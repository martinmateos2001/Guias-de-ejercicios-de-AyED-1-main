{-
1)
golesDeNoGoleadores, devulve los goles que no fueron de los goleadores de equipo, osea que es igual a golesDeNoGoleadores = golesTotales - sum(golesDeGoleadores)
Requieres:
1-equiposValidos (goleadoresPorEquipo), donde goleadoresPorEquipo es la lista de la forma [(String, String)] donde en las duplas el primer componente es el nombre del equipo y la segunda el del jugador goleador
2-|goleadoresPorEquipo| = |goles| , donde goles es la lista del tipo [Int] que contiene los goles asociados al goleador
3- sea x un elemento de goles, todo x > 0
4- sum|goles|<=totalGolesTorneo
Asegura:
- res = totalGolesTorneo - sum|goles|
-}

--golesDeNoGoleadores :: [(String, String)] -> [Integer] -> Int


-- para el requiere 2
numElementos :: (Eq t) => [t] -> Integer
numElementos []=0
numElementos (x:xs) 
    |(x:xs) /= [] = 1 + numElementos xs

-- para el requiere 3
golesValidos :: [Integer] -> Bool
golesValidos [x] = x>=0
golesValidos (x:xs) = x >= 0 && golesValidos xs