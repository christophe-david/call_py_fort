#!/usr/bin/env bash

export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib" # fix for recent macOS from https://stackoverflow.com/a/65428700/16488238

gfortran -c types.f90 data.f90
f2py -c -m demo types.o data.o data_reader.f90 demo.f90