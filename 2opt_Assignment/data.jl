using Random

# Function caculating euclidian distance
function euclidian_distance(p1, p2)
    return sqrt(sum(p1-p2).^2)
end


function distance_matrix_generator(n, coordinate_vector)
    distances = zeros(n, n)
    for i in 1:n
        for j in i+1:n
            dist = euclidian_distance(coordinate_vector[i], coordinate_vector[j])
            distances[i, j] = dist
            distances[j, i] = dist
        end
    end

    return distances
end

# Function generating random random instance
function random_TSP_instance(n)

    # Deciding random seed
    #random_seed::Int16 = 2024

    #Random.seed!(random_seed)

    # Random location (x,y) of n nodes(cities) on the coordinate
    coordinate_vector = [rand(2) for i in 1:n]

    # Generating distance matrix
    distances = distance_matrix_generator(n, coordinate_vector)

    return coordinate_vector, distances

end

function concorde_data_generator(n, coordinate_vector)

    coordinate_vector *= 1000

    new_matrix = distance_matrix_generator(n, coordinate_vector)
    new_matrix = round.(Int, new_matrix)

    return new_matrix
end

function xys(coordinate_vector)
    n = length(coordinate_vector)
    x = zeros(n)
    y = zeros(n)
    for i in 1:n
        x[i], y[i] = coordinate_vector[i][1], coordinate_vector[i][2]
    end
    return x, y
end