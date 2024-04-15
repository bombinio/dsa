function sumRange(n) {
    if (n === 1) return 1
    return n + sumRange(n - 1)
}

// console.log(sumRange(5)) // 15

function power(num, pow) {
    if (pow === 0) return 1
    if (pow === 1) return num
    return num * power(num, pow - 1)
}

// console.log(power(2, 5)) // 32

function fact(n) {
    if (n === 1) return 1
    return n * fact(n - 1)
}

// console.log(fact(5)) // 120


function allLessSeven(arr, n = 0, callback) {
    if (n === arr.length - 1 && callback(arr[n])){
        return true
    }
    else if (!callback(arr[n])) {
        return false
    }
    else {
        return allLessSeven(arr, n+1, callback)
    }
}

// console.log(allLessSeven([21, 2, 5, 5, 2], 0, function (num){
//     return num < 7
// }))

function productOfArray(arr) {
    if (arr.length === 0) return 1
    const num = arr.pop()
    return num * productOfArray(arr)
}

// console.log(productOfArray([1, 2, 3, 5])) // 30

const nestedObject = {
    a: {
        foo: "bar",
    },
    b: null,
    c: {
        needle: 42
    }
}

function contains(obj, searchValue) {
    if (typeof obj !== 'object' || obj === null){
        return obj === searchValue
    }
    for(let value of Object.values(obj)){
        if (contains(value, searchValue)){
            return true;
        }
    }
    return false
}

// let hasIt = contains(nestedObject, 42); // true
// let hasNotIt = contains(nestedObject, 43); // false
// console.log(hasIt, hasNotIt)


function mergeArray(arr, output = []){
    if (arr.length === 0){
        return 0;
    }
    for (let value of arr){
        if (typeof value === 'number'){
            output.push(value)
        }
        if (Array.isArray(value)){
            mergeArray(value, output)
        }
    }
    return output.length
}

// const arr = mergeArray([5, 3, 2, 0, 2, ['foo'], [], 46, 5, 6])
// console.log(arr)

function sumSquares(arr){
    if (arr.length === 0){
        return 0;
    }
    let total = 0
    for (let value of arr){
        if (Array.isArray(value)){
            total += sumSquares(value)
        }
        else
            total += value ** 2
        }
    return total
}

// console.log(sumSquares([10,[[10],10],[10]])) // 400

function replicate(times, n){
    if (times <= 0){
        return []
    }
    if (times === 1) return [n]

    return [n].concat(replicate(times-1, n))
}

// console.log(replicate(3, 55)) // [5, 5, 5]