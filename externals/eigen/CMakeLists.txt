message(STATUS "Building Eigen ${_acts_eigen3_version}")

include(ExternalProject)

set(Eigen3_URL "https://gitlab.com/libeigen/eigen/-/archive/${_acts_eigen3_version}/${_acts_eigen3_version}.tar.gz")
set(Eigen3_SRC_DIR ${CMAKE_CURRENT_BINARY_DIR}/eigen3-prefix/src/eigen3)
set(Eigen3_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR}/eigen3-prefix/src/eigen3-build)

ExternalProject_Add(
  eigen3
  URL ${Eigen3_URL}
  CONFIGURE_COMMAND cmake -S ${Eigen3_SRC_DIR} -B ${Eigen3_BUILD_DIR}  -DCMAKE_INSTALL_PREFIX=$ENV{TARGET_DIR}/eigen -DCMAKE_CXX_STANDARD=17
  BUILD_COMMAND cmake --build  ${Eigen3_BUILD_DIR}  -j${_acts_build_threads} 
  INSTALL_COMMAND cmake --build  ${Eigen3_BUILD_DIR} -j${_acts_build_threads} --target install
)
