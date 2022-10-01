message( STATUS "Building ROOT ${_acts_root_version}" )

include(ExternalProject)

string(REPLACE "." "-" _acts_root_folder ${_acts_root_version})

set(ROOT_URL "https://github.com/root-project/root/releases/download/${_acts_root_folder}/root_${_acts_root_version}.source.tar.gz")

ExternalProject_Add(
  root
  URL ${ROOT_URL}
  CONFIGURE_COMMAND cmake -S . -B build_root -DCMAKE_PREFIX_PATH=${CMAKE_INSTALL_PREFIX}/xerces-c:${CMAKE_INSTALL_PREFIX}/tbb:${CMAKE_INSTALL_PREFIX}/pythia8:${CMAKE_INSTALL_PREFIX}/geant4 -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/root -DGEANT4_BUILD_CXXSTD=17 -Dbuiltin_glew=On
  BUILD_COMMAND cmake --build  build_root -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build  build_root --target install
  BUILD_IN_SOURCE True
)

