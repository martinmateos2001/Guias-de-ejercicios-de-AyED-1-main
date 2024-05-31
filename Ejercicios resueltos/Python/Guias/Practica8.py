import random
import typing 
from queue import LifoQueue as Pila

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