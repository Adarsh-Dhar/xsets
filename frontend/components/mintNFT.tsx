import React, { useState } from 'react';
import { mintNFTAptos } from '../connection/connectAptos';
import { mintNFTEth } from '../connection/connectEth';

interface MintNFTProps {
  nftContractAddress: string;
}

const MintNFT: React.FC<MintNFTProps> = ({ nftContractAddress }) => {
  const [recipient, setRecipient] = useState('');
  const [tokenURI, setTokenURI] = useState('');

  const mintOnEthereum = async () => {
    if (!recipient || !tokenURI) {
      alert('Please enter all the details');
      return;
    }

    try {
      await mintNFTEth(recipient, tokenURI);
      alert('NFT Minted Successfully on Ethereum!');
    } catch (error) {
      console.error('Error minting NFT on Ethereum:', error);
      alert('Error minting NFT on Ethereum');
    }
  };

  const mintOnAptos = async () => {
    if (!recipient || !tokenURI) {
      alert('Please enter all the details');
      return;
    }

    try {
      await mintNFTAptos(recipient, tokenURI);
      alert('NFT Minted Successfully on Aptos!');
    } catch (error) {
      console.error('Error minting NFT on Aptos:', error);
      alert('Error minting NFT on Aptos');
    }
  };

  return (
    <div className="p-4 border rounded-lg">
      <h2 className="text-xl font-semibold mb-4">Mint NFT</h2>
      <input
        type="text"
        className="p-2 border rounded mb-2 w-full"
        placeholder="Recipient Address"
        value={recipient}
        onChange={(e) => setRecipient(e.target.value)}
      />
      <input
        type="text"
        className="p-2 border rounded mb-4 w-full"
        placeholder="Token URI"
        value={tokenURI}
        onChange={(e) => setTokenURI(e.target.value)}
      />
      <button className="p-2 bg-blue-500 text-white rounded mb-2 w-full" onClick={mintOnEthereum}>Mint NFT in Ethereum</button>
      <button className="p-2 bg-green-500 text-white rounded w-full" onClick={mintOnAptos}>Mint NFT in Aptos</button>
    </div>
  );
};

export default MintNFT;
