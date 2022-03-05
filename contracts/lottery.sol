pragma solidity ^0.4.17;

contract Lottery{
    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender; 
    }

    function enter() public payable {
        require(msg.value > .01 ether);

        players.push(msg.sender);
    }
}


 //manager = msg.sender; //ensures that when we create this contract we get the senders address assigned to it
 //msg.value is in wei so we need to convert our expectation to the expected eth in wei quantity