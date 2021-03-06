set(CDT_GAMMARAY "${KDAB_ADDR}/GammaRay.git" CACHE STRING "")

ExternalProject_Add(GammaRay
    DEPENDS GlsLang KDStateMachineEditor KDESyntaxHighlighting
  #--Download step --------------
  GIT_REPOSITORY ${CDT_GAMMARAY}
  GIT_TAG 5.12
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DQT_QMAKE_EXECUTABLE=${QT_QMAKE_EXECUTABLE} -DGAMMARAY_BUILD_UI=${GAMMARAY_BUILD_UI}
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
