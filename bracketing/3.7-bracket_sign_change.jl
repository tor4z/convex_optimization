#=
Expanding the interval width until there is a sign change between the insterval.
=#

function bracket_sign_change(f′, a, b; k=2)
    if a > b; a, b = b, a; end
    center, half_width = (a+b)/2, (b-a)/2;
    while f′(a) * f′(b) > 0
        half_width *= k;
        a = center - half_width;
        b = center + half_width;
    end
    return (a, b);
end
