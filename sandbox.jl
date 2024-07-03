using Plots
xy = [rand(2) for i in 1:10]

typeof(xy[1])
xy[1]

xy *= 1000
println(xy)

include("./2opt_Assignment/data.jl")
vec, mat = random_TSP_instance(5)

println(mat)

A = [1 2 3]
A[end-1]
B = [1]
B[end]

include("./2opt_Assignment/data.jl")
include("./2opt_Assignment/RCM.jl")


# Generate random instance
n = 5
coordinate_vector, distances = random_TSP_instance(n)
println(distances)
distances
coordinate_vector[1]
x, y = xys(coordinate_vector)
push!(x, x[1])
push!(y, y[1])
scatter(
    x, y, shape=[:circle], xlims=(0.0, 1.0)
)

round(3.128979, digits=3)



A = [1, 2, 3]
push!(A, 4)

using Concorde

cities = 1000
for i in 1:100
end

coordinate_vector, distances = random_TSP_instance(cities)
concorde_data = concorde_data_generator(cities, coordinate_vector)


opt_tour, opt_length = solve_tsp(concorde_data)