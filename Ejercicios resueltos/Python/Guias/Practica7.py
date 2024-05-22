import math

# Primera Parte
#1.1, ejecutar de tres formas distintas a pertence, dada una seq de num, ver si x pertece.
def pertence_In(ls:list, n) -> bool:
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
    print(b)
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
