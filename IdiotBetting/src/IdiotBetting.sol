// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */
    uint256 public winningAmount;
    uint256 public endTime;
    address public winningAddress;
    
    function bet() public payable {
        // your code here
        //require(msg.value>lastDepositAmount, "Your bet is too low! Try again!");
        if(endTime==0)
            endTime = (block.timestamp+60 minutes);
        require(block.timestamp<=endTime, "Sorry, your bet is too late. Winner can claim it!");
        
        if(msg.value>winningAmount){
            winningAmount = msg.value;
            winningAddress = msg.sender;
            endTime = (block.timestamp+60 minutes);
        }
        
    }

    function claimPrize() public {
        // your code here
        require(endTime!=0, "A new game has started. Place your bet now!");
        require(block.timestamp>endTime, "The game isn't over yet. Keep betting to win!");
        require(msg.sender == winningAddress, "You are not the winner");
        endTime=0;
        winningAmount=0;
        winningAddress=address(0);
        msg.sender.call{value: address(this).balance}("");
    }
}
