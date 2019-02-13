set(CDT_LLVM "${LLVM_ADDR}/llvm.git" CACHE STRING "")

ExternalProject_Add(Llvm
  DEPENDS Clang CompilerRT
  #--Download step --------------
  GIT_REPOSITORY ${CDT_LLVM}
  GIT_TAG stable
  GIT_SUBMODULES
  TIMEOUT 30
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86
  #--Output logging-------------
  LOG_DOWNLOAD ON
  LOG_INSTALL ON
  )
