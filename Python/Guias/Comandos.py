"""
FUNCIONES 

Módulo math --> https://docs.python.org/es/3.10/library/math.html 
import math --> importa el modulo
math.pi --> numero pi
math.sqrt(x) --> raiz cuadrada de x


ARREGLOS
Modulo array --> https://docs.python.org/es/3.10/library/array.html#module-array
    Tambien puede usarse el NumPy
from array import * --> importa todas las funciones del modulo

LISTAS
ls:list[Tipo] = [] --> lista vacia
ls[x] --> devuelve el elemento en la posicion x
ls[x] [i] --> para listas anidadas
ls[i] = x --> cambia el valor del elemento en la posicion i de la lista por x
ls.append(x) --> añade a x al final de la lista
ls.remove(x) --> elimina la primera aparicion de x en la lista
ls.count(x) --> devuelve el numero de apariciones de x
ls.index(x) --> devuelve el indice de la primera aparicion de x
ls.insert(p, x) --> inserta el elemento x delante de la posicion p
ls.sort() --> ordena los elementos de la lista de menor a mayor
ls.sort(reverse = True) --> ordena los elementos en sentido inverso
ls.extend(iterable) --> extiende la lista colocando el iterable al final
"""
ls:list = [i, for i in range(0,5)]
print(ls)

ls.extend(range(5,10))
print(ls)

"""
PILAS

COLAS

DICCIONARIOS

CONTROLES DE FLUJO

while (condicion):
    Body --> se repite mientras la condicion se cumpla

if (condicion):
    Body --> si se cumple la condicion 
else:
    Body --> si no se cumple la condicion

do:
    Body --> se repite mientras la condicion se cumpla
while (condicion)

for i in lista: 
    body --> el cuerpo se ejecuta para cada valor que i toma de la lista
"""