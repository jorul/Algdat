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

z = ["hello","no","gaga", "haha", "tull","pannekake","nattbordslampe"]
print(countingsortlength(z))