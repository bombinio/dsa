// Given head, the head of a linked list, determine if the linked list has a cycle in it.
//
// There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
//
// Return true if there is a cycle in the linked list. Otherwise, return false.

// Algos
// 1) Mark node as visited, if we react node that is visited = true we are in cycle

// Key point: Mark node as visited, if we react node that is visited = true we are in cycle


const hasCycle = function(head) {
    if (head === null) {
        return false
    }
    head.visited = true
    while(head.next) {
        head = head.next
        if(head.visited) {
            return true
        }
        head.visited = true
    }
    return false;
};