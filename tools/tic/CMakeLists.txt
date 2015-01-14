GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_EXECUTABLE (${COMPONENT}
                ${CMAKE_SOURCE_DIR}/lib/libterminfo/compile.c
                tic.c
                ${CMAKE_CURRENT_BINARY_DIR}/hash.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/lib/compat
                     ${CMAKE_SOURCE_DIR}/lib/libterminfo
                     ${NBTOOL_CONFIG_DIR})
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEFINITIONS (-Wno-implicit-function-declaration)
ADD_DEPENDENCIES (${COMPONENT} nbtool_config)

ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/hash.c
                    COMMAND sh ${CMAKE_SOURCE_DIR}/lib/libterminfo/envwrap.sh
                        $<TARGET_FILE_DIR:nbperf>
                        ${CMAKE_SOURCE_DIR}/lib/libterminfo/genhash
                        ${CMAKE_SOURCE_DIR}/lib/libterminfo/term.h >
                            ${CMAKE_CURRENT_BINARY_DIR}/hash.c
                    DEPENDS
                        ${CMAKE_SOURCE_DIR}/lib/libterminfo/envwrap.sh
                        ${CMAKE_SOURCE_DIR}/lib/libterminfo/genhash
                        ${CMAKE_SOURCE_DIR}/lib/libterminfo/term.h
                        nbperf)

TARGET_LINK_LIBRARIES (${COMPONENT} compat)
