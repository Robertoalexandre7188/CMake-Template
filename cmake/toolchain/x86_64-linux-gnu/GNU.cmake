include(${CMAKE_CURRENT_LIST_DIR}/Default.cmake)

find_program(CMAKE_C_COMPILER NAMES x86_64-linux-gnu-gcc REQUIRED)
find_program(CMAKE_AR NAMES x86_64-linux-gnu-gcc-ar REQUIRED)
find_program(CMAKE_RANLIB NAMES x86_64-linux-gnu-gcc-ranlib REQUIRED)
find_program(CMAKE_NM NAMES x86_64-linux-gnu-gcc-nm REQUIRED)

if(CMAKE_HOST_UNIX)
    find_program(CMAKE_LINKER NAMES mold x86_64-linux-gnu-ld REQUIRED)
else()
    find_program(CMAKE_LINKER NAMES x86_64-linux-gnu-ld REQUIRED)
endif()

if(CMAKE_LINKER MATCHES mold)
    set(CMAKE_LINKER_TYPE MOLD)
else()
    set(CMAKE_LINKER_TYPE BFD)
endif()
