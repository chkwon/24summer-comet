using Random

function euclidian_distance(p1, p2)
    return sqrt(sum(p1-p2).^2)
end

function random_TSP_instance(n)
    Random.seed!(1234)

    # random loaction (x,y) of n nodes
    xy = [rand(1:100, 2) for i in 1:n]

    # calculate the distance between each pair of nodes
    distances = zeros(n, n)
    for i in 1:n
        for j in i+1:n
            dist = euclidian_distance(xy[i], xy[j])
            distances[i, j] = dist
            distances[j, i] = dist
        end
    end

    distances = round.(Int, distances)

    return xy, distances
end