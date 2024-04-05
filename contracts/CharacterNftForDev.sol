// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
/**
 * Thi contract is developper contract
 * Character NFT is still cleated on ThirdWeb
 * This contract is Checking for ERC-6551 contract, 
 * because ec6551cegister is requiresquired to token contract.
 */
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract myNFT is ERC721, Ownable {
    constructor() ERC721("myNFT", "NFT") Ownable(msg.sender){}

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}