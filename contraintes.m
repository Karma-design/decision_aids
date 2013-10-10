function [A, b, lb, t, q, Q, pv, pa, c] = contraintes()
% définition des matrices et vecteurs de contraintes A, b  et d'autres paramètres

% A : matrice de contraintes
% Colonnes: Produits (A, B,... F)
% Lignes: Machines (1, 2,... 7) puis Matières premières (MP1, MP2, MP3)
A = [11 15 0 5 0 10;
    0 1 2 8 7 12;
    12 1 11 0 10 15;
    2 10 5 4 13 7;
    15 0 0 0 10 25;
    5 5 13 12 8 0;
    5 3 5 28 0 7;
    1 1 1 5 0 2;
    2 2 1 0 2 1;
    1 0 3 2 6 0];

% b: contraintes à respecter (même sens que les lignes de A)
b = [4800;
     4800;
     4800;
     4800;
     4800;
     4800;
     4800;
     650;
     820;
     585];

Q = [650; 820; 585];
lb = zeros(6,1);
t = [11 0 12 2 15 5 5;15 1 1 10 0 5 3;0 2 11 5 0 13 5;5 8 0 4 0 12 28;0 7 10 13 10 8 0;10 12 15 7 25 0 7];
q = [1 1 1 5 0 2;2 2 1 0 2 1;1 0 3 2 6 0];
pv = [28 20 30 37 45 22];
pa = [3 4 2];
c = [2 2 1 1 2 3 1];

end
