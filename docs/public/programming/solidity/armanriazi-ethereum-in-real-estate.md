## A guide to demoing the real-estate contract

## Prerequisites

This documentation has been intended for readers with a basic understanding on the Solidity smart contract programming language and on basic web developing tools. In order to run,
the demo requires the following software to be installed. For verified functionality, the specified versions are recommended:

> Ubuntu 16.04.2 LTS
> 
> TestRPC, version 3.0.4
> 
> Truffle, version 3.2.1
> 
> Node.js, version 7.9.0

Running an Ethereum client

### Run a deterministic TestRPC session
At first, an Ethereum client needs to be run

```shell
testrpc -d
```

### Deploy the contract
For demoing purposes, TestRPC is a good choice for a client, for a number of reasons. First
ly, TestRPC creates a new blockchain instance and transactions can be paid with tokens of the
said blockchain. The creator of the TestRPC session gains access to the tokens for free and
therefore transactions can be made without a cost. Secondly, by default, TestRPC is configured
in such a way that there is no block time—instead, blocks are created on demand, whenever
transactions occur. This type of a configuration is well suited for quick testing and demoing.
Finally, TestRPC can be run in deterministic mode. This means that a smart contract’s address,
for example, can be known already before deploying it in the blockchain. This makes it possi
ble to reference the address in scripts made for testing or demoing purposes.
Deploying the smart contracts
The smart contracts written in Solidity need to be compiled and deployed to the blockchain.
This can be achieved by using a development environment for Ethereum called Truffle. A sim
ple migration script needs to be created for Truffle, after which the contracts can be deployed
using the following command:
```shell
truffle migrate
```

### Open the status view  in browser

Without a graphical user interface, none of the process steps can be visually observed in any
way. Therefore, a simple web-browser-based status viewer has been added to the demo application. It shows the changes in the status of the different entities as a crude HTML table. The
status viewer can be accessed by opening the web page index.html in any web browser.
Open `scripts/status/index.html` in browser.

### Run the issuer script that creates real estates, owners and agents in the contract.

Creating the assets and the agents, and establishing ownership
For the demo, agents are needed in order to facilitate a workflow between them. Furthermore,
for the purposes of facilitating the sale of a share in a housing association, the ownership of assets and documents needs to be assigned to these parties. In our demo, we utilize an approach
where a master key holder has the power to establish ownerships to the system participants.
We establish a master key holder that is allowed to create owners for shares of stock, property
agents and shares of stock in housing companies in the application. By running the script 0-issuer.js, we create a number of owners, agents and a number of shares of stock, and we assign
the first owner to each created share of stock.

```shell
cd scripts/
node 0-issuer
```

### Initiate the sale of a real estate

The process of selling a share of stock in a housing company usually starts with the seller contacting a property agent or agents for a listing offer. In the case of our demo application, the
seller can announce a solicitation for listing offers by initiating a transaction in the smart contract designed to facilitate the workflow.
For the purposes of the demo, the smart contract should therefore be populated with at least
one request for listing offers. The script 1-initiateSale.js is used for this purpose

```shell
node 1-initiateSale
```

### Open IPFS web user interface

Uploading documents to the IPFS
Selling a share of stocks in a housing corporation requires a housing manager’s certificate
to be drafted.2 In order to draft the certificate, the building manager must check the validity
of the required information by combining data from several public and private information
pools, e.g. the title and the mortgage register of the National Land Survey, the trade register
of the Finnish Patent and Registration Office, the housing company debt report of the creditor banks, the property management planning report of the housing company in question, and
so on.
In our demo application’s workflow, the data required for the housing manager’s certificate are
requested from the information pools. The pools directly store the requested files in the Interplanetary File System (IPFS) and enter the associated hash values into the smart contract facilitating the workflow.3 To emulate this in our demo, the hashes of three random documents
followed by the hash of the housing manager’s certificate are recorded into the blockchain.
We first run the following command to set up a local IPFS node.

```shell
ipfs daemon
```

We then open the web user interface at http://localhost:5001/webui in browser, drag-and-drop
the information pool documents to the web user interface to upload them, and make note of
the hash values of the documents

### Upload three documents related to the real estate

Upload the document to IPFS by drag-and-drop in the web UI. See what the hash of the document is and announce it in the smart contract.
As the next step, the command above is executed three times, each time replacing <document
hash> with the hash of a different document. We then run the following command once to upload the actual housing manager’s certificate, compiled from the already uploaded documents:
  
```shell
node 2-uploadDocument <document hash>
```

### Upload confirmation letter

As the next step, the command above is executed three times, each time replacing <document
hash> with the hash of a different document. We then run the following command once to up
load the actual housing manager’s certificate, compiled from the already uploaded documents:
  
```shell
node 3-uploadConfirmationLetter <document hash>
```

### Create offers to sell the property as a real estate agent/broker

Create offers from real estate agents to sell the property
When the housing manager’s certificate has been received, the real estate can be sold. In the
workflow of our demo application, real estate agents compete for who gets to sell the real estate by making offers to the seller of the real estate, specifying a fee (e.g. a percentual cut) that
they’ll sell it for.
  
```shell
node 4-makeAgentOffer <fee>
```


### As the owner of the real estate, accept one of the agent offers

To emulate this market behavior, we run the command above any number of times, each time
changing the fee variable to differentiate between offers.
Accepting a real estate agents offer
As the last step of the workflow modelled in our demo application, the seller of the share of
stocks in a housing company chooses one of the listing offers made by one of the agents. This
is emulated by executing the command below, along with the proper offer ID from the status
viewer window.
  
```shell
node 5-chooseAgentOffer <offer id>
```

### Smart Contract
  
The logic of the smart contract facilitating the workflow is defined in the Solidity file RealEstateMarket.sol. The contract defines the public methods for initiating sales, creating housing manager certificates, as well as creating listing offers and accepting them.
 
 
### GUI
  
The status viewer is a web page which is useful for observing changes in the blockchain while
running the demo. It shows the status of the workflow process, with all the contributions to it
by the various participants. The status viewer can be run by opening the file index.html in any
web browser.
