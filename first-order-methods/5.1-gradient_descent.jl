using Plots

abstract type DescentMethod end


struct GradientDescent <: DescentMethod
    α
end

# init! function does nothing.
init!(M::GradientDescent, f, ∇f, x) = M;

function step!(M::GradientDescent, f, ∇f, x)
    α, g = M.α, ∇f(x);
    return x - α*g;
end

# test

A = rand(2, 2);
b = rand(2);
c = rand(2);
x = rand(2);


f = (x) -> 1/2 * x'*A*x + b'*x .+ c
∇f = (x) -> 1/2 * (A + A') * x + b


p = contour(-10:0.1:10, -10:0.1:10, (x, y)->sum(f([x, y])))
scatter!(p, [x[1]], [x[2]])

m = GradientDescent(0.5);
init!(m, f, ∇f, x);
x_res = [];
y_res = [];

for i in 1:100
    x = step!(m, f, ∇f, x)
    push!(x_res, [x[1]])
    push!(y_res, [x[2]])
end

x_res
y_res

scatter!(p, x_res, y_res)

x_res
y_res



