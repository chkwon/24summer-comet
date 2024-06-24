using Concorde

M = [
     0  16   7  14;
    16   0   3   5;
     7   3   0  16;
    14   5  16   0 ;
]
opt_tour, opt_len = solve_tsp(M)

println(opt_len)
println(opt_tour)