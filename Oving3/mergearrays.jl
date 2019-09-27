#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x, y, coordinate)
    total_length = size(x, 1)+ size(y,1)
    merged = zeros(Float64, total_length,2)
    x_counter = 1
    y_counter = 1
    x_length = size(x,1)
    y_length = size(y,1)
    for i in 1:total_length
        if x_counter > x_length && y_counter <= y_length
            merged[i,:] = y[y_counter,:]
            y_counter += 1
        elseif y_counter > y_length && x_counter <= x_length
            merged[i,:] = x[x_counter,:]
            x_counter += 1

        elseif y[y_counter,coordinate] < x[x_counter,coordinate]
            merged[i,:] = y[y_counter,:]
            y_counter += 1

        else
            merged[i,:] = x[x_counter,:]
            x_counter += 1
        end
    end
    return merged
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    if size(x, 1) == 1
        return x
    end
    mid = div(size(x,1), 2)
    lpart = mergesort(x[1:mid,:],coordinate)
    rpart = mergesort(x[mid+1:end,:],coordinate)
    result = mergearrays(lpart, rpart, coordinate)
    return result
end

listami = zeros(Float64, 3, 2)
listami[1,1] = 0
listami[1,2] = 3
listami[2,1] = 4
listami[2,2] = 7
listami[3,1] = 1
listami[3,2] = 2
println(listami)

println(mergesort(listami,1))
