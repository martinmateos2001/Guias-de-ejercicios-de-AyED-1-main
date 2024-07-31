{-
problema esSudokuvalido (in m:seq(seq(Z)):Bool{
requiere: {todos los elementos de m tienen longitud 9}
requiere: {|m|=9}
requiere: {todos los elementos en todas las secuencias de m son numeros del 0 al 9}
asegura: {(res = True) <-> en cada fila de de m no se repiten numeros del 1 al 9 && en cada columna de m no
            se repiten numeros del 1 al 9}
}
-}
hayRepetidos :: [Int] -> Bool
hayRepetidos lista = hayRepetidosAux lista lista

hayRepetidosAux :: [Int] -> [Int] -> Bool
hayRepetidosAux lista (x:xs) = esRepetido lista x || hayRepetidosAux lista xs

esRepetido :: [Int] -> Int -> Bool
esRepetido [] n = False
esRepetido (x:xs) n
    |x==n = True
    |otherwise = esRepetido xs n

obtenerColumna :: [[Int]] -> [Int]
obtenerColumna [] = []
obtenerColumna (x:xs) = [head (x)] ++ obtenerColumna xs 

obtenerColumnas :: [[Int]] -> [[Int]]
obtenerColumnas [] = []
obtenerColumnas lista = [obtenerColumna(lista)] ++ obtenerColumnas(tail lista)

secuenciaValida :: [[Int]] -> Bool
secuenciaValida [] = True
secuenciaValida (x:xs) = not (hayRepetidos x && secuenciaValida xs)

esSudokuvalido :: [[Int]] -> Bool
esSudokuvalido lista = secuenciaValida lista && hayRepetidos(obtenerColumnas lista)