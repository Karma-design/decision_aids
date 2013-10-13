function [ X ] = f1(vectBenef,A,b,lb)

    [X,benef] = linprog(-vectBenef,A,b,[],[],lb,[]);
    
    %figure('Name','Comptable','NumberTitle','off');plot(benef);
end
