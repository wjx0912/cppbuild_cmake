# cmake自带Modules
cmake自带了很多常用库脚本，路径：

C:\Program Files\CMake\share\cmake-3.20\Modules

比如：FindBoost.cmake，还有OpenSSL,Iconv,curl,lua,...

尽量使用cmake最新版本，尽量使用cmake自带Modules



# 各文件夹说明

| 文件夹                       | 说明        |
| ---------------------------- | ----------- |
| D:\sdk\cmake_modules\build   | 编译脚本    |
| D:\sdk\cmake_modules\demo    | 示例        |
| D:\sdk\cmake_modules\Modules | Modules文件 |
| D:\sdk\cmake_build\vs2019    |             |

windows平台vs2019编译库的文件夹：D:\sdk\cmake_build\vs2019

所有文件夹使用绝对路径，CI/CD也是



# 使用方法

在CMakeLists.txt最前面添加这两行：

	include("D:/sdk/cmake_modules/Modules/global_config.cmake")
	message("CMAKE_MODULE_PATH = ${CMAKE_MODULE_PATH}")

然后就能用了FindRapidJSON之类自己写的脚本了

说明：这个路径查找cmake子模块优先级高于${CMAKE_ROOT}/Modules

参考：https://gitlab.kitware.com/cmake/community/-/wikis/doc/tutorials/How-To-Find-Libraries#writing-find-modules



# 项目git地址

https://github.com/wjx0912/cmake_modules



