//SPDX-License-Identifier:MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract MyMappings {
    address private useraddress;
    mapping(address => uint256) private balance;

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
        console.log("message.sender = ", useraddress);
        console.log("returning value = ", balance[useraddress]);
        return balance[useraddress];
    }

    //receive() external payable {}

    //fallback() external payable {}
}
