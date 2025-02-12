// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */
    uint256[][] public arr;
    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // your code here
        // [1  , 0  , 1]
        // [0  , 1  , 0]
        // [1  , 0  , x]
// winning combinations [i][0]==[i][1] & [i][0]==[i][2]
//                      [0][i]==[1][i] & [0][i]==[2][i]
//                      [0][0]==[1][1] & [0][0]==[2][2]
//                      [0][2]==[1][1] & [0][2]==[2][0]
        if(board[0][0]==board[1][1] && board[0][0]==board[2][2])
        return true;
        if(board[0][2]==board[1][1] && board[0][2]==board[2][0])
        return true;

        for(uint256 i=0;i<board.length;i++){

            if(board[i][0]==board[i][1] && board[i][0]==board[i][2])
            return true;
            
            if(board[0][i]==board[1][i] && board[0][i]==board[2][i])
            return true;
        }

        return false;
    }
}