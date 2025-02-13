module Parcial where    

{-
ejercicio 1
-}

divisoresPropios :: Int -> [Int] --Funciona
divisoresPropios n = divisoresPropiosAux n 1

divisoresPropiosAux :: Int -> Int -> [Int]
divisoresPropiosAux n a 
    |a == n = []
divisoresPropiosAux n a 
    |n > 0 && mod n a == 0 = (a:(divisoresPropiosAux n (a+1)))
    |n > 0 && mod n a  /= 0 = divisoresPropiosAux n (a+1) 

{-
Ejercicio 2
son amigos si la suma de los divisores del otro si cada uno es la suma de los divisores propios de el otro
-}

sonAmigos :: Int -> Int -> Bool
sonAmigos a b 
    |a>0 && b>0 && a/=b && sumNumeros (divisoresPropios a) == b && sumNumeros (divisoresPropios b) == a = True
    |a>0 && b>0 && a/=b && (sumNumeros (divisoresPropios a) /= b || sumNumeros (divisoresPropios b) /= a) = False
    |a>0 && b>0 && a == b = False

sumNumeros :: [Int]->Int
sumNumeros [] = 0
sumNumeros (x:xs) = x + sumNumeros xs

{-
Ejercicio 3
-}

losPrimerosNPerfectos :: Int -> [Int] --Funciona
losPrimerosNPerfectos n = losPrimerosNPefectosAux n 1

esPerfecto :: Int -> Bool
esPerfecto x = sumNumeros(divisoresPropios x) == x

losPrimerosNPefectosAux :: Int -> Int -> [Int]
losPrimerosNPefectosAux 0 a = [] 
losPrimerosNPefectosAux n a 
    |esPerfecto a == True = (a:losPrimerosNPefectosAux (n-1) (a+1))
    |esPerfecto a == False = losPrimerosNPefectosAux n (a+1)


{-
Ejercicio 4
Dada una lista de numeros devuelve una lista de duplas de enteros donde cada una muestra los numeros amigos
-}

--Requiere 1, todos mayores a cero
mayoresQueCero :: [Int] -> Bool --Funciona
mayoresQueCero [x] = x>0
mayoresQueCero (x:xs) 
    |x > 0 = mayoresQueCero xs
    |otherwise = False

--Requiere 2, todos los numeros de la lista son distintos
distinto :: [Int] -> Bool
distinto [x] = True
distinto (x:y:xs) 
    |x==y = False
    |otherwise = distinto (x:xs)

distintos :: [Int] -> Bool --Funciona
distintos [] = True
distintos (x:xs) = distinto (x:xs) && distintos (xs)


{-ASEGURAS-}

listaDeAmigos :: [Int] -> [(Int, Int)] --Funciona
listaDeAmigos lista
    |(distintos lista && mayoresQueCero lista) == True = borrarMismos(borrarRepeticiones(listaDeAmigosAux lista))

listaDeAmigosAux :: [Int] -> [(Int,Int)]
listaDeAmigosAux [] = []
listaDeAmigosAux (x:xs) = ((encontrarAmigo (x:xs)):listaDeAmigosAux xs)

encontrarAmigo :: [Int] -> (Int, Int)
encontrarAmigo [x]=(0,0)
encontrarAmigo (x:y:ys) 
    |sonAmigos x y == True = (x, y)
    |otherwise = encontrarAmigo (x:ys)

borrarMismos :: [(Int, Int)] -> [(Int, Int)]
borrarMismos [] = []
borrarMismos ((a,b):duplas)
    |a==b = borrarMismos duplas
    |otherwise = ((a,b):borrarMismos duplas)

borrarRepeticiones :: [(Int, Int)] -> [(Int, Int)]
borrarRepeticiones []=[]
borrarRepeticiones [x] = [x]    
borrarRepeticiones ((a,b):(c,d):duplas)
    |(a,b)==(c,d) = ((a,b):borrarRepeticiones duplas)
    |(a,b)/=(c,d) && (c,d)==(b,a) = ((a,b):borrarRepeticiones duplas)
    |otherwise =  ((a,b):(c,d):borrarRepeticiones duplas)