function binaryintervalsearch(x,delta, coordinate)
    sizen = size(x,1)
    if sizen%2 == 0
        println("ok")
        median = 3.5
    #    median = (x[div(sizen,2), coordinate] + x[div(sizen,2) +1, coordinate])/2
    else
    #    median = x[div(sizen,2)+1, coordinate]
    end
    lower = median - delta
    higher = median + delta
    low_index = 1
    high_index = 0
    found = false
    println(median)
    for i in 1:sizen
        if x[i,coordinate] < lower
            low_index +=1
            high_index +=1
        elseif x[i, coordinate] <= higher
            high_index += 1
        end
        if x[i,coordinate]>= lower && x[i,coordinate] <= higher
            found = true
        end
    end
    if found == false
        return -1, -1
    end
    return low_index, high_index
end

listami = zeros(Float64, 4, 2)
listami[1,1] = 0
listami[1,2] = 3

listami[2,1] = 2
listami[2,2] = 7

listami[3,1] = 4
listami[3,2] = 2

listami[4,1] = 6
listami[4,2] = 7
println(listami)

println(binaryintervalsearch(listami,1,1))