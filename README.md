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



一、c++库收集：
7z,zlib,zstd,bzip,
cximage,ImageMagick,openjpeg,libpng,freetype,
boost,poco,folly,
openssl,openssl3,
curl,
json,tinyxml,sqlite(mysql),orm,libxml,xerces,
protobuf,flatbuffer,thrift,fast,
icu4c,libidn,iconv,
lua,python,v8,
opencv,cuda,tbb,openmp,
redis,
spdlog,glog,
gtest,cppunit,
libevent,
ffmpeg,libx264,xvidcore,
opengl,glu,glut,
java,jni,
其它不常用库：caffe,crashrtp,eigen,hikang_sdk,dskinlite,bass,themida,win32xx,opencl,openblas,tracetool,
二、问题
(1)include/lib/bin 二进制兼容，vs版本：2015,2017,2019
(2)库支持debug&release, MT&MTD:  FindMylib之前可以定义变量强制，也可以根据cmake参数自适应
(3)项目支持debug&release, MT&MTD: 和库匹配
(4)复用cmake自带modules，不能复用的要能disable
(5)Find的库里面可以预定义宏，三方库;  c++warning控制；
(6)add bin文件夹到cmake生成的项目文件里面（避免人工拷贝win32&x64 dll/bin到path里面）
(7)调试可以跟踪到lib里面
(8)同一个库多版本
(9)源码，文档，.cmake文件；怎么组织；ci,cd

优先编译：curl,zlib,openssl,boost,opencv,sqlite,tinyxml,protobuf,lua,spdlog,