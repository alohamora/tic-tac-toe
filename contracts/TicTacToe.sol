pragma solidity ^0.4.24;

contract TicTacToe{
    address player1;
    address player2;
    bytes32[] board;
    uint participating_amount;
    uint playerCount = 0;

    constructor () public payable{
        require(msg.value > 0, "A participating bid is required");
        player1 = msg.sender;
        playerCount = 1;
    }

    function register_second_player() public payable{
        require(playerCount == 1, "Player limit exceeded");
        require(msg.value == participating_amount, "Participating bid required");
        require(msg.sender != player1, "Same players not allowed");
        playerCount = 2;
    }
}
