# Define parameters
set(TARGET_NAME "" CACHE STRING "TARGET_NAME")
set(TARGET_TYPE "" CACHE STRING "TARGET_TYPE")

# Make sure arguments are passed to the parameters
if(NOT TARGET_NAME)
    message(FATAL_ERROR "NAME was provided")
endif()
if (NOT TARGET_TYPE MATCHES "^(EXECUTABLE|OBJECT|STATIC|SHARED|INTERFACE|)$")
    message(FATAL_ERROR "TYPE was not specified as EXECUTABLE, OBJECT, STATIC, SHARED, or INTERFACE")
endif()

file(TOUCH "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}/${TARGET_NAME}.hpp")
file(APPEND "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}/${TARGET_NAME}.hpp"
        "#ifndef TEST_HPP\n#define TEST_HPP\n\n#endif // #ifndef TEST_HPP\n"
)
