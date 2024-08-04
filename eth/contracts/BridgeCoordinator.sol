// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "./IWormhole.sol";
import "./MyNft.sol";

contract BridgeCoordinator is  ERC721Holder {
    address public wormholeAddress;
    address public nftAddress;
    

    event TransferRequested(address indexed from, address indexed to, uint256 indexed tokenId, string tokenURI);
    event TransferReceived(address indexed from, address indexed to, uint256 indexed tokenId, string tokenURI);
    address private _owner;


    constructor(address _wormholeAddress, address _nftAddress) {
        wormholeAddress = _wormholeAddress;
        nftAddress = _nftAddress;
    }

    function handleTransferRequest(address to, uint256 tokenId) external {
        IERC721Metadata nftContract = IERC721Metadata(nftAddress);
        require(nftContract.ownerOf(tokenId) == msg.sender, "You do not own this token");

        // Transfer the NFT to this contract
        nftContract.safeTransferFrom(msg.sender, address(this), tokenId);

        // Get the token URI
        string memory tokenURI = nftContract.tokenURI(tokenId);

        // Create the payload
        bytes memory payload = abi.encode(msg.sender, to, tokenId, tokenURI);

        // Send the message through Wormhole
        IWormhole(wormholeAddress).sendMessage(payload);

        emit TransferRequested(msg.sender, to, tokenId, tokenURI);
    }

      function owner() public view virtual returns (address) {
        return _owner;
    }

     modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    function handleMintRequest(address from, address to, uint256 tokenId, string memory tokenURI) external onlyOwner {
        IERC721Metadata nftContract = IERC721Metadata(nftAddress);

        // Mint the NFT to the recipient
        // nftContract.mint(to, tokenId, tokenURI);

        emit TransferReceived(from, to, tokenId, tokenURI);
    }

    function verifyWormholeMessage(bytes memory payload) external view returns (bool) {
        // Implement message verification logic
        // For example, checking the signature or sender address
        return true;
    }
}
