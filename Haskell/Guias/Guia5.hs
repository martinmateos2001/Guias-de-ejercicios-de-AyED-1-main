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

ultimo :: (Num a) => [a] -> a
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

{-
1.3
entendi que tengo que devolver la lista menos el ultimo el elemento
-}
--como me piden que el numero de elementos sea >1
contarElementos :: (Eq t) => [t] -> Int
contarElementos [] = 0
contarElementos [x] = 1
contarElementos lista   |lista /= [] = 1 + contarElementos(tail lista)

sacarUltimoElementoLs :: (Num t) => [t] -> [t]
sacarUltimoElementoLs [x] = []
sacarUltimoElementoLs (a:b:[]) = [a]
sacarUltimoElementoLs (a:rLista) = a:sacarUltimoElementoLs(rLista)

{-1.4 reverso, devuelve la lista al reves-}
reverso :: (Num t)=> [t] -> [t]
reverso []=[]
reverso [x]=[x]
reverso lista = ((ultimo lista):(reverso (sacarUltimoElementoLs lista)))
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

{-2.9, un numero es capicua si se lee igual en ambos sentidos, ejemplo 11,112211, etc.
capicua :: (Eq t) => [t] -> Bool
capicua lista = lista == reverso lista
-}
-------------------------------------------------------------------3
{-3.1, implementar sumatoria desde i=0 a n=elem(lista)-1 de una lista de numeros, osea la sumatoria de todos los elementos de la lista-}
sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria(xs)

{-3.2, productoria, producto de los elementos de la lista.-}
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

{-
Ejercicio 3.3 
-}

maximo :: [Integer] -> Integer
maximo (x:[]) = x -- es lo ultimo que recorre
maximo (x:y:ys) |x>=y = maximo (x:ys) -- x>=y me evaluo de nuevo x con la cola que se dividira en en y':ys por la forma de la funcion, que quedara en maximo x:y':ys y asi hasya el caso de arriba 
                |x<y = maximo (y:ys) -- si no es mayor o igual entonces es menor y quedaria maximo y:y':xs 

{-3.4, dados un numero n y una lista L, devuelvo una lista L' que es igual a los elementos de L pero sumado a cada uno n
asegura:
*|L'| = |L|
-}
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x+n]
sumarN n (x:xs) = ((x+n):sumarN n xs)

{-3.5, Dada una lista de numeros devuelvo otra con los elementos de la anterior pero sumando el primer elemento-}
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero lista = sumarN (head lista) lista
 
{-3.6, igual al anterior pero sumo el ultimo elemento-}
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo lista = sumarN u lista
    where u = ultimo lista

{-3.7, dada una lista de numeros, devuelvo la lista pero solo con numeros pares.-}
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) 
    |esPar x == True = x:pares(xs)
    |otherwise = pares xs

esPar :: Integer -> Bool
esPar x = mod x 2 == 0

{-3.8, dada una lista y un numero, devuelvo otra lista con los numeros que son multiplos del numero.-}
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) 
    |esMultiplo x n = x:multiplosDeN n xs
    |otherwise = multiplosDeN n xs

esMultiplo :: Integer -> Integer -> Bool -- leer como ¿a esMultiplo de b?
esMultiplo a b = mod a b == 0

{-Ejercicio 3.9, ordenar la lista de forma creciente (menor a mayor) | pista dada por la profesora: usar maximo y quitar.
Uso la funcion menor, concatenar (:) y quitar, para ir armanda la lista de menor a mayor.-}
ordenar :: [Integer]->[Integer]
ordenar [] = []
ordenar lista = (menor lista):ordenar(quitar (menor lista) lista)

--defino la funcion menor para poder ordenar agregando el menor de la lista primero.
menor :: [Integer]->Integer
menor [x] = x
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
cantP :: [Char]->Integer
cantP [x, y]
    |x == ' ' && y == x = 0
    |x /= ' ' || y /= ' ' = 1
cantP (x:y:ys)
    |x/=y && y==' ' = 1 + cantP (y:ys)
    |otherwise = 0 + cantP (y:ys)

{-4c, palabras :: [Char] -> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original
¿Que herramientas tengo?-}
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras lista = [obtenerPalabra lista] ++ palabras (cortarLista lista)

obtenerPalabra :: [Char]->[Char]
obtenerPalabra [] = []
obtenerPalabra [x]
    |x == ' ' = []
    |otherwise = [x]
obtenerPalabra (x:y:ys) 
    |x/= ' ' && y ==' ' = (x:[])
    |x/= ' ' && y /= ' ' = (x:(obtenerPalabra (y:ys)))
    |x == ' ' && y /= ' ' = obtenerPalabra (y:ys)
    |x == ' ' && y == ' ' = obtenerPalabra ys

cortarLista :: [Char]->[Char]
cortarLista [] = []
cortarLista [x] = []
cortarLista (x:y:ys) 
    |x /= ' ' && y == ' ' = (y:ys)
    |x /= ' ' && y /= ' ' = cortarLista (y:ys)
    |x == ' ' && y == ' ' = cortarLista (y:ys)
    |x == ' ' && y /= ' ' = (y:ys)
{-
4D, dada una lista de caracteres devuelve la palabra mas larga.
-}
palabraMasLarga :: [Char]->[Char]
palabraMasLarga [x]
    |x /= ' ' = []
    |otherwise = [x]
palabraMasLarga lista = palabraMasLargaAux (obtenerPalabra lista) (palabras (cortarLista lista))

palabraMasLargaAux :: [Char] -> [[Char]] -> [Char]
palabraMasLargaAux x [] = x
palabraMasLargaAux w1 (x:xs) 
    |contadorChar w1 >= contadorChar x = palabraMasLargaAux w1 xs
    |otherwise = palabraMasLargaAux x xs

contadorChar :: [Char]->Int
contadorChar [] = 0
contadorChar (x:xs)
    |x /= ' ' = 1 + contadorChar xs
    | x==' ' = 0 + contadorChar xs


{-
4E:  aplanar :: [[char]] -> [char]
A partir de una lista de palabras arma una lista de caracteres concatenandolas
-}

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (p:ps) = p ++ aplanar ps

{-
4F: aplanarConBlancos :: [[char]] -> [char]
Aplanar pero insertando blancos entre cada palabra
-}
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [x] = x
aplanarConBlancos (p:ps) = p ++ [' '] ++ aplanarConBlancos ps

{-
4G: aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
A partir de una lista de palabras y un entero n,
arma una lista de caracteres concatenandolas e insertando n blancos entre cada palabra (n debe ser no negativo).
-}

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [x] n = x 
aplanarConNBlancos (p:ps) n = p ++ (nBlancos n) ++ aplanarConNBlancos ps n

nBlancos :: Integer -> [Char]
nBlancos 1 = [' ']
nBlancos n = [' '] ++ nBlancos (n-1)

-------------------------------------------------------------- 5
{-
5.1 sumaAcumulada :: (Num t) => [t] -> [t]
problema sumaAcumulada (s: seq⟨T⟩) : seq⟨T⟩ {
requiere: {T es un tipo num´erico}
requiere: {cada elemento de s es mayor estricto que cero}
asegura: {|s| = |resultado| ∧ el valor en la posici´on i de resultado es Sum(k=0, i) s[k]}

osea si s = [1,2,3], res=[1, 1+2, 1+2+3]
}
-}

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [x] = [x]
sumaAcumulada lista = reverso (sumaAcumuladaAux lista)

sumaAcumuladaAux :: (Num t) => [t] -> [t]
sumaAcumuladaAux [x] = [x]
sumaAcumuladaAux lista = [sumatoria(lista)] ++ sumaAcumuladaAux(sacarUltimoElementoLs lista)

{-
5.2 descomponerEnPrimos :: [Integer] -> [[Integer]]
Ejemplo: descomponerEnPrimos [2, 10, 6] es [[2], [2, 5], [2, 3]].
-}

esPrimo :: Integer -> Bool
esPrimo n = esPrimoAux n (n-1)

esPrimoAux :: Integer -> Integer -> Bool
esPrimoAux n 1 = True
esPrimoAux n k
    |mod n k == 0 = False
    |otherwise = esPrimoAux n (k-1)

factorizarEnPrimos :: Integer -> [Integer]
factorizarEnPrimos n = factorizarEnPrimosAux n 2


factorizarEnPrimosAux :: Integer -> Integer -> [Integer] 
factorizarEnPrimosAux n k |k == n  = []
factorizarEnPrimosAux n k 
    |esPrimo k == True && mod n k == 0 = [k] ++ factorizarEnPrimosAux n (k+1)
    |otherwise = factorizarEnPrimosAux n (k+1)

descomponerEnPrimosAux :: [Integer] -> [[Integer]]
descomponerEnPrimosAux [] = []
descomponerEnPrimosAux (x:xs)
    |esPrimo x == True = [[x]] ++ descomponerEnPrimosAux xs
    |otherwise = [factorizarEnPrimos x] ++ descomponerEnPrimosAux xs

dividir :: Integer -> Integer -> Integer --division entre enteros, require n 'mod' k = 0
dividir n k |n == k = 1 
dividir n k
    |n-k /= 0 = 1 + dividir (n-k) k

productoLista :: [Integer] -> Integer
productoLista [] = 1
productoLista (x:xs) = x * productoLista xs

descomponerEnPrimosAux2 :: [Integer] -> [[Integer]] -> [[Integer]]
descomponerEnPrimosAux2 [] [] = []
descomponerEnPrimosAux2 (x:xs) (y:ys) 
    |dividir x (productoLista y) == 1 = (y:descomponerEnPrimosAux2 xs ys)
    |otherwise = (((dividir x (productoLista y)):y):descomponerEnPrimosAux2 xs ys)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos lista = descomponerEnPrimosAux2 lista (descomponerEnPrimosAux lista)