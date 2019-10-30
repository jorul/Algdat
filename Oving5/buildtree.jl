
#buildtree(["A", "AG", "TG", "T"])
#Node(Dict('A' => Node(Dict('G' => Node(Dict{Char,Node}(), 1)), 2), 'T' => Node(Dict('G' => Node(Dict{Char,Node}(), 1)), 2)), 4)
mutable struct Node
    children::Dict{Char,Node}
    count::Int
end

function buildtree(dnasequences)
    root = Node()
    #Alle sekvenser har den tomme strengen som prefix:
    root.count = length(dnasequences)
   
 	theNode = root
    for dna in dnasequences
        for j in 1:length(dna)
            if !(haskey(theNode.children, dna[j]))
                theNode.children[dna[j]] = Node()
            end 
        	theNode = theNode.children[dna[j]]
        	theNode.count += 1
        end
        theNode = root
    end
    return root
end

print(buildtree(["A", "AG", "TG", "T"]))
