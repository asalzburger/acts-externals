message(STATUS "Building Boost ${_acts_boost_version}")

include(ExternalProject)

string(REPLACE "." "_" _acts_boost_version_ ${_acts_boost_version})
set(Boost_URL "https://boostorg.jfrog.io/artifactory/main/release/${_acts_boost_version}/source/boost_${_acts_boost_version_}.tar.gz")
set(Boost_SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/boost-prefix/src/boost)
set(Boost_B2_CXXFLAGS -std=c++17\ -fPIC\ -O3)
set(Boost_B2_FLAGS variant=release threading=multi runtime-link=shared link=shared cxxflags=${Boost_B2_CXXFLAGS})

ExternalProject_Add(
  boost
  URL ${Boost_URL}
  CONFIGURE_COMMAND ./bootstrap.sh 
  BUILD_COMMAND ./b2 ${Boost_B2_FLAGS} --prefix=$ENV{TARGET_DIR}/boost
  INSTALL_COMMAND ./b2 install --prefix=$ENV{TARGET_DIR}/boost
  SOURCE_DIR ${Boost_SOURCE_DIR}
  BUILD_IN_SOURCE true)