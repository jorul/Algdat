function countingsortletters(A, position)
    B = Array{String}(undef, length(A))
    C = zeros(Int,26)
    for j in 1:length(A)
        char = A[j][position]
        digit = chartodigit(char)
        C[digit] = C[digit] + 1
    end

    for i in 2:26
        C[i] = C[i] + C[i-1]
    end
    
    for k in length(A):-1:1
        char = A[k][position]
        digit = chartodigit(char)
        B[C[digit]] = A[k]
        C[digit] = C[digit] - 1
    end
    return B
end



function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end