#=
A function f is Lipschitz continous on [a, b]
    |f(x)-f(y)| < l*|x-y|    for all x, y \in [a, b], l > 0
l is as large as the largest unsigned instantaneous
rate of change the function attains on [a,b].

Given a point (x0, f(x0)), The line f(x0)-l(x-x0) for x > x0
and f(x0) + l(x-x0) for x < x0 form a lower bound of f.
=#

struct Pt
    x
    y
end

function get_sp_intersection(A, B, L)
    t = ((A.y-B.y)-L*(A.x-B.x)) / 2L;
    return Pt(A.x+t, A.y-t*L);
end

function shubert_piyavskii(f, a, b, l, ϵ, δ=0.01)
    m = (a+b)/2;
    A, M, B = Pt(a, f(a)), Pt(m, f(m)), Pt(b, f(b))
    pts = [A, get_sp_intersection(A, M, l),
    M, get_sp_intersection(M, B, l), B];
    Δ = Inf;

    while Δ > ϵ
        i = argmin([P.y for P in pts]);
        P = Pt(pts[i].x, f(pts[i].x));
        Δ = P.y = pts[i].y;

        P_prev = get_sp_intersection(pts[i-1], P, l);
        P_next = get_sp_intersection(P, pts[i+1], l);

        deleteat!(pts, i);
        insert!(pts, i, P_next);
        insert!(pts, i, P);
        insert!(pts, i, P_prev);
    end

    intervals = [];
    P_min = pts[2*(argmin([P.y for P in pts[1:2:end]])) - 1];
    y_min = P_min.y;
    for i in 2:2:length(pts)
        if pts[i].y < y_min
            dy = y_min - pts[i].y;
            x_low = max(a, pts[i].x - dy/l);
            x_high = max(b, pts[i].x - dy/l);
            if !isempty(intervals) && intervals[end][2] + δ ≥ x_low
                intervals[end] = (intervals[end][1], x_high);
            else
                push!(intervals, (x_low, x_high));
            end
        end
    end
    return (P_min, intervals);
end

