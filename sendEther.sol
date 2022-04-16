// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {

        mapping(address => uint) balances;
        function invest() external payable{
            if(msg.value < 1000){
                revert();
            }

            balances[msg.sender] += msg.value;

        }

        function balanceOf() external view returns(uint){
            return address(this).balance;
        }

}