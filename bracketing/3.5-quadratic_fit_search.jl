#=
(a, ya) (b, yb) (c, yc)
====
q(x) = p1 + p2*x + p3 * x^2
====
ya = p1 + p2*a + p3 * a^2
yb = p1 + p2*b + p3 * b^2
yc = p1 + p2*c + p3 * c^2
=====
lagrange’s interpolating polynomial:
q(x) = ya * ((x-b)(x-c))/((a-b)(a-c)) +
       yb * ((x-a)(x-c))/((b-a)(b-c)) +
       yc * ((x-a)(x-b))/((c-a)(c-b))
=====
q'(x) = 1/2 * (ya(b^2-c^2)+yb(c^2-a^2)+yc(a^2-b^2))/(ya(b-c) + yb(c-a) + yc(a-b))
=#

function quadratic_fit_search(f, a, b, c, n)
    ya, yb, yc = f(x), f(x), f(c);
    for i in 1:n-3
        x = 0.5 * (ya(b^2-c^2)+yb(c^2-a^2)+yc(a^2-b^2))/
                  (ya(b-c) + yb(c-a) + yc(a-b));
        yx = f(x);
        if x > b
            if yx > yb
                c, yc = x, yx;
            else
                a, ya, b, yb = b, yb, x, yx;
            end
        elseif x < b
            if yx > yb
                a, ya = x, yx;
            else
                c, yc, b, yb = b, yb, x, yx;
            end
        end
    end
    return (a, b, c);
end
