kind: cmake
description: |
  ROCm Info

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:extensions/mesa/libdrm.bst
- rocm-cmake.bst
- rocr-runtime.bst
- rocclr.bst

runtime-depends:
- freedesktop-sdk.bst:components/kmod.bst

environment:
  # libdrm.pc
  PKG_CONFIG_PATH: "%{prefix}/lib/pkgconfig:/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig"

variables:
  cmake-local: |
    -DROCRTST_BLD_TYPE=Release

sources:
- kind: git_tag
  url: rocm:rocminfo
  track: "%{rocmtag}"
  ref: rocm-6.4.3-0-g6ea2ba38c8e1ab2899acf66878148b1192fd0bee
- kind: patch
  path: patch/0001-Find-drm-and-drm_amdgpu-paths.patch

