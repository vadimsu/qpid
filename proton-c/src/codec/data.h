#ifndef _PROTON_DATA_H
#define _PROTON_DATA_H 1

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

#include <proton/buffer.h>

#include "decoder.h"
#include "encoder.h"

typedef struct {
  size_t next;
  size_t prev;
  size_t down;
  size_t parent;
  size_t children;
  pn_atom_t atom;
  // for arrays
  bool described;
  pn_type_t type;
  bool data;
  size_t data_offset;
  size_t data_size;
  char *start;
  bool small;
} pni_node_t;

struct pn_data_t {
  size_t capacity;
  size_t size;
  pni_node_t *nodes;
  pn_buffer_t *buf;
  size_t parent;
  size_t current;
  size_t base_parent;
  size_t base_current;
  pn_decoder_t *decoder;
  pn_encoder_t *encoder;
  pn_error_t *error;
  pn_string_t *str;
};

pni_node_t *pn_data_node(pn_data_t *data, size_t nd);
int pni_data_traverse(pn_data_t *data,
                      int (*enter)(void *ctx, pn_data_t *data, pni_node_t *node),
                      int (*exit)(void *ctx, pn_data_t *data, pni_node_t *node),
                      void *ctx);

#endif /* data.h */
