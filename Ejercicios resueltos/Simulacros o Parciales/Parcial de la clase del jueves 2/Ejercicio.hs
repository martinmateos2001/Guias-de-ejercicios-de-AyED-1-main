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

golesDeNoGoleadores :: [(String, String)] -> [Integer] -> Integer -> Integer
golesDeNoGoleadores goleadoresPorEquipo goles totalGolesTorneo
    |(equiposValidos(goleadoresPorEquipo) && numElementos(goleadoresPorEquipo) == numElementos(goles) && golesValidos(goles) && sumElementos(goles) <= totalGolesTorneo) == True = totalGolesTorneo - sumElementos(goles)

-- para el requiere 2
numElementos :: (Eq t) => [t] -> Integer
numElementos []=0
numElementos (x:xs) 
    |(x:xs) /= [] = 1 + numElementos xs

-- para el requiere 3
golesValidos :: [Integer] -> Bool
golesValidos [x] = x>=0
golesValidos (x:xs) = x >= 0 && golesValidos xs

-- para el requiere 4
sumElementos :: [Integer] -> Integer
sumElementos [] = 0 
sumElementos (x:xs) = x + sumElementos (xs) 

{-
para el requiere 1 que es el EJERICICIO 2.
Da True si y solo si goleadoresPorEquipo no contiene nombres de clubes repetidos (1), ni goleadores repetidos (2), ni jugadores con nombre de club (3).
-Por 3 si (a,b) -> a/=b
-Por 2 si (a,b) y (c,d) -> b/=d
-Por 1 si (a,b) y (c,d) -> a/=c

-}

equiposValidos :: [(String,String)] -> Bool
equiposValidos [x] = equipoValido [x]
equiposValidos (equipo:rDeEquipos) = equipoValido (equipo:rDeEquipos) && equiposValidos (rDeEquipos)

equipoValido :: [(String,String)] -> Bool
equipoValido [(a,b)] = a/=b
equipoValido ((a,b):(c,d):ts) = a/=c && b/=d && equipoValido((a,b):ts) --osea que cuando llegue a (a,b):[], (a,b) es distinto de todas lista y por consiguiente si a/=b cumple con las condiciones.

{-
problema porcentajeDeGoles (goleador: String, goleadoresPorEquipo: seq⟨String x String⟩,goles:seq< Z >) : R
REQUIERE:
1- (a,b) perteneciente a goleadoresPorEquipo --> b=goleador 
2- EquiposValidos(goleadoresPorEquipo) 
3- |goleadoresPorEquipo| = |goles|
4- Todos los elementos de goles son mayores o iguales a 0
5- Hay al menos un elemento de goles mayores estricto a 0
ASEGURA:
- res= golDeGoleador*100/sum(goles)
-}

mayorQueCero :: [Integer] -> Bool
mayorQueCero [x] = x>0
mayorQueCero (x:xs) = x > 0 || mayorQueCero xs

--Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:
division :: Integer -> Integer -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeGoles :: String -> [(String,String)] -> [Integer] -> Float
porcentajeDeGoles goleador goleadoresPorEquipo goles = goleadorPorcentaje goleador goleadoresPorEquipo goles goles

requiereEJ3 :: String -> [(String,String)] -> [Integer] -> Bool
requiereEJ3 goleador goleadoresPorEquipo goles = mayorQueCero(goles) && equiposValidos(goleadoresPorEquipo) && numElementos(goleadoresPorEquipo) == numElementos(goles) && golesValidos(goles) 

goleadorPorcentaje :: String -> [(String,String)] -> [Integer] -> [Integer] -> Float
goleadorPorcentaje goleador ((a,b):restoDeGoleadoresPorEquipo) (gol:restoDeGoles) goles   
    |requiereEJ3 goleador ((a,b):restoDeGoleadoresPorEquipo) goles == True && goleador == b = division (100*gol) (sumElementos(goles))
    |requiereEJ3 goleador ((a,b):restoDeGoleadoresPorEquipo) goles == True && goleador /= b = goleadorPorcentaje goleador restoDeGoleadoresPorEquipo restoDeGoles goles 

{-
Ejercicio 4, Botín de Oro.
botinDeOro (goleadoresPorEquipo: seq⟨String x String⟩, goles:seq< Z >) : String
REQUIERE:
- equiposValidos(goleadoresPorEquipo)
- |goleadoresPorEquipo| = |goles|
- Todos los elementos de goles son mayores o iguales a 0
- |goles| > 0
ASEGURA:
- res = goleador con mas goles. 
-}

aseguraEj4 :: [(String, String)] -> [Integer] -> Bool
aseguraEj4 goleadoresPorEquipo goles = equiposValidos(goleadoresPorEquipo) && numElementos(goleadoresPorEquipo) == numElementos(goles) && golesValidos(goles) && numElementos(goles) > 0

numMayor :: [Integer] -> Integer
numMayor [x] = x
numMayor (x:y:xs) 
    |x>=y = numMayor (x:xs)
    |otherwise = numMayor (y:xs)

botinDeOro :: [(String, String)] -> [Integer] -> String
botinDeOro (goleador:restoDeGoleadoresPorEquipo) (gol:restoDeGoles) 
    |aseguraEj4 (goleador:restoDeGoleadoresPorEquipo) (gol:restoDeGoles) == True && gol == numMayor(gol:restoDeGoles) = snd(goleador)
    |aseguraEj4 (goleador:restoDeGoleadoresPorEquipo) (gol:restoDeGoles) == True && gol /= numMayor(gol:restoDeGoles) = botinDeOro restoDeGoleadoresPorEquipo restoDeGoles