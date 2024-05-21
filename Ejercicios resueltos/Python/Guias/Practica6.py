import math

# Ejercicio 1.1
def imprimir_hola_mundo():
    print("¡Hola mundo!")

#imprimir_hola_mundo()

#1.2
def imprimir_un_verso():
    print("hola soy Martin Mateos y aca hay un salto de linea...  \nAhora estoy escribiendo abajo y debajo hay una carita feliz\n:)")

#imprimir_un_verso()

#1.4, lo hice para todo x jaja, terrible capo
def factorial(x:int):
    i=x
    if x==0:
        return 1
    else: 
        while i!=1:
            x=x*(i-1)
            i=i-1
        return x
#print(factorial(3))

#1.5
def perimetro (radio:int)-> float:
    x=2*radio*math.pi
    return x
#print(perimetro(2))

#Ejercicios 2
#2.1
def imprimir_saludo(nombre:str) -> str:
    print("hola " + nombre)
#imprimir_saludo("marton")

#1.3 y 2.2
def raiz_cuadrada_de(x:int) -> float:
    return round(math.sqrt(x), 4)

#print(raiz_cuadrada_de(2))

#2.3
def fahrenheit_a_celcius(f:float) -> float:
    c=(f-32)*5/9
    return c
#print (fahrenheit_a_celcius(212))

#2.4
def imprimir_dos_veces(estribillo:str) -> str:
    print(2*estribillo)

#imprimir_dos_veces("Cuak ")

#2.5
def resto(x:int,n:int) -> int:
    while x>=0:
        if x<n:
            return x
        else:
            x=x-n
    return x
#print(resto(26,6))

def es_multiplo_de(x:int, n:int) -> bool:
    if resto(x,n)==0:
        return True
    else:
        return False
#print(es_multiplo_de(8,3))

#2.6
def es_par(n:int) -> bool:
    if resto(n,2) == 0:
        return True
    else:
        False
#print(es_par(6))

#2.7
def cantidad_de_pizzas(comensales:int,min_cant_de_porciones:int)-> int:
    x=comensales*min_cant_de_porciones
    if resto(x,8) != 0:
        return math.floor((x/8)+1)
    else:
        return x/8
#print(cantidad_de_pizzas(4,7))

# Ejercicios 3
#3.1
def alguno_es_0(n1:int, n2:int)->bool:
    x= n1==0 or n2==0
    return x
#print(alguno_es_0 (1, 1))

#3.2
def ambos_son_0 (x:int, y:int) -> bool:
    son = x==0 and y==0
    return son
#print(ambos_son_0 (0,1)) 

#3.3
def es_nombre_largo(nombre:str) -> bool:
    es = 3<=len(nombre) and len(nombre)<=8
    return es
print(es_nombre_largo("nombre"))