GET_FILENAME_COMPONENT (COMPONENT ${CMAKE_CURRENT_SOURCE_DIR} NAME)

ADD_LIBRARY (${COMPONENT}
             efun.c
             fgetln.c
             fparseln.c
             getmode.c
             mi_vector_hash.c
             pack_dev.c
             setgroupent.c
             setpassent.c
             setprogname.c
             stat_flags.c
             strlcpy.c
             btree/bt_close.c
             btree/bt_conv.c
             btree/bt_delete.c
             btree/bt_get.c
             btree/bt_open.c
             btree/bt_overflow.c
             btree/bt_page.c
             btree/bt_put.c
             btree/bt_search.c
             btree/bt_seq.c
             btree/bt_split.c
             btree/bt_utils.c
             cdb/cdbr.c
             cdb/cdbw.c
             db/db.c
             db/dbfile.c
             gen/pw_scan.c
             gen/pwcache.c
             gen/unvis.c
             gen/vis.c
             hash/hash.c
             hash/hash_bigkey.c
             hash/hash_buf.c
             hash/hash_func.c
             hash/hash_log2.c
             hash/hash_page.c
             hash/md/md5c.c
             hash/md/md5hl.c
             hash/rmd160/rmd160.c
             hash/rmd160/rmd160hl.c
             hash/sha1/sha1.c
             hash/sha1/sha1hl.c
             hash/sha2/sha2.c
             hash/sha2/sha256hl.c
             hash/sha2/sha384hl.c
             hash/sha2/sha512hl.c
             issetugid.c
             mpool/mpool.c
             recno/rec_close.c
             recno/rec_delete.c
             recno/rec_get.c
             recno/rec_open.c
             recno/rec_put.c
             recno/rec_search.c
             recno/rec_seq.c
             recno/rec_utils.c)
INCLUDE_DIRECTORIES (${CMAKE_SOURCE_DIR}/sys
                     ${CMAKE_SOURCE_DIR}/include
                     ${CMAKE_CURRENT_SOURCE_DIR}
                     ${CMAKE_CURRENT_BINARY_DIR})
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H)
ADD_DEFINITIONS (-Wno-implicit-function-declaration)
ADD_DEFINITIONS (-D__DBINTERFACE_PRIVATE)
ADD_DEFINITIONS (-D_FILE_OFFSET_BITS=64)
ADD_DEFINITIONS (-DHAVE_NBTOOL_CONFIG_H=1)
ADD_CUSTOM_COMMAND (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/nbtool_config.h
                    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/configure)
ADD_CUSTOM_TARGET (nbtool_config
                   DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/nbtool_config.h)

ADD_DEPENDENCIES (${COMPONENT} nbtool_config)
