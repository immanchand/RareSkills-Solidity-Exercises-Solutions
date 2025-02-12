// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract IfStatement {
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        // return the maximum of a and b
        if (a > b)
        return a;
        else if (b > a)
        return b;
        else
        return 0;
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        // return the minimum of a and b

        if (a < b)
        return a;
        else if (b < a)
        return b;
        else
        return 0;
    }
}