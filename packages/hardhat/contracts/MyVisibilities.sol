//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract ParentContract {
    uint8 public pubData = 10;
    uint8 internal intData = 10;
    uint8 private privData = 10;

    function access() public returns (uint8) {
        pubData += 10; //private access [Can be possible for this is a public variable]
        intData += 5; //private access [Can be possible for this is an internal variable]
        privData += 2; //private access [Can be possible for this is an internal variable]
        console.log("pubData = %d ", pubData);
        console.log("intData = %d ", intData);
        console.log("privData = %d ", privData);
        return pubData;
    }
}

contract CallerContract {
    ParentContract pc = new ParentContract();

    function callerFunction() public view returns (uint8) {
        //return pc.intData(); //external access [not possible because this is an internal variable]
        //return pc.privData(); //external access [not possible because this is a private variable]
        console.log("pubData = %d ", pc.pubData());
        //console.log("intData = %d ", intData);
        return pc.pubData(); //external access [possible because this is a public variable]
    }
}

contract ChildContract is ParentContract {
    function accessParent() public returns (uint8) {
        pubData += 10; //internal access [possible because this is a public variable]
        intData += 5; //internal access [possible because this is an internal variable]
        //privData += 2; //internal access [not possible because this is a private variable]
        console.log("pubData = %d ", pubData);
        console.log("intData = %d ", intData);
        //console.log("privData = %d ", privData);
        return pubData;
    }
}
