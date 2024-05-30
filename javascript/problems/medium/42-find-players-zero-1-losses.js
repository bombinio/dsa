// You are given an integer array matches where matches[i] = [winneri, loseri] indicates that the player winneri defeated player loseri in a match.
//
// Return a list answer of size 2 where:
//
//     answer[0] is a list of all players that have not lost any matches.
//     answer[1] is a list of all players that have lost exactly one match.
//
// The values in the two lists should be returned in increasing order.
//
// Note:
//
//     You should only consider the players that have played at least one match.
//     The testcases will be generated such that no two matches will have the same outcome.
//
//
//
// Example 1:
//
// Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
// Output: [[1,2,10],[4,5,7,8]]
// Explanation:
// Players 1, 2, and 10 have not lost any matches.
// Players 4, 5, 7, and 8 each have lost one match.
// Players 3, 6, and 9 each have lost two matches.
// Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].

// Algos
// 1) track wins and losses of each players in hashmap
// 2) If player won, increment wins, otherwise increment losses
// 3) Iterate through hashmap and push to output arrays players with 0 and 1 losses
// 4) sort output arrays

// Key points: Use hashmap to track every player wins and losses

const findWinners = function(matches) {
    const players = new Map();
    const output = [[], []]
    for (let i = 0; i < matches.length; i++) {
        for (let j = 0; j < matches[i].length; j++) {
            const currPlayer = matches[i][j]
            if (j === 0) {
                if (players.has(currPlayer)) {
                    const player = players.get(currPlayer)
                    player.wins++;
                } else {
                    players.set(currPlayer, {wins: 1, losses: 0})
                }
            } else {
                if (players.has(currPlayer)) {
                    const player = players.get(currPlayer)
                    player.losses++;
                } else {
                    players.set(currPlayer, {wins: 0, losses: 1})
                }
            }
        }
    }
    for (const [player, score] of players) {
        if (score.losses === 0) {
            output[0].push(player)
        } else if (score.losses === 1) {
            output[1].push(player)
        }
    }
    output[0].sort((a,b) => a - b)
    output[1].sort((a,b) => a - b)
    return output
}

console.log(findWinners([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]))