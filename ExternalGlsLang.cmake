set(CDT_GLS_LANG "${KHRONOS_ADDR}/glslang.git" CACHE STRING "")

ExternalProject_Add(GlsLang
  #--Download step --------------
  GIT_REPOSITORY ${CDT_GLS_LANG}
  GIT_TAG master
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
