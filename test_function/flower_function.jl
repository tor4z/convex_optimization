using LinearAlgebra
using Plots


function flower(x, a=1, b=1, c=4)
    return a * norm(x) + b * sin(c * atan(x[2], x[1]));
end


contour(-3:0.1:3, -3:0.1:3, (x, y)->flower([x, y]))
