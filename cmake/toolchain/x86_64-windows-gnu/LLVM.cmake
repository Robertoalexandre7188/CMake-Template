include(${CMAKE_CURRENT_LIST_DIR}/Default.cmake)

if(NOT CMAKE_HOST_WIN32 OR NOT CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64|AMD64)")
    find_program(CMAKE_C_COMPILER NAMES clang REQUIRED)
    find_program(CMAKE_CXX_COMPILER NAMES clang++ REQUIRED)
    find_program(CMAKE_LINKER NAMES lld REQUIRED)
    find_program(CMAKE_AR NAMES llvm-ar REQUIRED)
    find_program(CMAKE_RANLIB NAMES llvm-ranlib REQUIRED)
    find_program(CMAKE_NM NAMES llvm-nm REQUIRED)

    set(CMAKE_C_COMPILER_TARGET "${PLATFORM}")
    set(CMAKE_LINKER_TYPE LLD)
endif()

execute_process(
    COMMAND ${CMAKE_C_COMPILER} -target ${PLATFORM} -print-search-dirs
    OUTPUT_VARIABLE LIBDIRS
)

if(NOT CMAKE_HOST_WIN32)
    string(REGEX MATCH "libraries:.*" LIBDIRS "${LIBDIRS}")
    string(REPLACE "=" ";" LIBDIRS "${LIBDIRS}")
    list(GET LIBDIRS 1 LIBDIRS)
    string(REPLACE ":" ";" LIBDIRS "${LIBDIRS}")

    foreach(PATH IN LISTS LIBDIRS)
        if(EXISTS "${PATH}")
            file(REAL_PATH "${PATH}" PATH)
            list(APPEND DIRS "${PATH}")
        endif()
    endforeach()

    set(LIBDIRS "${DIRS}")
    list(JOIN LIBDIRS " -L" LIBDIRS)
endif()

set(CMAKE_EXE_LINKER_FLAGS_INIT "-L${LIBDIRS}")
