{-
NUMEROS
+, -, /, * --> suma, resta, division, multiplicacion
x^n --> x elevado a la n, con n natural
x^^n --> x elevado a la n, con n entero
x**y --> x elevado a la y, con y racional
sqrt x --> raiz cuadrada de x


BOOLEANOS
<, <=, >, >= --> menor, menor o igual, mayor, mayor o igual
x == y --> verifica si x es igual a y 
x /= y --> verifica si x es distinto de y
and 'o' && --> conjuncion
or 'o' || --> disyuncion
even x --> verifica si x es par
odd x --> verifica si x es impar


OPERACIONES
abs x --> valor absoluto de x
ceiling x --> menor entero no menor que x
floor x --> mayor entero no mayor que x
div x y --> division entera de x entre y
gcd x y --> maximo comun divisor de x e y
lcm x y --> minimo comun multiplo de x e y
max x y --> maximo de x e y, ej: max 2 10 = 10
min x y --> minimo de x e y, ej: min 2 10 = 2
mod x y --> resto de la division entera de x entre y
divMod x y = (div x y, mod x y), ej: divMod 8 3 = (2, 2)
fromIntegral x :: TIPO --> transforma el tipo entero a el TIPO NUMERICO correspondiente
truncate x --> parte entera de x

LISTAS NUMERICAS
sum xs --> suma de la lista numerica
product xs --> producto de la lista numerica
-}



{-
LISTAS

VERIFICACIONES
null xs --> verifica si la lista está vacía
elem n xs --> verifica si n Pertenece a xs
notElem n xs --> verifica si n No Pertence a xs
all p xs --> verifica si todos los elementos de xs cumplen la propiedad p
any p xs --> verifica si algun elemento de xs cumple la propiedad p
length xs --> devuelve el numero de elementos
maximum xs --> maximo elemento de la lista xs
minimum xs --> minimo elemento de la lista xs

MANIPULACIONES
x:xs --> añade el elemento x al principio de xs
concat [xs, ys] = xs ++ ys --> concatenacion de listas, ej: [1,2] ++ [2,5] = [1,2,2,5] 
xs !! n --> obtiene el elemento en la posicion 
reverse xs --> devuelve la lista en orden inverso
head xs --> devuelve el primer elemento de xs
last xs --> devuelve el último elemento de xs
init xs --> lista obtenia al eliminar el úlitmo elemento de xs
tail xs --> devuelve la lista eliminando el primer elemento
take n xs --> es la lista de los primeros n elementos de xs, ej: take 2 [0,1,2] = [0,1]
drop n xs --> elimina los primeros n elementos de xs
takeWhile p xs --> devuelve la lista de elementos de xs que cumplen la proposicion p

Librería Data.List
xs \\ ys --> lista de los elementos de xs que no pertencen a ys, ej: [3,2,5,7] \\ [5,6,3] = [2,7]
delete x ys --> borra la primera aparicion de x en ys
find p xs --> toma el primer elemento de xs que cumpla la proposicion p
nub xs --> elimina elementos repetidos de xs
sort xs --> ordena de menor a mayor los elementos de xs
union xs ys --> es la union de xs e ys
-}