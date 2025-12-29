#!/bin/bash

set -xe

cd go
CGO_ENABLED=0 go build -o citest main.go
