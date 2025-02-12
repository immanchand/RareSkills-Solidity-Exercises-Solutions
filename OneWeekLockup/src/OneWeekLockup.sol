// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
    mapping (address=>uint256) public balances;
    mapping (address=>uint256) public lastDeposits;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[user];
    }

    function depositEther() external payable {
        /// add code here
        balances[msg.sender] += msg.value;
        lastDeposits[msg.sender] = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        require(balances[msg.sender]>=amount, "insufficient funds to withdraw");
        require(block.timestamp > (lastDeposits[msg.sender] + 1 weeks), "cannot withdraw before 1 week");
        balances[msg.sender] -= amount;
        msg.sender.call{value: amount}("");
    }
}