#!/usr/bin/env bash

export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib" # fix for recent macOS from https://stackoverflow.com/a/65428700/16488238

gfortran -c shapes.f90
f2py -c -m demo shapes.o demo.f90