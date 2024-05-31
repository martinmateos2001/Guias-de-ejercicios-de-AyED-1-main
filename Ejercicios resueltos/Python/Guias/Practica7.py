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
def reemplaza_pares(ls:'list[int]')-> None:
    i=0
    long=len(ls)
    while i<long:
        if i%2==0:
            ls[i]=0
        i+=1
#lista=[2,1,4]
#reemplaza_pares(lista)

#print(f"reemplaza_pares:{lista}")

def reemplaza_pares_for(ls:'list[int]') -> None:
    for i in range(0, len(ls), 2):
        ls[i]=0
#reemplaza_pares_for(lista)

#print(f"reemplaza_pares_for:{lista}")

#2.5.2, pertenece a cada uno, usar pertenece_In
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

