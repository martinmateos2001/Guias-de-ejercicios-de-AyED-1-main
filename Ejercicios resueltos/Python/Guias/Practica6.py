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
#print(es_nombre_largo("nombre"))

#3.4
def es_bisiesto(año:int)->bool:
    es= es_multiplo_de(año,400) or (es_multiplo_de(año, 4)==True and es_multiplo_de(año, 100)==False)
    return es
#print(es_bisiesto(2023))

# Ejercicios 4
#4.1
''' 
3M----900Kg --> 1M---300Kg
>3M| 1M----200Kg
'''
altura:int=3.5

def peso_pino(h:int)->int: #h es la altura en metros.
    if h<=3:
        h=h*3
    else:
        h=900+(h-3)*200
    return h
#print("El peso del arbol es: "+ str(peso_pino(altura))+ "Kg")

#4.2
def es_peso_util(p:int):
    es = p>=400 and p<=1000
    return es
    '''if es==True:
        print("El peso de " + str(p) + "Kg ES válido")
    else:
         print("El peso de " + str(p) + "Kg NO ES válido")'''
#es_peso_util(1300)

#4.3, la altura en la que sirve un pino es entre 1.33333M y 4M
def sirve_pino(h:int):
    sirve = h >= 1+1/3 and h <= 3.5
    if sirve == True:
        print("La altura de " +str(h)+"M SÍ sirve.")
    else:
        print("La altura de " +str(h)+"M NO sirve.")
#sirve_pino(1)

#4.4
def sirve_pino_compuesto(h:int):
    sirve= es_peso_util(peso_pino(h))
    if sirve == True:
        print("La altura de " +str(h)+"M SÍ sirve.")
    else:
        print("La altura de " +str(h)+"M NO sirve.")
#sirve_pino_compuesto(altura)

# Ejercicios 5
#5.1
def es_par(n:int)->bool:
    if n % 2 ==0:
        return True
    else:
        return False
def devolver_el_doble_si_es_par(n:int):
    if es_par(n) == True:
        print(str(n) + " es par, se le devuelve: " + str(2*n)+".")
    else:
        print(str(n) + " no es par.")
#devolver_el_doble_si_es_par(10)

#5.2
def devolver_valor_si_es_par_sino_el_que_sigue(n:int):
    if es_par(n)==True:
        print("Es par, por lo tanto: " + str(n))
    else:
        print(str(n) + " no es par, por lo tanto: " + str(n+1))
#devolver_valor_si_es_par_sino_el_que_sigue(9)

#5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n:int):
    if n % 3 == 0 and n % 9 != 0:
        print(str(n) + " es múltiplo de 3, por lo tanto: " + str(n*2) + ".")
    if n % 9 == 0:
        print(str(n) + " es múltiplo de 9, por lo tanto: " + str(n*3) + ".")
    if n % 3 != 0 and n % 9 != 0:
        print(str(n) + " no es multiplo de 3 o 9, por lo tanto: " + str(n))
#devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(7)

#5.4
def lindo_nombre(nombre:str):
    if len(nombre) >= 5:
        print("\"Tu nombre tiene muchas letras!\"")
    else:
        print("\"Tu nombre tiene menos de 5 caracteres\"")
#lindo_nombre("Mara")

#5.6
def vacaciones_o_trabajar(sexo:str, años:int):
    if len(sexo)==1:
        if sexo=="M":
            if años>=65 or años<18:
                print("Andá de vacaciones.")
            else:
                print("Te toca trabajar.")
        if sexo=="F":
            if años>=60 or años<18:
                print("Andá de vacaciones.")
            else:
                print("Te toca trabajar.")
#vacaciones_o_trabajar("M", 65)

# Ejercicios 6 (condicion: usar while)
#6.1
def hasta_10_aux():
    i=0
    lista:list=[]
    while i<10:
        lista.insert(i,i+1)
        i=i+1
    return lista
def hasta_10():
    print(hasta_10_aux())
#hasta_10()

#6.2
def lista_pares_entre_10_y_40():
    i=10
    p=0
    l:list=[]
    while i<=40:
        if i % 2 == 0:
            l.insert(p, i)
            i += 1
            p +=1
        else:
            i += 1
            p +=1
    return l
def pares_entre_10_y_40():
    print(lista_pares_entre_10_y_40())
pares_entre_10_y_40()

#6.2