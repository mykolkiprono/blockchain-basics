// spdx-License-Identifier: GPL-3.0

pragma solidity >=0.4.16<0.9.0;

contract SimpleStorage{
    uint storeData;
    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns(uint){
        return storeData;
    }
}