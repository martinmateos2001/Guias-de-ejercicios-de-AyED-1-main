import random
import typing 
from queue import LifoQueue as Pila # Del modulo queue se importa la clase LifoQueue como Pila
from queue import Queue as Cola 
#clase 29/5
"""
Empezamos viendo pilas, luego archivos.
Para usar PILAS hay que importar queue
Estructura de pilas:
+ p = Pila() #crea la pila
+ p.put(x) # apila a x
+ elemento = p.get() # desapila un elemento y lo guarda en la variable elemento
+ p.empty() # Pregunta si la pila esta vacía, devuelve un booleano

Estructura para usar ARCHIVOS:
+ mi_archivo = open("dir del archivos", "f") #f es la orden que puede ser lectura(r), escritura(w) (si el archivo no existe lo crea) o append(a)
+ lineas:[str] = mi_archivo.readlines(x) #Devuelve las lineas del archivo
                 mi_archivo.write(x)
                    donde x es un str   
+ mi_archivo.close()
"""

"""         --- PILAS ---           """

"""Ejercicio 9"""# ejercicio introductoria a pilas.
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
#print(contar_elementos_pila(mi_pila))   #pila con 2 y 8
#print(contar_elementos_pila(mi_pila))   #como la funcion saca los elementos ahora muestra cero
                                        #para solucionar esto se propone usar una funcion que copie la pila
                                        #ahora ya funciona.
    
#print( "\nEjericio 8")
# Ejercicio 8
def generar_nros_al_azar(cantidad:int, desde:int, hasta:int) -> 'Pila[int]':
    p = Pila()
    for _ in range(cantidad):
        valor:int = random.randint(desde, hasta)
        p.put(valor)
    return p

def imprimir_pila(p:'Pila[int]') -> int:
    paux = copiar_pila(p)
    while(not paux.empty()):
        elem = paux.get()
        print(elem)

#p = generar_nros_al_azar (20, 0, 100)
#imprimir_pila(p)
#print("cuantos elementos tiene?")
#print(contar_elementos_pila(p))
#print("\nComo lista:")
#print(p.queue) #muestra la pila como una lista

#print("\nEjercicio 10")
def buscar_el_maximo(p:'Pila[int]') -> int:
    paux = copiar_pila(p)
    res:int = paux.get()
    while (not paux.empty()):
        valor:int = paux.get()
        if valor > res:
            res = valor
    return res

#print(buscar_el_maximo(p))

"""         ---  ARCHIVOS ---           """

"""
Ejercicio 1.1
"""
def contar_lineas(nombre_archivo:str) -> int:
    archivo = open(nombre_archivo, "r")
    lineas:list[str] = archivo.readlines()
    print(lineas)
    archivo.close()
    return len(lineas)
 
#print(contar_lineas("archivo.txt"))

"""
Ejercicio 1.2
"""
def existe_palabra(palabra:str, nombre_archivo:str) -> bool:
    res:bool = False
    with open(nombre_archivo, "r") as archivo: #la ventaja de usar with es que al finalizar el codigo el archivo se cierra automaticamente.
        lineas:list[str] = archivo.readlines()
    for linea in lineas:
        if palabra in linea:
            res = True
    archivo.close()
    return res
arch_ej_1_2:str = "D:\Multimedia\Estudios\Marton\Materias carrera\Programacion - AyED 1\Guias-de-ejercicios-de-AyED-1-main\Ejercicios resueltos\Python\Guias\Ej_1_2.txt"
word_1_2:str = "hola"
#print("¿Mi palabra existe? " + str(existe_palabra(word_1_2, arch_ej_1_2))) YEY :)

"""
Ejercicio 1.3
    implementar una funcion que indique cuantas veces aparece una palabra en un archivo.
"""
def cantidad_apariciones(nombre_archivo:str, palabra:str) -> int:
    with open(nombre_archivo, "r") as archivo:
        lineas:list[str] = archivo.readlines()
    contador:int = 0
    for linea in lineas:
        for word in linea.split():
            if palabra == word:
                contador += 1
    return contador

#print(cantidad_apariciones(arch_ej_1_2, word_1_2))
"""
Ejercicio 2
"""
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
    while(i<len(linea) and linea[i] == ' '): #Lee los espacios en blanco por ejemplo: "      #esto es un comentario"
        i+=1

    return i < len(linea) and linea[i] == '#' 

#clonar_sin_comentarios("archivo.txt") #funciona

"""
Ejercicio 3
"""
def invertir_lineas(nombre_archivo:str) -> typing.IO:
    archivo:typing.IO = open(nombre_archivo, "r")
    lineas:list[str] = archivo.readlines()
    lineas.reverse()
    reverso:typing.IO = open(nombre_archivo + "_reverso", "w")
    for e in lineas:
        reverso.writelines(e)
    archivo.close()
    reverso.close()
    
#invertir_lineas(arch_ej_1_2)

"""
Ejercicio 4, agregar frase al final de un archivo.
"""
def agregar_frase_al_final(nombre_archivo:str, frase:str) -> typing.IO:
    with open(nombre_archivo, "r") as archivo:
        lineas:list[str] = archivo.readlines()
    lineas.append(frase)
    with open(nombre_archivo, "w") as archivo:
        for linea in lineas:
            archivo.write(linea)

agregar_frase_al_final(arch_ej_1_2, "nueva linea")

"""
            --- DICCIONARIOS ---
Hoy empezamos con colas y diccionarios.
    Los metodos de las colas son iguales a los de las pilas, pero cambia que las colas son FIFO, primero en entrar primero en salir.
    Ejemplo [1,2,34,5], el primer elemento es 
    c = Cola() # c es una cola y hay que importar
    c.put(elem) #
    c.get() # obtiene el primer elemento.
    c.empty() # pregunta si la cola está vacia.
"""

"""
Ejercicio 13
    Generar una cola de numeros al azar 
"""

def generar_nros_al_azar_cola(cantidad:int, desde:int, hasta:int) -> 'Cola[int]':
    res:Cola[int] = Cola()
    for _ in range(cantidad):
        x:int = random.randint(desde, hasta)
        res.put(x)
    return res
#print(generar_nros_al_azar_cola(10, 0, 50)) no sirve para imprimir la cola

"""Funcion auxiliar"""
def imprimir_pila_o_cola(pila_o_cola):
    print("---")
    while(not(pila_o_cola.empty())):
        print(pila_o_cola.get()) #imprime hasta que la cola quede vacia. Ojo, al igual que las pilas hay que trabajar con la copia (si es in) porque ¿los valores se pasan por referencia?
    print("---")
#imprimir_pila_o_cola(generar_nros_al_azar_cola(10, 0, 50))

"""
Ejercicio 16
    Bingo: un carton de 12 numeros al azar entre 0 y 99.
    1.  Implementar una funcion armar_secuencia_de_bingo() → Cola[int] que genere una cola con los numeros del 0 al 99 ordenados al azar.
    2.  implentar jugar_carton_de_bingo(in carton:list[int], in bolillero:Cola[int]) -> int que toma un carton de bingo y una cola de enteros 
        (que corresponden a las bolillas numeradas) y determina cual es la cantidad de jugadas de ese bolillero que se necesitan para ganar.
"""
def armar_sec_de_bingo() -> 'Cola[int]':
    res:Cola[int] = Cola()
    nros:list = [] #esta lista se usa para que luego no se repitan valores en cola.
    while len(nros) < 100:
        v:int = random.randint(0, 99)
        if not(v in nros): #habria que usar pertence hecho a mano. Lo usamos para que el numero al azar no se repita en la cola.
            res.put(v)
            nros.append(v)
    return res

#imprimir_pila_o_cola(armar_sec_de_bingo())

def copiar_cola(original:Cola) -> Cola:
    res:Cola = Cola() #la copia.
    cola_tmp:Cola = Cola() #temporal porque se usa para llenar de nuevo la original.
    while not(original.empty()):
        v = original.get()
        res.put(v)
        cola_tmp.put(v)
    while not(cola_tmp.empty()):
        v = cola_tmp.get()
        original.put(v)
    return res
"""
def jugar_carton_bingo(carton:list, bolillero:Cola) -> int:
    jugadas:int = 0
    copia = copiar_cola(bolillero)
    aciertos:int = 0
    while aciertos < len(carton):
        jugada:int = copia.get()
        jugadas += 1
        if pertenece(carton, jugada): #importar Practica 6
            aciertos += 1
    return jugadas
"""

"""
Arrancamos con diccionarios.
Posee claves y valores.
Se asignan como tipo dict
"""

diccionario:dict={
    'auto' : 'car',
    'sol' : 'sun',
    'luna' : 'moon'
}

#Agrego clave - valor
diccionario['yo'] = "martin"

#reemplazo el valor de una clave
diccionario['yo'] = "martonnn"

#recuperar un valor del diccionario
v:str = diccionario['yo'] #v = "martonnn"

#diccionario vacío
#dicc_vacio:[str, str] = {}

#recuperar claves de un diccionario
def imprimir_claves(diccionario:dict):
    claves:'list[str]' = diccionario.keys()
    for clave in claves:
        valor:str = diccionario[clave]
        print(clave + "-" + valor)

"""
.keys() devuelve una lista con las claves
.items() devuelve la lista con las duplas clave-valor
.values() devuelve la lista con los valores de las claves
"""

"""
Ejercicio 19 
    Leer un archivo de texto y agrupar la cantidad de palabras de acuerdo a su longitud.
    Implementar la funcion agrupar_por_longitud(in nombre_archivo:str) -> dict
"""

def agrupar_por_longitud(nombre_archivo:str) -> dict:
    palabras:list[str] = palabras_de_arch(nombre_archivo) #funcion auxiliar que recoge las palabras del archivo
    res:dict = {}
    for p in palabras:
        t = len(p)
        if pertenece_dict(res, t):
            res[t] = res[t] + 1
        else:
            res[t] = 1
        return res
    
"""auxiliares"""
def pertenece_dict(d:dict, k) -> bool:
    lista = list(d.keys())
    for e in lista:
        if e == k:
            return True
    return False

def mi_split(linea: str) -> 'list[str]': #esta funcion devuelve una lista de palabras, dado un string muy grande.
    res:list[str] = []
    palabra = ""
    for char in linea:
        if char == " " or char == "\t" or char == "\n" or char == "\r": # ¿char es un espacio o algun tipo de salto de linea? si es así:
            if len(palabra) > 0: #si la lognitud de palabra es mayor a cero hace:
                res.append(palabra) #agrega palabra a la lista de palabras
                palabra = "" #vuelve palabra a caracter vacio para llenar con los caracteres que no son espacios o saltos de linea
        else: # si char no es salto de linea o espacio lo agrega a palabra.
            palabra += char
    if len(palabra) > 0:  # para añadir la última palabra si no termina en un espacio
        res.append(palabra)
    return res

def palabras_de_arch(nombre_archivo:str) -> 'list[str]':
    with open(nombre_archivo, 'r') as archivo: #abre el archivo como solo lectura
        contenido:str = archivo.read() #toma todo su texto en un solo string llamado contenido
        return mi_split(contenido) #devuelve la lista de palabras. mi_split es lo mismo que: contenido.split() ¿ :| ?

""" 
Revisar archivo del profe tranquilo en casa, es el link que ya tengo.    
"""

"""
Ejercicio 19:
    Implementar un funcion que devuelve la palabra mas frecuente, se aconseja usar diccionarios.
"""
