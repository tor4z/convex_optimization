using Plots


function branin(x, a=1, b=5.1/(4π^2), c=5/π, r=6, s=10, t=1/(8π))
    return a * (x[2] - b * x[1]^2 + c * x[1] - r)^2 + s*(1-t) * cos(x[1]) + s;
end


# plot

contour(-50:50, -50:50, (x, y)->branin([x, y]))

