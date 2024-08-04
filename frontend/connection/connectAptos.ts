import { useWallet, InputTransactionData } from "@aptos-labs/wallet-adapter-react";
import { Aptos, AptosConfig, Network } from "@aptos-labs/ts-sdk";

import { useRecoilState } from "recoil";

const aptosConfig = new AptosConfig({ network: Network.DEVNET });
export const aptos = new Aptos(aptosConfig);
// Change this to be your module account address
export const MyNFT_module_address = "0x0da2178c68352cf9035afbb8750eb9eb6905332a9d0f15bd36b140cba6eaf5eb";

export const mintNFTAptos = async (signAndSubmitTransaction: any, metadata_uri: string) => {
    const transaction: InputTransactionData = {
        data: {
            function: `${MyNFT_module_address}::nft::mint`,
//@ts-ignore
functionArguments: [metadata_uri]
        }
    };
    try {
        // Sign and submit transaction to chain
        const response = await signAndSubmitTransaction(transaction);
        // Wait for transaction
        await aptos.waitForTransaction({ transactionHash: response.hash });
        return response;
    } catch (error) {
        console.error("Error minting NFT on Aptos:", error);
        throw error;
    }
};

export const burnNFTAptos = async (signAndSubmitTransaction: any, metadata_uri: string) => {
    const transaction: InputTransactionData = {
        data: {
            function: `${MyNFT_module_address}::nft::burn`,
            //@ts-ignore
            functionArguments: [metadata_uri]
        }
    };
    try {
        // Sign and submit transaction to chain
        const response = await signAndSubmitTransaction(transaction);
        // Wait for transaction
        await aptos.waitForTransaction({ transactionHash: response.hash });
        return response;
    } catch (error) {
        console.error("Error burning NFT on Aptos:", error);
        throw error;
    }
};

export const transferNFTAptosToEth = async (signAndSubmitTransaction: any,  recipient: string, metadata_uri: string) => {
    const transaction: InputTransactionData = {
        data: {
            function: `${MyNFT_module_address}::BridgeCoordinator::handle_transfer_request`,
            //@ts-ignore
            functionArguments: [recipient, metadata_uri] // Provide the recipient, token ID, and metadata URI
        }
    };
    try {
        const response = await signAndSubmitTransaction(transaction);
        await aptos.waitForTransaction({ transactionHash: response.hash });
        return response;
    } catch (error) {
        console.error("Error transferring NFT from Aptos to Ethereum:", error);
        throw error;
    }
};
