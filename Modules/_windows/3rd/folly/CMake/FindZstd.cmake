# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# - Try to find Facebook zstd library
# This will define
# ZSTD_FOUND
# ZSTD_INCLUDE_DIR
# ZSTD_LIBRARY
#

# modify by wyt, 2021.4.29
set (PC_ZSTD_INCLUDE_DIR "D:/sdk/cmake_build/vs2019/zstd-1.4.9/lib/")
if(CMAKE_CL_64)
    set (PC_ZSTD_LIBRARY_DEBUG   "D:/sdk/cmake_build/vs2019/zstd-1.4.9/_build_/cmake/build/x64/lib/Debug/")
    set (PC_ZSTD_LIBRARY_RELEASE "D:/sdk/cmake_build/vs2019/zstd-1.4.9/_build_/cmake/build/x64/lib/Release/")
else()
    set (PC_ZSTD_LIBRARY_DEBUG   "D:/sdk/cmake_build/vs2019/zstd-1.4.9/_build_/cmake/build/Win32/lib/Debug/")
    set (PC_ZSTD_LIBRARY_RELEASE "D:/sdk/cmake_build/vs2019/zstd-1.4.9/_build_/cmake/build/Win32/lib/Release/")
ENDIF()
message("PC_ZSTD_LIBRARY_DEBUG: ${PC_ZSTD_LIBRARY_DEBUG}")
message("PC_ZSTD_LIBRARY_RELEASE: ${PC_ZSTD_LIBRARY_RELEASE}")

find_path(ZSTD_INCLUDE_DIR NAMES zstd.h HINTS ${PC_ZSTD_INCLUDE_DIR})
find_library(ZSTD_LIBRARY_DEBUG   NAMES zstd zstd_static  HINTS ${PC_ZSTD_LIBRARY_DEBUG})
find_library(ZSTD_LIBRARY_RELEASE NAMES zstd zstd_static  HINTS ${PC_ZSTD_LIBRARY_RELEASE})

#find_path(ZSTD_INCLUDE_DIR NAMES zstd.h)
#find_library(ZSTD_LIBRARY_DEBUG NAMES zstdd zstd_staticd)
#find_library(ZSTD_LIBRARY_RELEASE NAMES zstd zstd_static)

include(SelectLibraryConfigurations)
SELECT_LIBRARY_CONFIGURATIONS(ZSTD)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    ZSTD DEFAULT_MSG
    ZSTD_LIBRARY ZSTD_INCLUDE_DIR
)

if (ZSTD_FOUND)
    message(STATUS "Found Zstd: ${ZSTD_LIBRARY}")
endif()

mark_as_advanced(ZSTD_INCLUDE_DIR ZSTD_LIBRARY)