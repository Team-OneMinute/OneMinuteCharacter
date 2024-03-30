// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1167Proxy is Ownable {
    // 実装コントラクトのアドレス
    address private implementationAddress;

    constructor(address _implementation) {
        transferOwnership(msg.sender); // コントラクトのデプロイヤーをオーナーとして設定
        implementationAddress = _implementation;
    }

    // 実装アドレスを更新する関数（オーナーのみ実行可能）
    function updateImplementation(address newImplementation) public onlyOwner {
        require(newImplementation != address(0), "Invalid address for new implementation");
        implementationAddress = newImplementation;
    }

    // 現在の実装アドレスを取得する関数
    function getImplementation() public view returns (address) {
        return implementationAddress;
    }

    fallback() external payable {
        address _impl = implementationAddress;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    receive() external payable {
        fallback();
    }
}
