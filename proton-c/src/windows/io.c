/*
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
 */

#define FD_SETSIZE 2048
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0501
#endif
#if _WIN32_WINNT < 0x0501
#error "Proton requires Windows API support for XP or later."
#endif
#include <winsock2.h>
#include <Ws2tcpip.h>
#define PN_WINAPI

#include "../platform.h"
#include <proton/io.h>
#include <proton/object.h>

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <assert.h>

static int pni_error_from_wsaerr(pn_error_t *error, const char *msg) {
  errno = WSAGetLastError();
  return pn_i_error_from_errno(error, msg);
}


#define MAX_HOST (1024)
#define MAX_SERV (64)

struct pn_io_t {
  char host[MAX_HOST];
  char serv[MAX_SERV];
  pn_error_t *error;
  bool wouldblock;
};

void pn_io_initialize(void *obj)
{
  pn_io_t *io = (pn_io_t *) obj;
  io->error = pn_error();
  io->wouldblock = false;

  /* Request WinSock 2.2 */
  WORD wsa_ver = MAKEWORD(2, 2);
  WSADATA unused;
  int err = WSAStartup(wsa_ver, &unused);
  if (err) {
    pni_error_from_wsaerr(io->error, "pipe");
    fprintf(stderr, "Can't load WinSock: %d\n", err);
  }
}

void pn_io_finalize(void *obj)
{
  pn_io_t *io = (pn_io_t *) obj;
  pn_error_free(io->error);
  WSACleanup();
}

#define pn_io_hashcode NULL
#define pn_io_compare NULL
#define pn_io_inspect

pn_io_t *pn_io(void)
{
  static pn_class_t clazz = PN_CLASS(pn_io);
  pn_io_t *io = (pn_io_t *) pn_new(sizeof(pn_io_t), &clazz);
  return io;
}

void pn_io_free(pn_io_t *io)
{
  pn_free(io);
}

pn_error_t *pn_io_error(pn_io_t *io)
{
  assert(io);
  return io->error;
}

/*
 * Windows pipes don't work with select(), so a socket based pipe
 * workaround is provided.  They do work with completion ports, so the
 * workaround can be disposed with in future.
 */
static int pni_socket_pair(SOCKET sv[2]);

int pn_pipe(pn_io_t *io, pn_socket_t *dest)
{
  int n = pni_socket_pair(dest);
  if (n) {
    pni_error_from_wsaerr(io->error, "pipe");
  }

  return n;
}

static void pn_configure_sock(pn_io_t *io, pn_socket_t sock) {
  //
  // Disable the Nagle algorithm on TCP connections.
  //
  int flag = 1;
  if (setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, (char *)&flag, sizeof(flag)) != 0) {
    perror("setsockopt");
  }
}

static inline pn_socket_t pn_create_socket(void);

pn_socket_t pn_listen(pn_io_t *io, const char *host, const char *port)
{
  struct addrinfo *addr;
  int code = getaddrinfo(host, port, NULL, &addr);
  if (code) {
    pn_error_format(io->error, PN_ERR, "getaddrinfo(%s, %s): %s\n", host, port, gai_strerror(code));
    return INVALID_SOCKET;
  }

  pn_socket_t sock = pn_create_socket();
  if (sock == INVALID_SOCKET) {
    pni_error_from_wsaerr(io->error, "pn_create_socket");
    return INVALID_SOCKET;
  }

  BOOL optval = 1;
  if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *) &optval, sizeof(optval)) == -1) {
    pni_error_from_wsaerr(io->error, "setsockopt");
    closesocket(sock);
    return INVALID_SOCKET;
  }

  if (bind(sock, addr->ai_addr, addr->ai_addrlen) == -1) {
    pni_error_from_wsaerr(io->error, "bind");
    freeaddrinfo(addr);
    closesocket(sock);
    return INVALID_SOCKET;
  }

  freeaddrinfo(addr);

  if (listen(sock, 50) == -1) {
    pni_error_from_wsaerr(io->error, "listen");
    closesocket(sock);
    return INVALID_SOCKET;
  }

  return sock;
}

pn_socket_t pn_connect(pn_io_t *io, const char *hostarg, const char *port)
{
  // convert "0.0.0.0" to "127.0.0.1" on Windows for outgoing sockets
  const char *host = strcmp("0.0.0.0", hostarg) ? hostarg : "127.0.0.1";

  struct addrinfo *addr;
  int code = getaddrinfo(host, port, NULL, &addr);
  if (code) {
    pn_error_format(io->error, PN_ERR, "getaddrinfo(%s, %s): %s", host, port, gai_strerror(code));
    return INVALID_SOCKET;
  }

  pn_socket_t sock = pn_create_socket();
  if (sock == INVALID_SOCKET) {
    pni_error_from_wsaerr(io->error, "pn_create_socket");
    return INVALID_SOCKET;
  }

  pn_configure_sock(io, sock);

  if (connect(sock, addr->ai_addr, addr->ai_addrlen) != 0) {
    if (WSAGetLastError() != WSAEWOULDBLOCK) {
      pni_error_from_wsaerr(io->error, "connect");
      freeaddrinfo(addr);
      closesocket(sock);
      return INVALID_SOCKET;
    }
  }

  freeaddrinfo(addr);

  return sock;
}

pn_socket_t pn_accept(pn_io_t *io, pn_socket_t socket, char *name, size_t size)
{
  struct sockaddr_in addr = {0};
  addr.sin_family = AF_INET;
  socklen_t addrlen = sizeof(addr);
  pn_socket_t sock = accept(socket, (struct sockaddr *) &addr, &addrlen);
  if (sock == INVALID_SOCKET) {
    pni_error_from_wsaerr(io->error, "accept");
    return sock;
  } else {
    int code;
    if ((code = getnameinfo((struct sockaddr *) &addr, addrlen, io->host, MAX_HOST, io->serv, MAX_SERV, 0))) {
      pn_error_format(io->error, PN_ERR, "getnameinfo: %s\n", gai_strerror(code));
      if (closesocket(sock) == -1)
        pni_error_from_wsaerr(io->error, "closesocket");
      return INVALID_SOCKET;
    } else {
      pn_configure_sock(io, sock);
      snprintf(name, size, "%s:%s", io->host, io->serv);
      return sock;
    }
  }
}

static inline pn_socket_t pn_create_socket(void) {
  return socket(AF_INET, SOCK_STREAM, getprotobyname("tcp")->p_proto);
}

ssize_t pn_send(pn_io_t *io, pn_socket_t sockfd, const void *buf, size_t len) {
  ssize_t count = send(sockfd, (const char *) buf, len, 0);
  io->wouldblock = count < 0 && WSAGetLastError() == WSAEWOULDBLOCK;
  return count;
}

ssize_t pn_recv(pn_io_t *io, pn_socket_t socket, void *buf, size_t size)
{
  ssize_t count = recv(socket, (char *) buf, size, 0);
  io->wouldblock = count < 0 && WSAGetLastError() == WSAEWOULDBLOCK;
  return count;
}

ssize_t pn_write(pn_io_t *io, pn_socket_t socket, const void *buf, size_t size)
{
  // non-socket io is mapped to socket io for now.  See pn_pipe()
  return pn_send(io, socket, buf, size);
}

ssize_t pn_read(pn_io_t *io, pn_socket_t socket, void *buf, size_t size)
{
  return pn_recv(io, socket, buf, size);
}

void pn_close(pn_io_t *io, pn_socket_t socket)
{
  closesocket(socket);
}

bool pn_wouldblock(pn_io_t *io)
{
  return io->wouldblock;
}


static int pni_socket_pair (SOCKET sv[2]) {
  // no socketpair on windows.  provide pipe() semantics using sockets

  SOCKET sock = socket(AF_INET, SOCK_STREAM, getprotobyname("tcp")->p_proto);
  if (sock == INVALID_SOCKET) {
    perror("socket");
    return -1;
  }

  BOOL b = 1;
  if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (const char *) &b, sizeof(b)) == -1) {
    perror("setsockopt");
    closesocket(sock);
    return -1;
  }
  else {
    struct sockaddr_in addr = {0};
    addr.sin_family = AF_INET;
    addr.sin_port = 0;
    addr.sin_addr.s_addr = htonl (INADDR_LOOPBACK);

    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
      perror("bind");
      closesocket(sock);
      return -1;
    }
  }

  if (listen(sock, 50) == -1) {
    perror("listen");
    closesocket(sock);
    return -1;
  }

  if ((sv[1] = socket(AF_INET, SOCK_STREAM, getprotobyname("tcp")->p_proto)) == INVALID_SOCKET) {
    perror("sock1");
    closesocket(sock);
    return -1;
  }
  else {
    struct sockaddr addr = {0};
    int l = sizeof(addr);
    if (getsockname(sock, &addr, &l) == -1) {
      perror("getsockname");
      closesocket(sock);
      return -1;
    }

    if (connect(sv[1], &addr, sizeof(addr)) == -1) {
      int err = WSAGetLastError();
      fprintf(stderr, "connect wsaerrr %d\n", err);
      closesocket(sock);
      closesocket(sv[1]);
      return -1;
    }

    if ((sv[0] = accept(sock, &addr, &l)) == INVALID_SOCKET) {
      perror("accept");
      closesocket(sock);
      closesocket(sv[1]);
      return -1;
    }
  }

  u_long v = 1;
  ioctlsocket (sv[0], FIONBIO, &v);
  ioctlsocket (sv[1], FIONBIO, &v);
  closesocket(sock);
  return 0;
}
