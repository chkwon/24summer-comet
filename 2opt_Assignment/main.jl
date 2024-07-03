include("data.jl")
include("RCM.jl")
include("imp.jl")

using Concorde, BenchmarkTools

function one_iteration(n)
    # Generate random instance
    coordinate_vector, distances = random_TSP_instance(n)
    concorde_data = concorde_data_generator(n, coordinate_vector)

    # Obtain exact solution from concorde
    # @time opt_tour, opt_length = solve_tsp(concorde_data)
    opt_tour, opt_length = solve_tsp(concorde_data)
    # println("Concorde - length : ", opt_length/1000, ", tour : ", opt_tour)
    # println(" ")

    # initial tour generation
    # initial tour with Nearest neighbor 
    tour_n = Nearest_neighbor_method(n, distances)
    length_n = tour_length(n, tour_n, distances)

    # initial tour with Farthest insertion
    tour_f = Farthest_insertion_method(n, distances)
    length_f = tour_length(n, tour_f, distances)

    # 4 combination of implementation & strategy
    # Compare time, length, tour

    result_length = [length_n, length_f, opt_length/1000]

    nb_tour, nb_length = newtour_best(n, tour_n, distances)
    nf_tour, nf_length = newtour_first(n, tour_n, distances)
    db_tour, db_length = direct_best(n, tour_n, distances)
    df_tour, df_length = direct_first(n, tour_n, distances)

    push!(result_length, nb_length)
    push!(result_length, nf_length)
    push!(result_length, db_length)
    push!(result_length, df_length)

    nb_tour, nb_length = newtour_best(n, tour_f, distances)
    nf_tour, nf_length = newtour_first(n, tour_f, distances)
    db_tour, db_length = direct_best(n, tour_f, distances)
    df_tour, df_length = direct_first(n, tour_f, distances)

    push!(result_length, nb_length)
    push!(result_length, nf_length)
    push!(result_length, db_length)
    push!(result_length, df_length)

    return result_length
end

cities=1000
result_sum = zeros(11)

iteration_num = 100

for i in 1:iteration_num

    result = one_iteration(cities)
    if i%(iteration_num/10) == 0
        println(i/iteration_num*100, "% processed")
    end

    for j in 1:11
        result_sum[j] += result[j]
    end
end

Message_array = ["NN initial length     ", "FI initial length   ","concorde  ", 
"NN-newtour/best    ", "NN-newtour/first    ", "NN-direct/best  ", "NN-direct/first ",
"FI-newtour/best    ", "FI-newtour/first    ", "FI-direct/best  ", "FI-direct/first "
]

println(" ")

for i in 1:11
    avg = result_sum[i]/500
    println(Message_array[i], round(avg, digits=3))
    println(" ")
end


println(" ")
println(" ")

coordinate_vector, distances = random_TSP_instance(cities)
concorde_data = concorde_data_generator(cities, coordinate_vector)


opt_tour, opt_length = solve_tsp(concorde_data)


@time tour_n = Nearest_neighbor_method(cities, distances)

@time tour_f = Farthest_insertion_method(cities, distances)

# 1. RCM method 1
println("Nearest neighbor method")
println(" ")

@time nb_tour, nb_length = newtour_best(cities, tour_n, distances)
# println("newtour_best - length : ", nb_length, ", tour : ", nb_tour)
println("newtour_best - length : ", round(nb_length, digits=3))
println(" ")

@time nf_tour, nf_length = newtour_first(cities, tour_n, distances)
# println("newtour_first - length : ", nf_length, ", tour : ", nf_tour)
println("newtour_first - length : ", round(nf_length, digits=3))
println(" ")

@time db_tour, db_length = direct_best(cities, tour_n, distances)
# println("direct_best - length : ", db_length, ", tour : ", db_tour)
println("direct_best - length : ", round(db_length, digits=3))
println(" ")

@time df_tour, df_length = direct_first(cities, tour_n, distances)
# println("direct_first - length : ", df_length, ", tour : ", df_tour)
println("direct_first - length : ", round(df_length, digits=3))
println(" ")

println(" ")

# 2. RCM method 2
println("Farthest insertion method")
println(" ")

@time nb_tour, nb_length = newtour_best(cities, tour_f, distances)
# println("newtour_best - length : ", nb_length, ", tour : ", nb_tour)
println("newtour_best - length : ", round(nb_length, digits=3))
println(" ")

@time nf_tour, nf_length = newtour_first(cities, tour_f, distances)
# println("newtour_first - length : ", nf_length, ", tour : ", nf_tour)
println("newtour_first - length : ", round(nf_length, digits=3))
println(" ")

@time db_tour, db_length = direct_best(cities, tour_f, distances)
# println("direct_best - length : ", db_length, ", tour : ", db_tour)
println("direct_best - length : ", round(db_length, digits=3))
println(" ")

@time df_tour, df_length = direct_first(cities, tour_f, distances)
# println("direct_first - length : ", df_length, ", tour : ", df_tour)
println("direct_first - length : ", round(df_length, digits=3))

