"use strict";

// function fibs(n) {
//     let output = []
//     let a = 0, b = 1, c = a + b;
//     output.push(a,b,c)
//     for (let i = 3; i < n; i++) {
//         a = b
//         b = c
//         c = a + b;
//         output.push(c)
//     }
//     return output
// }
//
// console.log(fibs(8))

function fibsRec(n) {
    if (n === 0){
        return [];
    } else if (n === 1) {
        return [0];
    } else if (n === 2) {
        return [0,1];
    } else {
        return fibsRec(n-1).concat(+fibsRec(n-1).slice(-1) + +fibsRec(n-2).slice(-1))
    }
}

const arr = fibsRec(8)
console.log(arr)