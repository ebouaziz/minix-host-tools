GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)
STRING (SUBSTRING ${COMPONENT} 3 -1 COMPONENT)

ADD_LIBRARY (${COMPONENT}
             compile.c
             curterm.c
             setupterm.c
             term.c
             termcap.c
             termcap_map.c
             ti.c
             tparm.c
             tputs.c
             )
INCLUDE_DIRECTORIES (${CMAKE_CURRENT_SOURCE_DIR}
                     ${CMAKE_SOURCE_DIR}/lib/compat 
                     ${NBTOOL_CONFIG_DIR})
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEPENDENCIES (${COMPONENT} nbtool_config)