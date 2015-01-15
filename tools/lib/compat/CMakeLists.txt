GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_LIBRARY (${COMPONENT}
             efun.c
             getmode.c
             mi_vector_hash.c
             pack_dev.c
             stat_flags.c
             cdb/cdbr.c
             cdb/cdbw.c
             gen/pw_scan.c
             gen/pwcache.c
             gen/vis.c
             hash/md/md5c.c
             hash/md/md5hl.c
             hash/rmd160/rmd160.c
             hash/rmd160/rmd160hl.c
             hash/sha1/sha1.c
             hash/sha1/sha1hl.c
             hash/sha2/sha2.c
             hash/sha2/sha256hl.c
             hash/sha2/sha384hl.c
             hash/sha2/sha512hl.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/sys
                     ${CMAKE_CURRENT_SOURCE_DIR}  
                     ${CMAKE_CURRENT_BINARY_DIR})
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEFINITIONS (-Wno-implicit-function-declaration)
ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/nbtool_config.h
                    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/configure)
ADD_CUSTOM_TARGET (nbtool_config
                   DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/nbtool_config.h)

ADD_DEPENDENCIES (${COMPONENT} nbtool_config)
