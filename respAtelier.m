function [ R ] = respAtelier(A, b)
%   minimiser les produits et mati�res premi�res en stock
    
    lb = zeros(6, 1);
    
    matSomme = ones(6, 1);
    R = linprog(-1 * matSomme, A, b, [], [],lb, []);

end
