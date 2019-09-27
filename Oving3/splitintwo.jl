function splitintwo(x,y)
    sizen = size(x,1)
    if sizen%2 == 0
        første_h = sizen/2+1
    else
        første_h = div(sizen,2)+2
    end
    venstre_lim = første_h-1
    høyre_lim = sizen-første_h+1
    x_venstre = zeros(Float64, venstre_lim, 2)
    y_venstre = zeros(Float64, venstre_lim, 2)
    x_høyre = zeros(Float64, høyre_lim, 2)
    y_høyre = zeros(Float64, høyre_lim, 2)
    s= Dict{Array{Float64,1},Int64}()
    for i in 1:(første_h-1)
        x_venstre[i,1] = x[i,1]
        x_venstre[i,2] = x[i,2]
        s[x_venstre[i,:]] = 1
    end
    for i in første_h:sizen
        x_høyre[i-første_h+1,1] = x[i,1]
        x_høyre[i-første_h+1,2] = x[i,2]
        s[x_høyre[i-første_h+1,:]] = 2
    end
    println(s)
    v_count = 1
    h_count = 1
    for i in 1:length(s)
        if s[y[i,:]] == 1
            y_venstre[v_count,1] = y[i,1]
            y_venstre[v_count,2] = y[i,2]
            v_count = v_count + 1
        else
            y_høyre[h_count,1] = y[i,1]
            y_høyre[h_count,2] = y[i,2]
            h_count = h_count + 1
        end
    end

    return x_venstre, x_høyre, y_venstre, y_høyre
end


x= [2.0 0.0; 3.0 2.0; 4.0 0.0; 4.0 5.0; 5.0 4.0]
y= [2.0 0.0; 4.0 0.0; 3.0 2.0; 5.0 4.0; 4.0 5.0]

println(splitintwo(x, y))