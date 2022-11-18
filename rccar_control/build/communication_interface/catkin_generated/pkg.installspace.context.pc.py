# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "message_runtime;message_generation;roscpp;std_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ludp;-lconnector;-lnodelet_sample".split(';') if "-ludp;-lconnector;-lnodelet_sample" != "" else []
PROJECT_NAME = "communication_interface"
PROJECT_SPACE_DIR = "/home/bnlab/catkin_ws/install"
PROJECT_VERSION = "0.0.0"
