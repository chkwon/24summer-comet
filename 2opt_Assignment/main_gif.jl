include("data.jl")
include("RCM.jl")
include("imp_gif.jl")

using Concorde

function one_iteration(n)
    coordinate_vector, distances = random_TSP_instance(n)
    concorde_data = concorde_data_generator(n, coordinate_vector)

    opt_tour, opt_length = solve_tsp(concorde_data)

    x, y = xys(coordinate_vector)
    push!(x, x[1])
    push!(y, y[1])

    scatter(
        x, y, shape=[:circle], xlims=(0.0, 1.0)
    )

    tour_n = Nearest_neighbor_method(n, distances)

    # tour_f = Farthest_insertion_method(n, distances)

    result_length = [opt_length/1000]

    nb_tour, nb_length = newtour_best(n, tour_n, distances, x, y)
    nf_tour, nf_length = newtour_first(n, tour_n, distances, x, y)
    db_tour, db_length = direct_best(n, tour_n, distances, x, y)
    df_tour, df_length = direct_first(n, tour_n, distances, x, y)

    push!(result_length, nb_length)
    push!(result_length, nf_length)
    push!(result_length, db_length)
    push!(result_length, df_length)

    # nb_tour, nb_length = newtour_best(n, tour_f, distances, x, y)
    # nf_tour, nf_length = newtour_first(n, tour_f, distances)
    # db_tour, db_length = direct_best(n, tour_f, distances)
    # df_tour, df_length = direct_first(n, tour_f, distances)

    # push!(result_length, nb_length)
    # push!(result_length, nf_length)
    # push!(result_length, db_length)
    # push!(result_length, df_length)

    return result_length
end

tmp = one_iteration(20)

# cities=100
# result_sum = zeros(9)

# iteration_num = 1000

# for i in 1:iteration_num

#     result = one_iteration(cities)
#     if i%(iteration_num/10) == 0
#         println(i/iteration_num*100, "% processed")
#     end

#     for j in 1:9
#         result_sum[j] += result[j]
#     end
# end

# Message_array = ["concorde  ", 
# "NN-newtour/best    ", "NN-newtour/first    ", "NN-direct/best  ", "NN-direct/first ",
# "FI-newtour/best    ", "FI-newtour/first    ", "FI-direct/best  ", "FI-direct/first "
# ]

# for i in 1:9
#     println(Message_array[i], result_sum[i]/500)
# end


# # 1. RCM method 1
# println("Nearest neighbor method")

# @time nb_tour, nb_length = newtour_best(n, tour_n, distances)
# println("newtour_best - length : ", nb_length, ", tour : ", nb_tour)

# @time nf_tour, nf_length = newtour_first(n, tour_n, distances)
# println("newtour_first - length : ", nf_length, ", tour : ", nf_tour)

# @time db_tour, db_length = direct_best(n, tour_n, distances)
# println("direct_best - length : ", db_length, ", tour : ", db_tour)

# @time df_tour, df_length = direct_first(n, tour_n, distances)
# println("direct_first - length : ", df_length, ", tour : ", df_tour)

# println(" ")

# # 2. RCM method 2
# println("Farthest insertion method")

# @time nb_tour, nb_length = newtour_best(n, tour_f, distances)
# println("newtour_best - length : ", nb_length, ", tour : ", nb_tour)

# @time nf_tour, nf_length = newtour_first(n, tour_f, distances)
# println("newtour_first - length : ", nf_length, ", tour : ", nf_tour)

# @time db_tour, db_length = direct_best(n, tour_f, distances)
# println("direct_best - length : ", db_length, ", tour : ", db_tour)

# @time df_tour, df_length = direct_first(n, tour_f, distances)
# println("direct_first - length : ", df_length, ", tour : ", df_tour)

