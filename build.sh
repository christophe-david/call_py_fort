#!/bin/bash

# When using pyenv...
python_prefix=$(pyenv prefix)
export CMAKE_PREFIX_PATH=$python_prefix

mkdir build
cd build || exit
cmake ..
make
make install