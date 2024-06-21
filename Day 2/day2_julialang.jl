a = [1;2;3]
b = [4 5 6]
A = [1 2 3; 4 5 6]

transpose(A)
A'

a = [1;2;3]
c = [7;8;9]

a' * c

dot(a,c)

B = [1 2 3 ; 4 5 6 ; 7 8 9]
inv(B)

zeros(4, 1)
ones(1, 3)

using BenchmarkTools

@btime begin
    x=int[]
    for i in 1:10
        push!(x, i*10)
    end
end

@btime begin
    x=vector{Int64}(undef, 10)
    for i in 1:10
        x[i] = i*10
    end
end