---
tags:
  - kusama
  - polkadot_ecosystem
  - substrate
  - polkadot
---

**Highlighted Deep Dive Into Polkadot/Substrate/Kusama/Part(2)**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

**Polkadot and Substrate are not dependent on each other**. Polkadot parachains can be built and maintained without ever touching Substrate. Substrate-based chains can exist as **‘solo-chains’** on an independent basis.

Substrate is a fully modular blockchain framework that unleashes developers **instead of forcing them to work within the confines of others' design decisions.** Building a custom blockchain with Substrate offers greater freedom, flexibility, and optimization than **building on top of a** general-purpose smart-contract blockchain.

you're not only free to choose your parameters such gas costs, governance, and consensus, you're also free to choose how your blockchain is deployed and if/how it should communicate with other networks.

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/29595a4f69cc12a98a7f5acb9d464ae8.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/4f9089382921bd452e5a3ea9eae13109.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/da4a423d6dc3ddc805db4d3f3e712c2e.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/39aea8ad47982e2fc6137f2db921de4c.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/d7db05f71af49b6718444f368c1abd64.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/dbdb9edcaa1a5e4a5374e6172f88af64.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/83a5d0a4/a6f9ed5e5be643255ea03b35917493e0.png)

On my opinion for substrate future(DNA Replication)

## Limitations-Resolved

For example, reusing the Ethereum codebase implies several limitations: **having to place all of your business logic in terms of the EVM**, being forced to **use one of the two EVM languages**, having all business logic dynamically metered, and being limited to Ethereum's transaction pool and lack of core upgradability.

**Without Substrate, there would be no easy way to build the blockchains** that constitute the Polkadot ecosystem, and many builders would be forced into using a constrictive and uniform smart contract environment, limiting innovation and leaving Polkadot’s remarkable heterogeneous sharding system unutilized.

## MainModules

### Frame

 business logic is provided through a **modular system known as FRAME**.

is a **set of modules** and support libraries that simplify runtime development. In Substrate, these **modules are called Pallets**, each hosting domain-specific logic to include in a chain's runtime. FRAME also **provides some helper modules to interact with important** Substrate Primitives that provide the interface to the core client.

FRAME not only provides a library of commonly used Substrate pallets but also a framework to build custom domain-specific pallets, giving runtime engineers the flexibility to define their runtime's behavior according to their target use case. **The result is each pallet has its own discrete logic which can modify the features and functionality of your blockchain's state transition functions.**

For example, the Balances pallet, which is included in FRAME, defines cryptocurrency capabilities for your blockchain. More specifically, it defines:

**Storage items** that keep track of the tokens a user owns.

**Functions** that users can call to transfer and manage those tokens.

**APIs** which allow other pallets to make use of those tokens and their capabilities.

**Hooks** which allow other pallets to trigger function calls when a user's balance changes.

A FRAME pallet is composed of 7 sections:

Imports and Dependencies

Declaration of the Pallet type

Runtime Configuration Trait

Runtime Storage

Runtime Events

Hooks

Extrinsics

An example is as follows: <https://docs.substrate.io/v3/runtime/frame/>

Pallets can be composed of as many sections as needed, giving runtime engineers a lot of flexibility on top of the basic skeletons depicted above. Refer to **the Substrate Runtime Macros to learn more about adding functionality to a FRAME pallet.**

@System crate

The FRAME System crate frame_system provides low-level types, storage, and functions for your blockchain. **All other pallets depend on the System crate** as the basis of your Substrate runtime.

**The System crate defines all the core types for the Substrate runtime**, such as:

\*Origin

\*Block Number

\*Account Id

\*Hash

- *Header
  *Version
- \*etc...

  \*It also has a number of system-critical storage items, such as:

  \*Account Nonce

- \*Block Hash

  \*Block Number

  *Events
  *etc...

Finally, it defines a number of low level functions which can access your blockchain storage, verify the origin of an extrinsic, and more.

@Support crate@System crate

The FRAME Support Crate frame_support is a collection of Rust macros, types, traits, and modules that **simplify the development of Substrate pallets.**

The support macros expanded at compile time generate boilerplate code needed for the common structure of a pallet and save developers from writing them repeatedly.

@Executive pallet@System crate

The FRAME Executive Pallet frame_executive **acts as the orchestration layer** for the runtime. It dispatches incoming extrinsic calls to the respective pallets in the runtime.

@Runtime@System crate

**The runtime library brings together all** these components and pallets. It defines which pallets are included with your runtime and configures them to work together to compose your final runtime. When calls are made to your runtime, it uses the Executive pallet to dispatch those calls to the individual pallets.

### Pallet

**A developer may choose to have a pallet that enables smart contracts**, or specifically not include pallets to keep their blockchain network lean and reduce attack vectors.

For example, a developer may want to enable users to gain access to accounts even if they lose their private keys or other authentication mechanism.  In this case, the developer would simply include the **Recovery pallet.**

 From the Oracle pallet to the Zero-Knowledge Verifier pallet and the Governance pallet, there are numerous existing pallets that can be integrated from the start or added later with forkless runtime upgrades.

Developers can choose and even hot-swap components (pallets) such as the network stack, consensus, even the finality engine. Simply select from the growing list of pallets or create your own.

When building with FRAME, **the Substrate runtime is composed of several smaller components called pallets. A pallet contains a set of types, storage items, and functions that define a set of features and functionality for a runtime.**

@Prebuilt pallets

<https://docs.substrate.io/v3/runtime/frame/>

Atomic Swap, Aura, Authority Discovery, Authorship, BABE , Balances, Benchmark, Collective, Contracts, Democracy, Elections Phragmén, Elections, GRANDPA, Identity, I'm Online, Indices, Membership, Multisig, Nicks, Offences, Proxy, Recovery, Randomness Collective Flip, Scheduler, Scored Pool, Session, Society, Staking, Sudo, Timestamp, Transaction Payment, Treasury, Utility, Vesting

### Execution environment

Off-chain features run in their own Wasm execution environment outside of the Substrate runtime.

## Conceptes

### Extrinsics

An extrinsic is a piece of information that comes from outside the chain and is included in a block. **Extrinsics fall into three categories: inherents, signed transactions, and unsigned transactions.**

**Note that events are not extrinsics.** The chain emits events for pieces of information that are intrinsic to the chain itself. For example, **staking rewards are events, not extrinsics, because the reward is triggered by circumstances intrinsic to the chain's logic**.  The header contains a block height, parent hash, extrinsics root, state root, and digest.

@Inherents

Inherents are pieces of information that are **not signed** and only **inserted into a block by the block author**. They are not gossiped on the network or stored in the transaction queue. **For example, the author of the block may insert a timestamp inherent into the block. There is no way to prove that a timestamp is true** the way the desire to send funds is proved with a signature. Rather, validators accept or reject the block based on how reasonable the other validators find the timestamp, which may mean it is within some acceptable range of their own system clocks.

@SignedTransactions

Contain a signature of the account that **issued the transaction** and stands to **pay a fee** to have the transaction included on chain. Because the value of including signed transactions **on-chain** can be recognized prior to execution, they can be **gossiped on the network between nodes** with a low risk of spam.

@UnsignedTransactions

Since the transaction is not signed, there is **nobody to pay a fee**. Because of this, the transaction queue lacks economic logic to prevent spam. **Unsigned transactions also lack a nonce, making replay protection difficult**. A few transactions warrant using the unsigned variant, but they will require some form of spam prevention based on a custom implementation of signed extension, which can exist on unsigned transactions.

**An example of unsigned transactions in Substrate is the I'm Online heartbeat transaction sent by authorities**. The transaction includes a signature from a Session key, which does not control funds and therefore cannot pay a fee. The transaction pool controls spam by checking if a heartbeat has already been submitted in the session.

👆👆👆

## Features

### Configurable

@Feeless

Unlike many legacy blockchain networks, which have hard limits for transaction throughput, Substrate is configurable. **Transaction latency can be alleviated through configurable blocktimes, flexible transaction queues, and/or horizontal scaling. Transaction fees are configurable even to the point of feeless** transactions. Development is faster since developers can use the tooling they prefer and select from a growing list of pallets instead of building from scratch. Upgrades happen faster thanks to forkless runtime upgrades.

## Light-client-first

Another unique attribute of Substrate is its “light-client-first” design which can **run directly in-browser and interact with a chain in a fully trustless way.** Traditional approaches for syncing nodes require users to run dedicated hardware and wait a long time for their node to sync, or as a workaround, use a centralized service provider. Substrate light-clients sync lightning fast and drastically increase the decentralization of blockchain networks. Developers can relax, knowing their end users aren’t reliant on a separate node infrastructure susceptible to downtime or hacking.

## Security

Substrate chains can inherit security from Substrate-based relay chains like Polkadot or Kusama.

## Offchain

Off-chain features run in **their own execution environment outside of the Substrate runtime**. This creates a separation of concerns and ensures block production is not impacted by long-running off-chain tasks. Although the primary benefit of off-chain features may be cost, there are many other benefits. For example, off-chain features can **enable private data to be easily stored and retrievable off-chain to support record deletion and other needs of GDPR-compliant use cases and applications.**

Off-Chain Worker subsystems **allows execution of long-running** and possibly **non-deterministic tasks** (e.g. web requests, encryption/decryption and signing of data, random number generation, CPU-intensive computations, enumeration/aggregation of on-chain data, etc.) that could otherwise require longer than the block execution time.

**Off-chain workers** have access to extended APIs for communicating with the external world:

Ability to submit transactions (either signed or unsigned) to the chain to publish computation results.

A fully-featured HTTP client allowing the worker to access and fetch data from external services.

Access to the local keystore to sign and verify statements or transactions.

An additional, local key-value database shared between all off-chain workers.

A secure, local entropy source for random number generation.

Access to the node's precise local time.

The ability to sleep and resume work.

Note that the results from off-chain workers are not subject to regular transaction verification. **A verification mechanism should be implemented to determine what information gets into the chain.**

**Off-Chain Storage** offers storage that is local to a Substrate node that can be accessed both by **off-chain workers (both read and write access) and on-chain logic (write access via off-chain indexing but not read access).** This allows different worker threads to communicate to each other and to store user or node-specific data that does not require consensus over the whole network.

It can also be read using RPC.

**Off-Chain Indexing** allows the runtime, if opted-in, **to write directly to the off-chain storage independently from OCWs.** This serves **as a local/temporary storage for on-chain logic** and complement to its on-chain state.

Nodes have to opt-in for persistency of this data via --enable-offchain-indexing flag when starting up the Substrate node.

**Unlike OCWs, which are not executed during initial blockchain synchronization,** off-chain indexing is populating the storage every time a block is processed, so the data is always consistent and will be exactly the same for every node with indexing enabled.

👆👆👆

## Compatibility

### SRML

SRML provides the basic building blocks for Substrate-based blockchains and **includes all the essential functionality for a purpose-built blockchain.** Among the various modules included with the **SRML is the Contracts module, designed for executing "native" Wasm smart contracts on any Substrate-based chain.**

@Parity

Moreover, Parity Technologies is a long-term supporter and builder in the Ethereum ecosystem, and we want to continue to provide support and infrastructure as we can to teams who have built on the Parity platform as we move from **“Blockchain 2.0” to “3.0”.**

As part of this ongoing support, and to ensure that Substrate and Polkadot remain as inclusive as possible to the broader DApp community, we’ve **(Parity Team)built an EVM implementation for the SRML.**

**Substrate EVM is an SRML module that provides an EVM execution environment for running unmodified Solidity code “natively” on a Substrate-based blockchain.** In essence, Substrate EVM will allow Substrate-based blockchains, including Polkadot parachains, to host a nearly-complete instance of the Ethereum state transition function on-chain, alongside any additional Substrate modules as required for custom functionality.

Existing Solidity applications can be deployed and executed in this environment, and will gain the added benefits of being part of a Substrate-based blockchain. These benefits include the possibility of integration with other Substrate modules and of **connecting to the broader Polkadot network, thereby enabling interoperability not only with other Polkadot parachains but, via bridges, with external blockchains as well, including Ethereum mainnet.**

Interoperability with other Substrate modules is possible thanks to custom-built "pre-compiled contract" APIs, which will allow all basic SRML functionality, including calls between modules, balance transfers, and interchain messaging.

**Differences between the Substrate EVM module and the Ethereum mainnet EVM include block hashes, which are fetched via the System module.**

In addition, the underlying EVM engine (**SputnikVM**) has been modified to make it modular, which will allow us to enable users to swap out and **customize individual components (such as the gasometer)** to their applications' specific needs.

**Substrate EVM is an SRML** module that provides an EVM execution environment for running unmodified Solidity code “natively” on a Substrate-based blockchain. In essence, Substrate EVM will allow Substrate-based blockchains, including Polkadot parachains, to host a nearly-complete instance of the Ethereum state transition function on-chain, alongside any additional Substrate modules as required for custom functionality.

Existing Solidity applications can be deployed and executed in this environment, and will gain the added benefits of being part of a Substrate-based blockchain.

**Interoperability** with other Substrate modules is possible thanks to custom-built **"pre-compiled contract"** APIs, which will allow all basic SRML functionality, including calls between modules, balance transfers, and interchain messaging.

📚📚📚

## Literature

hot-swap components = pallets

Off-Chain Worker = OCW

Remote procedure calls = RPC

Framework for Runtime Aggregation of Modularized Entities = FRAME

runtime = state transition function

pot = The Treasury pallet provides a "pot" of funds

The Sudo pallet allows for a single account = Sudo

verifiable random function = VRF

A verification mechanism =e.g. voting, averaging, checking sender signatures, or simply "trusting"

Substrate Runtime Module Library = SRML

[Substrate-Glossary](https://docs.substrate.io/v3/getting-started/glossary/)

❤️❤️❤️

Researcher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Polkadot]]

[[Substrate]]
