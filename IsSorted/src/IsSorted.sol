// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public pure returns (bool) {
        // your code here
        if(arr.length==0)
            return true;
        for(uint256 i=0; i<(arr.length-1);i++){

            if(arr[i]>arr[i+1])
            return false;

        }
       
        return true;
    }
}