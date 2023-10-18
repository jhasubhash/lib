#!/bin/bash

rm -rf build
rm -rf out
mkdir build
cd build
cmake ..
make
make install