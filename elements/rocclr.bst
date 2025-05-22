kind: cmake
description: |
  ROCclr Compute Language Runtimes

build-depends:
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/vim.bst
- freedesktop-sdk.bst:components/opencl.bst
- freedesktop-sdk.bst:extensions/clinfo/khronos-headers.bst
- cppheaderparser.bst
- ply.bst
- rocm-llvm.bst
- rocm-hipcc.bst
- rocr-runtime.bst

depends:
# https://github.com/ROCm/ROCclr/issues/38
- rocm-comgr.bst
- rocm-device-libs.bst

variables:
  command-subdir: clr
  cmake-local: |
    -DCMAKE_C_COMPILER="%{prefix}/bin/clang" \
    -DCMAKE_CXX_COMPILER="%{prefix}/bin/clang++" \
    -DCLR_BUILD_OCL=ON \
    -DCLR_BUILD_HIP=ON \
    -DHIP_COMMON_DIR="%{build-root}/hip" \
    -DHIPCC_BIN_DIR="%{prefix}/bin" \
    -DBUILD_ICD=OFF \
    -DHIP_ENABLE_ROCPROFILER_REGISTER=OFF

config:
  strip-commands: []
  install-commands:
  - |
    %{make-install}
    mkdir -p %{install-root}%{prefix}/OpenCL/vendors
    touch %{install-root}%{prefix}/OpenCL/vendors/amdocl64.icd
    echo libamdocl64.so > %{install-root}%{prefix}/OpenCL/vendors/amdocl64.icd
    # might need ldconfig magic here

sources:
- kind: git_tag
  url: rocm:clr
  track: "%{rocmtag}"
  directory: clr
  ref: rocm-6.4.1-0-ga187df25c8bac2a51d9c2e7a46c2b955fefb3600
- kind: git_tag
  url: rocm:HIP
  track: "%{rocmtag}"
  directory: hip
  ref: rocm-6.4.1-0-g22b0b2eb9a09e30dca11b213872127f9caa2e1e7
- kind: patch
  path: patch/0001-Remove-use-of-etc-os-release.patch
