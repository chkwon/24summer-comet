using JuMP, GLPK, Gurobi

m = Model(GLPK.Optimizer)

@variable(m, 0<=x1<=10)
@variable(m, x2>=0)
@variable(m, x3>=0)

@objective(m, Max, 5x1 + 3x2 + 2x3)

@constraint(m, c1, -x1+x2+3x3 <= 20)
@constraint(m, c2, x1+3x2+x3 <= 30)

print(m)

JuMP.optimize!(m)

println("Optimal Solutions:")
println("x1 = ", JuMP.value(x1))
println("x2 = ", JuMP.value(x2))
println("x3 = ", JuMP.value(x3))