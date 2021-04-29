zstd-1.4.9



cmake  -B  build\Win32   -G "Visual Studio 16 2019"  -A Win32
cmake  -B  build\x64       -G "Visual Studio 16 2019"  -A x64
cmake --build build\Win32
cmake --build build\x64



