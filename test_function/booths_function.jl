using Plots

function booth(x)
    return (x[1] + 2x[2] - 7)^2 + (2x[1] + x[2] - 5)^2;
end

# plot

contour(-30:0.1:30, -30:0.1:30, (x, y)->booth([x, y]))
