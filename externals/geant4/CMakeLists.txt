message( STATUS "Building Geant4 ${_acts_geant4_version}" )

include(ExternalProject)

set(GEANT4_URL "https://github.com/Geant4/geant4/archive/refs/tags/${_acts_geant4_version}.tar.gz")
set(GEANT4_SRC_DIR ${CMAKE_CURRENT_BINARY_DIR}/geant4-prefix/src/geant4)
set(GEANT4_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR}/geant4-prefix/src/geant4-build)

set(LIB_SUFFIX "so")
if(APPLE)
  set(LIB_SUFFIX "dylib")
endif()

ExternalProject_Add(
  geant4
  URL ${GEANT4_URL}
  DOWNLOAD_EXTRACT_TIMESTAMP True
  CONFIGURE_COMMAND cmake -S ${GEANT4_SRC_DIR} -B ${GEANT4_BUILD_DIR} -DXercesC_INCLUDE_DIR=$ENV{TARGET_DIR}/xerces-c/include -DXercesC_LIBRARY=$ENV{TARGET_DIR}/xerces-c/lib/libxerces-c.${LIB_SUFFIX} -DXercesC_VERSION=${_acts_xercesc_version} -DCMAKE_INSTALL_PREFIX=$ENV{TARGET_DIR}/geant4 -DCMAKE_CXX_STANDARD=17 -DGEANT4_USE_GDML=On -DGEANT4_INSTALL_DATA=${_acts_geant4_data}
  BUILD_COMMAND cmake --build ${GEANT4_BUILD_DIR} -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build ${GEANT4_BUILD_DIR} --target install -j${_acts_build_threads}
  BUILD_IN_SOURCE True  
)
