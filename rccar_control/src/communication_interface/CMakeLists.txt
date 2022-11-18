cmake_minimum_required(VERSION 3.0.2)
project(communication_interface)

find_package(catkin REQUIRED COMPONENTS
  nodelet
  pluginlib
  message_generation
  roscpp
  rospy
  std_msgs
)

add_message_files(FILES test.msg)
add_message_files(FILES test2.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(
INCLUDE_DIRS include
LIBRARIES udp
LIBRARIES connector
LIBRARIES nodelet_sample
CATKIN_DEPENDS message_runtime message_generation roscpp std_msgs
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
add_library(NodeletSample1
  src/connector.cpp
)
target_link_libraries(NodeletSample1
	${catkin_LIBRARIES}
)

add_library(NodeletSampleNodelet1
  src/nodelet.cpp
)
target_link_libraries(NodeletSampleNodelet1
	NodeletSample1
	${catkin_LIBRARIES}
)


add_executable(udp_sender ${project_HEADERS} src/sender.cpp src/udp.cpp src/connector.cpp src/DataObjectQueue.cpp)
add_dependencies(udp_sender ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(udp_sender NodeletSample1 ${catkin_LIBRARIES})

add_executable(udp_reciever ${project_HEADERS} src/reciever.cpp src/udp.cpp src/connector.cpp src/DataObjectQueue.cpp)
add_dependencies(udp_reciever ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(udp_reciever NodeletSample1 ${catkin_LIBRARIES})

add_executable(gps_recv ${project_HEADERS} src/gps_recv.cpp src/udp.cpp src/connector.cpp src/DataObjectQueue.cpp)
add_dependencies(gps_recv ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(gps_recv NodeletSample1 ${catkin_LIBRARIES})

add_executable(gps_data ${project_HEADERS} src/topic_publisher.cpp)
add_dependencies(gps_data ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(gps_data ${catkin_LIBRARIES})

add_executable(speed_data ${project_HEADERS} src/speed_publisher.cpp)
add_dependencies(speed_data ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(speed_data ${catkin_LIBRARIES})

add_executable(topic_subscriber ${project_HEADERS} src/topic_subscriber.cpp)
add_dependencies(topic_subscriber ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(topic_subscriber ${catkin_LIBRARIES})
