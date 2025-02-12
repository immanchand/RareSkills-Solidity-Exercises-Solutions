// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PriceIsRight {
    /// @dev make this function revert unless exactly 1 ether is sent as value in the function call
    function buy() public payable {
        /// your code here
        require(msg.value==1 ether,"exactly 1 ether required");
    }
}