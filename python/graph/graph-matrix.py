def add_node(v):
    global node_count
    if v in nodes:
        print(v, 'node already in graph')
    else:
        node_count = node_count + 1
        nodes.append(v)
        for n in graph:
            n.append(0)
        temp = []
        for i in range(node_count):
            temp.append(0)
        graph.append(temp)


def add_edge(v1, v2, cost):
    if v1 not in nodes:
        print(v1, 'Not in graph')
    elif v2 not in nodes:
        print(v2, 'Not present in graph')
    else:
        index1 = nodes.index(v1)
        index2 = nodes.index(v2)

        # directed graph
        # graph[index1][index2] = 1

        # undirected graph
        # graph[index1][index2] = 1
        # graph[index2][index1] = 1

        # weighted graph
        # graph[index1][index2] = cost
        # graph[index2][index1] = cost

        # unweighted directed graph
        # graph[index1][index2] = 1

        graph[index1][index2] = cost
        graph[index2][index1] = cost


def delete_node(v):
    global node_count
    if v not in nodes:
        print(v, 'is not present in the graph')
    else:
        index1 = nodes.index(v)
        node_count = node_count - 1
        nodes.remove(v)
        graph.pop(index1)
        for i in graph:
            i.pop(index1)

def delete_edge(v1, v2):
    if v1 not in nodes:
        print(v1, 'is not present in graph')
    if v2 not in nodes:
        print(v2, 'is not present in graph')
    else:

        # undirected graph
        # index1 = nodes.index(v1)
        # index2 = nodes.index(v2)
        # graph[index1][index2] = 0
        # graph[index2][index1] = 0

        # directed graph
        index1 = nodes.index(v1)
        index2 = nodes.index(v2)
        graph[index1][index2] = 0

def print_graph():
    for i in range(node_count):
        for j in range(node_count):
            print(format(graph[i][j], '<3'), end=' ')
        print()


nodes = []
graph = []
node_count = 0
print('before addind nodes')
print(nodes)
print(graph)

add_node('A')
add_node('B')
add_node('C')


add_edge('A', 'B', 10)
add_edge('A', 'C', 5)

delete_node('C')
# delete_edge('A', 'B')

print('after addind nodes')
print('nodes', nodes)
print(graph)
print_graph()
