kind: cmake
description: |
  ROCr Runtime - HSA Runtime API and runtime for ROCm

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:extensions/mesa/libdrm.bst
# for xxd
- freedesktop-sdk.bst:components/vim.bst
- rocm-cmake.bst
- rocm-llvm.bst
- rocm-device-libs.bst

depends:
- numactl.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: "%{prefix}/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig"

variables:
  cmake-local:
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++"

config:
  strip-commands: []

sources:
- kind: git_tag
  url: rocm:ROCR-Runtime
  track: "%{rocmtag}"
  ref: rocm-6.4.1-0-g890a339b49bf2c2a1d3f1e3caf07e5196e26124d
- kind: patch
  path: patch/0001-Fix-libnuma-to-use-pkg_config.patch
