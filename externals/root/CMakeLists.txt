message( STATUS "Building ROOT ${_acts_root_version}" )

include(ExternalProject)

string(REPLACE "." "-" _acts_root_folder ${_acts_root_version})

set(ROOT_URL "https://github.com/root-project/root/releases/download/${_acts_root_folder}/root_${_acts_root_version}.source.tar.gz")

set(LIB_SUFFIX "so")
if(APPLE)
  set(LIB_SUFFIX "dylib")
endif()

ExternalProject_Add(
  root
  URL ${ROOT_URL}
  CONFIGURE_COMMAND cmake -S . -B build_root -DXercesC_INCLUDE_DIR=$ENV{TARGET_DIR}/xerces-c/include -DXercesC_LIBRARY=$ENV{TARGET_DIR}/xerces-c/lib/libxerces-c.${LIB_SUFFIX} -DXercesC_VERSION=${_acts_xercesc_version}  -DCMAKE_PREFIX_PATH=$ENV{TARGET_DIR}/tbb:$ENV{TARGET_DIR}/pythia8:$ENV{TARGET_DIR}/geant4 -DCMAKE_INSTALL_PREFIX=$ENV{TARGET_DIR}/root -DGEANT4_BUILD_CXXSTD=17 -Dbuiltin_glew=On
  BUILD_COMMAND cmake --build  build_root -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build  build_root --target install -j${_acts_build_threads}
  BUILD_IN_SOURCE True
)
