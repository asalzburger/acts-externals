message( STATUS "Building Geant4 ${_acts_geant4_version}" )

include(ExternalProject)


set(GEANT4_URL "https://github.com/Geant4/geant4/archive/refs/tags/${_acts_geant4_version}.tar.gz")

ExternalProject_Add(
  geant4
  URL ${GEANT4_URL}
  CONFIGURE_COMMAND cmake -S . -B build_geant4 -DCMAKE_PREFIX_PATH=${CMAKE_INSTALL_PREFIX}/xerces-c:${CMAKE_INSTALL_PREFIX}/tbb  -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/geant4 -DCMAKE_CXX_STANDARD=17 -DGEANT4_USE_GDML=On -DGEANT4_INSTALL_DATA=${_acts_geant4_data}
  BUILD_COMMAND cmake --build  build_geant4 -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build  build_geant4 --target install -j${_acts_build_threads}
  BUILD_IN_SOURCE True
)
