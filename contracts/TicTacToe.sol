pragma solidity ^0.4.24;

contract TicTacToe{
    address player1;
    address player2;
    uint[] board = new uint[](9);
    uint participating_amount;
    uint playerCount = 0;
    bool game_finish = false;
    uint chance = 0;
    address winner;
    uint[][] winner_check =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    mapping (address => uint) player_chance;
    constructor () public payable{
        require(msg.value > 0, "A participating bid is required");
        player1 = msg.sender;
        participating_amount = msg.value;
        playerCount = 1;
        player_chance[msg.sender] = 0;
    }

    function register_second_player() public payable{
        require(playerCount == 1, "Player limit exceeded");
        require(msg.value == participating_amount, "Participating bid required");
        require(msg.sender != player1, "Same players not allowed");
        player_chance[msg.sender] = 1;
        player2 = msg.sender;
        playerCount = 2;
    }

    function makeMove(uint pos) public{
        require(playerCount == 2, "Players not registered yet");
        require(msg.sender == player1 || msg.sender == player2, "Not a participant");
        require(game_finish == false, "Game is finished");
        require(board[pos] == 0, "Position is filled");
        require(pos >= 0 && pos <= 8, "Invalid position");
        require(player_chance[msg.sender] == chance, "Not your chance");
        if(msg.sender == player1)   board[pos] = 1;
        else    board[pos] = 2;
        chance = 1 - chance;
        check_winner(msg.sender);
    }

    function check_winner(address player) private{
        uint c;
        if(player == player1)   c = 1;
        else    c = 2;

        for(uint i=0;i<8;i++){
            if(board[winner_check[i][0]] == board[winner_check[i][1]] && board[winner_check[i][1]] == board[winner_check[i][2]] && board[winner_check[i][0]] == c){
                game_finish = true;
                winner = player;
                break;
            }
        }
    }

    // function board_status() public{

    // }
}
