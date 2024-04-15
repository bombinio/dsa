
# queue = []
# queue.append(10)
# print(queue) # 10
# queue.append(30)
# print(queue) # 10 30
# queue.pop(0) # removed 10
# print(queue)

# queue = []
# queue.insert(0, 10) # append item from start
# queue.insert(0, 20)
# queue.insert(0, 30)
# print(queue) # 30 20 10
# 
# queue.pop() # removed 10
# queue.pop() # removed 20
# print(queue)
# 
# print(not queue) # checks if queue empty
# 
# queue.insert(0, 50)
# print(queue[-1]) # 30

queue = []

def enqueue():
    element = input("Enter the element:")
    queue.append(element)
    print(element, 'is added to queue!')

def dequeue():
    if not queue:
        print('queue is empty!')
    else:
        e = queue.pop(0)
        print('removed element:', e)

def display():
    print(queue)

while True:
    print('Select the operation 1. push 2.pop 3.display 4.quit')
    choice = int(input())
    if choice == 1:
        enqueue()
    elif choice == 2:
        dequeue()
    elif choice == 3:
        display()
    elif choice == 4:
        break
    else:
        print('Enter the correct operation')