include(${CMAKE_CURRENT_LIST_DIR}/Default.cmake)

if(NOT CMAKE_HOST_WIN32)
    message(FATAL_ERROR
        "MSVC Toolchain is unavailable for non-Windows hosts"
    )
endif()

if(NOT CMAKE_HOST_SYSTEM_PROCESSOR MATCHES "(x86_64|AMD64)")
    find_program(CMAKE_C_COMPILER NAMES cl REQUIRED)
    find_program(CMAKE_CXX_COMPILER NAMES cl REQUIRED)
    find_program(CMAKE_LINKER NAMES link REQUIRED)
    find_program(CMAKE_AR NAMES lib REQUIRED)
    find_program(CMAKE_NM NAMES symbols dumpbin REQUIRED)

    set(CMAKE_LINKER_TYPE MSVC)
endif()
