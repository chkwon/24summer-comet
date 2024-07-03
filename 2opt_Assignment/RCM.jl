# Initial tour construction

# Nearest Neighbor Method

function find_nearest(n, tour, distances)
    city = tour[end]

    next_city = 0

    for i in 2:n
        tmp = Inf
        if !(i in tour)
            if tmp > distances[city, i]
                tmp = distances[city, i]
                next_city = i
            end
        end
    end
    return next_city
end


function Nearest_neighbor_method(n, distances)

    # Define 'tour' vector
    tour = [1]

    next_city = 0

    for i in 2:n
        next_city = find_nearest(n, tour, distances)
        push!(tour, next_city)
    end

    return tour
end


# Farthest Insertion Method

function find_farthest(n, tour, distances)
    point = 1
    tmp = 0.0
    for i in 2:n
        if !(i in tour)
            if tmp < distances[1, i]
                tmp = distances[1, i]
                point = i
            end
        end
    end

    l = length(tour)
    ins = 1

    if l == 1
        push!(tour, point)
    else
        tmp = Inf
        for i in 1:(l-1)
            new = distances[i, point] + distances[point, i+1] - distances[i, i+1]
            if tmp > new
                tmp = new
                ins = i
            end
        end
        insert!(tour, ins+1, point)
    end

    return tour
end

function Farthest_insertion_method(n, distances)
    tour = [1]

    for i in 2:n
        tour = find_farthest(n, tour, distances)
    end
        
    return tour

end