kind: cmake
description: |
  ROCm HIPCC

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/vim.bst
- rocm-llvm.bst

variables:
  # TODO dwz has issues with DWARF v5 included in hipcc.bin
  optimize-debug: "false"

  command-subdir: amd/hipcc
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

sources:
- kind: git_tag
  url: rocm:llvm-project
  track: "%{rocmtag}"
  ref: rocm-6.4.1-0-gc87081df219c42dc27c5b6d86c0525bc7d01f727
- kind: patch
  path: patch/0001-Fix-hipcc-stdc++fs.patch
