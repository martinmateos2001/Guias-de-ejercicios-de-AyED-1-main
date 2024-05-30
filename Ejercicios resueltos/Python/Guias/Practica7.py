import math
import random
import typing 
from queue import LifoQueue as Pila

# Primera Parte
#1.1, ejecutar de tres formas distintas a pertence, dada una seq de num, ver si x pertece.
def pertence_In(ls:list[int], n:int) -> bool:
    return n in ls
#print(pertence_In([1,2,3,4], 3))

def pertenece_while(ls:list, n:int) -> bool:
    i=0
    b:bool=False
    while i<=len(ls)-1:
        if n==ls[i]:
            b = True
        if n!= ls[i]:
            i+=1
    return b
#print(pertenece_while([1,2,3,4], 5))

def pertenece_for(ls:list, n:int):
    b=False
    for i in range(0, len(ls)):
        if n==ls[i]:
            b=True
    #print(b)
    return b
#pertenece_for([1,2,3], 5)

#1.2, divide a todos.
def divide_a_todos(n:int, ls:list):
    msj:str = " divide a todos"
    bs:list = []
    for i in range(0, len(ls)):
        if ls[i] % n != 0:
            bs.append(False)
    if pertence_In(bs, False) == True:
        print("NO" +  msj)
    else:
        print("SI" + msj)
#divide_a_todos(2, [2, 4, 6])

#1.3, sumar total.
def suma_total(ls:list):
    k=0
    for i in range(0, len(ls)):
        k=ls[i]+k
    print("La suma de todos los elementos es " + str(k) + ".")
#suma_total([2,2])

#Usando sum() que es nativa.
def sumar_lista(ls:list):
    print("La suma de los elementos es " + str(sum(ls))) 
#sumar_lista([1,2,3])

#1.4, si estan ordenados de menor a mayor da true.
#usando funciones nativas: sort(), ordena de menor a mayor la lista.
#prueba=[4,2,3]

#list.sort() modifica la lista pero no retorna la lista actualizada.
def ordenar(ls:list):
    ls.sort()
    return ls
#print(ordenar(prueba))

def ordenados(ls:list):
    b= ls == ordenar(ls)
    print(b)
#ordenados(prueba)

#1.5, dada una lista de palabras, devolver true si alguna tiene longitud mayor a 7.
def palabras_mayores_a_7(ls:list):
    i=0
    while i < len(ls):
        if len(ls[i]) > 7:
            return True
        else:
            i += 1
    return False
#print(palabras_mayores_a_7(["hola", "falso", "chauuuuuuu"]))

#1.6
def al_reves(s:str):
    invertida = "".join(reversed(s))
    return invertida
#print(al_reves("aaa"))

def al_reves_2(s:str):
    reves = s[::-1]
    print(reves)
#al_reves_2("abcd")

def al_reves_3(text):
    reves = ""
    for i in text:
        reves = i + reves #como reves esta a la derecha de la suma, los caracteres se van a ir anidando atras
    print(reves)
#al_reves_3("marto")

def palindromo(s):
    return(s == al_reves(s))
#print(palindromo("aaaa"))

#2.1, dada una lista numerica, reemplaza en las posiciones pares por cero. La lista es inout
def reemplaza_pares(ls:list[int])-> None:
    i=0
    long=len(ls)
    while i<long:
        if i%2==0:
            ls[i]=0
        i+=1
#lista=[2,1,4]
#reemplaza_pares(lista)

#print(f"reemplaza_pares:{lista}")

def reemplaza_pares_for(ls:list[int]) -> None:
    for i in range(0, len(ls), 2):
        ls[i]=0
#reemplaza_pares_for(lista)

#print(f"reemplaza_pares_for:{lista}")

#5.2, pertenece a cada uno, usar pertenece_In
def pertenece_a_cada_uno_v2(s:list[list[int]], e:int, res:list[bool])->None:
    res.clear() #se limpia.
    for v in s: #v es valor.
        res.append(pertenece_for(v, e))

""" Chequeo:
lista=[[1,2], [5,3], [5,8]]
res=[True, False]
print(f"res al principio:{res}") 
pertenece_a_cada_uno_v2(lista, 5, res)
print(f"pertenece_a_cada_uno_v2:{res}")
"""

#Practicar recorrer columnas de matrices.

#clase 29/5
"""
Empezamos viendo pilas, luego archivos.
Para usar pilas hay que importar queue
Estructura de pilas:
+ p = Pila() #crea la pila
+ p.put(x) # apila a x
+ elemento = p.get() # desapila un elemento y lo guarda en la variable elemento
+ p.empty() # Pregunta si la pila esta vacía, devuelve un booleano

Estructura para usar archivos:
+ mi_archivo = open("dir del archivos", "f") #f es la orden que puede ser lectura(r), escritura(w) (si el archivo no existe lo crea) o append(a)
+ lineas:[str] = mi_archivo.readlines(x) #Devuelve las lineas del archivo
                 mi_archivo.write(x)
                    donde x es un str   
+ mi_archivo.close()
"""

# ejercicio introductoria a pilas.
def contar_elementos_pila(p:Pila) -> int:
    cantidad:int = 0
    paux:Pila = copiar_pila(p) #trabaja con la copia.
    while (not paux.empty()):
        elem = paux.get()
        cantidad += 1
    return cantidad

def copiar_pila(p:Pila) -> Pila:
    paux = Pila()
    res = Pila()
    while (not p.empty()):
        elem = p.get()
        paux.put(elem) #ojo que queda invertida y p queda vacia.
    while (not paux.empty()):
        elem = paux.get()
        p.put(elem) #la dejo como estaba
        res.put(elem) #es la pila que devuelvo y sobre la que se trabajara
    return res

mi_pila = Pila()
mi_pila.put(2)
mi_pila.put(8)
print(contar_elementos_pila(mi_pila))   #pila con 2 y 8
print(contar_elementos_pila(mi_pila))   #como la funcion saca los elementos ahora muestra cero
                                        #para solucionar esto se propone usar una funcion que copie la pila
                                        #ahora ya funciona.
    
print( "\nEjericio 8")
# Ejercicio 8
def generar_nros_al_azar(cantidad:int, desde:int, hasta:int) -> Pila[int]:
    p = Pila()
    for _ in range(cantidad):
        valor:int = random.randint(desde, hasta)
        p.put(valor)
    return p

def imprimir_pila(p:Pila[int]) -> int:
    paux = copiar_pila(p)
    while(not paux.empty()):
        elem = paux.get()
        print(elem)

p = generar_nros_al_azar (20, 0, 100)
imprimir_pila(p)
print("cuantos elementos tiene?")
print(contar_elementos_pila(p))
print("\nComo lista:")
print(p.queue) #muestra la pila como una lista

print("\nEjercicio 10")
def buscar_el_maximo(p:Pila[int]) -> int:
    paux = copiar_pila(p)
    res:int = paux.get()
    while (not paux.empty()):
        valor:int = paux.get()
        if valor > res:
            res = valor
    return res

print(buscar_el_maximo(p))

# Empezamos con Archivos

print("\nEjercicio 1.1")
def contar_lineas(nombre_archivo:str) -> int:
    archivo = open(nombre_archivo, "r")
    lineas:list[str] = archivo.readlines()
    print(lineas)
    archivo.close()
    return len(lineas)
 
print(contar_lineas("archivo.txt"))

def clonar_sin_comentarios(nombre_archivo:str):
    archivo:typing.IO = open(nombre_archivo, "r")
    archivo_clonado:typing.IO = open(nombre_archivo + "_clonado", "w")

    lineas:list[str] = archivo.readlines()

    for linea in lineas:
        if(not es_comentario(linea)):
            archivo_clonado.write(linea)
    archivo.close()
    archivo_clonado.close

def es_comentario(linea:str) -> bool:
    i:int = 0
    while(i<len(linea) and linea[i] == ' '):
        i+=1
    
    return i < len(linea) and linea[i] == '#'

clonar_sin_comentarios("archivo.txt") #funciona