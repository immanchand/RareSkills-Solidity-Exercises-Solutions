// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Tupledore {
    /* This exercise assumes you know about tuples/struct in solidity.
        1. Create a struct named `UserInfo` with types address 
           and uint256.
        2. Create a variable of type UserInfo, named `userInfo`.
        3. Create a function called `setTuple` that takes in 
           a address and uint256 and sets the all values 
           the `userInfo` variable you created above.
        4. Create a function called `returnTuple`, 
           that returns `userInfo` (as a tuple)
    */

    struct UserInfo{
        address _address;
        uint256 _number;
        }

    UserInfo userInfo;

    function setTuple(address _add, uint256 _num) public {
        userInfo._address =_add;
        userInfo._number =_num;
    }

    function returnTuple() public view returns(address, uint256) {
        return (userInfo._address, userInfo._number);
    }
}