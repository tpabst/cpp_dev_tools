set(CDT_CLANG "${LLVM_ADDR}/clang.git" CACHE STRING "")

ExternalProject_Add(Clang
  #--Download step --------------
  GIT_REPOSITORY ${CDT_CLANG}
  GIT_TAG google/stable
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_BUILD_TYPE=Release
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
