# import collections
# q = collections.deque()
# print(q) # empty queue
#
# q.appendleft(10)
# q.appendleft(20)
# q.appendleft(30)
# print(q) # 30 20 10
# q.pop() # removed 10
# print(q) # 30 20

# q.append(10)
# q.append(30)
# q.append(20)
# q.popleft() # removes 10
# print(q)
# print(not q) # check if queue empty
#
# print(q[-1]) # 20

# priority queue
import queue
q = queue.PriorityQueue()
q.put(10)
q.put(60)
q.put(20)
q.put(40)
print(q.queue) # 10 40 20 60
q.get() # remove 10 lowest number in queue
q.get() # remove 20
print(q.queue) # 40 60

