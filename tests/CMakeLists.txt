#---------------------SET COMPONENT NAME---------------------------------------#
set(TARGET_NAME testlib)
set(LINK_NAME testlibtest)
#------------------------------------------------------------------------------#
#---------------------SET LOCAL NAME TO LINK COMPONENT-------------------------#
set(MODULE_NAME test_manager_test)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED on)

set(MANAGER_MODULE ICOL.example.businessLayer.lib_a)

#------------------------------------------------------------------------------#
#---------------------SET PROTO FILE-------------------------------------------#
#------------------------------------------------------------------------------#
#-----------------------INCLUDE HEADER-----------------------------------------#
include(FetchContent)
include(FindProtobuf)
#------------------------------------------------------------------------------#
#---------------------GENERATE AUTOCODE----------------------------------------#
#------------------------------------------------------------------------------#
#---------------------ADD SOURCE-----------------------------------------------#
set(SOURCE  functions_test.cpp)
#------------------------------------------------------------------------------#
#---------------------FIND PACKAGES--------------------------------------------#
find_package(Catch2 REQUIRED)
find_package(Threads REQUIRED)

#------------------------------------------------------------------------------#
#---------------------ADD DEFINITIONS------------------------------------------#
add_definitions(-fcoroutines)
add_definitions(-fno-exceptions)
add_definitions(-fexceptions)
#------------------------------------------------------------------------------#

add_executable(${TARGET_NAME} test_file.cpp
                            test_main.cpp)

target_compile_features(${TARGET_NAME} PRIVATE cxx_std_20)
target_link_libraries(${TARGET_NAME} PRIVATE Catch2::Catch2)
target_link_libraries(${TARGET_NAME} PRIVATE ${MANAGER_MODULE})


target_compile_features(${TARGET_NAME} PRIVATE cxx_std_20)
add_test(NAME ${LINK_NAME} COMMAND ${TARGET_NAME})