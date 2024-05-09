const levelOrder = function(root) {
    let q = [root]
    let output = []
    console.log(root)
    while (q.length > 0){
        let currentRange = q.length;
        let currLevel = []
        for (let i = 0; i < currentRange; i++) {
            let currNode = q.shift()
            if (currNode !== null) {
                if (currNode.left !== null) {
                    q.push(currNode.left)
                } else if (currNode.right !== null) {
                    q.push(currNode.right)
                }
                currLevel.push(currNode.val)
            }
        }
        output.push(currLevel)
    }
    return output;
}

console.log(levelOrder([3,9,20,null,null,15,7]))