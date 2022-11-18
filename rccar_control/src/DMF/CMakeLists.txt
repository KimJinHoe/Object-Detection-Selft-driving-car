cmake_minimum_required(VERSION 3.0.2)
project(DMF)

find_package(catkin REQUIRED COMPONENTS
  nodelet
  pluginlib
  message_generation
  roscpp
  rospy
  std_msgs
  
)

add_message_files(FILES MsgLine.msg)
add_message_files(FILES MsgSpeed.msg)
add_message_files(FILES Speed.msg)
add_message_files(FILES MsgnCurLane.msg)
generate_messages(DEPENDENCIES std_msgs)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES DMF
LIBRARIES nodelet_sample
LIBRARIES Nodelet
  CATKIN_DEPENDS message_generation roscpp rospy std_msgs 
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

add_library(Nodelet_DMF src/Nodelet_DMF.cpp)
target_link_libraries(Nodelet_DMF ${catkin_LIBRARIES})

add_library(Nodelet_DMF_Nodelet src/nodelet.cpp)
target_link_libraries(Nodelet_DMF_Nodelet Nodelet_DMF ${catkin_LIBRARIES})

add_executable(subscribe ${PROJECT_HEADERS} src/subscriber.cpp src/Nodelet_DMF.cpp)
add_dependencies(subscribe ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(subscribe Nodelet_DMF ${catkin_LIBRARIES})

add_executable(nCurLane ${project_HEADERS} src/nCurLane.cpp)
add_dependencies(nCurLane ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(nCurLane ${catkin_LIBRARIES})

add_executable(speed_pub ${project_HEADERS} src/speed.cpp src/speed_pub.cpp)
add_dependencies(speed_pub ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(speed_pub ${catkin_LIBRARIES})

#add_executable(GPS ${project_HEADERS} src/gps.cpp)
#add_dependencies(GPS ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
#target_link_libraries(GPS ${catkin_LIBRARIES})

#add_executable(led_test ${PROJECT_HEADERS} src/led_test.cpp src/jetsonGPIO.cpp)
#add_dependencies(led_test ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
#target_link_libraries(led_test ${catkin_LIBRARIES})
