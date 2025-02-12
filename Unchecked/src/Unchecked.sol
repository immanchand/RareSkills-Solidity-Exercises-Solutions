// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Unchecked {
    /*
        This exercise assumes you understand what unchecked keyword is.
        1. The `getNumber` function reverts when called, you need to make the function stop
           reverting and return underflow value.
    */
     

    function getNumber(uint256 x) public pure returns (uint256) { // Corrected syntax
        unchecked{
            return x - 100;
        }
        
    }

   
}