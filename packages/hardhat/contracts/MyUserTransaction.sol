//SPDX-License-Identifier:MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

struct UserDetails {
    string name;
    uint256 age;
}

contract MyUserTransaction {
    address private useraddress;
    mapping(address => uint256) private balance;
    mapping(address => UserDetails) private userDetails;

    constructor() payable {}

    /*

    function setAddressMapping(address _add, uint _amount) public{
        balance[_add] = _amount;
    }
    */
    //Growic Task Mapping
    function deposit(uint256 _amount) public {
        useraddress = msg.sender;
        balance[useraddress] = balance[useraddress] + _amount;
        console.log("useraddress = ", useraddress);
        console.log("value = ", balance[useraddress]);
    }

    function checkBalance() public view returns (uint256) {
        console.log("msg.sender = ", useraddress);
        console.log("returning value = ", balance[useraddress]);
        return balance[useraddress];
    }

    function setUserDetails(string calldata _name, uint256 _age) external {
        useraddress = msg.sender;
        UserDetails memory _userDetails;
        _userDetails.name = _name;
        _userDetails.age = _age;
        userDetails[useraddress] = _userDetails;
    }

    function getUserDetails() public view returns (UserDetails memory) {
        console.log("message.sender = ", useraddress);
        return userDetails[useraddress];
    }
}
