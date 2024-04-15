import collections
import queue

# stack = collections.deque()
# print(stack)
# stack.append(10)
# stack.append(25)
# print(stack)
# stack.pop() # remove 25
# print(stack)

import queue
stack = queue.LifoQueue(3)
stack.put(10)
stack.put(20)
stack.put(30)
# stack.put(40, timeout=1) # max size of queue is 3, it's now full
stack.get() # remove 30
stack.get() # remove 20