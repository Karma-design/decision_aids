function [ R ] = f2(A, b,lb)
%   minimiser les produits et mati�res premi�res en stock
        
    matSomme = ones(6, 1);
    [R,stock] = linprog(-1 * matSomme, A, b, [], [],lb, []);

    figure('Name','Responsable Atelier','NumberTitle','off');plot(R);
end
