def add_node(v):
    if v in graph:
        print(v, 'already present in graph')
    else:
        graph[v] = []


def add_edge(v1, v2):
    if v1 not in graph:
        print(v1, 'Not present in graph')
    elif v2 not in graph:
        print(v2, 'Not present in graph')
    else:
        # weighted graph
        # list1 = [v2, cost]
        # list2 = [v1, cost]
        # graph[v1].append(list1)
        # graph[v2].append(list2)

        # weighted directed graph
        # list1 = [v2, cost]
        # graph[v1].append(list1)

        # unweighted directed graph
        # graph[v1].append(v2)

        # undirected graph
        graph[v1].append(v2)
        graph[v2].append(v1)


def delete_node(v):
    if v not in graph:
        print(v, 'is not present in the graph')
    else:
        graph.pop(v)
        for i in graph:
            list1 = graph[i]
            # if v in list1:
            # list1.remove(v)
            # for weighted graph
            for j in list1:
                if v == j[0]:
                    list1.remove(j)
                    break


def delete_edge(v1, v2, cost):
    if v1 not in graph:
        print(v1, 'is not present in the graph')
    if v2 not in graph:
        print(v2, 'is not present in the graph')
    else:
        temp = [v1, cost]
        temp1 = [v2, cost]
        if temp1 in graph[v1]:
            graph[v1].remove(temp1)
            graph[v2].remove(temp)

# recursive method
# def DFS(node, visited, graph):
#     if node not in graph:
#         print(node, 'Not present in graph')
#         return
#     if node not in visited:
#         print(node)
#         visited.add(node)
#         for i in graph[node]:
#             DFS(i, visited, graph)
#
#
# visited = set()

# DFS iterative
def DFSiterative(node, graph):
    visited = set()
    stack = []
    if node not in graph:
        print(node, 'not present in graph')
        return
    stack.append(node)
    while stack:
        current = stack.pop()
        if current not in visited:
            print(current)
            visited.add(current)
            for i in graph[current]:
                stack.append(i)





graph = {}

add_node('A')
add_node('B')
add_node('C')

add_edge('A', 'B')
add_edge('A', 'C')

# delete_node('C')
# delete_edge('A', 'C', 5)

print(graph)

# DFS('K', visited, graph)
DFSiterative('A', graph)