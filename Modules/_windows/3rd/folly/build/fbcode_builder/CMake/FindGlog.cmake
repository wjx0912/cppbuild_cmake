# Copyright (c) Facebook, Inc. and its affiliates.
# - Try to find Glog
# Once done, this will define
#
# GLOG_FOUND - system has Glog
# GLOG_INCLUDE_DIRS - the Glog include directories
# GLOG_LIBRARIES - link these to use Glog

# modify by wyt, 2021.4.30
if(CMAKE_CL_64)
    set (GLOG_INCLUDEDIR            "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/x64_Dynamic/")
    set (GLOG_LIBRARYDIR_RELEASE    "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/x64_Dynamic/Release/")
    set (GLOG_LIBRARYDIR_DEBUG      "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/x64_Dynamic/Debug/")
else()
    set (GLOG_INCLUDEDIR            "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/Win32_Dynamic/")
    set (GLOG_LIBRARYDIR_RELEASE    "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/Win32_Dynamic/Release/")
    set (GLOG_LIBRARYDIR_DEBUG      "D:/sdk/cmake_build/vs2019/glog-0.4.0/_build_/Win32_Dynamic/Debug/")
ENDIF()
message("GLOG_INCLUDEDIR: ${GLOG_INCLUDEDIR}")
message("GLOG_LIBRARYDIR_RELEASE: ${GLOG_LIBRARYDIR_RELEASE}")
message("GLOG_LIBRARYDIR_DEBUG: ${GLOG_LIBRARYDIR_DEBUG}")

include(FindPackageHandleStandardArgs)
include(SelectLibraryConfigurations)

find_library(GLOG_LIBRARY_RELEASE glog
  PATHS ${GLOG_LIBRARYDIR_RELEASE})
find_library(GLOG_LIBRARY_DEBUG glogd
  PATHS ${GLOG_LIBRARYDIR_DEBUG})

find_path(GLOG_INCLUDE_DIR glog/logging.h
  PATHS ${GLOG_INCLUDEDIR})

select_library_configurations(GLOG)

message("debug GLOG_LIBRARY: ${GLOG_LIBRARY}")
message("debug GLOG_INCLUDE_DIR: ${GLOG_INCLUDE_DIR}")
find_package_handle_standard_args(glog DEFAULT_MSG
  GLOG_LIBRARY
  GLOG_INCLUDE_DIR)

mark_as_advanced(
  GLOG_LIBRARY
  GLOG_INCLUDE_DIR)

set(GLOG_LIBRARIES ${GLOG_LIBRARY})
set(GLOG_INCLUDE_DIRS ${GLOG_INCLUDE_DIR})

if (NOT TARGET glog::glog)
  add_library(glog::glog UNKNOWN IMPORTED)
  set_target_properties(glog::glog PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${GLOG_INCLUDE_DIRS}")
  set_target_properties(glog::glog PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES "C" IMPORTED_LOCATION "${GLOG_LIBRARIES}")
endif()
