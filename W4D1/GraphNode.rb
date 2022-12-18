require 'Set'
class GraphNode

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def value
        @value
    end

    def neighbors
        @neighbors
    end
    def neighbors=(edges)
        for edge in edges
            neighbors << edge
        end
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new
    until queue.empty?
        node = queue.shift
        return node if node.value == target_value
        visited.add(node)
        for neighbor in node.neighbors
            unless visited.include?(neighbor)
                queue.append(neighbor)
            end
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
