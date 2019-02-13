set(CDT_EXTRA_CMAKE_MODULE "${KDE_ADDR}/extra-cmake-modules.git" CACHE STRING "")

ExternalProject_Add(ExtraCmakeModules
  #--Download step --------------
  GIT_REPOSITORY ${CDT_EXTRA_CMAKE_MODULE}
  GIT_TAG master
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
