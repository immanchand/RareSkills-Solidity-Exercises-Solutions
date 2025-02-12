// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract BasicBankV2 {
    /// used to store the balance of users
    ///     USER    =>  BALANCE
        mapping (address=>uint256) public balances;
    function addEther() external payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {
        require(balances[msg.sender]>=amount,"insufficient balance in your account");
        msg.sender.call{value: amount}("");
        balances[msg.sender] -= amount;
    }
}
