using Plots


function wheeler(x, a=1.5)
    return exp(-(x[1]*x[2] - a)^2 - (x[2] - a)^2);
end

# plot

heatmap(-10:0.01:25, -3:0.01:6, (x, y)->wheeler([x, y]))
