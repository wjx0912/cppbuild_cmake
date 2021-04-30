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

# Finds libdouble-conversion.
#
# This module defines:
# DOUBLE_CONVERSION_INCLUDE_DIR
# DOUBLE_CONVERSION_LIBRARY
#


# modify by wyt, 2021.4.30
set (PC_DOUBLE_CONVERSION_INCLUDE_DIR "D:/sdk/cmake_build/vs2019/double-conversion-3.1.5/")
if(CMAKE_CL_64)
    set (PC_DOUBLE_CONVERSION_LIBRARY "D:/sdk/cmake_build/vs2019/double-conversion-3.1.5/_build_/x64_Static/Release/")
else()
    set (PC_DOUBLE_CONVERSION_LIBRARY "D:/sdk/cmake_build/vs2019/double-conversion-3.1.5/_build_/Win32_Static/Release/")
ENDIF()
message("PC_DOUBLE_CONVERSION_INCLUDE_DIR: ${PC_DOUBLE_CONVERSION_INCLUDE_DIR}")
message("PC_DOUBLE_CONVERSION_LIBRARY: ${PC_DOUBLE_CONVERSION_LIBRARY}")

find_path(DOUBLE_CONVERSION_INCLUDE_DIR double-conversion/double-conversion.h HINTS ${PC_DOUBLE_CONVERSION_INCLUDE_DIR})
find_library(DOUBLE_CONVERSION_LIBRARY NAMES double-conversion HINTS ${PC_DOUBLE_CONVERSION_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  DoubleConversion
  DEFAULT_MSG
  DOUBLE_CONVERSION_LIBRARY DOUBLE_CONVERSION_INCLUDE_DIR)

mark_as_advanced(DOUBLE_CONVERSION_INCLUDE_DIR DOUBLE_CONVERSION_LIBRARY)
