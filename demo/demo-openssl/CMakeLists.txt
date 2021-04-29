cmake_minimum_required(VERSION 3.5)

# Set the project name
project (my_project_name)

find_package(OpenSSL REQUIRED)
set(DEP_LIBS
    OpenSSL::Crypto OpenSSL::SSL  # modern
    #${OPENSSL_SSL_LIBRARY} ${OPENSSL_CRYPTO_LIBRARY}  # old style
)


# Add an executable
add_executable(my_project_name main.cpp)

# link against the boost libraries
target_link_libraries( my_project_name ${DEP_LIBS})
