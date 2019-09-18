mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end

function findindexinlist(linkedlist, index)
    currentnode = linkedlist
    currentindex = 1
    while currentindex < index
        if currentnode.next == nothing
            return -1
        end
        currentnode = currentnode.next
        currentindex += 1
    end
    return currentnode.value
end

listami = createlinkedlist(7)
println(listami)
println(findindexinlist(listami, 3))