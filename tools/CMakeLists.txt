CMAKE_MINIMUM_REQUIRED (VERSION 3.0)

PROJECT (minix-tools)

# define subprojects
SET (subprojects
     #byacc
     compat
     #flex
     #host-mkdep
     join
     mkfs.mfs
     mktemp
     # mtree
     pwd_mkdb
     tic
     toproto
     tsort)

SET (NBTOOL_CONFIG_DIR ${CMAKE_BINARY_DIR}/lib/compat)

# build all projects
FOREACH (project ${subprojects})
  ADD_SUBDIRECTORY (${project} ${project})
ENDFOREACH (project)
