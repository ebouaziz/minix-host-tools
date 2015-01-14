GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_EXECUTABLE (${COMPONENT}
                graph2.c
                graph3.c
                nbperf-bdz.c
                nbperf-chm.c
                nbperf-chm3.c
                nbperf.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/lib/compat
                     ${NBTOOL_CONFIG_DIR}
                     ${CMAKE_SOURCE_DIR}/sys)
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEPENDENCIES (${COMPONENT} nbtool_config)
TARGET_LINK_LIBRARIES (${COMPONENT} compat)
