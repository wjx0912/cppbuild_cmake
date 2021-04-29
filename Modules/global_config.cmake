if(WIN32)
    # win平台，总是使用UNICODE
    add_definitions(-DUNICODE -D_UNICODE)

    # win平台上，默认使用visual sutdio sdk，总是开启并行编译，加快编译速度
    add_compile_options(/MP)

    #
    list(INSERT CMAKE_MODULE_PATH 0 D:/sdk/cmake_modules/Modules/_windows/3rd)
    #list(INSERT CMAKE_MODULE_PATH 0 ./windows)
elseif(APPLE)
    # 默认只支持x86_64，不再支持x86
    set(CMAKE_OSX_ARCHITECTURES x86_64)
endif()

