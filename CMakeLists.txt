cmake_minimum_required(VERSION 3.14)

project(acts-externals VERSION 0.0.0)

cmake_policy(SET CMP0135 NEW)

# must be set before project(...) call; version module is needed before
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# External dependency version
# base deps
set(_acts_boost_version 1.80.0)
set(_acts_eigen3_version 3.3.7)
set(_acts_nlohmanjson_version 3.2.0)
set(_acts_tbb_version v2021.6.0)
set(_acts_xercesc_version 3.2.4)
set(_acts_base_versions boost_${_acts_boost_version}_eigen_${_acts_eigen3_version}_nlohmann_${_acts_nlohmanjson_version}_tbb_${_acts_tbb_version}_xercesc_${_acts_xercesc_version})
# core hep deps
set(_acts_geant4_version v11.0.3)
set(_acts_root_version v6.26.04)
set(_acts_edm4hep_version v00-04-01)
set(_acts_dd4hep_version 1.21)
set(_acts_actsdd4hep_version 1.0.0)
set(_acts_hepmc3_version 3.2.1)

option(VERSIONING "Add versioning check" OFF)
option(BUILD_BASE "Build the base externals" OFF)
option(BUILD_GEANT4 "Build Geant4 external" OFF)
option(BUILD_ROOT "Build ROOT external" OFF)

set(ENV{TARGET_DIR} ${CMAKE_INSTALL_PREFIX})
message(STATUS "Creating target directory: $ENV{TARGET_DIR}")
file(MAKE_DIRECTORY $ENV{TARGET_DIR})

# Some specifications
set(_acts_geant4_data On)

# Threads
set(_acts_build_threads 4)

if (VERSIONING)
    file(MAKE_DIRECTORY $ENV{TARGET_DIR}/versioning)
    add_subdirectory(versioning)
else()
    add_subdirectory(externals)
endif()
