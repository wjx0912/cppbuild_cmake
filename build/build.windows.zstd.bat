::文件路径：D:\sdk\cmake_build\vs2019\zstd-1.4.9\build\cmake
rm build -fr

cmake  -B  build\Win32       -G "Visual Studio 16 2019"  -A Win32
cmake --build build\Win32    --target ALL_BUILD
cmake --build build\Win32    --target ALL_BUILD   --config Release

cmake  -B  build\x64         -G "Visual Studio 16 2019"  -A x64
cmake --build build\x64      --target ALL_BUILD
cmake --build build\x64      --target ALL_BUILD   --config Release
pause