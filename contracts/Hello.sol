// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Hello {
    bool public initialized;

    function initialize() public {
        require(!initialized,"already initialized");
        initialized = true;
    }
    // "Hello, World!"を返す関数
    function sayHello() public pure returns (string memory) {
        return "Hello, World!";
    }
}