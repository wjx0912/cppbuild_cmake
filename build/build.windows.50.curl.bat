::文件路径：D:\sdk\cmake_build\vs2019\curl-7.76.1
@echo off
rm build -fr

cmake  -B  build\Win32       -G "Visual Studio 16 2019"  -A Win32    -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build build\Win32    --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build build\Win32    --target ALL_BUILD   --config Release
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB

cmake  -B  build\x64         -G "Visual Studio 16 2019"  -A x64      -DCMAKE_USE_OPENSSL=ON
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build build\x64      --target ALL_BUILD
IF %ERRORLEVEL% NEQ 0 GOTO STOP_JOB
cmake --build build\x64      --target ALL_BUILD   --config Release
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
