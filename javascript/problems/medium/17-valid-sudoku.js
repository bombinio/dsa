// Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
//
//     Each row must contain the digits 1-9 without repetition.
//     Each column must contain the digits 1-9 without repetition.
//     Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
//
// Note:
//
//     A Sudoku board (partially filled) could be valid but is not necessarily solvable.
//     Only the filled cells need to be validated according to the mentioned rules.

// Algos
// 1) for each row and column create hashsets to track duplicates, it we met duplicates return false
// 2) Create subBoxes hashmap for each 3x3 boxes
// SubBoxes will have keys like [0,1] [0,2] [0,0] [2,2] etc... it represents each 3x3 box!
// 3) SubBox accepts array as key, and hashset as value, it helps track every number in 3x3 box
// 4) By dividing indexes 'i' and 'j' by 3 we can find to which box we should put current number
// If current number already exists in this subbox we return false

// Key point: create sets for each row, column. Create subBoxes hashmap, key is serial number of box
// Divide 'i' and 'j' by 3 to find in which box to put current number

const isValidSudoku = function(board) {
    for (let i = 0; i < board.length; i++) {
        let rows = new Set();
        let columns = new Set();
        for (let j = 0; j < board.length; j++) {
            if (board[i][j] !== '.') {
                if (rows.has(board[i][j])) {
                    return false;
                } else rows.add(board[i][j])
            }
            if (board[j][i] !== '.') {
                if (columns.has(board[j][i])) {
                    return false;
                } else columns.add(board[j][i])
            }
        }
    }
    let subBoxes = {}
    for (let i = 0; i < board.length; i++) {
        for (let j = 0; j < board.length; j++) {
            if(board[i][j] !== '.') {
                let currI = Math.floor(i / 3)
                let currJ = Math.floor(j / 3)
                if (!([currI, currJ] in subBoxes)) {
                    subBoxes[[currI, currJ]] = new Set(board[i][j])
                } else if (subBoxes[[currI, currJ]].has(board[i][j])) {
                    console.log(subBoxes)
                    return false;
                } else subBoxes[[currI, currJ]].add(board[i][j])
            }
        }
    }

    return true;
}

console.log(isValidSudoku([["5","3","4",".","7",".",".",".","."]
                                ,["6",".",".","1","9","5",".",".","."]
                                ,[".","9","8",".",".",".",".","6","."]
                                ,["8",".",".",".","6",".",".",".","3"]
                                ,["4",".",".","8",".","3",".",".","1"]
                                ,["7",".",".",".","2",".",".",".","6"]
                                ,[".","6",".",".",".",".","2","8","."]
                                ,[".",".",".","4","1","9",".",".","5"]
                                ,["3",".",".",".","8",".",".","7","9"]]))