# Define parameters
set(TARGET_NAME "" CACHE STRING "TARGET_NAME")
set(TARGET_TYPE "" CACHE STRING "TARGET_TYPE")

string(TOUPPER ${TARGET_NAME} TARGET_NAME_UPPER)
string(TOLOWER ${TARGET_NAME} TARGET_NAME_LOWER)

# Make sure arguments are passed to the parameters
if(NOT TARGET_NAME)
    message(FATAL_ERROR "NAME was provided")
endif()
if (NOT TARGET_TYPE MATCHES "^(EXECUTABLE|OBJECT|STATIC|SHARED|INTERFACE|)$")
    message(FATAL_ERROR "TYPE was not specified as EXECUTABLE, OBJECT, STATIC, SHARED, or INTERFACE")
endif()

file(TOUCH "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}/${TARGET_NAME}.hpp")
file(APPEND "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}/${TARGET_NAME}.hpp"
        "#ifndef ${TARGET_NAME_UPPER}_HPP\n#define ${TARGET_NAME_UPPER}_HPP\n\n#endif // #ifndef ${TARGET_NAME_UPPER}_HPP\n"
)

if(NOT TARGET_TYPE MATCHES "^(INTERFACE)")
    file(TOUCH "${CMAKE_SOURCE_DIR}/src/${TARGET_NAME}.cpp")
    file(APPEND "${CMAKE_SOURCE_DIR}/src/${TARGET_NAME}.cpp" "#include <${PROJECT_NAME}/${TARGET_NAME}.hpp>\n")
endif()
