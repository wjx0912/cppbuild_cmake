cmake_minimum_required(VERSION 3.5)

# (1)添加路径（路径必须正斜杠，优先这个文件夹其次cmake自己的Modules文件夹）
include("D:/sdk/cmake_modules/Modules/global_config.cmake")
message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")

# Set the project name
project (my_project_name)

# (2)查找rapidjson，会导出变量（上面的路径里面找FindRapidJSON.cmake）
set(MIN_RapidJSON_VERSION 1.1)
find_package(RapidJSON ${MIN_RapidJSON_VERSION} REQUIRED)
if(RapidJSON_FOUND)
    message("RapidJSON_FOUND = ${RapidJSON_FOUND}")
    message("RapidJSON_VERSION = ${RapidJSON_VERSION}")
    message("RapidJSON_INCLUDE_DIRS = ${RapidJSON_INCLUDE_DIRS}")
else()
    message(FATAL_ERROR "can not find rapidjson.")
endif()

# Add an executable
add_executable(my_project_name main.cpp json_utils_wrap.cpp)

# (3)链接库
target_link_libraries( my_project_name 
    PUBLIC
        RapidJSON::RapidJSON
)

