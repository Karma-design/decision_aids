function [ R ] = f2(A, b,lb)
%   minimiser les produits et matières premières en stock
        
    matSomme = ones(6, 1);
    R = linprog(-1 * matSomme, A, b, [], [],lb, []);

end
