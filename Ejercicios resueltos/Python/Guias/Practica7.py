# Primera Parte
#1.1, ejecutar de tres formas distintas a pertence, dada una seq de num, ver si x pertece.
def pertence_In(ls:'list[int]', n:int) -> bool:
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

def pertenece_for(ls:list, n):
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
def suma_total(ls:'list[int]') -> int:
    k=0
    for i in range(len(ls)):
        k += ls[i]
    return k


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

"""Ejercicio 1.6"""

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

"""
Ejercicio 1.7
    Analizar contraseña:
        VERDE:
            a) len(contraseña) > 8
            b) Contiene al menos una letra minuscula
            c) Contiene al menos una letra mayuscula
            d) Tiene al menos un digito numerico
        ROJA:
            a) len(contraseña) < 5
        AMARILLA:
            Caso contrario
"""
def tiene_minuscula (cadena: str) -> bool :
    res: bool = False
    for c in cadena:
        if 'a' <= c and c <= 'z' :
            res = True
    return res 
 
def tiene_mayuscula (cadena: str) -> bool :
    res: bool = False
    for c in cadena:
        if 'A' <= c and c <= 'Z' :
            res = True
    return res 
 
def tiene_numeros (cadena: str) -> bool :
    res: bool = False
    for c in cadena:
        if '0' <= c and c <= '9' :
            res = True
    return res 
 
 
def fortaleza_PWD_v2 (cadena: str) -> str:
    tiene_min: bool = tiene_minuscula(cadena)
    tiene_may: bool = tiene_mayuscula(cadena)
    tiene_num: bool = tiene_numeros(cadena)
    mayor_a_8: bool = len(cadena) > 8
 
    if tiene_may and tiene_num and tiene_min and mayor_a_8 :
        return "VERDE"
    elif len(cadena) < 5 : #if y else pueden haber uno solo, elif pueden haber varios y funcionan igual al if.
        return "ROJA"
    else :
        return "AMARILLA"
 
#x = fortaleza_PWD_v2 ("a6$_Afghij5Dklmnopqrstuvwxyz")
 
def fortaleza_PWD_v1 (cadena: str) -> str:
    tiene_min: bool = False
    tiene_may: bool = False
    tiene_mum: bool = False
    mayor_a_8: bool = len(cadena) > 8
 
    for c in cadena:
        if c.isalpha(): #pregunta si el caracter c es alfanumerico.
            if c.islower(): #pregunta si el caracter c es minuscula.
                tiene_min = True
            elif c.isupper(): #pregunta si el caracter c es mayuscula.
                tiene_may = True
        elif c.isdigit(): #pregunta si el caracter c es numerico.
            tiene_mum = True
 
    if tiene_may and tiene_mum and tiene_min and mayor_a_8 :
        return "VERDE"
    elif len(cadena) < 5 :
        return "ROJA"
    else :
        return "AMARILLA"

"""
Ejercicio 1.8
    Dada una lista de tuplas que representan operaciones bancarias donde la primer componente indica el ingreso ("I") o retiro ("R") de dinero y la segunda componente el monto de dinero
    devolver el saldo final tras las operaciones.
"""
def moviento(operacion:str, dinero_en_cuenta:int, monto):
    if operacion == "I":
        dinero_en_cuenta = dinero_en_cuenta + monto
    else:
        dinero_en_cuenta = dinero_en_cuenta - monto
    return dinero_en_cuenta

def saldo_final(movimientos:'list[(str, int)]'):
    dinero:int = 0
    for tupla in movimientos:
        dinero = moviento(tupla[0], dinero, tupla[1])
    return dinero

def saldo_final_v2(movimientos:'list[(str, int)]'): #como son pocas operaciones funciona mejor, pero en caso contrario
    res:int = 0
    for tupla in movimientos:
        if tupla[0] == "I":
            res = res + tupla[1]
        else:
            res = res - tupla[1]
    return res
""""
historial:'list[(str, int)]' = [("I", 2000), ("R", 20),("R", 1000),("I", 300)]
print(saldo_final(historial))
print(saldo_final_v2(historial))
"""

"""
Ejercicio 1.9:
    Devolver True si una palabra tiene mas de 3 vocales distintas.
"""
def eliminar_repetidos(lista:list) -> list: #Este es el ejercicio 2.6
    res:list = []
    for e in lista:
        if not(pertenece_for(res, e)):
            res.append(e)
    return res

print(eliminar_repetidos([1,11,1,1,1,1,1]))
print(eliminar_repetidos("holaaa"))


def al_menos_3_vocales(cadena:str) -> bool:
    vocales:list[chr] = ['a', 'e', 'i', 'o', 'u']
    contador:int = 0
    cadena_mod:str = eliminar_repetidos(cadena)
    for c in cadena_mod:
        if c in vocales:
            contador += 1
    res:bool = contador >= 3
    return res

cadena1:str = "hello" #false
cadena2:str = "hielo" #true

print(cadena1 + " es " + str(al_menos_3_vocales(cadena1)))
print(cadena2 + " es " + str(al_menos_3_vocales(cadena2)))
        

#print(al_menos_3_vocales("palabra")) #False
#print(al_menos_3_vocales("permutacion")) #True 

#2.1, dada una lista numerica, reemplaza en las posiciones pares por cero. La lista es inout
def reemplaza_pares(ls:'list[int]')-> None:
    i=0
    long=len(ls)
    while i<long:
        if i%2==0:
            ls[i]=0
        i+=1
lista=[2,1,4]
#reemplaza_pares(lista)

#print(f"reemplaza_pares:{lista}")

def reemplaza_pares_for(ls:'list[int]') -> None:
    for i in range(0, len(ls), 2):
        ls[i]=0
#reemplaza_pares_for(lista)
#print(f"reemplaza_pares_for:{lista}")

"""
Ejercicio 2.2:
    Lo mismo que en el punto anterior pero sin modificar la lista original.
"""
def reemplaza_pares_v2(ls:'list[int]') -> 'list[int]':
    #comparo con la original y modifico la copia.
    res:'list[int]' = []
    for e in ls:
        if e%2 == 0:
            e=0
        res.append(e) 
    return res
print(reemplaza_pares_v2(lista))

"""
Ejercicio 2.3:
    Dada una cadena de caracteres devolver la misma cadena sin caracteres.
"""
def sin_vocales(cadena:str) -> str:
    vocales:list[chr] = ['a', 'e', 'i', 'o', 'u']
    cadena_aux:list[chr] = [] 
    for caracter in cadena:
        cadena_aux.append(caracter)
    for char in cadena_aux:
        if (pertenece_for(vocales, char)):
            cadena = cadena.replace(char, '')
    return cadena
print("sin vocales: " + sin_vocales("hello"))

"""
Ejercicio 2.4:
    Dada una lista de caracteres si alguno es una vocal se reemplaza por: '_' |
    El parametro de entrada es tipo in.
"""
def reemplaza_vocales(caracteres:'list[chr]') -> 'list[chr]':
    vocales:list[chr] = ['a', 'e', 'i', 'o', 'u']
    caracteres_aux:'list[chr]' = []
    for c in caracteres:
        if (pertenece_for(vocales, c)):
            caracteres_aux += ['_']
        else:
            caracteres_aux += [c]

    return caracteres_aux


#print(reemplaza_vocales('hola'))

"""
Ejercicio 2.5:
    problema da vuelta str (in s:seq⟨Char⟩) : seq⟨Char⟩ {
        requiere: { T rue }
        asegura: {|res| = |s|}
        asegura: { Para todo i ∈ Z si 0 ≤ i < |res| → res[i] = s[|s| − i − 1]}
    }
"""
def da_vuelta_str(s:'list[chr]') -> 'list[chr]':
    i = len(s)-1
    s_al_reves:list[chr] = []
    while i>-1:
        s_al_reves += s[i] 
        i -= 1
    return s_al_reves

print(da_vuelta_str("hola"))

"""
Ejercicio 3:
    problema aprobado (in notas: seq⟨Z⟩) : Z {
        requiere: {|notas| > 0}
        requiere: {Para todo i ∈ Z si 0 ≤ i < |notas| → 0 ≤ notas[i] ≤ 10)}
        asegura: {res = 1 ↔ todos los elementos de notas son mayores o iguales a 4 y el promedio es mayor o igual a 7}
        asegura: {res = 2 ↔ todos los elementos de notas son mayores o iguales a 4 y el promedio est´a entre 4 (inclusive) y 7}
        asegura: {res = 3 ↔ alguno de los elementos de notas es menor a 4 o el promedio es menor a 4}
    }
"""
def aprobado(notas:'list[int]') -> int:
    aprobadas:int = 0
    promedio = suma_total(notas)/len(notas)
    for nota in notas:
        if nota >= 4:
            aprobadas += 1
    if aprobadas == len(notas) and promedio >= 7:
        return 1
    elif aprobadas == len(notas) and promedio >= 4 and promedio < 7:
        return 2
    elif aprobadas < len(notas) or promedio < 4:
        return 3

"""res aprobado
print(aprobado([7,7])) #res = 1
print(aprobado([6,7])) #res = 2
print(aprobado([3,9])) #res = 3, 
"""

"""Ejercicio 4.1:
    Ingresar nombres a una lista hasta que se ingrese la palabra listo.
"""
def ingresar_nombres() -> 'list[str]':
    lista_de_nombres:'list[str]' = []
    fin:str = "listo"
    nombre:str = ""
    while nombre != fin:
        nombre = input()
        if nombre != fin:
            lista_de_nombres.append(nombre)
    return lista_de_nombres
#print(ingresar_nombres())


"""Ejercicio 4.2:
Implementar una funcion que devuelve una lista con el historial de un monedero electronico (por ejemplo la SUBE).
El usuario debe seleccionar en cada paso si quiere:
    “C” = Cargar creditos,
    “D” = Descontar creditos,
    “X” = Finalizar la simulaci´on (terminar el programa)
En los casos de cargar y descontar creditos, el programa debe ademas solicitar el monto para la operacion. Vamos a
asumir que el monedero comienza en cero. Para guardar la informacion grabaremos en el historial tuplas que representen
los casos de cargar (“C”, monto a cargar) y descontar credito (“D”, monto a descontar).
"""
def historial_movimientos_sube() -> 'list[(str, int)]':
    res:'list[(str, int)]' = []
    fin:str = "X"
    operacion:str = ""
    monto:int = 0
    elemento:tuple[str, int] = ("", 0)
    texto:str = "Ingrese 'C' para cargar creditos.\nIngrese 'D' para descontar credito\nIngrese 'X' para salir\n" 
    error:str = "El codigo de operacion no es correcto\n"  
    while operacion != fin:
        print(texto)
        operacion = input()
        if operacion == "C" or operacion == "D":
            print("Ingrese el monto de la operacion")
            monto = input()
            elemento = (operacion, monto)
            res.append(elemento)
        elif operacion == "X":
            print("Adios\n")
            operacion = fin
        else:
            print(error)
    return res
#print(historial_movimientos_sube())

"""5.1
Dada una lista de lista de enteros, una lista de booleanos y un elemento e, si este pertenece a algun elemento de la lista en la posicion i
entoces res[i] = true
"""
def pertenece_a_cada_uno_v1()

"""5.2
Pertenece a cada uno, usar pertenece_In
"""
def pertenece_a_cada_uno_v2(s:'list[list[int]]', e:int, res:'list[bool]')->None:
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

