using Plots


function circle(x)
    θ = x[1];
    r = 1/2 + 1/2 * (2*x[2]/(1+x[2]^2));
    return [1-r*cos(θ), 1-r*sin(θ)];
end
