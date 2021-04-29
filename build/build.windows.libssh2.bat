::ÎÄ¼þÂ·¾¶£ºD:\sdk\cmake_build\vs2019\libssh2
rm build -fr

cmake  -B  build\Win32       -G "Visual Studio 16 2019"  -A Win32    -DCMAKE_USE_OPENSSL=ON
cmake --build build\Win32    --target ALL_BUILD
cmake --build build\Win32    --target ALL_BUILD   --config Release

cmake  -B  build\x64         -G "Visual Studio 16 2019"  -A x64      -DCMAKE_USE_OPENSSL=ON
cmake --build build\x64      --target ALL_BUILD
cmake --build build\x64      --target ALL_BUILD   --config Release
pause