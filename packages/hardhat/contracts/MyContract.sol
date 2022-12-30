pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract MyContract is Ownable {
    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

    //event SetPurpose(address sender, string purpose);
    //Class 1 - add
    //address public owner = 0x2cf7d618b97CEC7C996BAbfB2319fD2A717a9eD7;
    string public purpose = "Building Unstoppable Apps!!!";

    constructor() payable {
        // what should we do on deploy?
    }

    function setPurpose(string memory _newPurpose) public payable {
        //Class 1 - add
        //require(msg.sender == owner, "You are not the owner");
        require(msg.value >= 0.0001 ether, "Need more money");
        purpose = _newPurpose;
        console.log(msg.sender, "set purpose to", purpose);
        //emit SetPurpose(msg.sender, purpose);
    }

    //Class - 1
    function withdraw() public onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
