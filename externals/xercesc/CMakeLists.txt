message(STATUS "Building Xerces-c ${_acts_xercesc_version}")

include(ExternalProject)

set(Xercesc_URL "https://dlcdn.apache.org//xerces/c/3/sources/xerces-c-${_acts_xercesc_version}.tar.gz")
set(Xercesc_SRC_DIR ${CMAKE_CURRENT_BINARY_DIR})

ExternalProject_Add(
  xercesc
  URL ${Xercesc_URL}
  CONFIGURE_COMMAND cmake -S . -B xercesc-build -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/xerces-c -DCMAKE_BUILD_TYPE=Release
  BUILD_COMMAND cmake --build xercesc-build -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build xercesc-build --target install
  BUILD_IN_SOURCE True
)
