using Plots


function rosenbrock(x; a=1, b=100)
    (a-x[1])^2 + b * (x[2] - x[1]^2)^2;
end

# plot

# contour(-2:0.1:2, -1:0.1:3, (x, y)->rosenbrock([x, y]))
heatmap(-2:0.01:2, -1:0.01:3, (x, y)->rosenbrock([x, y]))
