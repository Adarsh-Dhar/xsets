import React, { useState } from 'react';
import { useWallet } from "@aptos-labs/wallet-adapter-react";
import { transferNFTAptosToEth, burnNFTAptos } from '../connection/connectAptos';
import { useRecoilState } from 'recoil';
import { recipentatom, tokenuriatom } from '../recoil/nft';

interface MintNFTProps {
  nftContractAddress: string;
}

const AptosToEth: React.FC<MintNFTProps> = ({ nftContractAddress }) => {
  const { signAndSubmitTransaction } = useWallet();
  const recipent = useRecoilState(recipentatom)
  const tokenURI = useRecoilState(tokenuriatom)

  const transferAndBurn = async () => {
    if (!recipent || !tokenURI) {
      alert('Please enter all the details');
      return;
    }

    try {
      //@ts-ignore
      await transferNFTAptosToEth(signAndSubmitTransaction, recipent, tokenURI);
      //@ts-ignore
      await burnNFTAptos(signAndSubmitTransaction, tokenURI);
      alert('NFT Transferred from Aptos to Ethereum and burned on Aptos!');
    } catch (error) {
      console.error('Error during transfer and burn:', error);
      alert('Error during transfer and burn');
    }
  };

  return (
    <div className="p-4 border rounded-lg">
      <h2 className="text-xl font-semibold mb-4">Aptos to Ethereum</h2>
      
      <button className="p-2 bg-green-500 text-white rounded w-full" onClick={transferAndBurn}>Transfer and Burn</button>
    </div>
  );
};

export default AptosToEth;
