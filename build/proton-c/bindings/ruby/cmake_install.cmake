# Install script for directory: /home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")
  IF(EXISTS "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so"
         RPATH "")
  ENDIF()
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so")
FILE(INSTALL DESTINATION "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux" TYPE MODULE FILES "/home/vadim/projects/qpid-proton-0.7/build/proton-c/bindings/ruby/cproton.so")
  IF(EXISTS "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so")
    FILE(RPATH_REMOVE
         FILE "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/cproton.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/qpid_proton.rb")
FILE(INSTALL DESTINATION "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux" TYPE FILE FILES "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby/lib/qpid_proton.rb")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux/qpid_proton")
FILE(INSTALL DESTINATION "/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux" TYPE DIRECTORY FILES "/home/vadim/projects/qpid-proton-0.7/proton-c/bindings/ruby/lib/qpid_proton")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Ruby")

