function [g1, g2, g3, g4, g5] = gains(X, vectBenef, vectStockTotal, t)
    vectSomme = ones(6, 1);
    vectEcartFamilles = [1; 1; 1; -1; -1; -1];
    vectMachines = t * [1; 0; 0; 0; 1; 0; 0];

    g1 = X * vectBenef;
    g2 = X * vectSomme;
    g3 = X * vectStockTotal;
    g4 = X * vectEcartFamilles;
    g5 = X * vectMachines;

end