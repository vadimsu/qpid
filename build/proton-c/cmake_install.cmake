# Install script for directory: /home/vadim/projects/qpid-proton-0.7/proton-c

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/proton")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump"
         RPATH "")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/proton-dump")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/proton-dump")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so.2.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    ENDIF()
  ENDFOREACH()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/libqpid-proton.so.2.0.0"
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/libqpid-proton.so.2"
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/libqpid-proton.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so.2.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libqpid-proton.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/proton" TYPE FILE FILES
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/scanner.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/selectable.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/message.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/type_compat.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/framing.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/ssl.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/session.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/transport.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/cproton.i"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/parser.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/buffer.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/messenger.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/util.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/disposition.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/object.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/event.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/link.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/selector.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/connection.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/engine.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/types.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/driver.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/error.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/condition.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/import_export.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/delivery.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/driver_extras.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/container.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/io.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/terminus.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/sasl.h"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/include/proton/codec.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/proton" TYPE FILE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/include/proton/version.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/libqpid-proton.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Proton" TYPE FILE FILES
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/ProtonConfig.cmake"
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/ProtonConfigVersion.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/cmake_install.cmake")
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/proton-c/docs/api/cmake_install.cmake")
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/proton-c/docs/man/cmake_install.cmake")
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/tests/tools/apps/c/cmake_install.cmake")
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/proton-c/src/tests/cmake_install.cmake")
  INCLUDE("/home/vadim/projects/qpid-proton-0.7/build/examples/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

