#---------------------SET COMPONENT NAME---------------------------------------#
set(LIB_NAME ICOL.example.businessLayer.lib_a)
#------------------------------------------------------------------------------#
#---------------------SET LOCAL NAME TO LINK COMPONENT-------------------------#
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
set(CMAKE_CXX_STANDARD 20)
set(PRODUCER_LIB ICOL.MES.controller.applicationLayer.transport.producer_)
#------------------------------------------------------------------------------#
#---------------------SET PROTO FILE-------------------------------------------#
set(PROTO   ${PROJECT_SOURCE_DIR}/proto/helloworld.proto)
#------------------------------------------------------------------------------#
#-----------------------INCLUDE HEADER-----------------------------------------#
#[[include(FindProtobuf)]]
set(LIB_PATH ${PROJECT_SOURCE_DIR}/include/lib_a)
set(HEADER_LIST ${LIB_PATH}/lib_a.hpp
        ${LIB_PATH}/helloworld.pb.h
        ${LIB_PATH}/helloworld.pb.cc)
set(PROTO_SRC_DIR ${PROJECT_SOURCE_DIR}/include/lib_a)
#------------------------------------------------------------------------------#
#---------------------FIND PACKAGES--------------------------------------------#
find_package(Threads REQUIRED)
find_package(Protobuf REQUIRED)
#------------------------------------------------------------------------------#
#---------------------GENERATE AUTOCODE----------------------------------------#
protobuf_generate_cpp(PROTO_SRC PROTO_HEADER ${PROTO_SRC_DIR}
        ${PROTO})
#------------------------------------------------------------------------------#
#---------------------COMPILE DEFINES------------------------------------------#
add_definitions(-fcoroutines)
add_definitions(-fno-exceptions)
add_definitions(-fexceptions)
#------------------------------------------------------------------------------#
#---------------------ADD SOURCE-----------------------------------------------#
set(SOURCE  lib_a.cpp)
#------------------------------------------------------------------------------#
#---------------------ADD LIBRARY----------------------------------------------#
add_library(${LIB_NAME}
        ${HEADER_LIST}
        ${SOURCE}
        ${PROTO_SRC})
#------------------------------------------------------------------------------#
#--------------------INCLUDE DIRS----------------------------------------------#
target_include_directories(${LIB_NAME} PUBLIC ${PROTOBUF_INCLUDE_DIR})
target_include_directories(${LIB_NAME} PUBLIC
        ${PROJECT_SOURCE_DIR}/include)
#---------------------LINK COMPONENTS------------------------------------------#
target_link_libraries(${LIB_NAME} PRIVATE ${PROTOBUF_LIBRARY})
#------------------------------------------------------------------------------#
#--------------------------REQUIRED STD----------------------------------------#
target_compile_features(${LIB_NAME} PUBLIC cxx_std_20)
#------------------------------------------------------------------------------#
#-----------------------------CMAKE BUILD--------------------------------------#
#------------------------------------------------------------------------------#
#---------------------------PVS STUDIO ANALYZE---------------------------------#