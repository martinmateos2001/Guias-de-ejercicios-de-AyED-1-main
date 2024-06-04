"""
Ejercicio 1:
    problema acomodar (in s: seq<String>) : seq<String> {
        requiere: { Todos los elementos de s son o bien "LLA" o bien "UP"}
        asegura: {|res| = |s|}
        asegura: { Todos los elementos de res son o bien "LLA" o bien "UP"}
        asegura: {res contiene la misma cantidad de elementos "UP" que s}
        asegura: {res contiene todas las apariciones de "UP" antes de las
        apariciones de "LLA"}
    
    Acomodar las boletas de la lista, ejemplo:
        l = ["LLA", "UP", "LLA", "LLA", "UP"] -> res =  ["UP", "UP", "LLA", "LLA", "LLA"]
    
"""

#como el parametro de entrada es del tipo in, necesito una funcion que copie la lista.
def copiar_lista(ls:list) -> list:
    res:list = []
    for i in range(len(ls)):
        res.append(ls[i])
    return res
"""
ls_ejemplo:list = [0,1,2]
print("original: " + str(ls_ejemplo))
ls_copia:list = copiar_lista(ls_ejemplo)
print("copia: " + str(ls_copia))
ls_copia.append(3)
print("copia modificada: " + str(ls_copia))
print("original: " + str(ls_ejemplo))
"""
def acomodar(ls:'list[str]') -> 'list[str]':
    res:'list[str]' = []
    copia:'list[str]' = copiar_lista(ls)
    lla_ls:'list[str]' = []
    up_ls:'list[str]' = []
    for e in copia:
        if e == "UP":
            lla_ls.append(e)
        else:
            up_ls.append(e)
    res = lla_ls + up_ls
    return res

"""corroboro que funciona"""
l = ["LLA", "UP", "LLA", "LLA", "UP"]
print(l)
l_ok = acomodar(l)
print("acomadadas: " + str(l_ok))
"""YEY"""

"""
Ejercicio 2:
    Dada una lista de enteros que indica entrada y salida de personas y una variable que indica 
    el momento, devolver el pico de entrada a partir de la variable.
    problema pos_umbral (in s: seq<Z>, in u: Z) : Z {
        requiere: u ≥ 0
        asegura: {res=-1 si el umbral no se supera en ningún momento }
        asegura: {Si el umbral se supera en algún momento, res es la primera
        posición tal que la sumatoria de los primeros res+1 elementos
        (considerando solo aquellos que son positivos) es estrictamente mayor que
        el umbral u }
    Por ejemplo, dadas:
        s = [1,-2,0,5,-7,3]
        u = 5
        se debería devolver res = 3
"""
def pos_umbral(lista:'list[int]', u:int) -> int:
    res:int = 0
    ls:'list[int]' = copiar_lista(lista)
     