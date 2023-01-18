message( STATUS "Building oneTBB ${_acts_tbb_version}" )

include(ExternalProject)

set(TBB_URL "https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_acts_tbb_version}.tar.gz")
set(TBB_SRC_DIR ${CMAKE_CURRENT_BINARY_DIR}/tbb-prefix/src/tbb)
set(TBB_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR}/tbb-prefix/src/tbb-build)

ExternalProject_Add(
  tbb
  URL ${TBB_URL}
  CONFIGURE_COMMAND cmake -S ${TBB_SRC_DIR} -B ${TBB_BUILD_DIR} -DCMAKE_INSTALL_PREFIX=$ENV{TARGET_DIR}/tbb -DCMAKE_CXX_STANDARD=17 -DTBB_TEST=Off
  BUILD_COMMAND cmake --build  ${TBB_BUILD_DIR} -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build  ${TBB_BUILD_DIR} --target install -j${_acts_build_threads}
  BUILD_IN_SOURCE True
)
