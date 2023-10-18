cmake_minimum_required(VERSION 3.12)
project(test_lib VERSION 1.0.0)

# Source files
set(SOURCES
    src/common/test.cpp
    # Add other source files as needed
)

# Include directories
include_directories(include)

# Create a shared (dynamic) library
add_library(your_library_name_shared SHARED ${SOURCES})

# Create a static library
add_library(your_library_name_static STATIC ${SOURCES})

# Set the version and SOVERSION for the shared library (on macOS)
#set_target_properties(your_library_name_shared PROPERTIES
#    VERSION ${PROJECT_VERSION}
#    SOVERSION 1
#)

# Specify output directory for the libraries (optional)
set_target_properties(your_library_name_shared PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)
set_target_properties(your_library_name_static PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
)

# Specify the name of the output libraries
set_target_properties(your_library_name_shared PROPERTIES
    OUTPUT_NAME test
)
set_target_properties(your_library_name_static PROPERTIES
    OUTPUT_NAME test
)

set(CUSTOM_INSTALL_PATH "${CMAKE_CURRENT_SOURCE_DIR}/out")

# Specify the installation targets (optional)
install(TARGETS your_library_name_shared your_library_name_static
    DESTINATION "${CUSTOM_INSTALL_PATH}/lib"
)

# Specify the installation headers (optional)
install(DIRECTORY include/
    DESTINATION "${CUSTOM_INSTALL_PATH}/include"
)
