GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_EXECUTABLE (nb${COMPONENT}
                compare.c
                crc.c
                create.c
                excludes.c
                getid.c
                misc.c
                mtree.c
                only.c
                spec.c
                specspec.c
                verify.c)

INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/lib/compat
                     ${CMAKE_SOURCE_DIR}/include
                     ${NBTOOL_CONFIG_DIR})
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEFINITIONS (-Wno-implicit-function-declaration)
ADD_DEPENDENCIES (nb${COMPONENT} nbtool_config)

TARGET_LINK_LIBRARIES (nb${COMPONENT} compat)

INSTALL (TARGETS nb${COMPONENT}
         RUNTIME DESTINATION ${INSTALL_DIR})
