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

ultimo :: (Eq a) => [a] -> a
ultimo (x:[]) = x
ultimo (x:xs) 
    |(x:xs) /= [] = ultimo (xs)

{-
1.3
entendi que tengo que devolver la lista menos el ultimo el elemento
-}
--como me piden que el numero de elementos sea >1
contarElementos :: (Eq t) => [t] -> Int
contarElementos [] = 0
contarElementos [x] = 1
contarElementos lista   |lista /= [] = 1 + contarElementos(tail lista)

principio :: (Eq t) => [t] -> [t]
principio (a:b:[]) = [a]
principio (a:rLista) 
    |contarElementos (a:rLista) > 0 && (a:rLista) /= [] = (a:(principio rLista))

{-1.4 reverso, devuelve la lista al reves-}
reverso :: (Eq t)=> [t]->[t]
reverso []=[]
reverso [x]=[x]
reverso lista = ((ultimo lista):(reverso (principio lista)))
-------------------------------------------------------------------------------------------2
{-Ejercicio 2.1 -}
pertenece :: (Eq t) => t -> [t] -> Bool -- Eq significa cualquier tipo
pertenece (_) [] = False
pertenece x (y:ys)
    |x == y = True
    |otherwise = pertenece x ys

{-con pattern matching
pertenece x [] = False
pertenece x ys = x == head ys || pertenece x (tail ys)
-}

{-2.2-}
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [t] = True
todosIguales (t:ts) = t==(head ts) && todosIguales ts

{-2.3-}
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [t] = True
todosDistintos (t:ts) = t/=(head ts) && todosDistintos ts

{-Ejercicio 2.4, si hay repetidos en una lista es true-}
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

{-2.6-}
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos e lista 
    |pertenece e lista == True = quitarTodos e (quitar e lista)
    |otherwise= lista

{-2.7-}
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = [] 
eliminarRepetidos (x:xs) 
    |pertenece x xs = x:(eliminarRepetidos(quitarTodos x xs))
    |otherwise = (x:eliminarRepetidos xs)

{-2.8-}
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos lista1 lista2 = esSubConjunto lista1 lista2 ==True && esSubConjunto lista2 lista1 == True

esSubConjunto :: (Eq t) => [t] -> [t] ->Bool
esSubConjunto [x] lista = pertenece x lista
esSubConjunto (x:xs) lista = pertenece x (eliminarRepetidos(lista)) && esSubConjunto (eliminarRepetidos xs) lista 

{-2.9, un numero es capicua si se lee igual en ambos sentidos, ejemplo 11,112211, etc.-}
capicua :: (Eq t) => [t] -> Bool
capicua lista = lista == reverso lista

-------------------------------------------------------------------3
{-3.1, implementar sumatoria desde i=0 a n=elem(lista)-1 de una lista de numeros, osea la sumatoria de todos los elementos de la lista-}
sumatoria :: [Integer]->Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria(xs)

{-3.2, productoria, producto de los elementos de la lista.-}
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

{-
Ejercicio 3.3 
-}

maximo :: [Integer]->Integer
maximo (x:[]) = x -- es lo ultimo que recorre
maximo (x:y:ys) |contarElementos (x:y:ys) >1 && x>=y = maximo (x:ys) -- x>=y me evaluo de nuevo x con la cola que se dividira en en y':ys por la forma de la funcion, que quedara en maximo x:y':ys y asi hasya el caso de arriba 
                |contarElementos (x:y:ys) >1 && x<y = maximo (y:ys) -- si no es mayor o igual entonces es menor y quedaria maximo y:y':xs 

{-3.4, dados un numero n y una lista L, devuelvo una lista L' que es igual a los elementos de L pero sumado a cada uno n
asegura:
*|L'| = |L|
-}
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x+n]
sumarN n (x:xs) = ((x+n):sumarN n xs)

{-3.5, Dada una lista de numeros devuelvo otra con los elementos de la anterior pero sumando el primer elemento-}
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero lista
    |contarElementos lista > 0 = sumarN (head lista) lista
 
{-3.6, igual al anterior pero sumo el ultimo elemento-}
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo lista 
    |contarElementos lista > 0 = sumarN ultimoLista lista
    where ultimoLista = ultimo lista

{-3.7, dada una lista de numeros, devuelvo la lista pero solo con numeros pares.-}
pares :: [Integer] -> [Integer]
pares [x]   
    |esPar x == True = [x]
    |otherwise = []
pares (x:xs) 
    |esPar x == True = x:pares(xs)
    |otherwise = pares xs

esPar :: Integer -> Bool
esPar x = mod x 2 == 0
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

-----------------------------------------------------------------------------------------4
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

--compararTamaño :: []