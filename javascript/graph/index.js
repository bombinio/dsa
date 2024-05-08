"use strict";

const graph = {}

function validMoves(coords){
    const [x, y] = coords
    const validMovesArray = []

    if (x + 2 <= 7){
        if (y + 1 <= 7){
            validMovesArray.push([x+2, y+1])
        }
        if (y - 1 >=0){
            validMovesArray.push([x+2, y-1])
        }
    }
    if (x - 2 >= 0){
        if (y + 1 <= 7){
            validMovesArray.push([x-2, y+1])
        }
        if (y - 1 >=0){
            validMovesArray.push([x-2, y-1])
        }
    }
    if (x + 1 <= 7){
        if (y + 2 <= 7){
            validMovesArray.push([x+1, y+2])
        }
        if (y - 2 >=0){
            validMovesArray.push([x+1, y-2])
        }
    }
    if (x - 1 >= 0){
        if (y + 2 <= 7){
            validMovesArray.push([x-1, y+2])
        }
        if (y - 2 >=0){
            validMovesArray.push([x-1, y-2])
        }
    }
    return validMovesArray
}


function checkVisited(coords, visitedArr){
    let wasVisited = false
    for (let i = 0; i < visitedArr.length; i++) {
        if (coords === visitedArr[i]){
            wasVisited = true
            break
        }
    }
    return wasVisited
}
function knightMoves(curr, target){

    if (curr[0] === target[0] && curr[1] === target[1]){
        console.log('You found path in 0 moves!')
        return
    }

    graph[curr] = [curr, 0]
    const q = []
    const visited = []

    q.push(curr)

    while (q.length > 0){

        const currNode = q.shift()
        if (!checkVisited(currNode, visited)){
            visited.push(currNode)
            const availableMoves = validMoves(currNode)
            for (let i = 0; i < availableMoves.length; i++) {
                q.push(availableMoves[i])
                const historyOfMoves = graph[currNode][0].concat(` ${availableMoves[i]}`)
                const historyOfMovesDistance = [historyOfMoves, graph[currNode]]
                historyOfMovesDistance[1] = graph[currNode][1] + 1;
                graph[availableMoves[i]] = historyOfMovesDistance
            }
            if (currNode[0] === target[0] && currNode[1] === target[1]){
                console.log(`From ${curr} to ${target}`)
                console.log(`You found path in ${graph[currNode][1]} moves!` )
                console.log(`Here is the moves you should do ${graph[currNode][0]}`)
                return
            }
        }
    }
}

knightMoves([0,0], [7,7])