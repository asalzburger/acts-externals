#!/bin/bash

export build_dir=${1}
export target_dir=${2}

echo "[ acts-externals ] Building versioning file"
cmake -S . -B ${build_dir} -DCMAKE_INSTALL_PREFIX=${target_dir} -DCMAKE_CXX_COMPILER=clang -DCMAKE_C_COMPILER=clang -DVERSIONING=On 

echo "[ acts-externals ] Building base dependencies"
cmake -S . -B ${build_dir} -DCMAKE_INSTALL_PREFIX=${target_dir} -DCMAKE_CXX_COMPILER=clang -DCMAKE_C_COMPILER=clang -DVERSIONING=Off -DBUILD_BASE=On
cmake --build ${build_dir}

echo "[ acts-externals ] Building Geant4"
cmake -S . -B ${build_dir} -DCMAKE_INSTALL_PREFIX=${target_dir} -DCMAKE_CXX_COMPILER=clang -DCMAKE_C_COMPILER=clang -DVERSIONING=Off -DBUILD_BASE=Off -DBUILD_GEANT4=On
cmake --build ${build_dir}