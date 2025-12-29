cmake_minimum_required(VERSION 3.13)
project(citest)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(ENABLE_CLANG_TIDY "Run clang-tidy" OFF)

add_compile_options(
  -Wall
  -Wextra
  -Wpedantic
  -Wshadow
  -Wnon-virtual-dtor
  -Wpedantic
  -Wold-style-cast
  -Wcast-align
  -Wunused
  -Woverloaded-virtual
  -Wsign-conversion
  -Wmisleading-indentation
  -Wduplicated-cond
  -Wduplicated-branches
  -Wnull-dereference
  -Wuseless-cast
  -Wdouble-promotion
  -g
  -O3
)

if (ENABLE_CLANG_TIDY)
  find_program(CLANG_TIDY clang-tidy clang-tidy-14 clang-tidy-13 clang-tidy-12 clang-tidy-11)
  set(CMAKE_CXX_CLANG_TIDY ${CLANG_TIDY})
else()
  message(STATUS "Not running clang-tidy. Use ENABLE_CLANG_TIDY=ON to run clang-tidy.")
endif()

add_executable(citest
  src/main.cc
)

target_compile_features(citest
  PUBLIC
  cxx_std_20
)
