module ParcialFinal where

{-
problema esSudokuvalido (in m:seq(seq(Z)):Bool{
requiere: {todos los elementos de m tienen longitud 9}
requiere: {|m|=9}
requiere: {todos los elementos en todas las secuencias de m son numeros del 0 al 9}
asegura: {(res = True) <-> en cada fila de de m no se repiten numeros del 1 al 9 && en cada columna de m no
            se repiten numeros del 1 al 9}
}
-}


pertenece :: [Int] -> Int -> Bool
pertenece [] n = False
pertenece (x:xs) n
    |x == n = True
    |otherwise = pertenece xs n

hayRepetidos :: [Int] -> Bool -- verifica si hay repetidos
hayRepetidos [] = False
hayRepetidos (x:xs)
    |pertenece xs x == True = True
    |otherwise = hayRepetidos xs

secuenciasValidas :: [[Int]] -> Bool -- verifica si en cada secuencias NO hay repetidos 
secuenciasValidas [] = True
secuenciasValidas (x:xs) = not (hayRepetidos x) && secuenciasValidas xs

obtenerColumna :: [[Int]] -> [Int]
obtenerColumna [] = []
obtenerColumna (x:xs) |x==[] = []
obtenerColumna ((x:xs):ys) = [x] ++ obtenerColumna ys

eliminarPrimeros :: [[Int]] -> [[Int]]
eliminarPrimeros [] = []
eliminarPrimeros (x:xs) |x==[] = []
eliminarPrimeros ((x:xs):ys) = [xs] ++ eliminarPrimeros ys

obtenerColumnas :: [[Int]] -> [[Int]]
obtenerColumnas (x:xs) |x==[] = []
obtenerColumnas lista = obtenerColumna lista : obtenerColumnas (eliminarPrimeros lista)

esSudokuvalido :: [[Int]] -> Bool
esSudokuvalido lista = secuenciasValidas lista && secuenciasValidas (obtenerColumnas lista)