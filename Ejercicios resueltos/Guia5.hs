{-
Ejercicio 1.1, devolver la cantidad de elementos de una lista
-}
longList :: (Eq t)=> [t]->Integer
longList [] = 0
longList (x:xs) 
    |(x:xs) /= [] = 1 + longList xs

{-
ejercicio 1.2, devolver el ultimo valor la lista.
-}

ultimo :: (Eq a)=> [a]->a
ultimo (x:[])=x
ultimo (x:xs) 
    |(x:xs) /= (x:[]) = ultimo (xs)

{-
Ejercicio 2.1 
-}

pertenece :: (Eq t) => t -> [t] -> Bool -- Eq significa cualquier tipo
pertenece _ [] = False
pertenece x (y:ys)
    |x == y = True
    |otherwise = pertenece x ys

{-con pattern matching
pertenece x [] = False
pertenece x ys = x == head ys || pertenece x (tail ys)
-}
{-
Ejercicio 2.4, si hay repetidos en una lista es true
-}

hayRepetidos :: (Eq t) => [t]-> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs  
-- cuando llega a hayRepetidos [] se rompe, entonces lo mando a False

{-
Ejercicio 2.5: 
implementar la funcion quitar :: (Eq t) => t -> [t] -> [t], que dados un entero x y una lista xs, elimina la primera aparici´on de x en la lista xs (de haberla).
-}
--si x se repite en la lista, elimino la primera aparicion
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:ys)
    |x==y {-&& x==head ys-} = ys -- agruegue el x==head xs porque sino cuando x es igual al primer elemento de la lista lo saca pero asi deja de funcionar el resto ¿ :| ?
    |otherwise = y:quitar x ys 

{-
Ejercicio 3.3 
-}

maximo :: [Integer]->Integer
maximo (x:[]) = x -- es lo ultimo que recorre
maximo (x:y:ys) |x>=y = maximo (x:ys) -- x>=y me evaluo de nuevo x con la cola que se dividira en en y':ys por la forma de la funcion, que quedara en maximo x:y':ys y asi hasya el caso de arriba 
                |otherwise = maximo (y:ys) -- si no es mayor o igual entonces es menor y quedaria maximo y:y':xs 

{-
Ejercicio 3.9, ordenar la lista de forma creciente (menor a mayor) | pista dada por la profesora: usar maximo y quitar.
-}
--puedo usar maximo y concatenar con el maximo de la cola
ordenar :: [Integer]->[Integer]
ordenar (x:[])= (x:[])
ordenar (x:y:ys) = menor(x:y:ys):ordenar(quitar (menor (x:y:ys)) (x:y:ys))

--defino la funcion menor para poder ordenar pero no es necesaria porque al ir agregando los mayores van quedando al final, en cambio si uso esta funcion siempre obtengo una lista de menores
menor :: [Integer]->Integer
menor (x:[]) = x
menor (x:y:ys)
    |x<=y = menor(x:ys)
    |otherwise = menor(y:ys) 


{-
ejercicio 4a) sacar blancos repetidos, reemplazar cada subsecuencia de blancos contiguos de primera lista por un solo blanco en la lista resultado.
-}
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos (x:[]) = (x:[])
sacarBlancosRepetidos (x:y:ys)
    |x== ' ' && y==x = sacarBlancosRepetidos (x:ys)
    |otherwise = (x:sacarBlancosRepetidos(y:ys))

{-
4b, contar palabras, dada una lista de caracteres devuelve la cantidad de palabras que tiene.
-}
contP :: [Char]->Integer
contP (x:[]) = 1
contP (x:y:ys)
    |x/=y && y==' ' = 1 + contP (y:ys)
    |otherwise = 0 + contP (y:ys)


{-
4D, dada una lista de caracteres devuelve la palabra mas larga.
-}

palabraMasLarga :: [Char]->[Char]
palabraMasLarga (x:[])=(x:[])
palabraMasLarga (x:y:ys) 
    |contadorChar (primerPalabra(x:y:ys)) >= contadorChar(primerPalabra(cortarLista (x:y:ys))) = primerPalabra (x:y:ys)
    |otherwise = palabraMasLarga (cortarLista(x:y:ys))

contadorChar :: [Char]->Integer
contadorChar (x:y:ys) | x==' ' = 0
contadorChar (x:y:ys)
    |x /= ' ' = 1 + contadorChar (y:ys)

cortarLista :: [Char]->[Char]
cortarLista (x:y:ys) 
    |x/=y && y == ' ' = ys
    |otherwise = cortarLista(y:ys)

primerPalabra :: [Char]->[Char]
primerPalabra (x:y:ys) 
    |y==' ' = (x:[])
    |otherwise = (x:primerPalabra(y:ys))

compararTamaño :: []