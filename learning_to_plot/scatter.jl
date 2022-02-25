using Plots

x_res = []
y_res = []

for i in 1:10
    push!(x_res, rand(1))
    push!(y_res, rand(1))
end

x_res
y_res

scatter(x_res, y_res)

