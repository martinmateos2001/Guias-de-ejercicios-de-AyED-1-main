module Final1807 where

{-
problema esSudokuvalido (in m:seq(seq(Z)):Bool{
requiere: {todos los elementos de m tienen longitud 9}
requiere: {|m|=9}
requiere: {todos los elementos en todas las secuencias de m son numeros del 0 al 9}
asegura: {(res = True) <-> en cada fila de de m no se repiten numeros del 1 al 9 && en cada columna de m no
            se repiten numeros del 1 al 9}}
-}

listaValida :: [Int] -> Bool --si no hay repetidos da True
listaValida [] = True
listaValida (x:xs)    
    |(elem x xs == True) && (x /= 0) = False
    |otherwise = listaValida xs

filasValidas :: [[Int]] -> Bool
filasValidas [] = True
filasValidas [[]] = True
filasValidas (x:xs) = listaValida x && filasValidas xs

obtenerColumna :: [[Int]] -> [Int]
obtenerColumna [] = []
obtenerColumna [[]] = []
obtenerColumna (x:xs) = [head x] ++ obtenerColumna xs 

sacarColumna :: [[Int]] -> [[Int]]
sacarColumna [] = []
sacarColumna [x]
    |null x == True = []
    |otherwise = [tail x]
sacarColumna (x:xs) = (tail x:sacarColumna xs)