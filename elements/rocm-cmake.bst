kind: cmake
description: |
  ROCm CMake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_tag
  url: rocm:rocm-cmake
  track: "%{rocmtag}"
  ref: rocm-6.3.3-0-gd70c538dd6897b7a4d6006a625cc7cb51d7cbfcd
