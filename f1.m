function [ X,benef ] = f1(vectBenef,A,b,lb)

    [X,benef] = linprog(-vectBenef,A,b,[],[],lb,[]);
    benef = -benef;
end