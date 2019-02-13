set(CDT_KD_STATE_MACHINE_EDITOR "${KDAB_ADDR}/KDStateMachineEditor.git" CACHE STRING "")

ExternalProject_Add(KDStateMachineEditor
  #--Download step --------------
  GIT_REPOSITORY ${CDT_KD_STATE_MACHINE_EDITOR}
  GIT_TAG master
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DQT_QMAKE_EXECUTABLE=${QT_QMAKE_EXECUTABLE}
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
