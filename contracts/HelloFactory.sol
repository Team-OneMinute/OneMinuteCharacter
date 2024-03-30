// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import './HelloWorld.sol';
import './CloneFactory.sol';

contract HelloFactory is CloneFactory, Ownable {
  address public baseToken;
  address[] public tokens;

  constructor (address _baseToken, address initialOwner) Ownable(initialOwner) {
    baseToken = _baseToken;
  }

  function createToken() public onlyOwner {
    address clone = createClone(baseToken);
    HelloWorld(clone).initialize();
    tokens.push(clone);
  }

  function tokenOf(uint256 tokenId) public view returns (address) {
      return tokens[tokenId];
  }
}
