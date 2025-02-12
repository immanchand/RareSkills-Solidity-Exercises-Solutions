// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PublicFunction {
    // change this code so this function
    // is callable outside the contract
    function magicNumber() public pure returns (uint256) {
        return 42;
    }
}