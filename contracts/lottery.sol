pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);

        players.push(msg.sender);
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        uint256 index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns(address[]) {
        return players
    }

}

//manager = msg.sender; //ensures that when we create this contract we get the senders address assigned to it
//msg.value is in wei so we need to convert our expectation to the expected eth in wei quantity
//sha3 is global and is able to be called without imports, also may see keccak256() - keccak is a class of algorithms while sha3 is an instance of it
//random funcitont akes the hash of each of those variable and converts it to a number - not perfectly random - can be manipulated - change random function to public for testing
// modifyer solved DRY and runs the require statement before a funciton injecting the rest of the function at the _
