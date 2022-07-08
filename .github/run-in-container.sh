#!/bin/bash

set -xe

cmake -B build
cmake --build build -j $(nproc)
build/citest

