function dnasimilarity(s1, s2)
    counter = 0
    for i in 1:length(s1)
        if s1[i] == s2[i]
            counter += 1
        end
    end
    return counter
end

print(dnasimilarity("ATCG", "ATGC"))