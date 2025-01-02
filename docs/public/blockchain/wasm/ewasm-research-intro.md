---
tags:
  - substrate
  - polkadot_ecosystem
  - webassembly
  - wasm
  - llvm
---

**Highlighted Deep Dive Into Polkadot/Substrate/Kusama/EWASM(5)**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

WebAssembly (or Wasm as a contraction) is a new, portable, size- and load-time-efficient format. A few key points: WebAssembly defines an instruction set, intermediate source format (WAST) and a binary encoded format (WASM). WebAssembly has a few higher level features, such as the ability to import and execute outside methods defined via an interface.

## WASM

Fast. WebAssembly achieves near native performance. **Compared with the Java, Python or JavaScript runtimes, it can be 10x to 100x faster** (how is this possible?). It is also much faster than Docker, especially in cold start and system access.

Safe. **WebAssembly is a sandbox** with a capability-based security model. It is not only safer than native binaries, but also **safer than OS-level containers** like Docker. Yet it provides access to the underlying system, icnluding new hardware features.

Portable. WebAssembly apps can be written in C, C++, Rust, Go, and run without change on different OS and hardware platforms.

Manageable. WebAssembly programs can be provisioned, started, hot swapped, stopped, and **moved around by other applications.**

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/c73b32d67af1318276dd9888e75c8ca8.png)

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/070dd66796872ae6e3dc63c77176a748.png)

### Goals

To provide a specification of ewasm contract semantics and the Ethereum interface

To provide an EVM transcompiler, preferably as an ewasm contract

To provide a metering injector, preferably as an ewasm contract

To provide a VM implementation for executing ewasm contracts

To implement an ewasm backend in the Solidity compiler

To provide a library and instructions for writing contracts in Rust

To provide a library and instructions for writing contracts in C.

### ImportantContent

The project VP Hung-Ying Tai (hydai) from Second State shared the current research content and future direction of Ewasm VM. **The content is very exciting, including EVM bytecode, Webassembly, Ewasm1.0 and Ewasm2.0.**

## PALLET

While supporting the **EVM pallet** to provide seamless compatibility with all existing Ethereum applications, **ParaState also provides developers with a next-gen smart contract implementation environment, EWASM (Ethereum-flavored WebAssembly)**. All existing Ethereum smart contracts work on ParaState’s Ewasm VM (Pallet SSVM) without any change.We see more and more parachain projects like Acala, Clover Finance, and Darwinia etc to integrate the EVM pallet into their parachains in order to interact with Ethereum ecosystem.

## EEI

Ethereum defines the EEI to allow the client Corresponding **function libraries can be implemented in different languages,** and it is easier to complete prototypes and upgrades. **A set of methods available to ewasm contracts.**

The smart contract of **Ewasm 2.0 is renamed Execution Environments (EE).**

## LLVM

**LLVM includes a WebAssembly backend to generate WASM output.** Major browser JavaScript engines will notably have native support for WebAssembly, including but not limited to: Google's V8 engine (Node.js and Chromium-based browsers), Microsoft's Chakra engine (Microsoft Edge), Mozilla's Spidermonkey engine (Firefox and Thunderbird). \* Other non-browser implementations exist too: wasm-jit-prototype (a standalone VM using an LLVM backend), wabt (a stack-based interpreter), ml-proto (the OCaml reference interpreter), etc.

it future-proofs the Ethereum protocol by bringing the **LLVM** and WebAssembly developer communities into the Polkadot ecosystem. It is your best choice among one-stop development platforms for next-gen Web3 applications. **It is Ethereum on Steroids.**

SecondState developers recently built a Solidity to Ewasm compiler called Soll.

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/b7c9671dd8b831841383864f615382e4.png)

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/54616ed0162c79fb98ff115bf19525c1.png)

`solc/solc --strict-assembly --optimize ~/simple_storage/simple_storage_yul_ir.txt`

## SewUp

**The Second State EWasm Utility Program (SewUp)** is a library that helps you sew up your Ethereum project with Rust, just like development in a common backend.

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/abef4b5add46893a5c5be2fb268b62d2.png)

[Set-up-Sewup](https://docs.parastate.io/developers-resources/sewup-ewasm/set-up-sewup)

[Tutorial-Hello-World]](<https://docs.parastate.io/developers-resources/sewup-ewasm/tutorial-hello-world>)

![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/e120f04193d2f6aed497d0d10a40224e.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/90ad2987d86671619e2d1bf735dd5e72.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/d91df8b7d7070ab7f89c24b3cd55fdca.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/be4efe44a8ae3e6bbcc280391474df13.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/50949cc1c0fd9fb462cb58a13f8eec63.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/ca5ffce8589408fbb9e6be6333fea98a.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/ab9c3bebfeb31b6343c3ed68edb758bd.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/d52c2ff932d4582064f7257deac68339.png)
![EWASM](https://cdn.rcimg.net/arman-riazi-science/591674c4/0a07bafd67a57de724abcc47659e9f5d.png)

👆👆👆

@SSVN

@SOLL@LLVM

@Compiler@AOT@JIT

@WasmEdge

@DAO

@STAKE

📚📚📚

## Literature

Ewasm contract: a contract adhering to the ewasm specification

Ethereum environment interface = EEI

metering: the act of measuring execution cost in a deterministic way

metering injector: a transformation tool inserting metering code to an ewasm contract

EVM transcompiler: an EVM bytecode (the current Ethereum VM) to ewasm transcompiler. See this chapter.

❤️❤️❤️

Reseacher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Substrate]]
