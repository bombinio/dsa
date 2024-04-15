
# stack = []
# stack.append(10)
# stack.append(20)
# stack.append(30)
# print(stack)
# stack.pop() # remove 30
# print(stack)
# stack.pop() # remove 20
# print(stack)
# stack.pop() # remove 10
# print(stack)
# print(len(stack) == 0) # true

stack = []
# print(not stack) # empty stack -> true
# stack.append(10)
# stack.append(20)
# print(stack[-1]) # last element in stack

def push():
    if len(stack) == n:
        print('list is full!')
    else:
        element = input("Enter the element:")
        stack.append(element)
        print(stack)

def pop_element():
    if not stack:
        print('stack is empty!')
    else:
        e = stack.pop()
        print('removed element:', e)
        print(stack)

n = int(input('limit of stack: '))
while True:
    print('Select the operation 1. push 2.pop 3.quit')
    choice = int(input())
    if choice == 1:
        push()
    elif choice == 2:
        pop_element()
    elif choice == 3:
        break
    else:
        print('Enter the correct operation')