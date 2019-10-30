function brokendnasearch(root, dna, i=1)
    node = root
    total = 0
    if i > length(dna)
        return root.count
    end
    possibles = ['A', 'T', 'C', 'G']
    if dna[i] == '?'
        for letter in possibles
            if haskey(node.children, letter)
                total += brokendnasearch(node.children[letter], dna, i+1)
            end
        end
    else
        if haskey(node.children, dna[i])
            total += brokendnasearch(node.children[dna[i]], dna, i+1)
        else
            return 0
        end
    end
    return total
end