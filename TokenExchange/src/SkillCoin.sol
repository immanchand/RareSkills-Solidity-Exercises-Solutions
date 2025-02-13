// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SkillCoin {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public totalSupply;
    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public approvals;

    constructor(string memory _name, string memory _symbol, uint8 _decimal){
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        owner = msg.sender;
        totalSupply = 0;
    }

    function mint(uint amount) public returns(bool){
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        return true;
    }
    function approve(address spender, uint256 amount) public returns(bool){
        approvals[msg.sender][spender] = amount;
        return true;
    }
    function transferFunction(address from, address to, uint256 amount) private returns(bool){
        require(balanceOf[from]>=amount,"current balance is insufficient to transfer");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }
    function transfer(address to, uint256 amount) public returns(bool){
        return transferFunction(msg.sender, to, amount);
    }
    function transferFrom(address from, address to, uint256 amount) public returns(bool){
        if(msg.sender!=from)
            require(approvals[from][msg.sender] >=amount,"approval amount insufficient to transfer");
        return transferFunction(from, to, amount);    
    }
}