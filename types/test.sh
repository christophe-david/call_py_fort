#!/usr/bin/env bash

rm -f *.so *.mod *.o
bash ./compile.sh
python main.py $*