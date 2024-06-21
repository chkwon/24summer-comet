2+3

[1,2,3] .^3

.![true, false]

x = 3.141592

round(x)

x1 = -9
abs(x1)

sqrt(abs(x1))

x2 = 8
cbrt(x2)

log(exp(2))

cos(pi)

a=[1;2;3]
b = [4 5 6]
c = [456]
A = [ 1 2 3 ; 4 5 6]

A[2,1]
transpose(A)
A'

c = [7;8;9]
a'*c

using LinearAlgebra
dot(a,c)

Matrix(1.0I, 2,2)

zeros(4, 1)

ones(3,2)

B = [1 3 2; 3 2 2; 1 1 1]
inv(B)

B*inv(B)

inv(B)[2,1]

p=Array{Float64}(undef, 3,1)

pairs = Array{Tuple{Int64, Int64}}(undef,3)

pairs[1] = (1,2)
pairs[2] = (2,3)
pairs[3] = (3,4)

pairs

a = [1;2;3;4;5;6;7;8;9;10]
a[1:3]
a[1:3:9]
a[end]

c = collect(1:2:9)
A= [1 2 3; 4 5 6; 7 8 9]
A[:, 2]
A[:, 2:3]
A[3, :]
A[3:3, :]

print("hello?"); print("hi"); print("w semicolon")
println("hello"); println("jump lines");
println("matrix A is $A")
A

for i in 1:length(a)
    println("a[$i] = $(a[i])")
end

for i in 1:5
    if i>=3
        break
    end
    println("this is number $i")
end

my_keys = ["Zinedine Zidane", "Magic Johnson", "Yuna Kim"]
my_values = ["football", "basketball", "figure skating"]

d = Dict()

for i in 1:length(my_keys)
    d[my_keys[i]] = my_values[i]
end

d

for (key, value) in d
    println("$key is a $value player.")
end

d["Diego Maradona"] = "football"

d

links = [(1,2), (3,4), (4,2)]
link_costs = [5, 13, 8]

link_dict = Dict()

for i in 1:length(links)
    link_dict[ links[i]] = link_costs[i]
end

link_dict

function f(x,y)
    return 3x+y
end

f(1,3)

3 * (f(3,2)+f(5,6))

function my_func(n,m)
    a = zeros(n,1)
    b = ones(m,1)
    return a,b
end

x, y = my_func(3,2)
    
x

y

sqrt(9)
# sqrt([9 16])
sqrt.([9 16])

myfunc(x) = sin(x)+ 3*x
myfunc(3)
myfunc.([5 10])

a = [1;2;3;4;5]

# s=0
# for i in :length(a)
#   s+=a[i]
# end

function my_sum(a)
    s=0
    for i in 1:5
        s+=a[i]
    end
    return s
end

my_sum(a)

rand()
rand(6)

rand(2, 3)

rand()*100

rand(1:10)

randn(2,3)


sigma = 3
mu = 50
randn(10).*sigma.+mu

using StatsFuns

mu = 50; sigma = 3;
normpdf(mu, sigma, 53)

normcdf(mu, sigma, 50)

norminvcdf(mu, sigma, 0.5)

