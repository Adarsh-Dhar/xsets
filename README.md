XSETS

This application demonstrates cross-chain NFT transfers between Ethereum and Aptos using the Wormhole protocol. It includes both Solidity and Move smart contracts, as well as a basic frontend to interact with the contracts.
Features

    Ethereum Contract: A Solidity contract that handles NFT minting, transferring, and burning.
    Aptos Contract: A Move contract that manages messages on the Aptos blockchain.
    Cross-Chain Transfer: Enables NFTs to be transferred from Ethereum to Aptos and vice versa using the Wormhole protocol.
    Basic Frontend: A simple web interface to interact with the contracts and demonstrate cross-chain NFT transfers.

Prerequisites

    Node.js
    npm or yarn
    Truffle or Hardhat
    Move CLI and Aptos CLI
    Metamask 
    Petra Wallet

Installation

    Clone the repository:

     

git clone https://github.com/Adarsh-Dhar/xsets


Install dependencies:


npm install

Compile Solidity contracts:

 

npx hardhat compile

Deploy Solidity contracts:

 

npx hardhat run scripts/deploy.js --network your_network

Compile and deploy Move contracts:

 

    aptos move compile --save-metadata
    aptos move publish --profile default

Usage

    Start the frontend:

     

    npm start

    Open the web application:
    Open your browser and go to http://localhost:3000.

    Interact with the application:
        Connect your Ethereum wallet (e.g., Metamask).
        Connect your Aptos wallet.
        Mint NFTs on Ethereum and transfer them to Aptos.
        Transfer NFTs back from Aptos to Ethereum.

Smart Contracts
Ethereum (Solidity)


    Description: Handles NFT minting, transferring, burning, and cross-chain communication via Wormhole.

Aptos (Move)

    Description: Manages messages and cross-chain communication on the Aptos blockchain.

Frontend

The frontend is a basic React application that interacts with both Ethereum and Aptos blockchains. It uses web3.js for Ethereum and the Aptos SDK for Aptos.
Key Components

    Connect Wallet: Connect your Ethereum and Aptos wallets.
    Mint NFT: Mint a new NFT on Ethereum.
    Transfer NFT to Aptos: Transfer an NFT from Ethereum to Aptos.
    Transfer NFT to Ethereum: Transfer an NFT from Aptos to Ethereum.

Wormhole Integration

The application uses the Wormhole protocol to facilitate cross-chain communication. The Wormhole smart contracts are used to verify and process messages between the Ethereum and Aptos blockchains.
Development
Ethereum

    Compile Contracts:

     

npx hardhat compile

Deploy Contracts:

 

    npx hardhat run scripts/deploy.js --network your_network

Aptos

    Compile Move Contracts:

     

aptos move compile --save-metadata

Deploy Move Contracts:

 

    aptos move publish --profile default

License

This project is licensed under the Apache 2.0 License.
Acknowledgements

    OpenZeppelin for their secure and community-vetted smart contracts.
    Wormhole for providing the protocol to facilitate cross-chain communication.
    Aptos for their innovative blockchain platform.
