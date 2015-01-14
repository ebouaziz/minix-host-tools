# define subprojects
SET (subprojects
     compat
     terminfo)

# build all projects
FOREACH (project ${subprojects})
  ADD_SUBDIRECTORY (${project} ${project})
ENDFOREACH (project)
