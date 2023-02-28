//SPDX-License-Identifier:MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract MyMappings {
    address private useraddress;
    mapping(address => uint256) private balance;
    mapping(uint256 => uint256)[] array;
    mapping(uint256 => mapping(address => uint256)) public nestedMapping;

    constructor() payable {}

    /*

    function setAddressMapping(address _add, uint _amount) public{
        balance[_add] = _amount;
    }
    */
    //Growic Task Mappings
    function deposit(uint256 _amount) public {
        useraddress = msg.sender;
        balance[useraddress] = balance[useraddress] + _amount;
        console.log("useraddress = ", useraddress);
        console.log("value = ", balance[useraddress]);
    }

    function checkBalance() public returns (uint256) {
        console.log("message.sender = ", useraddress);
        console.log("returning value = ", balance[useraddress]);
        return balance[useraddress];
    }

    // This function allocates some memory for the array to stode future data
    function allocate(uint256 newMaps) public {
        for (uint256 i = 0; i < newMaps; i++) array.push();
    }

    //Constructs the array element with index = map
    function writeMap(
        uint256 map,
        uint256 key,
        uint256 value
    ) public {
        array[map][key] = value;
    }

    //reads the map
    function readMap(uint256 map, uint256 key) public view returns (uint256) {
        return array[map][key];
    }

    //erases the map. It erases the array but the actual values stay there in the memory. If you call the
    //allocate function again and invoke the readmap with some previously set index and key, you will get the value back.
        delete array;
    }
    //receive() external payable {}

    //fallback() external payable {}
}
