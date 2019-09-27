function flexradix(A, maxlength)
    B = countingsortlength(A)
    C = zeros(Int,maxlength+1)
    
    for j in 1:length(A) #teller antall med ulike lengder fra 0 til maxlength
        digit = length(B[j]) + 1 #+1 for å ta høyde for lende 1
        C[digit] = C[digit] + 1
    end

    for i in maxlength:-1:1 #vi vil starte bakerst(med de lengste)
        C[i] = C[i] + C[i+1]
    end

    for k in maxlength:-1:1
        lex_sorted = countingsortletters(B[length(B)+1-C[k+1]:end],k)
        println(lex_sorted)
        B[length(B)+1-C[k+1]:end] = lex_sorted
        println(B)
    end
    return B
end

println()

z = ["hello","no","gaga", "haha", "tull","pannekake","nannekake"]
flexradix(z, 9)



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

function countingsortlength(A)
    B = Array{String}(undef, length(A))
    maxlength = 0
    for m in 1:length(A)
        if length(A[m])> maxlength
            maxlength = length(A[m])
        end
    end
    maxlength = maxlength + 1
    C = zeros(Int,maxlength)
    for j in 1:length(A)
        digit = length(A[j]) + 1
        C[digit] = C[digit] + 1
    end

    for i in 2:maxlength
        C[i] = C[i] + C[i-1]
    end

    for k in length(A):-1:1
        digit = length(A[k])+1
        B[C[digit]] = A[k]
        C[digit] = C[digit] - 1
    end
    return B
end