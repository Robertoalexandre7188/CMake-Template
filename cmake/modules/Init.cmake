# You may change this file as you wish
# This should be include()'d after the first call to project()

include(GNUInstallDirs)

# Alters the install location of certain kinds of artifacts based on the PLATFORM variable
if(DEFINED PLATFORM AND UNIX)
    if(CMAKE_CROSSCOMPILING)
        set(CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/${PLATFORM}" CACHE PATH "Install prefix" FORCE)
        set(CMAKE_INSTALL_ARCHLIBDIR "${CMAKE_INSTALL_LIBDIR}")
    else()
        cmake_path(APPEND CMAKE_INSTALL_ARCHLIBDIR "${CMAKE_INSTALL_LIBDIR}" "${PLATFORM}")
    endif()
else()
    set(CMAKE_INSTALL_ARCHLIBDIR "${CMAKE_INSTALL_LIBDIR}")
endif()
