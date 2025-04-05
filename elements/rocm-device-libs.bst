kind: cmake
description: |
  ROCm Device Libs

build-depends:
- freedesktop-sdk.bst:sdk.bst
- rocm-cmake.bst
- rocm-llvm.bst

variables:
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DLLVM_DIR="%{prefix}/llvm/lib/cmake/llvm"

  command-subdir: "amd/device-libs"

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-6.3.3-0-ge5bf7e55c91490b07c49d8960fa7983d864936c4
