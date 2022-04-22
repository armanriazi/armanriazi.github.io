---
tags:
  - ocw
  - runtime
  - build
---


**failed to run custom build command for `ocw-runtime v3.0.0**
??? info
    First of all search nightly in explorer project and then find version used in that.
    > rustup uninstall nightly
    > rustup install nightly-2020-10-06
    > rustup target add wasm32-unknown-unknown --toolchain nightly-2020-10-06
    > export WASM_BUILD_TOOLCHAIN=nightly-2020-10-06


[[issue-substrate]]