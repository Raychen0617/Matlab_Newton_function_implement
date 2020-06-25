function [root] = rootfind(P)
root = [];
x0 = 1;

    while polynomialDegree(P)>0
        for i=1:1000
                g = diff(P);
                x1 = x0
                x0 = x0-subs(P,x0)/subs(g,x0)
                if abs(subs(P,x0))<0.001
                    P = deconv( sym2poly(P), sym2poly(poly2sym([1,-x0]) ) )
                    P = poly2sym(P)
                    root = [root;vpa(x0)]
                    break;
               end
        end
    end
end
