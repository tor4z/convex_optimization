function golden_search(f, a, b, n)
    ϕ = (1 + √5) / 2;
    ρ = ϕ-1;
    d = ρ * b + (1-ρ) * a;
    yd = f(d);
    for i in 1: n-1
        c = ρ*a + (1-ρ)*b;
        yc = f(c);
        if yc < yd
            b, d, yd = d, c, yc;
        else
            a, b = b, c
        end
    end
    return a < b ? (a, b) : (b, a)
end
