using JuMP, Gurobi

function get_tour(x, n)
    tour = Int[]
    i=1
    while true
        push!(tour, i)
        for j in 1:n
            if value(x[i, j]) > 0.5
                i = j
                break
            end
        end
        if i == 1
            break
        end
    end
    return tour
end

# distance is a matrix(collection of length of edges)
function TSP_model(distances)
    n = size(distances, 1) # why ,1?

    #1 Define Model
    model = Model(Gurobi.Optimizer)

    #2 Define Variables
    @variable(model, x[1:n, 1:n], Bin)

    #3 Define Objextive
    @objective(model, Min, sum(distances[i, j] * x[i,j] for i in 1:n, j in 1:n))

    #4 Define Constraint
    for i in 1:n
        @constraint(model, sum(x[i, j] for j in 1:n) == 1)
    end

    for j in 1:n
        @constraint(model, sum(x[i, j] for i in 1:n) == 1)
    end

    # 4-1. No Self-loops
    for i in 1:n
        @constraint(model, x[i, i] == 0)
    end

    return model
end

function Gurobi_TSP_solver(distances)
    m = TSP_model(distances)
    @variable(m, t[2:n] >= 0)

    x = m[:x]

    # add all subtour elimination constraints
    for i=2:n
        for j=2:n
            @constraint(m, t[j] >= t[i] + n * x[i, j] - (n-1))
        end
    end

    optimize!(m)

    # get the optimal tour
    tour = get_tour(x, n)

    return tour, value.(x), objective_value(m)
end
