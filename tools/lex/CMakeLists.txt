GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

# it might be worth to generate a dedicated m4 tool here
FIND_PROGRAM (m4 m4)

ADD_EXECUTABLE (nb${COMPONENT}
                dist/buf.c
                dist/ccl.c
                dist/dfa.c
                dist/ecs.c
                dist/filter.c
                dist/gen.c
                dist/main.c
                dist/misc.c
                dist/nfa.c
                dist/options.c
                dist/regex.c
                dist/scanflags.c
                dist/scanopt.c
                dist/sym.c
                dist/tables.c
                dist/tables_shared.c
                dist/tblcmp.c
                dist/yylex.c
                ${CMAKE_CURRENT_BINARY_DIR}/parse.c
                ${CMAKE_CURRENT_BINARY_DIR}/scan.c
                ${CMAKE_CURRENT_BINARY_DIR}/skel.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/include
                     ${CMAKE_SOURCE_DIR}/lib/compat 
                     ${NBTOOL_CONFIG_DIR}
                     ${CMAKE_CURRENT_SOURCE_DIR}
                     ${CMAKE_CURRENT_BINARY_DIR}
                     ${CMAKE_CURRENT_SOURCE_DIR}/include
                     ${CMAKE_CURRENT_SOURCE_DIR}/dist)
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H=1
                 -D_FILE_OFFSET_BITS=64
                 -DHAVE_CONFIG_H
                 -DM4=\"${m4}\")
ADD_DEPENDENCIES (nb${COMPONENT} nbtool_config)
TARGET_LINK_LIBRARIES (nb${COMPONENT} compat m)

INSTALL (TARGETS nb${COMPONENT}
         RUNTIME DESTINATION ${INSTALL_DIR})

ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/parse.h
                    COMMAND echo "#include <initparse.h>" > 
                      ${CMAKE_CURRENT_BINARY_DIR}/parse.h
                    VERBATIM)
ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/parse.c
                    COMMAND echo "#include <initparse.c>" > 
                      ${CMAKE_CURRENT_BINARY_DIR}/parse.c
                    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/parse.h
                    VERBATIM)
ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/scan.c
                    COMMAND echo "#include <initscan.c>" > 
                      ${CMAKE_CURRENT_BINARY_DIR}/scan.c
                    VERBATIM)

ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/skel.c
                    COMMAND sed -e 's/m4_/m4postproc_/g' 
                                -e 's/m4preproc_/m4_/g'
                            ${CMAKE_CURRENT_SOURCE_DIR}/dist/flex.skl |
                            m4 -I ${CMAKE_CURRENT_SOURCE_DIR}/dist
                               -P |
                            sed -e 's/m4postproc_/m4_/g' |
                            sh ${CMAKE_CURRENT_SOURCE_DIR}/dist/mkskel.sh >
                               ${CMAKE_CURRENT_BINARY_DIR}/skel.c
                    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/dist/flex.skl
                            ${CMAKE_CURRENT_SOURCE_DIR}/dist/mkskel.sh)
