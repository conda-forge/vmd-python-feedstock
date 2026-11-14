#!/bin/bash
set -ex
# GCC 15 defaults to C23; VMD's bundled rnaview plugin uses pre-C23
# empty prototypes. Remove once upstream vmd-python fixes rna_header.h.
# Linux only: the plugin Makefiles also pass CFLAGS to C++ compiles, which
# g++ only warns about but clang rejects. macOS clang still defaults to gnu17.
if [[ "${target_platform}" == linux-* ]]; then
  export CFLAGS="${CFLAGS} -std=gnu17"
fi
${PYTHON} -m pip install . --no-deps -vv
