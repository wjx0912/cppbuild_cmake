::文件路径：D:\sdk\cmake_build\vs2019\curl-7.76.1
@echo off
rm _build_ -fr

cmake  -B  _build_\Win32_Static       -G "Visual Studio 16 2019"  -A Win32    -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32_Static    --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32_Static    --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

cmake  -B  _build_\x64_Static         -G "Visual Studio 16 2019"  -A x64      -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64_Static      --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64_Static      --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

cmake  -B  _build_\Win32_Dynamic       -G "Visual Studio 16 2019"  -A Win32    -DBUILD_SHARED_LIBS=ON    -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32_Dynamic    --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\Win32_Dynamic    --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

cmake  -B  _build_\x64_Dynamic         -G "Visual Studio 16 2019"  -A x64      -DBUILD_SHARED_LIBS=ON    -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64_Dynamic      --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build _build_\x64_Dynamic      --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

::=====================================
::file end
::=====================================
GOTO END

:STOP_JOB
echo "***********error***********"
pause

:END
echo "***********success***********"
pause

