b=[1;2;3;4;5;6;7;8;9;10]
c=Array{Int64}(undef,10)

for i in 1:10
    c[i] = 10*i
end

a = Array{Int64}(undef,10)
for i in 1:10
    a[i] = 10*i
end

a[1:3]
a[1:3:9]

a[1:end]

c = collect(1:9)
c = collect(1:20)

my_keys = ["Seoul", "New York", "Paris", "London", "Tokyo"]
my_values = ["Asiana", "Delta", "Air France", "British Airways", "AVA"]

d = Dict()

for i in 1:length(my_keys)
    d[my_keys[i]]=my_values[i]
end

d

d["Berline"] = "Lufthansa"

d

my_dict = Dict("name" => "Julia", "age"=> 10)

function julia(x,y)
    result = 3x+y
    return result
end

julia(2,1)

range = collect(1:5)
function my_sum(a)
    s=0
    for i in range
        s+=a[i]
    end
    return s
end

a = [1;2;3;4;5]
my_sum(a)

