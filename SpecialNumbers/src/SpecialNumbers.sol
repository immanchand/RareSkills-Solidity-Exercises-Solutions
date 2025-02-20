// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SpecialNumbers {
    mapping(uint256 => bool) public isSpecial;

    /**
     * The goal is to use mappings and store if a number is special or not (using booleans)
     */

    /// make @param n special
    function makeNumberSpecial(uint256 n) public {
        // your code here
        isSpecial[n]=true;
    }

    /// make @param n not special
    function makeNumberNotSpecial(uint256 n) public {
        // your code here
        isSpecial[n]=false;
    }

    /// return if a number @param n is special or not
    function isNumberSpecial(uint256 n) public view returns (bool) {
        // your code here
        return isSpecial[n];
    }
}