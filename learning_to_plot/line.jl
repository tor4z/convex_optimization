using Plots

p = plot()
plot!(p, 1:5, rand(5))
plot!(p, 1:5, rand(5))
vline!(p, [1, 2, 3])
