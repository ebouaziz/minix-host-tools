GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_EXECUTABLE (nb${COMPONENT}
                dist/closure.c
                dist/error.c
                dist/lalr.c
                dist/lr0.c
                dist/main.c
                dist/mkpar.c
                dist/output.c
                dist/reader.c
                dist/skeleton.c
                dist/symtab.c
                dist/verbose.c
                dist/warshall.c
                dist/graph.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/include
                     ${CMAKE_SOURCE_DIR}/lib/compat 
                     ${NBTOOL_CONFIG_DIR}
                     ${CMAKE_CURRENT_SOURCE_DIR}/include
                     ${CMAKE_CURRENT_SOURCE_DIR}/dist)
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H
                 -D_FILE_OFFSET_BITS=64
                 -DHAVE_CONFIG_H
                 -DGCC_NORETURN=__dead)
ADD_DEPENDENCIES (nb${COMPONENT} nbtool_config)

INSTALL (TARGETS nb${COMPONENT}
         RUNTIME DESTINATION ${INSTALL_DIR})

