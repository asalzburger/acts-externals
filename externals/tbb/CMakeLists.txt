message( STATUS "Building oneTBB ${_acts_tbb_version}" )

include(ExternalProject)

set(TBB_URL "https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_acts_tbb_version}.tar.gz")

ExternalProject_Add(
  tbb
  URL ${TBB_URL}
  CONFIGURE_COMMAND cmake -S . -B build_tbb -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/tbb -DCMAKE_CXX_STANDARD=17 -DTBB_TEST=Off
  BUILD_COMMAND cmake --build  build_tbb -j${_acts_build_threads}
  INSTALL_COMMAND cmake --build  build_tbb --target install -j${_acts_build_threads}
  BUILD_IN_SOURCE True
)
