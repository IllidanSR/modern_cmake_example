cmake_minimum_required(VERSION 3.17)

project(pet_p
        VERSION 0.1
        DESCRIPTION "pet_p"
        LANGUAGES CXX
        )

set(JSON_LIB third_party/json)
set(LOGGER_LIB third_party/logger/P7/Headers)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -pthread")

add_compile_options(-Wdeprecated)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
    include(CTest)
    find_package(Doxygen)
    if(Doxygen_FOUND)
        add_subdirectory(docs)
    else()
        message(STATUS "Doxygen not found, not building docs")
    endif()
endif()

#[[include_directories(${JSON_LIB})
include_directories(${LOGGER_LIB})]]

#[[if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()
if (CMAKE_BUILD_TYPE MATCHES Debug)
    include(cmake/PVS-Studio.cmake)
elseif (CMAKE_BUILD_TYPE MATCHES Release)
    message(build without pvs analyze)
endif ()]]

add_subdirectory(src)
add_subdirectory(app)

if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR MODERN_CMAKE_BUILD_TESTING)
        AND BUILD_TESTING)
    add_subdirectory(tests)
endif()




