using Plots

function ackley(x, a=20, b=0.2, c=2π)
    d = length(x);
    return -a * exp(-b * sqrt(sum(x.^2)/d)) - 
                exp(sum(cos(c*xi) for xi in x)/d) + a + exp(1);
end


# plot

contour(-30:0.1:30, -30:0.1:30, (x, y)->ackley([x,y]))
heatmap(-30:0.1:30, -30:0.1:30, (x, y)->ackley([x,y]))
