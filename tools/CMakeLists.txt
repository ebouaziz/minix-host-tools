CMAKE_MINIMUM_REQUIRED (VERSION 3.0)

PROJECT (minix-tools)

SET (TOOLS
     join
     mkfs.mfs
     mktemp
     mtree
     nbperf
     pwd_mkdb
     tic
     toproto
     tsort
     lex)

# define subprojects
SET (subprojects
     lib
     #byacc
     ${TOOLS})

SET (NBTOOL_CONFIG_DIR ${CMAKE_BINARY_DIR}/lib/compat)
SET (INSTALL_DIR ${CMAKE_BINARY_DIR}/install)

# build all projects
FOREACH (project ${subprojects})
  ADD_SUBDIRECTORY (${project} ${project})
ENDFOREACH (project)
