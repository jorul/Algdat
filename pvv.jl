println("atom er kjedelig.")

a = 5
b = 3
c = a + b
println(c)

#Base.sort!(A)
#while er raskere en for




x= [2.0 0.0; 3.0 2.0; 4.0 0.0; 4.0 5.0; 5.0 4.0]
y= [2.0 0.0; 4.0 0.0; 3.0 2.0; 5.0 4.0; 4.0 5.0]

print(typeof(x[1,:]))
s= Dict{Array{Float64,1},Float64}()
s[x[1,:]] = 1
print(s)
