maximoValor :: [Int] -> Int
maximoValor (x:xs) = maximoValorAux xs x

maximoValorAux :: [Int] -> Int -> Int
maximoValorAux [] n = n
maximoValorAux (x:xs) n
    |x >= n = maximoValorAux xs x
    |otherwise = maximoValorAux xs n 

subSecuencia :: [Int] -> Int -> [Int]
subSecuencia lista hasta = subSecuenciaAux lista hasta 0

subSecuenciaAux :: [Int] -> Int -> Int -> [Int]
subSecuenciaAux [] _ _ = []
subSecuenciaAux (x:xs) hasta contador
    |contador <= hasta = [x] ++ subSecuenciaAux xs hasta (contador + 1)
    |otherwise = []

len :: [Int] -> Int
len [] = 0
len (x:xs) = 1 + len xs


maximoValorSubseq :: [Int] -> [Int] -> [Int]
maximoValorSubseq [] _ = []
maximoValorSubseq (x:xs) s2 
    |x > len s2 = [0] ++ maximoValorSubseq xs s2
    |otherwise = [maximoValor (subSecuencia s2 x)] ++ maximoValorSubseq xs s2