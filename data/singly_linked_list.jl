mutable struct Node
    value::Number
    next::Node

    function Node(value::Number)
        new(value)
    end
    function Node(value::Number, next::Node)
        new(value, next)
    end
end

mutable struct LinkedList
    head::Node

    function LinkedList()
        new()
    end

    function LinkedList(node::Node)
        new(node)
    end
end

# ex) add(ll, 1)
function add(ll::LinkedList, value::Number)
    if !isdefined(ll, :head)
        ll.head = Node(value)
        return
    end

    head = ll.head
    while isdefined(head, :next)
        head = head.next
    end

    head.next = Node(value)
end

# ex) add(ll, Node(1))
function add(ll::LinkedList, node::Node)
    if !isdefined(ll, :head)
        ll.head = node
        return
    end

    head = ll.head
    while isdefined(head, :next)
        head = head.next
    end

    head.next = node
end

# ex) add(ll, [1, 2, 3])
function add(ll::LinkedList, nodes::Array)
    if !isdefined(ll, :head)
        ll.head = Node(nodes[1])  # first index is 1
    end

    head = ll.head
    while isdefined(head, :next)
        head = head.next
    end

    for node in nodes[2:length(nodes)]
        head.next = Node(node)
        head = head.next
    end
end

function remove(ll::LinkedList, value::Number)
    if ll.head.value === value
        ll.head = ll.head.next
        return
    end
    parent = ll.head
    head = ll.head.next
    
    while isdefined(head, :next)
        if head.value === value
            parent.next = head.next
            return
        end
    end

end

function printList(ll::LinkedList)
    if !isdefined(ll, :head)
        println("Empty list")
        return
    end

    head = ll.head
    while isdefined(head, :next)
        print("$(head.value) -> ")
        head = head.next
    end
    println("$(head.value)")
end


# Define Singly Linked List
ll = LinkedList()

# Add node with Node object
add(ll, Node(1))
add(ll, Node(2))

# Add node with value
add(ll, 3)
add(ll, 4)
add(ll, 5)

# Add node with array of values
add(ll, [6, 7, 8])

# print all nodes
printList(ll)  # 1 -> 2 -> 3 -> 4 -> 5 -> 7 -> 8

# remove node with value 2
remove(ll, 2)
printList(ll)  # 1 -> 3 -> 4 -> 5 -> 7 -> 8

