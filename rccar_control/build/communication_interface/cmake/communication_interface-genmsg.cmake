# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "communication_interface: 2 messages, 0 services")

set(MSG_I_FLAGS "-Icommunication_interface:/home/bnlab/catkin_ws/src/communication_interface/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(communication_interface_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_custom_target(_communication_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "communication_interface" "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" ""
)

get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_custom_target(_communication_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "communication_interface" "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/communication_interface
)
_generate_msg_cpp(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/communication_interface
)

### Generating Services

### Generating Module File
_generate_module_cpp(communication_interface
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/communication_interface
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(communication_interface_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(communication_interface_generate_messages communication_interface_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_cpp _communication_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_cpp _communication_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(communication_interface_gencpp)
add_dependencies(communication_interface_gencpp communication_interface_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS communication_interface_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/communication_interface
)
_generate_msg_eus(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/communication_interface
)

### Generating Services

### Generating Module File
_generate_module_eus(communication_interface
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/communication_interface
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(communication_interface_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(communication_interface_generate_messages communication_interface_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_eus _communication_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_eus _communication_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(communication_interface_geneus)
add_dependencies(communication_interface_geneus communication_interface_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS communication_interface_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/communication_interface
)
_generate_msg_lisp(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/communication_interface
)

### Generating Services

### Generating Module File
_generate_module_lisp(communication_interface
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/communication_interface
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(communication_interface_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(communication_interface_generate_messages communication_interface_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_lisp _communication_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_lisp _communication_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(communication_interface_genlisp)
add_dependencies(communication_interface_genlisp communication_interface_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS communication_interface_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/communication_interface
)
_generate_msg_nodejs(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/communication_interface
)

### Generating Services

### Generating Module File
_generate_module_nodejs(communication_interface
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/communication_interface
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(communication_interface_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(communication_interface_generate_messages communication_interface_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_nodejs _communication_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_nodejs _communication_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(communication_interface_gennodejs)
add_dependencies(communication_interface_gennodejs communication_interface_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS communication_interface_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface
)
_generate_msg_py(communication_interface
  "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface
)

### Generating Services

### Generating Module File
_generate_module_py(communication_interface
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(communication_interface_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(communication_interface_generate_messages communication_interface_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_py _communication_interface_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bnlab/catkin_ws/src/communication_interface/msg/test2.msg" NAME_WE)
add_dependencies(communication_interface_generate_messages_py _communication_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(communication_interface_genpy)
add_dependencies(communication_interface_genpy communication_interface_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS communication_interface_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/communication_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/communication_interface
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(communication_interface_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/communication_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/communication_interface
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(communication_interface_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/communication_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/communication_interface
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(communication_interface_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/communication_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/communication_interface
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(communication_interface_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/communication_interface
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(communication_interface_generate_messages_py std_msgs_generate_messages_py)
endif()
