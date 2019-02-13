set(CDT_KDE_SYNTAX_HIGHLIGHTING "${KDE_ADDR}/syntax-highlighting.git" CACHE STRING "")

ExternalProject_Add(KDESyntaxHighlighting
  DEPENDS ExtraCmakeModules
  #--Download step --------------
  GIT_REPOSITORY ${CDT_KDE_SYNTAX_HIGHLIGHTING}
  GIT_TAG master
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
