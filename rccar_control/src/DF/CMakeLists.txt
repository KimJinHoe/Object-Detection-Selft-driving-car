cmake_minimum_required(VERSION 3.0.2)
project(DF)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  std_msgs
)

add_message_files(FILES MsgRF.msg)
add_message_files(FILES MsgMode.msg)
generate_messages(DEPENDENCIES std_msgs)


catkin_package(
  INCLUDE_DIRS include
  LIBRARIES DF
  CATKIN_DEPENDS message_generation roscpp rospy std_msg
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

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -pthread -li2c")

add_compile_options(--std=c++11 -pthread -li2c)

add_executable(rf_receiver ${PROJECT_HEADERS} src/RFReceiver.cpp src/rf.cpp)
add_dependencies(rf_receiver ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(rf_receiver ${catkin_LIBRARIES})

#add_executable(led_test ${PROJECT_HEADERS} src/led_test.cpp src/jetsonGPIO.cpp)
#add_dependencies(led_test ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
#target_link_libraries(led_test ${catkin_LIBRARIES})

add_executable(pwm_test ${PROJECT_HEADERS} src/pwm_test.cpp src/jetsonGPIO.cpp src/pwm.cpp)
add_dependencies(pwm_test ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(pwm_test ${catkin_LIBRARIES})

add_executable(racecar ${PROJECT_HEADERS} src/racecar.cpp src/motor.cpp src/esc.cpp)
add_dependencies(racecar ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(racecar ${catkin_LIBRARIES} -li2c)
