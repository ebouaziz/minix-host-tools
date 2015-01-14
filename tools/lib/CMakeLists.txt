# define subprojects
SET (subprojects
     compat)

# build all projects
FOREACH (project ${subprojects})
  ADD_SUBDIRECTORY (${project} ${project})
ENDFOREACH (project)
