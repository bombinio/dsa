# Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
#
#     Each row must contain the digits 1-9 without repetition.
#     Each column must contain the digits 1-9 without repetition.
#     Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
#
# Note:
#
#     A Sudoku board (partially filled) could be valid but is not necessarily solvable.
#     Only the filled cells need to be validated according to the mentioned rules.
#
#
#
# Example 1:
#
# Input: board =
# [["5","3",".",".","7",".",".",".","."]
# ,["6",".",".","1","9","5",".",".","."]
# ,[".","9","8",".",".",".",".","6","."]
# ,["8",".",".",".","6",".",".",".","3"]
# ,["4",".",".","8",".","3",".",".","1"]
# ,["7",".",".",".","2",".",".",".","6"]
# ,[".","6",".",".",".",".","2","8","."]
# ,[".",".",".","4","1","9",".",".","5"]
# ,[".",".",".",".","8",".",".","7","9"]]
# Output: true


# Algorithm
# Firstly we will check rows and columns, we have amazing data structure as hashset, so we can just create for each row
# and for each column its hashset and check does it have duplicates or no, but how to check 3x3 boxes?
# we have 2D array with indexes in range [0...8] and to get every 3x3 box from this array, we need some math
# diving 'i' and 'j' indexes by 3, we can get all 9 3x3 boxes, for example square [0,0] will be [0,0]; square [8,8] will
# be [2,2]; [2,2] is [0,0] so we get => square [0,0] [1,1] [2,2] will be in box[0,0] that's how we can get every range
# in 9x9 array. Now we just need cool combo of hashmap + hashset! for each 3x3 box we will create hashset and it will
# be value of hashmap's key, and our key will [0,0] for first 3x3 box; it will be something like this --->
# hashmap {[0,0]} = set of 9 numbers of first box 3x3. hashmap saves only hashable values as key, so we use tuple as key

class Solution(object):
    def isValidSudoku(self, board):
        prevMap = {}
        # check rows
        for i in range(len(board)):
            row_set = set()
            for j in range(len(board)):
                if board[i][j].isdigit():
                    if board[i][j] in row_set:
                        return False
                    else:
                        row_set.add(board[i][j])

        for i in range(len(board)):
            column_set = set()
            for j in range(len(board)):
                if board[j][i].isdigit():
                    if board[j][i] in column_set:
                        return False
                    else:
                        column_set.add(board[j][i])

        for i in range(len(board)):
            for j in range(len(board)):
                if board[i][j].isdigit():
                    if tuple([i // 3, j // 3]) not in prevMap:
                        prevMap[(i // 3, j // 3)] = set(board[i][j])
                    elif board[i][j] in prevMap[tuple([i // 3, j // 3])]:
                        return False
                    else:
                        prevMap[(i//3, j//3)].add(board[i][j])

        return True


sol = Solution()
print(sol.isValidSudoku([["5", "3", ".", ".", "7", ".", ".", ".", "."]
                            , ["6", ".", ".", "1", "9", "5", ".", ".", "."]
                            , [".", "9", "8", ".", ".", ".", ".", "6", "."]
                            , ["8", ".", ".", ".", "6", ".", ".", ".", "3"]
                            , ["4", ".", ".", "8", ".", "3", ".", ".", "1"]
                            , ["7", ".", ".", ".", "2", ".", ".", ".", "6"]
                            , [".", "6", ".", ".", ".", ".", "2", "8", "."]
                            , [".", ".", ".", "4", "1", "9", ".", ".", "5"]
                            , [".", ".", ".", ".", "8", ".", ".", "7", "9"]]))
