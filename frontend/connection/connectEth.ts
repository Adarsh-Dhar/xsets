import { ethers } from "ethers";

// Contract ABIs and Addresses
import { NFT_ABI } from "./abi";


// Ethereum provider and signer
let provider;
let signer;
let MyNFTAddress = "0x095C465643C1Bd048A5531628D33774Cd8CBAe02"


// Initialize the provider and signer
export const initEthereum = async () => {
    //@ts-ignore
    if (window.ethereum) {
    //@ts-ignore

        provider = new ethers.BrowserProvider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        signer = provider.getSigner();
        console.log(`Signer: ${signer}`);
        console.log(`Provider: ${provider}`);
        return { signer, provider };
    } else {
        console.log("MetaMask is not installed!");
        return null;
    }
};

// Mint NFT on Ethereum
export const mintNFTEth = async (toAddress, tokenURI) => {
    //@ts-ignore

    const { signer } = await initEthereum();
    if (!signer) {
        console.log("Signer not available");
        return null;
    }

    const contract = new ethers.Contract(MyNFTAddress, NFT_ABI, signer);
    try {
        const transaction = await contract.mint(toAddress, tokenURI);
        await transaction.wait();
        console.log("NFT Minted successfully");
        return transaction;
    } catch (error) {
        console.error("Error minting NFT:", error);
        return null;
    }
};

// Burn NFT on Ethereum
export const burnNFT = async (tokenId) => {
    //@ts-ignore

    const { signer } = await initEthereum();
    if (!signer) {
        console.log("Signer not available");
        return null;
    }

    const contract = new ethers.Contract(MyNFTAddress, NFT_ABI, signer);
    try {
        const transaction = await contract.burn(tokenId);
        await transaction.wait();
        console.log("NFT Burned successfully");
        return transaction;
    } catch (error) {
        console.error("Error burning NFT:", error);
        return null;
    }
};

// Transfer NFT on Ethereum
export const transferNFT = async (tokenId, toAddress) => {
    //@ts-ignore

    const { signer } = await initEthereum();
    if (!signer) {
        console.log("Signer not available");
        return null;
    }

    const contract = new ethers.Contract(MyNFTAddress, NFT_ABI, signer);
    try {
        const transaction = await contract["safeTransferFrom(address,address,uint256)"](await signer.getAddress(), toAddress, tokenId);
        await transaction.wait();
        console.log("NFT Transferred successfully");
        return transaction;
    } catch (error) {
        console.error("Error transferring NFT:", error);
        return null;
    }
};
