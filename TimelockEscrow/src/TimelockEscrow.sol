// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;

    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    mapping(address => uint256) public escrows;
    mapping(address => uint256) public prices;
    
    /**
     * creates a buy order between msg.sender and seller
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        // your code here
        require(escrows[msg.sender]==0 || escrows[msg.sender]<block.timestamp, "active escrow exists");
        escrows[msg.sender] = block.timestamp+3 days;
        prices[msg.sender] = msg.value;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        // your code here
        require(escrows[buyer]<block.timestamp, "escrow time hasnt elapsed");
        require(escrows[buyer]!=0, "escrow doesnt exist for this buyer");
        require(msg.sender==seller, "You are not the seller");
        escrows[msg.sender]=0;
       // seller.call{value: price[buyer]}("");
        payable(seller).transfer(prices[buyer]);
        prices[buyer]=0;
    }

    /**
     * allows buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        // your code here
        require(escrows[msg.sender]!=0, "escrow doesnt exist for this buyer");
        require(escrows[msg.sender]>block.timestamp, "escrow time has already elapsed");
        escrows[msg.sender]=0;
       // seller.call{value: price[buyer]}("");
        payable(msg.sender).transfer(prices[msg.sender]);
        prices[msg.sender]=0;
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address buyer) external view returns (uint256) {
        // your code here
        return prices[buyer];
    }
}
