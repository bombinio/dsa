# Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

# Input: root = [3,9,20,null,null,15,7]
# Output: [[3],[9,20],[15,7]]



# def removeDuplicates(array):
#     output = []
#     for i in array:
#         if i not in output:
#             output.append(i)
#     return output
#
#
# def mergeHalves(leftHalf, rightHalf):
#     finalArray = []
#     leftLen = len(leftHalf)
#     rightLen = len(rightHalf)
#     i = 0
#     j = 0
#     while i < leftLen and j < rightLen:
#         if leftHalf[i] < rightHalf[j]:
#             finalArray.append(leftHalf[i])
#             i += 1
#         else:
#             finalArray.append(rightHalf[j])
#             j += 1
#
#     if i < leftLen:
#         leftRemainNums = leftHalf[i:leftLen]
#         for i in leftRemainNums:
#             finalArray.append(i)
#     if j < rightLen:
#         rightRemainNums = rightHalf[j:rightLen]
#         for i in rightRemainNums:
#             finalArray.append(i)
#     return finalArray
#
#
# def mergeSort(array):
#     array = removeDuplicates(array)
#     if len(array) == 1:
#         return array
#     mid = int((0 + len(array)) / 2)
#
#     leftHalf = mergeSort(array[0:mid])
#     rightHalf = mergeSort(array[mid:len(array)])
#
#     return mergeHalves(leftHalf, rightHalf)


# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right


# Algorithm Iterative method with using queue:
# 1) if root is null -> return empty array
# 2) If root is not null -> add root to queue
# 3) Create level array that represents every level in binary tree
# 4) Save current length of queue in qRange, qRange's value is from 1 to 2
# 5) go through queue in range of qRange
# 6) pop first element of queue and checks if its not null and then add to level array and then
# checks his left and right nodes and also add to queue
# 7) repeat process until len(q) != 0
# The main logic is to save current state of queue or current length of queue
# in qRange variable, so even when we add new nodes in queue, we still go only through 1 level

class Solution(object):
    def levelOrder(self, root):
        output = []

        if root is None:
            return output

        q = []
        q.append(root)

        while len(q) > 0:
            level = []
            qRange = len(q)
            for i in range(qRange):
                node = q.pop(0)
                if node is not None:
                    level.append(node.val)
                    if node.left is not None:
                        q.append(node.left)
                    if node.right is not None:
                        q.append(node.right)
            output.append(level)

        return output


# print(mergeSort([5, 4, 2, 6, 8, 9, 1, 2]))
