// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Add{
    function add(uint256 x, uint256 y) public pure returns(uint256){
        uint256 sum = x + y;
        return sum;
    }
}