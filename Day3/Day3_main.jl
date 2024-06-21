include("Day3_data.jl")
include("Day3_TSP.jl")

# Make a random TSP instance
n = 30
xy , distances = random_TSP_instance(n)

# println(xy)
# println(distances)

# Solve TSP with all subtour elimination constraints using Gurobi
model = TSP_model(distances)
optimize!(model)
x = model[:x]
tour = get_tour(x, n)
println("The optimal tour is ", tour)