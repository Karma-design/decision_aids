function [] = StockProdChart( A, b, ProdMax)

    for pourcentage=50:100,
       Prod = respStock( A, b, ProdMax, Ratio/100);
       ProdTotal = ones(1, 6) * Prod;
       
    end

end