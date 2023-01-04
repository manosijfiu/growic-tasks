//SPDX-License-Identifier:MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract MyPrimitives {
    //uint16 public uint8Data = 255; //8 bytes
    //Status of an NFT - Owned, Sold, Bought
    enum Status {
        OFF,
        ON
    }
    bytes3 public bytes3Data = "abc"; //3 bytes, each byte can hold two hexadecimal digits max value = ff
    bytes2 public bytes2Data = "ab"; //2 bytes
    string public stringData = "abc"; //string is used for large strings and escape characters

    bytes bytesData = "Growic Solidity"; //state variable, storage type
    string stringsData = "Growic Solidity"; //state variable, storage type
    address sender;

    constructor() payable {
        // what should we do on deploy?
    }

    function dataTypes() public {
        /*
        We do not have to have an explicit get function, as solidity implicitly provides the same.
        */
        uint8 uint8Data = 255; //local variables
        uint256 timestamp = block.timestamp; //The timestamp of the block in UNIX epoch, can be used to validate a transaction's age
        int256 intData = -465; //We should not use int unless we know definitely that there is a possibility of teh variable to be negative.
        console.logString("bytesData = ");
        console.logBytes(bytesData);
        console.logString("bytesData = ");
        console.logString(stringsData);
        console.logString("bytes3Data = ");
        console.logBytes3(bytes3Data);
        console.logString("bytes2Data = ");
        console.logBytes2(bytes2Data);
        console.logString("stringData = ");
        console.logString(stringData);
        console.logString("uint8Data = ");
        console.logUint(uint8Data);

        console.logString("timestamp = ");
        console.logUint(timestamp);

        console.logString("intData = ");
        console.logInt(intData);

        //Conversions
        bytes2 byte2ConvertedData = bytes2(bytes3Data);
        console.logString("byte2ConvertedData = ");
        console.logBytes2(byte2ConvertedData);
        bytes3 byte3convertedData = bytes3(bytes2Data);
        console.logString("byte3convertedData = ");
        console.logBytes3(byte3convertedData);
        sender = msg.sender; // Address type - to get the caller wallet's transactions
        bytes20 bytes20convertedAddress = bytes20(sender);
        console.logString("bytes20convertedAddress = ");
        console.logBytes20(bytes20convertedAddress);
        bytes memory bytes3fromStringConvertedData = bytes(stringsData); //Arrays, structs or mapping shoud be declared its memory location types
        console.logString("bytes3fromStringConvertedData = ");
        console.logBytes(bytes3fromStringConvertedData);
        bytes1 bytesFromUintConvertedData = bytes1(uint8Data);
        console.logString("bytesFromUintConvertedData = ");
        console.logBytes1(bytesFromUintConvertedData);
    }

    function maxValues() public view {
        int256 maxInt = type(int256).max;
        uint256 maxUint = type(uint256).max;
        /*
        Does not work other than int types
        */
        //bytes2 maxBytes2 = type(bytes2).max;
        //address maxAddress = type(address).max;
        //bytes3 maxBytes3 = type(bytes3).max;

        console.logString("maxInt = ");
        console.logInt(maxInt);
        console.logString("maxUint = ");
        console.logUint(maxUint);
        //console.log("maxBytes2 = %b", maxBytes2);
        //console.log("maxAddress = %a", maxAddress);
        //console.log("maxBytes3 = %b", maxBytes3);
    }

    /*
    Look at the gas difference for both of the functions below for using string and bytes
    This is the most useful usecase for bytesN. if we do not have any escape
    Character to deal with and the size of the expected string is limites, we can use bytesN
    to lower the gas cost of a smart contract function.
    */
    function getDataInString() public returns (string memory) {
        string memory stringsDataLocal = "This is our second class";
        return stringsDataLocal;
    }

    function getDataInBytes() public returns (bytes32) {
        bytes32 bytes32DataLocal = "This is our second class";
        return bytes32DataLocal;
    }
}

contract CallerPrimitives {
    function callGetDataInString() public returns (string memory) {
        string memory stringReturnData;
        MyPrimitives mp = new MyPrimitives();
        stringReturnData = mp.getDataInString();
        return stringReturnData;
    }

    function callGetDataInBytes() public returns (bytes32) {
        bytes32 bytes32ReturnData;
        MyPrimitives mp = new MyPrimitives();
        bytes32ReturnData = mp.getDataInBytes();
        return bytes32ReturnData;
    }
}
