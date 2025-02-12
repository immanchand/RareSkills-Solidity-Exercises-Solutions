// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exponent{

    /*
        This exercise assumes you know how exponent works.
        1. Function `getResult` should return the result of the exponent.
    */

    function getResult(uint256 _base, uint256 _e)
        public
        pure
        returns (uint256)
    {
        //uint256 expResult = _base ** _e;
        return _base ** _e;
    }



}