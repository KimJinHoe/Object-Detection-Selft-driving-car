cmake_minimum_required(VERSION 3.0.2)
project(LF)

find_package(catkin REQUIRED COMPONENTS
  nodelet
  pluginlib
  message_generation
  roscpp
  rospy
  std_msgs
serial
)

add_message_files(FILES MsgGPS.msg)
add_message_files(FILES MsgDetect.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(
INCLUDE_DIRS include
LIBRARIES LF
CATKIN_DEPENDS message_runtime message_generation roscpp std_msgs serial
DEPENDS system_lib
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

file(GLOB_RECURSE project_HEADERS
  "*.h"
  "*.hpp"
)

add_executable(gps_test ${project_HEADERS} src/gps.cpp)
add_dependencies(gps_test ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(gps_test ${catkin_LIBRARIES})

add_executable(uart ${project_HEADERS} src/uart.cpp)
add_dependencies(uart ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(uart ${catkin_LIBRARIES})
