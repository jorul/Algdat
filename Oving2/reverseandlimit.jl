function reverseandlimit(array, maxnumber)
    reverse!(array)
    for i in 1:length(array)
        if array[i] > maxnumber
            array[i] = maxnumber
        end
    end
    return array
end

listami = [1,2,3,7]
println(listami)
println(reverseandlimit(listami,4))