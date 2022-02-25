using Plots



function michalewicz(x; m=10)
    return -sum(sin(v)*sin(i*v^2/π)^(2m) for
        (i,v) in enumerate(x));
end

# plot

heatmap(0:0.1:4, 0:0.1:4, (x, y)->michalewicz([x, y]))
