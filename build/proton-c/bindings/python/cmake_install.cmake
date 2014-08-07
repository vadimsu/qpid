# Install script for directory: /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python

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
  execute_process(COMMAND /usr/bin/python -m py_compile cproton.py
                              WORKING_DIRECTORY /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/python -O -m py_compile cproton.py
                              WORKING_DIRECTORY /home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/python -m py_compile proton.py
                              WORKING_DIRECTORY /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/python -O -m py_compile proton.py
                              WORKING_DIRECTORY /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Python")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/python2.7/dist-packages/cproton.py;/usr/lib/python2.7/dist-packages/cproton.pyc;/usr/lib/python2.7/dist-packages/cproton.pyo;/usr/lib/python2.7/dist-packages/proton.py;/usr/lib/python2.7/dist-packages/proton.pyc;/usr/lib/python2.7/dist-packages/proton.pyo")
FILE(INSTALL DESTINATION "/usr/lib/python2.7/dist-packages" TYPE FILE FILES
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python/cproton.py"
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python/cproton.pyc"
    "/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python/cproton.pyo"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python/proton.py"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python/proton.pyc"
    "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/python/proton.pyo"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Python")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Python")
  IF(EXISTS "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so"
         RPATH "")
  ENDIF()
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/python2.7/dist-packages/_cproton.so")
FILE(INSTALL DESTINATION "/usr/lib/python2.7/dist-packages" TYPE MODULE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/python/_cproton.so")
  IF(EXISTS "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/lib/python2.7/dist-packages/_cproton.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Python")

