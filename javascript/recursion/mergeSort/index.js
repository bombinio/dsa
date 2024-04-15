"use strict";

function mergeArrays(firstHalf, secondHalf) {
    const finalArray = []

    const firstLength = firstHalf.length
    const secondLength = secondHalf.length

    let i = 0;
    let j = 0;

    // console.log('First half ', firstHalf)
    // console.log('Second half ', secondHalf)

    while (i < firstLength && j < secondLength) {
        if (firstHalf[i] < secondHalf[j]) {

            // compare first number of 1st half with 1st number of 2nd half
            // after undestanding which number is bigger ---> pushing to final array
            // after this just moving forward our index + 1

            // console.log('Final array before ', finalArray)
            finalArray.push(firstHalf[i])
            // console.log('final array after ', finalArray)
            i++;
        } else {
            // console.log('Final array before ', finalArray)
            finalArray.push(secondHalf[j])
            // console.log('final array after ', finalArray)
            j++;
        }
    }
    // if pushed all numbers from one of the halfs, and numbers remained in other half
    for (; i < firstLength; i++) {
        finalArray.push(firstHalf[i])
    }
    for (; j < secondLength; j++) {
        finalArray.push(secondHalf[j])
    }

    return finalArray
}

function mergeSort(array){
    if(array.length === 1){
        console.log(array)
        return array
    }

    const middle = Math.floor(array.length / 2);
    const firstHalf = mergeSort(array.slice(0, middle))
    const secondHalf = mergeSort(array.slice(middle, array.length))

    // console.log(firstHalf.length, secondHalf.length)
    console.log('First half ', firstHalf)
    console.log('Second half ', secondHalf)
    console.log('Middle ', middle)

    return mergeArrays(firstHalf, secondHalf)
}

console.log(mergeSort([9,3,7, 5, 6, 4, 8, 2]))