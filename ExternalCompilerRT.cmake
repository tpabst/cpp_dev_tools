set(CDT_COMPILER_RT "${LLVM_ADDR}/compiler-rt.git" CACHE STRING "")

ExternalProject_Add(CompilerRT
  #--Download step --------------
  GIT_REPOSITORY ${CDT_COMPILER_RT}
  GIT_TAG google/stable
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_BUILD_TYPE=Release
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
