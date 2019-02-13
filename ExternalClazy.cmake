set(CDT_CLAZY "${KDE_ADDR}/clazy.git" CACHE STRING "")

ExternalProject_Add(Clazy
  DEPENDS Clang
  #--Download step --------------
  GIT_REPOSITORY ${CDT_CLAZY}
  GIT_TAG master
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_BUILD_TYPE=Release
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
