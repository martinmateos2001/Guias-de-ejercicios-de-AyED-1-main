import math

# Ejercicio 1.1
def imprimir_hola_mundo():
    print("¡Hola mundo!")

#imprimir_hola_mundo()

#1.2
def imprimir_un_verso():
    print("hola soy Martin Mateos y aca hay un salto de linea...  \nAhora estoy escribiendo abajo y debajo hay una carita feliz\n:)")

#imprimir_un_verso()

#1.3
def raizDe2(x:int):
    return round(math.sqrt(x), 4)

#print(raizDe2(2))

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
print(factorial(3))
