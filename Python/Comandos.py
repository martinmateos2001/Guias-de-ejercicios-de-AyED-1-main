"""COMANDOS Y FUNCIONES NATIVAS

Operaciones sobre tipo int
+ suma
- resta
/ division
* producto
** potencia 
=  ; x = 10 asigna valor a una variable
% resto de la division entera: 10%3 =1
// division entera: 10//3=3

Operaciones booleanas

< menor que
> mayor que
<= menor o igual que
>= mayor o igual que
== igualdad
!= distinto
and --> conjuncion: x and y , si x=true e y=true entonces true, para otro caso es false
or --> disyuncion x or y , si alguno es true devuelve true, para otro caso es false 
not (p) --> negacion, si p es false entonces devuelve true


Operaciones sobre tipo float
Ademas de las nombradas en tipo en int es importante nombrar.

round(x, n) redondea al numero x en n digitos
>>>round(3.256, 2)
3.26

"""

"""CONTROLES DE FLUJO

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

"""FUNCIONES 

Módulo math --> https://docs.python.org/es/3.10/library/math.html 
import math --> importa el modulo
math.pi --> numero pi
math.sqrt(x) --> raiz cuadrada de x
"""

"""ARREGLOS
Modulo array --> https://docs.python.org/es/3.10/library/array.html#module-array
    Tambien puede usarse el NumPy

from array import * --> importa todas las funciones del modulo
"""

"""LISTAS
ls:list[Tipo] = [] --> lista vacia
ls[x] --> devuelve el elemento en la posicion x
ls[x] [i] --> para listas anidadas
ls[i] = x --> cambia el valor del elemento en la posicion i de la lista por x
ls[i:j] --> devuelve los elementos desde el indice i hasta el indice j
            ls = [1,2,3,4,5,6,7,8]
            ls[0,4] --> [1,2,3,4]
            ls[5,8] --> [5,6,7,8]
            ls[2:8:2] --> [2,4,6,8], indico el paso 
ls.append(x) --> añade a x al final de la lista
ls.remove(x) --> elimina la primera aparicion de x en la lista
del ls[i] --> elimina el elemento con indice i de la lista
ls.pop() --> elimina el ultimo elemento de la lista, si se pasa como parametro un indice, elimina el elemento de la posicion
ls.count(x) --> devuelve el numero de apariciones de x en la lista
ls.index(x) --> devuelve el indice de la primera aparicion de x
ls.insert(p, x) --> inserta el elemento x delante de la posicion p
ls.sort() --> ordena los elementos de la lista de menor a mayor
ls.sort(reverse = True) --> ordena los elementos en sentido inverso
ls.extend(iterable) --> extiende la lista colocando el iterable al final
                        Tambien dadas dos listas s1 y s2, se puede extender s1 con elementos de s2 haciendo s1 + s2
len(ls) --> devuelve la cantatidad de elementos de la lista
min(ls) --> devuelve el menor elemento de la lista
max(ls) --> devuelve el mayor elemento de la lista

forma de crear una lista

nueva_lista = [expresión for elemento in iterable if condición]

expresión: Es lo que se añadirá a la nueva lista.
elemento: Es la variable que toma cada valor del iterable.
iterable: Es la secuencia de la que se extraen los elementos (lista, tupla, rango, etc.).
if condición: (Opcional) Filtra los elementos que cumplen una condición.
"""
ls:list = []
for i in range(0,5):
    ls.append(i)
print(ls)
ls.extend(range(5,10))
print("Extiendo la lista:", ls)
print(ls[0:4])
print(ls[5:10])
"""PILAS y COLAS
queue es un modulo utilizado para manipular colas.

from queue import LifoQueue as Pila #LIFO Last In, First Out
from queue import Queue as Cola  #FIFO First in, First Out

pila = Pila(maxsize) --> Igual que en cola
cola = Cola(maxsize = x) --> creo una instancia de Cola con tamaño maximo x (opcional)
cola.put(x) --> coloca en la cola el objeto x
cola.get() --> extrae un elemento de la cola 
cola.empty() --> devulve true si la cola está vacía

"""

"""DICCIONARIOS
El diccionario, define una relación uno a uno entre claves y valores.

Metodos
diccionario['key'] = valor -> añade la clave valor o la actualiza si ya exista la key
del diccionario['key'] -> elimina el par clave valor.
diccionario['key'] ó diccionario.get('key')-> devuelve el valor
diccionario.clear() --> vacía el diccionario
copiadicciconario = diccionario.copy()
diccionario.items() -> devuelve una 'lista' con los pares clave - valor: [(k1, v1), (k2, v2), ... , (kn, vn)]
diccionario.keys() -> devuelve 'lista' con todas las llaves del diccionario
diccionario.values() -> devuelve 'lista' con todas los valores del diccionario
diccionario.pop('key') -> busca y elimina la key y devuelve su valor
diccionario.update(otroDiccionario) -> actualiza el diccionario.
"""

''' Practica de diccionarios
#Ejemplo de diccionario donde la clave es 
jerga_Argentina:dict={
    'claves':'valores'
    'joda':'fiesta',
    'boludo':'estupido',
    'gato':'hombre mujeriego o mujer prostituta',
    'fierro':'arma',
    'a':'ksksksks'
}


#acceder a valores --> diccionario['clave'] = valor
print(jerga_Argentina['boludo'])

#añadir clave-valor
jerga_Argentina['ñeri'] = "amigo o compañero"

#Uso claves y valores
for clave in jerga_Argentina:
    print('-' + clave, 'significa', jerga_Argentina[clave])

#cambio el valor de una clave
jerga_Argentina['boludo'] = 'tonto'
print(jerga_Argentina['boludo'])

#uso diccionario.items
for k, v in jerga_Argentina.items():
    print(k, v)

paresKV = jerga_Argentina.items()
print(paresKV) #imprime en forma de diccionario
print(list(paresKV)) #transformado a lista de tuplas clave valor

listaParesKV = list(paresKV)
print(listaParesKV[0]) # -> (joda, fiesta)

#uso pop
print(list(jerga_Argentina.values()))
print(jerga_Argentina.pop('a'))
print(list(jerga_Argentina.values()))
'''