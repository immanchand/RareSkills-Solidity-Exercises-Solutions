// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract RareCoin {
    address public owner;
    string public name;
    string public symbol;
    address public source; 
    uint8 public decimal;
    uint256 public totalSuply;
    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public approvals;

    constructor(string memory _name, string memory _symbol, uint8 _decimal, address _source){
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        source = _source;
        owner = msg.sender;
    }
    function mint() public pure returns(bool){
        require(false,"coins can only be minted by trading Skill coin for Rare coin");
        return true;
    }
    function approve(address spender, uint256 amount) public returns(bool){
        approvals[msg.sender][spender] = amount;
        return true;
    }
    function transferFunction(address from, address to, uint256 amount) private returns(bool){
        require(balanceOf[from]>=amount,"insufficnet balance to transfer");
        balanceOf[from]-=amount;
        balanceOf[to]+=amount;
        return true;
    }
    function transfer(address to, uint256 amount) public returns(bool){
        return transferFunction(msg.sender, to, amount);
    }
    function transferFrom(address from, address to, uint256 amount) public returns(bool){
        if(msg.sender!=from)
            require(approvals[from][msg.sender] >=amount,"insufficient approval to transfer");
        return transferFunction(from, to, amount);
    }
    function trade(uint256 amount) public returns(bool){
        (bool ok, bytes memory result) = source.call(abi.encodeWithSignature("transferFrom(address,address,uint256)",msg.sender,address(this),amount));
        require(ok,"transfer from Skill coin failed");
        totalSuply += amount;
        balanceOf[msg.sender] += amount;
        return abi.decode(result, (bool));
    }
}