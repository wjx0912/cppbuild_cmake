cmake_minimum_required(VERSION 3.5)

# Set the project name
project (my_project_name)

# (1)查找curl，会导出变量（使用cmake自带的FindCURL.cmake）
find_package( CURL REQUIRED )
if (CURL_FOUND)
    message("CURL_INCLUDE_DIRS = ${CURL_INCLUDE_DIRS}")
    message("CURL_LIBRARIES = ${CURL_LIBRARIES}")
    message("CURL_VERSION_STRING = ${CURL_VERSION_STRING}")
    #include_directories(${CURL_INCLUDE_DIRS})
else()
    MESSAGE(FATAL_ERROR "LibCurl is not found in your system.")
endif (CURL_FOUND)


# Add an executable
add_executable(my_project_name main.cpp)

# (3)链接库
include_directories(${CURL_INCLUDE_DIR})
target_link_libraries( my_project_name CURL::libcurl )
