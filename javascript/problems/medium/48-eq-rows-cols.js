// Given a 0-indexed n x n integer matrix grid, return the number of pairs (ri, cj) such that row ri and column cj are equal.
//
// A row and column pair is considered equal if they contain the same elements in the same order (i.e., an equal array).
//
//
//
// Example 1:
//
// Input: grid = [[3,2,1],[1,7,6],[2,7,7]]
// Output: 1
// Explanation: There is 1 equal row and column pair:
// - (Row 2, Column 1): [2,7,7]

// TODO

const equalPairs = function (grid) {
    const rows = {};
    const columns = {};
    let output = 0;
    for (let i = 0; i < grid.length; i++) {
        rows[grid[i]] = (grid[i] in rows) ? rows[grid[i]] + 1 : 1
        const column = []
        for (let j = 0; j < grid.length; j++) {
            column.push(grid[j][i])
        }
        columns[column] = (column in columns) ? columns[column] + 1 : 1
    }
    for (const row in rows) {
        if (row in columns) {
            if (rows[row] > 1 && columns[row] > 1) {
                output += (rows[row] * columns[row])
            } else {
                output += Math.max(rows[row], columns[row])
            }
        }

    }
    return output;
}

console.log(equalPairs([[3,2,1], [1,7,6], [2,7,7]]))
console.log(equalPairs([[3, 1, 2, 2], [1, 4, 4, 5], [2, 4, 2, 2], [2, 4, 2, 2]]))
console.log(equalPairs([ [13, 13], [13,13] ]))
console.log(equalPairs([ [13,13, 13], [13,13,13], [13,13,13] ]))