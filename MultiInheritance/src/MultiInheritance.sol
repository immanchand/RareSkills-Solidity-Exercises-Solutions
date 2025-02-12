// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract X {
    uint256 public constant x = 42;
}

contract Y {
    uint256 public constant y = 24;
}

contract MultiInheritance is X, Y {
    /**
     * The goal of this exercise is to use the functionality of contracts X and Y without pasting their code here or making an external call or delegate call
     */
     function getNumbers() public pure returns (uint256 _x, uint256 _y){
        return (x, y);
     }
}