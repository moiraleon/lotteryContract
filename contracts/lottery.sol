pragma solidity ^0.4.17;

contract Lottery{
    address public manager;

    function Lottery() public {
        manager = msg.sender; 
    }
}


 //manager = msg.sender; //ensures that when we create this contract we get the senders address assigned to it