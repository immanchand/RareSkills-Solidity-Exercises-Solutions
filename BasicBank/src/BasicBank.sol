// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times
    mapping (address=>uint256) private bankBalances;
    function addEther() external payable {
        bankBalances[msg.sender] += msg.value;
    }

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {
        require(bankBalances[msg.sender]>=amount,"insufficient balance in your account");
        msg.sender.call{value: amount}("");
        bankBalances[msg.sender] -= amount;
    }
}