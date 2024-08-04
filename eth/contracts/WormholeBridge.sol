// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "./IWormhole.sol";

contract WormholeBridge is  ERC721Holder {
    address public wormholeAddress;
    address public nftAddress;

    event TransferRequested(address indexed from, address indexed to, uint256 indexed tokenId, string tokenURI);
    event TransferReceived(address indexed from, address indexed to, uint256 indexed tokenId, string tokenURI);

    constructor(address _wormholeAddress, address _nftAddress) {
        wormholeAddress = _wormholeAddress;
        nftAddress = _nftAddress;
    }

    function sendMessage(address recipient, uint256 tokenId, string memory tokenURI) external {
        // Transfer the NFT to this contract
        IERC721(nftAddress).safeTransferFrom(msg.sender, address(this), tokenId);

        // Create the payload
        bytes memory payload = abi.encode(msg.sender, recipient, tokenId, tokenURI);

        // Send the message through Wormhole
        IWormhole(wormholeAddress).sendMessage(payload);

        emit TransferRequested(msg.sender, recipient, tokenId, tokenURI);
    }

    function receiveMessage(bytes memory payload) external {
        // Decode the payload
        (address from, address to, uint256 tokenId, string memory tokenURI) = abi.decode(payload, (address, address, uint256, string));

        // Mint the NFT to the recipient
        // IERC721Metadata(nftAddress).mint(to, tokenId, tokenURI);

        emit TransferReceived(from, to, tokenId, tokenURI);
    }
}
