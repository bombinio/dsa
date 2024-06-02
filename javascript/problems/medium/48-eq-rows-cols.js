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

// Algos
// 1) Make hashmap for columns in rows
// 2) iterate through array and columns and rows to hashmaps
// 3) Then iterate through keys in rows hashmap and check if this key exists in columns hashmap, if yes
// then we increase our output variable by product of rows[row] and columns[row], product and not sum, because
// for example array [[13,13,13],[13,13,13],[13,13,13]] each row has 3 the same columns so 3+3+3 or just 3*3

// Key point: Save rows and columns in hashmaps then check if row exists in columns hashmap(same values) and if yes,
// increase output by their product

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
            output += (rows[row] * columns[row])
        }

    }
    return output;
}

console.log(equalPairs([[3, 2, 1], [1, 7, 6], [2, 7, 7]]))
console.log(equalPairs([[3, 1, 2, 2], [1, 4, 4, 5], [2, 4, 2, 2], [2, 4, 2, 2]]))
console.log(equalPairs([[13, 13], [13, 13]]))
console.log(equalPairs([[13, 13, 13], [13, 13, 13], [13, 13, 13]]))