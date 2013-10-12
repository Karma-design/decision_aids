function [ R ] = f3( A, b, lb, ProdMax, Ratio)
%   minimiser les produits et matières premières en stock
    
    Aeq = ones(1,6);
    beq = Ratio * ProdMax;
    stockTotal = [5 4 6 8 9 4];
    
    R = linprog(stockTotal, A, b, Aeq, beq,lb, []);

end
