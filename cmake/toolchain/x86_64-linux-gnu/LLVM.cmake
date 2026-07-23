include(${CMAKE_CURRENT_LIST_DIR}/Default.cmake)

if(NOT CMAKE_HOST_LINUX OR NOT CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "(x86_64|AMD64)")
    find_program(CMAKE_C_COMPILER NAMES clang REQUIRED)
    find_program(CMAKE_CXX_COMPILER NAMES clang++ REQUIRED)
    find_program(CMAKE_LINKER NAMES lld REQUIRED)
    find_program(CMAKE_AR NAMES llvm-ar REQUIRED)
    find_program(CMAKE_RANLIB NAMES llvm-ranlib REQUIRED)
    find_program(CMAKE_NM NAMES llvm-nm REQUIRED)

    set(CMAKE_C_COMPILER_TARGET "${PLATFORM}")
    set(CMAKE_LINKER_TYPE LLD)
endif()
