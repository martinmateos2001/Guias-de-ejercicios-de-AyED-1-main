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
print (fahrenheit_a_celcius(212))

