function bruteforce(x)
    longest = 0
    for i in 1:(size(x,1)-1)
        for j in (i+1):size(x,1)
            if find_length(x,i,j) > longest
                longest =find_length(x,i,j)
            end
        end
    end
end

function find_length(x,p1_index,p2_index)
    return sqrt((x[p1_index,1]-x[p2_index,1])^2 +(x[p1_index,2]-x[p2_index,2])^2)
end

listami = zeros(Float64, 3, 2)
listami[1,1] = 0
listami[1,2] = 3
listami[2,1] = 4
listami[2,2] = 7
listami[3,1] = 1
listami[3,2] = 2
println(listami)

println(bruteforce(listami))
