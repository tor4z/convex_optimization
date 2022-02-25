function bracket_minimum(f, x=0.0, s=1e-2, k=2)
    
end


function minimize(f, a, b)
    # Brent-Dekker method

end


function line_search(f, x, d)
    obj = α -> f(x + α*d);
    a, b = bracket_minimum(obj);
    α = minimize(obj, a, b);
    return x + α * d;
end
