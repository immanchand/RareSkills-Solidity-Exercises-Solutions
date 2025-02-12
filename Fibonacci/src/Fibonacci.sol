// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 8, because the 6th Fibonacci number is 8.
    */

    function fibonacci(uint256 _position) public pure returns (uint256) {
        // your code here
        uint256 fibnum = 0;
        uint256 fibnumback = 1;
        uint256 temp;
        for(uint256 i = 1; i <= _position ; i++){
            
            temp = fibnum;
            fibnum = fibnum + fibnumback;
            fibnumback = temp;
        }
        return fibnum;
    }
}