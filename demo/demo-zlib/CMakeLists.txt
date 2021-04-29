cmake_minimum_required(VERSION 3.5)

# Set the project name
project (my_project_name)

# (1)查找zlib，会导出变量（使用cmake自带的FindZLIB.cmake）
find_package( ZLIB REQUIRED )
if (ZLIB_FOUND)
    message("ZLIB_INCLUDE_DIRS = ${ZLIB_INCLUDE_DIRS}")
    message("ZLIB_LIBRARIES = ${ZLIB_LIBRARIES}")
else()
    MESSAGE(FATAL_ERROR "zlib is not found in your system.")
endif (ZLIB_FOUND)


# Add an executable
add_executable(my_project_name main.cpp)

# (3)链接库
include_directories(${ZLIB_INCLUDE_DIRS})
target_link_libraries( my_project_name ZLIB::ZLIB )
