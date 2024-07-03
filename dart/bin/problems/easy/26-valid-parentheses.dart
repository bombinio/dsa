// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
// An input string is valid if:
//
//     Open brackets must be closed by the same type of brackets.
//     Open brackets must be closed in the correct order.
//     Every close bracket has a corresponding open bracket of the same type.
//
//
//
// Example 1:
//
// Input: s = "()"
// Output: true

// Algos
// 1) Firstly we need to use data structure 'stack' and we need only using 'pop' 'push' 'getLastElement' functions from stack
// 2) We only push open brackets to stack, if s[i] is closed brackets we check if last element in stack is the same type
// of closed brackets, if yes then we pop it from stack, otherwise we return false and brackets are invalid
// 3) If loop ended it means all brackets were valid and stack should be empty, that what we compare in the end

// Key points: use data structure 'stack'

class Solution {
  bool isValid(String s) {
    const parentheses = {
      '(': ')',
      '[': ']',
      '{': '}',
    };
    final stack = [];
    for (int i = 0; i < s.length; i++) {
      if (parentheses.containsKey(s[i])) {
        stack.add(s[i]);
      } else if (stack.isNotEmpty && stack[stack.length - 1] == '(' && s[i] == ')') {
        stack.removeLast();
      } else if (stack.isNotEmpty && stack[stack.length - 1] == '[' && s[i] == ']') {
        stack.removeLast();
      } else if (stack.isNotEmpty && stack[stack.length - 1] == '{' && s[i] == '}') {
        stack.removeLast();
      } else {
        return false;
      }
    }
    return stack.isEmpty;
  }
}
