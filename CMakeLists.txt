cmake_minimum_required(VERSION 3.14)

cmake_policy(SET CMP0135 NEW)

project(acts-externals VERSION 0.0.0)

# must be set before project(...) call; version module is needed before
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# External dependency version
set(_acts_eigen3_version 3.3.7)
set(_acts_boost_version 1.80.0)
set(_acts_tbb_version v2021.6.0)
set(_acts_geant4_version v11.0.3)
set(_acts_dd4hep_version 1.21)
set(_acts_actsdd4hep_version 1.0.0)
set(_acts_edm4hep_version v00-04-01)
set(_acts_hepmc3_version 3.2.1)
set(_acts_nlohmanjson_version 3.2.0)
set(_acts_root_version v6.26.04)
set(_acts_xercesc_version 3.2.4)

option(BUILD_BASE "Build the base externals" OFF)
option(BUILD_GEANT4 "Build Geant4 external" OFF)
option(BUILD_ROOT "Build ROOT external" OFF)

set(ENV{TARGET_DIR} ${CMAKE_INSTALL_PREFIX})
message(STATUS "Creating target directory: $ENV{TARGET_DIR}")
file(MAKE_DIRECTORY $ENV{TARGET_DIR})

# Some specifications
set(_acts_geant4_data Off)

# Threads
set(_acts_build_threads 6)

add_subdirectory(externals)
