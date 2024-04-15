"use strict";

class hashMap {
    constructor(size) {
        this.bucket = [];
        this.size = size;
    }

    hash(key) {
        let hashCode = 0;

        const primeNumber = 31;
        for (let i = 0; i < key.length; i++) {
            hashCode = (primeNumber * hashCode + key.charCodeAt(i)) % this.size
        }

        return hashCode
    }

    growBuckets(){
        let counter = 0;
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                counter++;
                let head = this.bucket[i]
            }
        }
        return Math.floor((counter / this.size) * 100) / 100;
    }

    set(key, value) {
        const hashCode = this.hash(key)
        let head = this.bucket[hashCode]
        const node = {
            [key]: value,
            next: null,
        }
        if (head !== undefined) {
            const headKey = Object.keys(head)[0];

            if (headKey === key) {
                return head[headKey] = value;
            }

            while (head.next !== null) {
                const nodeKey = Object.keys(head)[0];

                if (nodeKey === key) {
                    return head[headKey] = value;
                }

                head = head.next;
            }

            const nextHeadKey = Object.keys(head)[0];

            if (nextHeadKey === key) {
                return head[headKey] = value;
            }

            head.next = node
            return;
        }
        this.bucket[hashCode] = node
        const loadFactor = this.growBuckets()
        if (loadFactor >= 0.75){
            this.size = this.size * 2;
        }
    }

    get(key) {
        const hashCode = this.hash(key)
        let head = this.bucket[hashCode];
        if (head === undefined){
            return null
        }

        const headKey = Object.keys(head)[0];
        if (headKey === key) return head[headKey]

        while (head.next !== null) {
            head = head.next
            const nodeKey = Object.keys(head)[0]

            if (nodeKey === key) {
                return head[nodeKey]
            }
        }
    }

    has(key){
        const hashCode = this.hash(key)
        let head = this.bucket[hashCode];

        if (head !== undefined) {
            const headKey = Object.keys(head)[0];
            if (headKey === key) return true

            while (head.next !== null) {
                head = head.next
                const nodeKey = Object.keys(head)[0]

                if (nodeKey === key) {
                    return true
                }
            }
        }
        return false
    }

    remove(key){
        const hashCode = this.hash(key)
        let head = this.bucket[hashCode];

        const headKey = Object.keys(head)[0];
        if (headKey === key) delete this.bucket[hashCode];

        while (head.next !== null) {
            const tmpHead = head;
            head = head.next
            const nodeKey = Object.keys(head)[0]

            if (nodeKey === key) {
                tmpHead.next = head.next
            }
        }
    }

    length(){
        let counter = 0;
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                counter++;
                let head = this.bucket[i]
                while (head.next !== null){
                    counter++
                    head = head.next;
                }
            }
        }
        return counter

    }

    clear(){
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                delete this.bucket[i]
            }
        }
    }

    keys(){
        const arr = []
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                arr.push(Object.keys(this.bucket[i])[0])
                let head = this.bucket[i];
                while (head.next !== null){
                    head = head.next;
                    arr.push(Object.keys(head)[0])
                }
            }
        }
        return arr
    }

    values(){
        const arr = []
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                arr.push(Object.values(this.bucket[i])[0])
                let head = this.bucket[i];
                while (head.next !== null){
                    head = head.next;
                    arr.push(Object.values(head)[0])
                }
            }
        }
        return arr
    }

    entries(){
        const arr = []
        for (let i = 0; i < this.bucket.length; i++) {
            if (this.bucket[i] !== undefined){
                arr.push([Object.values(this.bucket[i])[0], Object.keys(this.bucket[i])[0]])
                let head = this.bucket[i];
                while (head.next !== null){
                    head = head.next;
                    arr.push([Object.values(this.bucket[i])[0], Object.keys(this.bucket[i])[0]])
                }
            }
        }
        return arr
    }

    logBucket() {
        for (let i = 0; i < this.bucket.length; i++) {
            console.log(this.bucket[i])
        }
    }
}



const hashM = new hashMap(3)


// set, hash, get
hashM.set('0', 'someValue0')
hashM.set('1', 'someValue1')
hashM.set('2', 'someValue2')

console.log(hashM.get('2')) // someValue2

// set
hashM.set('2', 'someOverride') // overrides old value

// has
console.log(hashM.has('2')) // true
console.log(hashM.has('6')) // false

// remove
hashM.set('22', 'testValue')
hashM.set('202', 'testValue')
hashM.remove('22') // removes 22 from chain and 202 subchain of 22

// length
console.log(hashM.length()) // 3

// clear
// hashM.clear() // clear hashmap

// keys
console.log(hashM.keys()) // logs all keys

// values
console.log(hashM.values()) // logs all values

// entries
console.log(hashM.entries()) // logs key:value pair

hashM.logBucket()

// console.log(hashM.growBuckets())