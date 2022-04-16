// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test {
    address  public owner = msg.sender;
    // uint public creationtime = now;
    uint public creationTime = block.timestamp;

    modifier onlyBy(address _account){
        require(
            msg.sender == _account,
            "sender not authorized"
        );
        _;
    }

    function changeOwner(address newOwner) public onlyBy(owner){
            owner = newOwner;
    }

    modifier onlyAfter(uint _time){
        require (
        block.timestamp >= _time,
        "function called earlier"
        );
        _;

    }

    function disown(address _owner) public onlyBy(owner) onlyAfter(creationTime+ 6 weeks) {
        delete owner;
    }

    modifier costs(uint _amount){
        require(
        msg.value>=_amount,
        "not enough ether"
        );
        _;

        if (msg.value > _amount)
         payable(msg.sender).transfer(msg.value - _amount);
    }

    function forceOwnerChange(address _owner) public payable costs(200 ether){
        owner = _owner;
        if (uint(owner) & 0 == 1) return; 
    }


}