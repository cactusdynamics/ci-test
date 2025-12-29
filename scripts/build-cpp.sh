#!/bin/bash

set -xe

cd cpp
cmake -B build
cmake --build build -j $(nproc)
build/citest


