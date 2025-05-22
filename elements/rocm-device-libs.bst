kind: cmake
description: |
  ROCm Device Libs

build-depends:
- freedesktop-sdk.bst:sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

variables:
  command-subdir: amd/device-libs
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DLLVM_DIR="%{prefix}/llvm/lib/cmake/llvm"

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-6.4.1-0-gc87081df219c42dc27c5b6d86c0525bc7d01f727
