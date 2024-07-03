
function tour_length(n, tour, distances)
    len = 0
    for i in 1:(n-1)
        len += distances[tour[i], tour[i+1]]
    end
    return len
end

function newtour_best(n, tour, distances)
    final_tour = copy(tour)

    for i in 1:n
        tmp_tour = final_tour
        for j in i+1:n
            new_tour = final_tour
            tmp1 = new_tour[i+1]
            tmp2 = new_tour[j]

            deleteat!(new_tour, i+1)
            insert!(new_tour, i+1, tmp2)
            deleteat!(new_tour, j)
            insert!(new_tour, j, tmp1)

            current_length = tour_length(n, final_tour, distances)
            new_length = tour_length(n, new_tour, distances)

            if current_length>new_length
                tmp_tour = new_tour
            end
        end
        final_tour = tmp_tour
    end
    return final_tour, tour_length(n, final_tour, distances)
end

function newtour_first(n, tour, distances)
    final_tour = copy(tour)

    for i in 1:n
        for j in i+1:n
            new_tour = final_tour
            tmp1 = new_tour[i+1]
            tmp2 = new_tour[j]

            deleteat!(new_tour, i+1)
            insert!(new_tour, i+1, tmp2)
            deleteat!(new_tour, j)
            insert!(new_tour, j, tmp1)

            current_length = tour_length(n, final_tour, distances)
            new_length = tour_length(n, new_tour, distances)

            if current_length>new_length
                final_tour = new_tour
                break
            end
        end
    end
    return final_tour, tour_length(n, final_tour, distances)
end

function direct_best(n, tour, distances)

    for i in 1:n
        tmp = i
        for j in i+1:n-1

            current_length = distances[tour[i], tour[i+1]] + distances[tour[j], tour[j+1]]
            new_length = distances[tour[i], tour[j]] + distances[tour[i+1], tour[j+1]]

            if current_length > new_length
                tmp = j
            end
        end
        if !(tmp == i)
            tmp1 = tour[i+1]
            tmp2 = tour[tmp]

            deleteat!(tour, i+1)
            insert!(tour, i+1, tmp2)
            deleteat!(tour, tmp)
            insert!(tour, tmp, tmp1)
        end
    end

    return tour, tour_length(n, tour, distances)
end

function direct_first(n, tour, distances)

    for i in 1:n
        for j in i+1:n-1

            current_length = distances[tour[i], tour[i+1]] + distances[tour[j], tour[j+1]]
            new_length = distances[tour[i], tour[j]] + distances[tour[i+1], tour[j+1]]

            if current_length > new_length
                tmp1 = tour[i+1]
                tmp2 = tour[j]

                deleteat!(tour, i+1)
                insert!(tour, i+1, tmp2)
                deleteat!(tour, j)
                insert!(tour, j, tmp1)
                break
            end
        end
    end

    return tour, tour_length(n, tour, distances)
end