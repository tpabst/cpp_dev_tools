cmake_minimum_required(VERSION 3.8)

project(cpp_dev_tools)
set(GITHUB_ADDR "https://github.com")
set(KDAB_ADDR "${GITHUB_ADDR}/KDAB")
set(KDE_ADDR "${GITHUB_ADDR}/KDE")
set(KHRONOS_ADDR "${GITHUB_ADDR}/KhronosGroup")

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "~/sysroot_x11_dev_tools" CACHE PATH "" FORCE)
endif()

# Qt
set(QT_RELEASE "5.10.0" CACHE STRING "")
set(QT_QUICK_CARD "qt5" CACHE STRING "")

find_package(Qt5 REQUIRED COMPONENTS Core Gui Widgets Network Qml Quick LinguistTools)

include(ExternalProject)
set_directory_properties(PROPERTIES EP_PREFIX "${CMAKE_BINARY_DIR}")
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include(ExternalKDStateMachineEditor)
include(ExternalExtraCMakeModules)
include(ExternalKDESyntaxHighlighting)
include(ExternalGlsLang)
include(ExternalGammaRay)

#install(DIRECTORY ${CMAKE_BINARY_DIR}/cmake/ DESTINATION cmake)
install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION include USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION lib USE_SOURCE_PERMISSIONS)
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/ DESTINATION bin USE_SOURCE_PERMISSIONS)
