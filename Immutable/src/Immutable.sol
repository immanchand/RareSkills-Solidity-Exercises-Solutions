// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/*
    This exercise assumes you know how to declare immutable variables.
    1. Make the variable `value` immutable.
*/

contract ContractImmutable {
    uint256 immutable public value = 20;

    constructor(uint256 _value) {
        value = _value;
    }

    function dummy() public {
        //value = 42; // This should fail.
    }
}