// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract OnlyOwner {
    /*
        This exercise assumes you know how restrict a function call to an address.
        1. Restrict `updateMagicNumber` function call to only the address
           passed in the constructor.
    */

    address owner;
    uint256 public magicNumber;

    constructor(address _owner, uint256 _magicNumber) {
        owner = _owner;
        //owner = msg.sender;
        magicNumber = _magicNumber;
    }

    function updateMagicNumber(uint256 _number) public {
        require(msg.sender==owner, "only the owner can update the magic number");
        magicNumber = _number;
    }
}