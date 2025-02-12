// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Withdraw {
    // @notice make this contract able to receive ether from anyone and anyone can call withdraw below to withdraw all ether from it
    function withdraw() public {
        // your code here
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Call failed");
        
    }
    receive() external payable { }
}