#!/bin/sh

set -x

(cd host/Python-2.7.3 && ./configure && make python Parser/pgen) || echo "Failed to build host Python"


