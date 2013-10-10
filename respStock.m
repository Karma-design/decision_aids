function [ R ] = respStock( A, b, ProdMax, Ratio)
%   minimiser les produits et matières premières en stock
    
    Aeq = ones(1,6);
    beq = Ratio * ProdMax;
    lb = zeros(6, 1);
    stockTotal = [5 4 6 8 9 4];
    
    R = linprog(stockTotal, A, b, Aeq, beq,lb, []);

end

