---
tags:
  - kusama
  - polkadot_ecosystem
  - substrate
  - crowdloan
---

**Highlighted Deep Dive Into Polkadot/Substrate/Kusama/CrowdLoan(3)**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

Kusama is a **canary** network for Polkadot; Kusama is a **proving ground for runtime upgrades, on-chain governance, and parachains**. The network is a permissionless.Kusama does not support smart contracts natively.The Kusama network is Polkadot's experimental, community-focused R&D network.

👆👆👆

AccountThese are transfer and transfer_keep_alive. transfer will allow you to send KSM regardless of the consequence; transfer_keep_alive will not allow you to send an amount that would allow the sending account to be removed due to it going below the existential deposit.

By default, Polkadot-JS Apps will use transfer_keep_alive, ensuring that the account you send from cannot drop below the existential deposit of 0.001666 KSM.

it may be that you **do not want to keep this account alive (for example, because you are moving all of your funds to a different address).**

Note: Even if the transfer fails due to a keep-alive check, the transaction fee will be deducted from the sending account if you attempt to transfer.

**Currently, Kusama does not use the Assets Pallet,** so this is probably not the reason for your tokens having existing references.

**Currently, Kusama does not use the Recovery Pallet,** so this is probably not the reason for your tokens having existing references.

On Kusama, you can check if recovery has been set up by checking the recovery.recoverable(AccountId) chain state. This can be found under Developer > Chain state in PolkadotJS Apps.

👆👆👆

## Parachain-Slots-Auction

Polkadot Parachain Auctions do not offer a free and open environment as we have seen with ERC20 tokens, where the only thing needed was a white paper to deploy a smart contract on the Ethereum Blockchain. Such a feature allows for flexibility in the Polkadot ecosystem where every Parachain can create its own set of rules

Basically, Polkadot Parachain Auctions are **automated candle auctions** (with some adjustments relevant to blockchain technology). It means that there is an opening period and an ending period. At any moment the winner can be chosen but we will only find it out at the end. It is not easy to get access to the Polkadot Relay Chain, and, currently, Parachains prefer to use crowdloan mechanism to collect funds to participate in Polkadot Parchain Auctions.

To participate in the PolkadotParachain Auction and compete for a slot, prospective Parachains can bid in two ways:

**Parachains can bid their own DOT, through a single account**

**Parachains can use crowdloans to crowdsource DOT and bid it in the auctions**

Users cannot participate in the Polkadot Parachain Auction directly. Users can only participate indirectly via crowd loans by contributing and locking DOT.

Shared security and processing of transactions don’t come for free. One of the ways to access them is to lease a slot on the Relay Chain. Projects compete to place the highest bid to get the slot. The first Polkadot Parachain Auction winner, via the process known as Crowdloan Campaign, raised 32.5 million DOT (around 1.3 billion USD at that time) to lease the slot for two years.

A Parachain slot is a scarce resource. Given an increase in the number of Parachains, every few months new Parachains slots will be added. The Polkadot ultimate goal is to have 100 slots.

## crowdsale-VS-crowdloan

crowdsale and crowdloan which makes sense because they sound the same. they are similar but there are some very key differences for example **crowdsale** I am sure you're familiar with it's kind of like platforms along the lines of **kickstarter** so you fund a project say **creating a backpack that sings and lights up and then you give the funds to eventually get the product knowing that it's not created yet** and then the creator uses those funds to make the product and then eventually you'll get that product in the mail so you are buying an actual thing and then you get that thing but you never get your original funds back where a **crowdloan is very different** so you're finding a specific function for example a parachain slot and it can only be used for that purpose it can't be used for anything else and then all funds that you contribute are delivered back to you once the lease is up so anything you contributed originally comes right back to you and it's not like you're putting funds down and you never see them again but you get something else in return and so parachain teams don't have control over the funds it's locked in the relay chain which prevents rug pull so all of a sudden funds can't just disappear or someone takes all of them it's pretty much impossible for that to happen and then if the first attempt to score slot isn't successful the crowd loan continues to try to score a parachain slot in the next round and then the next round until they do and all crowdloans do have an expiration date and that will all be specified in the outset so you should never be left in the dark you'll always have all the information you need so you can look forward to all the exciting things to come.

the other thing to keep in mind is some projects have a **rewards** cap for their crowd loans so they can only give out so many rewards or they can only take so many contributions to the crowd loan or a certain amount so if you are set on wanting to participate it's always good to do it as soon as you feel ready um just in case you know there's a cut off or in case you can get bonus rewards.

## ParachainAcution-vs-eBayAcution

a common misconception in the cryptocurrency space is that a para chain slot auction is something that you have to actively participate in kind of like an auction on ebay but that actually couldn't be further from the truth and all you have to do is contribute you don't have to bid and the crowdloan does on behalf of the project so there's no stress for you and then there's a difference between a regular auction and then a parachain slot option which is used to decide which pair of chains get to be connected to the relay chain so it's not like bidding on ebay for a handbag or something like that and then there's the concept of a candle auction which means in the ending period which is the last five days the auction can just end at any time and no one knows when this will be no single human knows and it's **completely automated and a mystery to everyone and so the crowdloan opens before the auction starts and it stays open until a winner is declared** so definitely make sure to contribute while the crowd loan is still open and hopefully before your team scores a slot and you **get lots of rewards.**

There is also the possibility of a **malicious bidder** or a block producer trying to grief honest bidders by sniping auctions.

For this reason, Vickrey auctions, a variant of second price auction in which bids are hidden and only revealed in a later phase, have emerged as a well-regarded mechanic. For example, it is implemented as the mechanism to auction human **readable names on the ENS.** The Candle auction is another solution that does not need the two-step commit and reveal schemes (a main component of Vickrey auctions), and for this reason **allows smart contracts to participate.**

Polkadot will use a random beacon based on the VRF that's used also in other places of the protocol. The **VRF** will provide the base of the randomness, which will retroactively **determine the end-time of the auction.**

1. Slot Action compatition(Weekly)

2. if Won then

3. Parachain Lease Relay chain (Yearly)

The slot durations are capped to 1 year and divided into 6-week periods(KSM- 12m/3m=4m); The slot durations are capped to 2 years and divided into 3-month periods (DOT- 24m/3m=8m);Once the parachain lease ends (48 weeks maximum on Kusama, 96 weeks on Polkadot), funds are returned to the contributors.

Parachains may lease a slot for any combination of periods of the slot duration. Parachains may lease more than one slot over time, meaning that they could extend their lease to Polkadot past the maximum duration by leasing a contiguous slot.

Note: Individual parachain slots are fungible. This means that parachains do not need to always inhabit the same slot, but **as long as a parachain inhabits any slot it can continue as a parachain.**You Can’t (Technically) Combine Crowdloans and Private Bids

Each period of the range 1 - 4 represents a 3-month duration for a total of 2 years.

Bidders will submit a configuration of bids specifying the token amount they are willing to bond and for which periods. The slot ranges may be any of the periods 1 - n, where n is the number of periods available for a slot (n will be 8 for both Polkadot and Kusama).

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/b817f983/ae71f11715314a58afb7eebf1c09c16d.png)

**highest bidder for any given slot lease period might not always win (see the example below).**

There is one parachain slot available.

Charlie bids 75 for the range 1 - 8.

Dave bids 100 for the range 5 - 8.

Emily bids 40 for the range 1 - 4.

Let's calculate each bidder's valuation according to the algorithm. We do this by multiplying the bond amount by the number of periods in the specified range of the bid.

**Charlie - 75 \* 8 = 600 for range 1 - 8**

Dave - 100 \* 4 = 400 for range 5 - 8

Emily - 40 \* 4 = 160 for range 1 - 4

Although Dave had the highest bid in accordance to token amount, when we do the calculations we see that since he only bid for a range of 4, he would need to share the slot with Emily who bid much less. Together Dave's and Emily's bids only equals a valuation of 560.

A random number, which is based on the VRF used by Polkadot, is determined at each block. Additionally, each auction will have a threshold that starts at 0 and increases to 1. The random number produced by the VRF is examined next to the threshold to determine if that block is the end of the auction within the so-called ending period.

**Charlie's valuation for the entire range is 600. Therefore Charlie is awarded the complete range of the parachain slot.**

While each parachain auction is scheduled for seven days, the candle auction format means that the “end” date and time is a bit of a wildcard.

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/b817f983/a360186ca4671c7895f36c69f26ff047.png)

**The first two days** are confirmed to be an “open” period of the auction.

**The following five days,** however, fall within the “wick” of this theoretical candle, and the auction will end sometime in this five-day period.  so you won’t actually know in real-time when the auction ends.

project must specify the following information:

Parachain ID/Index (which parachain the bid or crowdloan will support)

First and Last Slot **(the lease is broken into 8 increments,** and projects can bid on a partial or full lease period)

![Polkadot](https://cdn.rcimg.net/arman-riazi-science/b817f983/fd7cc5419a9d958125eea5fe12b7a67f.png)

While these crowdloan bids occur, the private-bid projects (Turquoise/Salmon) don’t have to enter additional bids. However, after Day 2, it becomes risky to wait since the auction can end at any time.

Finally, on Day 4, Salmon Parachain enters a private bid of 5000 DOT and briefly takes the lead in the auction.

Unfortunately, on Day 5, Salmon Parachain is quickly outbid by a private bid from Turquoise Parachain AND an increased bid from the Purple Parachain crowdloan module.

These antics continue until Day 7 when the highest bid is Purple Parachain with 18,000 DOT. However, importantly, Purple does not win. The winner is Turquoise.

**Turquoise Parachain wins the slot and is now able to connect to the Kusama network. This will likely happen soon after the slot is won since the lease period begins immediately.** After the end of a lease period (48 week periods on Kusama and 96 week lease periods on Polkadot), the slot will be available for renewal or for another project to occupy.

The remaining parachains must continue to compete for a slot, assuming their crowdloan modules remain open and the private bidders have the interest in pursuing a slot again, rather than waiting for a less competitive auction.

**Unbonding takes 28 days** on Polkadot and **7 on Kusama**. Ensure your staking and democracy holds are cleared.

👆👆👆

📚📚📚

## Literature

 authorities win slots based on a verifiable random function = VRF

the private-bid projects = Individual parachain

[Substrate-Glossary](https://docs.substrate.io/v3/getting-started/glossary/)

❤️❤️❤️

Researcher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Kusama]]

[[Polkadot]]

[[CrowdLoan]]
