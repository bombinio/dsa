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

const simplifyPath = function (path) {
    const stack = [];
    const splittedPath = path.split('/');
    // console.log(splittedPath)
    for (let i = 0; i < splittedPath.length; i++) {
        if (splittedPath[i] === '..') {
            stack.pop();
        } else if (splittedPath[i] === '.') {
            continue;
        } else if (splittedPath[i] !== '') {
            stack.push(splittedPath[i])
        }
    }
    let output = stack.join('/');
    if (!output || output[0] !== '/') {
        return '/' + output;
    } else {
        return stack.join('/');
    }
}

console.log(simplifyPath('/home/'));
console.log(simplifyPath('/home//foo/'));
console.log(simplifyPath("/home/user/Documents/../Pictures"));
console.log(simplifyPath("/../"));
console.log(simplifyPath("/.../a/../b/c/../d/./"));
console.log(simplifyPath("/a/../../b/../c//.//"));
