# Dapp campaign funding platform - Solidity, React.js

This **decentralized application** allow people to create a fundraising campaign.

This app is similar to Kickstarter but solves a big issue using **blockchain technology**. By using the **Ethereum blockchain**, the **funds** donated by the contributors are **securely locked** into a **smart contract**.

Users can contribute to the campaign by transferring funds to the smart contract.
When the creator of the campaign want to use some of the funds for his project, he has to create a request and inform the contributors the nature of the request, the recipient and the amount needed.
The fund will be unlocked if more than 50% of the contributors approve the request.

The [smart contract](https://rinkeby.etherscan.io/address/0x74E662ca03247f46592637Aef4C47eFd24DeF9fE) is deployed on the **Ethereum Rinkeby test network**.

You can view the **live version** of this dapp **[here](https://kickstart-xrhoqyfcpf.now.sh/)**.

###For this project I used:

* [Solidity](https://solidity.readthedocs.io/en/v0.4.21/) (Smart Contract language for the Ethereum blockchain)
* [React.js](https://reactjs.org/) for the frontend of the app
* [Next.js](https://github.com/zeit/next.js/) for client-side routing and server-side rendering
* [Semantic UI React](https://react.semantic-ui.com/introduction) for easy/simple/quick styling of the app

##Important note:
Users need **[MetaMask](https://metamask.io/)** installed in their browser to interact with the smart contract.
**Before using MetaMask**, make sure you switched to the **Rinkeby test network** and have **funds available**.
