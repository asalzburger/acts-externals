message(STATUS "Building Pythia8")

include(ExternalProject)

set(Pythia8_URL "https://pythia.org/download/pythia83/pythia8307.tgz")

ExternalProject_Add(
  pythia8
  URL ${Pythia8_URL}
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}/pythia8 
  BUILD_COMMAND make 
  INSTALL_COMMAND make install
  BUILD_IN_SOURCE True
)
