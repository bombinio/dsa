// Given an absolute path for a Unix-style file system, which begins with a slash '/', transform this path into its simplified canonical path.
//
// In Unix-style file system context, a single period '.' signifies the current directory, a double period ".." denotes moving up one directory level, and multiple slashes such as "//" are interpreted as a single slash. In this problem, treat sequences of periods not covered by the previous rules (like "...") as valid names for files or directories.
//
// The simplified canonical path should adhere to the following rules:
//
//     It must start with a single slash '/'.
//     Directories within the path should be separated by only one slash '/'.
//     It should not end with a slash '/', unless it's the root directory.
//     It should exclude any single or double periods used to denote current or parent directories.
//
// Return the new path.
//
//
//
// Example 1:
//
// Input: path = "/home/"
//
// Output: "/home"
//
// Explanation:
//
// The trailing slash should be removed.

// Algos
// 1) Use stack DS and also split whole path using '/' to get only names of directories
// 2) Traverse splittedPath and if element in array is '..' pop last element from array, if element is '.' then continue
// because '.' signifies current directory
// 3) In the end we join our string by '/' so we splitted in the start and we just revert it to get whole new path
// 4) If first character is not '/' we concat our output => '/' + output because in the start we removed all '/'s but
// paths start from '/'

// Key point: Use stack DS, .. = .pop(); . = continue; otherwise .push();

class Solution {
  String simplifyPath(String path) {
    final stack = [];
    final pathArr = path.split('/');
    print(pathArr);
    for (int i = 0; i < pathArr.length; i++) {
      if (pathArr[i] == '..') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
        continue;
      } else if (pathArr[i] == '.' || pathArr[i] == '') {
        continue;
      } else {
        stack.add(pathArr[i]);
      }
    }
    print(stack);
    return '/' + stack.join('/');
  }
}

void main () {

}