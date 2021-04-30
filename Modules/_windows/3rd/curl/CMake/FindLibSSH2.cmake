#***************************************************************************
#                                  _   _ ____  _
#  Project                     ___| | | |  _ \| |
#                             / __| | | | |_) | |
#                            | (__| |_| |  _ <| |___
#                             \___|\___/|_| \_\_____|
#
# Copyright (C) 1998 - 2020, Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file COPYING, which
# you should have received as part of this distribution. The terms
# are also available at https://curl.se/docs/copyright.html.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
###########################################################################
# - Try to find the libssh2 library
# Once done this will define
#
# LIBSSH2_FOUND - system has the libssh2 library
# LIBSSH2_INCLUDE_DIR - the libssh2 include directory
# LIBSSH2_LIBRARY - the libssh2 library name

# modify by wyt, 2021.4.28
set (PC_LIBSSH2_INCLUDE_DIR "D:/sdk/cmake_build/vs2019/libssh2/include/")
if("${CMAKE_GENERATOR_PLATFORM}" STREQUAL "x64")
    set (PC_LIBSSH2_LIBRARY "D:/sdk/cmake_build/vs2019/libssh2/_build_/x64/src/Release/")
    message("PC_LIBSSH2_LIBRARY of x64: ${PC_LIBSSH2_LIBRARY}")
else()
    set (PC_LIBSSH2_LIBRARY "D:/sdk/cmake_build/vs2019/libssh2/_build_/Win32/src/Release/")
    message("PC_LIBSSH2_LIBRARY of Win32: ${PC_LIBSSH2_LIBRARY}")
ENDIF()

find_path(LIBSSH2_INCLUDE_DIR libssh2.h  HINTS ${PC_LIBSSH2_INCLUDE_DIR})

find_library(LIBSSH2_LIBRARY NAMES ssh2 libssh2  HINTS ${PC_LIBSSH2_LIBRARY})

if(LIBSSH2_INCLUDE_DIR)
  file(STRINGS "${LIBSSH2_INCLUDE_DIR}/libssh2.h" libssh2_version_str REGEX "^#define[\t ]+LIBSSH2_VERSION[\t ]+\"(.*)\"")
  string(REGEX REPLACE "^.*\"([^\"]+)\"" "\\1"  LIBSSH2_VERSION "${libssh2_version_str}")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibSSH2
    REQUIRED_VARS LIBSSH2_LIBRARY LIBSSH2_INCLUDE_DIR
    VERSION_VAR LIBSSH2_VERSION)

mark_as_advanced(LIBSSH2_INCLUDE_DIR LIBSSH2_LIBRARY)
