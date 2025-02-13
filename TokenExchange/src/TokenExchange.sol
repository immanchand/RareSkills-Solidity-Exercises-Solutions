// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

/*
    Run the following command to install the oz contracts:
    forge install OpenZeppelin/openzeppelin-contracts --no-commit 
*/
//import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
//import "./RareCoin.sol";
//import "./SkillCoin.sol";

/*
Build two ERC20 contracts: RareCoin and SkillsCoin (you can change the name if you like).
Anyone can mint SkillsCoin, but the only way to obtain RareCoin is to send SkillsCoin to the RareCoin contract.
You'll need to remove the restriction that only the owner can mint SkillsCoin.

Here is the workflow:
- mint() SkillsCoin to yourself
- SkillsCoin.approve(address rareCoinAddress, uint256 yourBalanceOfSkillsCoin) RareCoin to take coins from you.
- RareCoin.trade() This will cause RareCoin to SkillsCoin.transferFrom(address you, address RareCoin, uint256 yourBalanceOfSkillsCoin) Remember, RareCoin can know its own address with address(this)
- RareCoin.balanceOf(address you) should return the amount of coin you originally minted for SkillsCoin.

Remember ERC20 tokens(aka contract) can own other ERC20 tokens. So when you call RareCoin.trade(), it should call SkillsCoin.transferFrom and transfer your SkillsCoin to itself, I.e. address(this).
*/

contract SkillsCoin {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimal;
    uint256 public totalSupply;
    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public approvals;

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
        //decimal = _decimal;
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

contract RareCoin {
    address public owner;
    string public name;
    string public symbol;
    address public source; 
    uint8 public decimal;
    uint256 public totalSuply;
    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public approvals;

    constructor(string memory _name, string memory _symbol, address _source){
        name = _name;
        symbol = _symbol;
        //decimal = _decimal;
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
