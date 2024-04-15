"use strict";

class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class Linkedlist {
    constructor() {
        this.head = null
    }

    append(value) {
        const newNode = new Node(value)
        if (this.head === null) {
            this.head = newNode;
        } else {
            let h = this.head
            while (h.next !== null) {
                h = h.next;
            }
            h.next = newNode
        }
    }

    prepend(value) {
        const newNode = new Node(value)
        if (this.head === null) {
            this.head = newNode;
        } else {
            let h = this.head
            newNode.next = h
            this.head = newNode
        }
    }

    size() {
        if (this.head === null) {
            return 0
        } else {
            let h = this.head;
            let i = 1;
            while (h.next !== null) {
                i++;
                h = h.next;
            }
            return i;
        }
    }

    getHead() {
        return this.head
    }
    getTail() {
        if (this.head === null){
            return this.head
        }
        else {
            let h = this.head;
            while (h.next !== null){
                h = h.next
            }
            return h
        }
    }
    atIndex(index){
        if (index === 0){
            return this.head
        }
        let i = 0;
        let h = this.head;
        while(h.next !== null){
            i++;
            h = h.next
            if (i === index){
                return h
            }
        }
        return `No node with this index`
    }
    doPop(){
        if (this.head === null) {
            console.log('list is empty')
        }
        else {
            let h = this.head
            while (h.next.next !== null) {
                h = h.next
            }
            h.next = null;
        }
    }
    contains(value){
        if (this.head === null) {
             return false
        }
        else {
            let h = this.head
            while (h.next !== null) {
                if (h.value === value){
                    return true
                }
                h = h.next
            }
            return false
        }
    }
    findNode(value){
        if (this.head === null){
            return this.head
        }
        if (this.head.value === value){
            return 0;
        }
        let i = 0;
        let h = this.head;
        while(h.next !== null){
            i++;
            h = h.next
            if (h.value === value){
                return i
            }
        }
        return `No node with this value`
    }
    toString() {
        if (this.head === null) {
            console.log('list is empty')
        } else {
            let h = this.head
            let string = ''
            while (h !== null) {
                string += `(${h.value}) -> `
                h = h.next
            }
            console.log(string, 'null')
        }
    }

}

const linkList = new Linkedlist()

linkList.append(50) // added 50
linkList.append(60) // added 60
linkList.prepend(10) // added 10

// console.log(linkList.size()) // size = 3
// console.log(linkList.getHead()) // 10
// console.log(linkList.getTail()) // 60

linkList.doPop() // deletes 60
linkList.append(80) // appends 80

// console.log(linkList.contains(51)) // false
// console.log(linkList.contains(50)) // true

// console.log(linkList.findNode(50)) // 1

linkList.toString()
// console.log(linkList.atIndex(0)) // 10 --> head
