---
tags:
  - kusama
  - polkadot_ecosystem
  - substrate
  - whitepapaer
  - polkadot
---

**Highlighted Deep Dive Into Polkadot/Substrate/Kusama/Part(1)**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

Polkadot unites a network of heterogeneous blockchain shards called parachains. These chains connect to and are secured by the Polkadot Relay Chain. They can also connect with external networks via bridges.

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/4c5d5b50/0f0ae7c0abdff4a4456ff44573206eae.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/4c5d5b50/8a633f06bc1859eae27b6d298639b29c.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/4c5d5b50/5d469a808b6b23fc10f74be2829a8a4b.png)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/4c5d5b50/5c9e40866efbc7b0adeeb92dc8fdc6ca.png)

# Inbound-outboundTransaction

@Ingress

Dynamic information includes aspects of the transaction routing system that must have global agreement such

as the parachain’s ingress queue

@Egress

...

👆👆👆

## Parachain

A first parachain implementation, likely to be based heavily on an existing blockchain protocol such as Bitcoin or (more likely, since it provides for rich transactions) Ethereum. This will include an integration with the proof-of-stake chain, allowing the parachain to gain consensus without its own internal consensus mechanism.

Each parachain is defined in this registry. It is a relatively simple database-like construct and holds both static and dynamic information on each chain.Static information includes the chain index (a simple integer), along with the validation protocol identity.

Each parachain brings with it the potential to grief validators with an

over-burdensome validation algorithm.

@zk-SNARKs

A parachain utilising the properties of zk-SNARKs in order to ensure identities of transactors on it are kept private. A stretch goal dependent on the relay-chain.

## Relay-chains

This is the final stage of the relay-chain, allowing the dynamic addition, removal and emergency pausing of parachains, the reporting of bad behaviour and includes implementation of the \fisherman" functionality Polkadot will be able to scale even further in the future with a planned feature known as nested relay chains, which will increase the number of shards that can be added to the network.

## Interchain

(according to the logic of that chain) able to effect the **dispatch of a transaction into a second parachain or, potentially**, the relay-chain. Like external transactions on production blockchains, they are fully asynchronous and there is no intrinsic ability for them to return any kind of information back to its origin.

@MessageProtocol

The secret sauce of parachain interoperability lies in XCMP. XCMP enables parachains to share trusted logic, for example, transferring tokens between networks, without any additional trust assumptions!

XCM is related to cross-chain in the same way that REST is related RESTful. XCM cannot actually send messages between systems. It is a format for how message transfer should be performed, similar to how RESTful services use REST as an architectural style of deployment.

@Queue

Interchain transactions are resolved using a simple queuing mechanism based around a Merkle tree to ensure fidelity.

@Routing

Posts Routing. Each parachain header includes an egress-trie-root;

These posts are structured as several FIFO queues; the number of lists is known as the routing base and may be around 16. Notably, this number represents the quantity of parachains we can support without having to resort to multi-phase routing. Initially, Polkadot will support this

kind of direct routing.

Hyper-cube Routing. Hyper-cube routing is a mechanism which can mostly be build as an extension to the basic routing mechanism described above.

## Validators

Validators may provide only a \null" block containing no external "transactions" data, but may run the risk of getting a reduced reward if they do.

List of punishable validator misbehaviour includes:

• Being part of a parachain group unable to provide

consensus over the validity of a parachain block.

• Actively signing for the validity of an invalid parachain block.

• Inability to supply egress payloads previously voted as available.

• Inactivity during the consensus process.

• Validating relay-chain blocks on competing forks.

Parachain validators will need to collect additional input data from the previous set of validators or the availability guarantors.

Each participant (validator) has a set of information, in the form

of signed-statements ("votes") from other participants, regarding each parachain block candidate as well the relaychain block candidate. The set of information is two pieces:

Availability: does this validator have egress transaction-post information from this block so they are able to properly validate parachain candidates on the following block? They may vote either 1(known) or 0 (not yet known).

Validity: is the parachain block valid and is all externally-referenced data (e.g. transactions). They may vote either 1 (valid), -1 (invalid) or 0

(not yet known).

The basic rules for validity of the individual blocks (that allow the total set of validators as a whole to come to consensus on it becoming the unique parachain candidate to be referenced from the canonical relay):

• must have at least two thirds of its validators voting positively and none voting negatively;

• must have over one third validators voting positively to the availability of egress queue information.

@BFT

All validators must submit votes; votes may be resubmitted, qualified by the rules above. The progression of consensus may be modelled as multiple standard BFT consensus algorithms over each parachain happening in parallel.

@Bonded-Validator

It allows an account to register a desire to become a bonded validator (along with its requirements), to nominate to some identity, and for preexisting bonded validators to register their desire to exit this status.

@Sealing

Under a PoW chain,sealing is effectively a synonym for mining. In our case, it involves the collection of signed statements from validators over the validity, availability and canonicality of a particular relay-chain block and the parachain blocks that it represents.

The relay-chain block may then be sealed and the process of sealing the next block begun.

The sealing process takes place under a single consensus-generating mechanism addressing both the relay-chain’s block and the parachains’ blocks.

@Improvments-for-sealing-relay-blocks

**Public Participation**. One more possible direction is to enlist public participation in the process through a micro-complaints system. Similar to the fishermen, there could be external parties to police the validators who claim availability. Their task is to find one who appears unable to demonstrate such availability.

**Availability Guarantors**. A (this may be represented by Validators in the basic form of the protocol).

Availability guarantors will mostly aim to maintain a stable connection to each other and to validators.

A final route would be to nominate a second set of bonded validators as "availability guarantors".

**Unlike normal validators, they would not switch between parachains** but rather would form a single group to attest to the availability of all important interchain data. This has the advantage of relaxing the equivalence between participants and chains.

Overweight Blocks. If a validator set is compromised, they may create and propose a block which though valid, takes an inordinate amount of time to execute and validate. This is a problem since a validator group could reasonably form a block which takes a very long time to execute unless some particular piece of information is already known allowing a short cut, e.g. factoring a large prime. If a single collator knew that information, then they would have a clear advantage in getting their own candidates accepted as long as the others were busy processing the old block. We call these blocks overweight.

To ensure validators can predict when they may be proposing an overweight block, it may be sensible to require them to publish information on their own performance for each block.

Collator Insurance. One issue remains for validators: unlike with PoW networks, to check a collator’s block for validity, they must actually execute the transactions in it. Malicious collators can feed invalid or overweight blocks to validators causing them grief and exacting a potentially substantial opportunity cost.

To mitigate this, we propose a simple strategy on the part of validators. Firstly, parachain block candidates sent to validators must be signed from a relay chain account with funds; if they are not, then the validator should drop it immediately.

Collator Preferences. One important aspect of this system is to ensure that there is a healthy selection of collators creating the blocks in any given parachain. If a single collator dominated a parachain then some attacks become more feasible.

## Collators

it is quite possible that this mechanism enables even very small stakeholders to contribute as a collator.

This is the delivery of an alternative chain-specific collator functionality. It includes proof creation (for collators), parachain misbehaviour detection (for fishermen) and the validation function (for validators). It also includes any additional networking required to allow the two to discover and communicate.

@zero-knowledge@gossip

Validators work alongside a parachain gossip protocol with collators individuals who collate **transactions into blocks** and provide a noninteractive, zero-knowledge proof that the block constitutes a valid child of its parent (and taking any transaction fees for their trouble

## Fishermen

The parties get a reward for reporting such activity; their term, "fishermen" stems from the unlikeliness of such a reward.

Fishermen, as well as general relay-chain and parachain clients will generally aim to keep a connection open to a validator or guarantor.

## Queue

These queues are **administered on the relay-chain**

allowing parachains to determine each other’s saturation

status; this way a failed attempt to post a transaction

to a stalled destination may be reported synchronously.

_(Though since no return path exists, if a secondary transaction failed for that reason.)_

## Networking

@overlay@devp2p @p2p

solved around a few request and answer message types. While Ethereum made progress on current protocol offerings with the devp2p protocol, which allowed for many subprotocols to be multiplexed over a single peer connection and thus have the same peer overlay support many p2p protocols simultaneously.To ensure an efficient transport mechanism, a "flat" overlay network like Ethereum’s devp2p.

Polkadot are rather more substantial. Rather then a wholly uniform network, Polkadot has several types of participants each with different requirements over their peer makeup and several network "avenues" whose participants will tend to converse about particular data. This means a substantially more structured network overlay|and a protocol supporting that will likely be necessary.

network participants into two sets (relay-chain, parachains) each of three subsets.

Path to an Effective Network Protocol. Likely the

most effective and reasonable development effort will focus on utilising a pre-existing protocol rather than rolling

our own. Several peer-to-peer base protocols exist that we may use or augment including Ethereum’s own devp2p, IPFS’s libp2p and GNU’s GNUnet. A full review of these protocols and their relevance for building a modular peer network supporting certain structural guarantees, dynamic peer steering and extensible sub-protocols is well beyond the scope of this document.

👆👆👆

### Parachain-Block

@Candidate

Such subsets of validators are required to provide a parachain block candidate which is guaranteed valid (on pain of bond confiscation).

### Transaction-forwarding-contract

In short, we envision that transactions from Polkadot can be signed by validators and then fed into Ethereum where they can be **interpreted and enacted by a transaction-forwarding contract.**

### Break-in-contract

Ethereum is able to host a "break-in contract" which can maintain the 144 signatories and be controlled by them.

we can imagine a "break-in" contract within a parachain which allows a

validator to be guaranteed payment in exchange for the provision of a particular volume of processing resources.

These resources may be measured in something like gas, but could also be some entirely novel model such as subjective time-to-execute or a Bitcoin-like flat-fee model.

### Breakout-contract

@Header

we can imagine our Polkadot-side Ethereum interface to have some simple functions: to be able to **accept a new header from the Ethereum network** and validate the PoW, to be able to accept some proof that a particular log was emitted by the Ethereum-side breakout contract for a header of sufficient depth (and forward the corresponding message within Polkadot) and finally to be able to accept proofs that a previously accepted but not-yet-enacted header contains an invalid receipt root.

Delivering a transaction from Bitcoin to Polkadot can in principle be done with a process similar to that for Ethereum; a \break-out address" controlled in some way by the Polkadot validators could receive transferred tokens (and data sent alongside them).

**Any tokens then owned in the "break-out address"** would then, in principle, be controlled by those same validators for later dispersal

## Staking-Contract

This contract maintains the validator set. It manages:

• which accounts are currently validators;

• which are available to become validators at short notice;

• which accounts have placed stake nominating to a validator;

• properties of each including staking volume, acceptable payout-rates and addresses and short term (session) identities.

👆👆👆

## POS

Proof-of-stake chain: Extending the consensus mechanism into proof-of stake territory; this module includes staking tokens, managing entry and exit from the validator pool, a market mechanism for determining validator rewards, finalising the approval-voting nomination mechanism and managing bond-confiscation and dismissal. It includes a substantial amount of research and prototyping prior to final development.

### NPOS

@Stake-Token-Liquidity

Keeping with our tenets, we elect for the simplest solution: **not all tokens be staked**. This would mean that some proportion (perhaps _20%) of tokens will forcibly remain liquid. Though this is imperfect from a security perspective_, it is unlikely to make a fundamental difference in the security of the network; 80% of the reparations possible from bond confiscations would still be able to be made compared to the perfect case" of 100% staking.

sessions would happen regularly, perhaps as often as once per hour.

@Nominate

Nominating works through an approval-voting system.Each session, nominators’ bonds are dispersed to be represented by one or more validators.

### POA

Proof-of-authority consensus mechanism supporting rich validator statements and allowing multiple independent items to be agreed upon under a single series based upon subjective reception of the partial set of validator statements. The mechanism should allow the proof of misbehaviour for the dismissal of malicious validators but need not involve any staking mechanism. A substantial amount of research and prototyping will precede the development of this component

### POC

An initial proof-of-concept would focus on placing the new validation algorithms into clients themselves, effectively requiring a hard fork of the protocol each time an additional class of chain were added.

👆👆👆

## Features

@Forkless

often taking months of work, and particularly contentious hard forks can break apart a community.Polkadot revolutionizes this process, enabling blockchains to upgrade themselves without the need to fork the chain. These forkless upgrades are enacted through Polkadot’s transparent **on-chain governance system.**

@runtime@substrate

How can a blockchain network automatically upgrade? Substrate has a unique property where the runtime (state transition function) is stored within the blockchain state. This means nodes update themselves by default rather than through manual intervention.

## DAO

@governance

Initially, this will be a meta-protocol on the relay-chain for managing exceptional events such as hard-forks, soft-forks and protocol reparameterisation. It will include a modern structure to help manage conflict and prevent live-lock. Ultimately, this may become a full meta protocol layer able to enact changes normally reserved for hard-forks. Requires the relay chain.

The registry is able to have parachains added only through full referendum voting; this could be managed internally but would more likely be placed in an external referendum contract in order to facilitate re-usage under more general governance components. The parameters to voting requirements (e.g. any quorum required, majority

required) for registration of additional chains.

two thirds supermajority to pass with more than one third of total system

stake voting positively may be a sensible starting point.

The removal of parachains altogether would come only after a referendum .

## Crowdloan

@Slot

If the slots cannot be filled, the lower bound could be repeatedly reduced by some factor in order to satisfy.

@StakeHolder

Essentially, the community of stakeholders will need to be incentivized to add child chains|either financially or through the desire to add featureful chains to the relay.

👆👆👆

## Fees

@Negotiation-logic

The transaction has an origin segment, providing the ability to identify a parachain, and an address which may be of arbitrary size. Unlike common current systems such as Bitcoin and Ethereum, **interchain transactions do not come with any kind of payment" of fee associated**; any such payment must be managed through negotiation logic on the source and destination parachains.

Calling into another such chain would mean proxying through this bridge, which would provide the means of negotiating the value transfer between chains in order to pay for the computation resources required on the destination parachain.

### Gas

**cost of Ethereum confirming** that an instruction was properly validated as coming from the Polkadot network would be no more than 300,000 gas|a mere 6% of the total block gas limit at 5.5M.

then the cost to the network of maintaining this **Ethereum-forwarding bridge** would be around 540,000 gas per day or, at present gas prices, $45 per year.

without gas, how does one parachain avoid another parachain from forcing it to do computation? While we can rely on transaction-post ingress queue buffers to prevent one chain from spamming another with transaction data, there is no equivalent mechanism provided by the protocol to prevent the spamming of transaction processing.

Because of Substrate’s modularity, gas is completely optional, and the introduction of off-chain features greatly reduces computation and storage costs.

✍️✍️✍️

### Signature

One interesting, and cheaper, _alternative to this multisignature contract model would be to use ✍️threshold signatures in order to achieve the multi-lateral ownership semantics_. While threshold signature schemes for **ECDSA** are computationally expensive, those for other schemes such as ✍️ **Schnorr signatures are very reasonable.**

Bitcoin is substantially more limited, with most clients accepting only multisignature transactions with a maximum of 3 parties

### SPV

refers to Simplified Payment Verification in Bitcoin and describes a method for clients to verify transactions while keeping only **a copy of all blocks headers** of the longest PoW chain.

❓❓❓

Appendix B. Frequently Asked Questions

_Is Polkadot designed to replace (insert blockchain here)?_ No. The goal of Polkadot is to provide a framework under which new blockchains may be created and to which existing blockchains can, if their communities desire, be transitioned.

_Is Polkadot designed to replace (insert crypto-currency here)?_ No. Polkadot tokens are neither intended nor designed to be used as a currency. They would make a bad currency: most will remain illiquid in the staking system and those that are liquid will face substantial fees for transfer of ownership. Rather, the purpose of Polkadot tokens is to be a direct representation of stake in the Polkadot network.

_What is the inflation rate for Polkadot staking tokens?_ The Polkadot staking token base expansion is unlimited. It rises and lowers according to market effects in order to target a particular proportion of tokens held

under long-term bond in the validation process.

_Why does staking token ownership reflect stakeholding?_ This is a mechanism realised by the fact that they underpin the network’s security. As such their value is tied to the overall economic value that Polkadot provides. Any actors who gain overall value from Polkadot operating correctly are incentivised to ensure it continues to do so. The best means of doing so is to take part in the validation process. This generally implies ownership of staking tokens.

📚📚📚

## Literature

external data referenced = transactions

grief = wasting their resources

a posted transaction = post

XCMP = Cross-Chain Message Passing

runtime = state transition function

[Substrate-Glossary](https://docs.substrate.io/v3/getting-started/glossary/)

❤️❤️❤️

If you liked this article or if it helped you please clap on this post to help the Read.Cash algorithm recommend it to more people. If you have any questions or remarks please feel free to leave a comment below.

Alternatively, please feel free to send donations

> 0xde5D732a5AB44832E1c69b18be30834639F44A2c

❤️❤️❤️

Reseacher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Polkadot]]

[[Kusama]]

[[Substrate]]
