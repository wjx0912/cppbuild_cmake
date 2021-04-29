cmake_minimum_required(VERSION 3.5)

# Set the project name
project (my_project_name)

set(Boost_USE_STATIC_LIBS        ON)  # only find static libs
#set(Boost_USE_DEBUG_LIBS        OFF)  # ignore debug libs and
set(Boost_USE_RELEASE_LIBS       ON)  # only find release libs
#set(Boost_USE_MULTITHREADED      OFF)
set(Boost_USE_STATIC_RUNTIME    OFF)
find_package(Boost 1.75.0 REQUIRED COMPONENTS filesystem system)

if(Boost_FOUND)
    message ("boost found:")
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

message("detect Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
message("detect Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
message("detect Boost_LIBRARIES: ${Boost_LIBRARIES}")
include_directories(${Boost_INCLUDE_DIRS})

# Add an executable
add_executable(my_project_name main.cpp)

# link against the boost libraries
target_link_libraries( my_project_name ${Boost_LIBRARIES})
