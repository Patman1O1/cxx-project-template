#-----------------------------------------------------------------------------------------------------------------------
# cmake_header.cmake
#-----------------------------------------------------------------------------------------------------------------------
# Define parameters
set(PROJECT_NAME "" CACHE STRING "PROJECT_NAME") # Required
set(HEADER_NAME "" CACHE STRING "HEADER_NAME") # Required

# Variables
string(TOUPPER "${HEADER_NAME}" HEADER_NAME_UPPER)

# Ensure arguments are passed to required parameters
if(NOT PROJECT_NAME)
    message(FATAL_ERROR "\"PROJECT_NAME\" was not specified")
    return()
endif()
if(NOT HEADER_NAME)
    message(FATAL_ERROR "\"HEADER_NAME\" was not specified")
    return()
endif()

# Make sure the header file doesn't already exist
if(EXISTS "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/${HEADER_NAME}.hpp")
    message(NOTICE "\"${HEADER_NAME}.hpp\" already exists")
    return()
endif()

# Create the header file
file(TOUCH "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/${HEADER_NAME}.hpp")
file(WRITE "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/${HEADER_NAME}.hpp"
        "#ifndef ${HEADER_NAME_UPPER}_HPP\n#define ${HEADER_NAME_UPPER}_HPP\n\n#endif // #ifndef ${HEADER_NAME_UPPER}_HPP\n"
)

# Let the user know the header file was successfully created
message("${HEADER_NAME}.hpp successfully created")
