"use strict";

function merge(leftHalf, rightHalf){
    const finalArray = []
    const lengthLeft = leftHalf.length
    const lengthRight = rightHalf.length
    let i = 0;
    let j = 0;
    while (i < lengthLeft && j < lengthRight){
        if (leftHalf[i] < rightHalf[j]){
            finalArray.push(leftHalf[i])
            i++;
        }
        else {
            finalArray.push(rightHalf[j])
            j++;
        }
    }
    for( ; i < lengthLeft; i++){
        finalArray.push(leftHalf[i])
    }
    for( ; j < lengthRight; j++){
        finalArray.push(rightHalf[j])
    }
    return finalArray
}

export function mergeSort(array){
    array = removeDubpicalites(array)
    if (array.length === 1){
        return array
    }
    const mid = Math.floor((0 + array.length) / 2)

    const leftHalf = mergeSort(array.slice(0, mid))
    const rightHalf = mergeSort(array.slice(mid, array.length))

    return merge(leftHalf, rightHalf)

}

function removeDubpicalites(array){
    const arr = []
    for (let i = 0; i < array.length; i++) {
        if (!arr.includes(array[i])){
            arr.push(array[i])
        }
    }
    return arr
}

export default mergeSort