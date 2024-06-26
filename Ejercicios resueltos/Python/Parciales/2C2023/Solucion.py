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
    ingresos:int = 0
    ls:'list[int]' = []
    for e in lista: #Lista con los numeros positivos
        if e > 0:
            ls.append(e)
    
    for i in range(len(ls)):
        e:int = ls[i]
        ingresos += e #sumo los ingresos
        if ingresos > u: # si ingresos es mayor al umbral retorno res = i + 1
            res = i+2
            return res 
    res = -1 # solo sucede si no se supera el umbral
    return res
       

print(pos_umbral([1,-2,0,5,-7,3], 5)) 

"""
Ejercicio 3:
    problema columnas_repetidas(in mat:seq<seq<Z>> ) : Bool {
        requiere: {|mat| > 0}
        requiere: {todos los elementos de mat tienen igual longitud m, con m > 0
        (los elementos de mat son secuencias)}
        requiere: {todos los elementos de mat tienen longitud par (la cantidad de
        columnas de la matriz es par)}
        asegura: {(res = true) <=> las primeras m/2 columnas de mat son iguales a
        las últimas m/2 columnas}
    }

    Por ejemplo, dada la matriz:
        m = [[1,2,1,2],[-5,6,-5,6],[0,1,0,1]]
    se debería devolver res = true
    TIP: para dividir un número entero x por 2 y obtener como resultado un número
    entero puede utilizarse la siguiente instrucción: int(x/2)
"""
m = [[1,2,1,2],[-5,6,-5,6],[0,1,0,1]]
def columnas_repetidas(mat:'list[list[int]]') -> bool:
    correctas:list[bool] = []
    for fila in mat:
        i:int = 0
        mitad1:int = 0
        mitad2:int = 0
        while i < len(fila)/2:  
            mitad1 += fila[i]
            i += 1
        while i <len(fila):
            mitad2 += fila[i]
            i += 1
        b:bool = mitad1 == mitad2
        correctas.append(b)
    return not(False in correctas)
print(columnas_repetidas(m))

"""4) Rugby 4 naciones [3 puntos]
Implementar la función cuenta_posiciones_por_nacion que dada la lista de
naciones que compiten en el torneo, y el diccionario que tiene los resultados
de los torneos anuales en el formato año:posiciones_naciones, donde año es un
número entero y posiciones_naciones es una lista de strings con los nombres de
las naciones, genere un diccionario de naciones:#posiciones, que para cada
Nación devuelva la lista de cuántas veces salió en esa posición.

Tip: para crear una lista con tantos ceros como naciones se puede utilizar la
siguiente sintaxis lista_ceros = [0]*len(naciones)

problema cuenta_posiciones_por_nacion(in naciones: seq<String>, in torneos:
dict<Z,seq<String>>: dict<String,seq<Z>> {
    requiere: {naciones no tiene elementos repetidos}
    requiere: {Los valores del diccionario torneos son permutaciones de la
    lista naciones (es decir, tienen exactamente los mismos elementos que
    naciones, en cualquier orden posible)}
    asegura: {res tiene como claves los elementos de naciones}
    asegura: {El valor en res de una nación es una lista de |naciones|
    elementos que indica en la posición i cuántas veces salió esa nación en la
    i-ésima posición.}
}
Por ejemplo, dados
naciones= ["arg", "aus", "nz", "sud"]
torneos= {2023:["nz", "sud", "arg", "aus"], 2022:["nz", "sud", "aus", "arg"]}
se debería devolver res = {"arg": [0,0,1,1], "aus": [0,0,1,1], "nz": [2,0,0,0],
"sud": [0,2,0,0]}
"""
def cuenta_posiciones_por_nacion(naciones:'list[str]', torneos:'dict[int, list[str]]') -> 'dict[str, list[int]]':
    res:dict[str, list[int]] = {}
    for nacion in naciones:
        res[nacion] = [0] * len(naciones)  #Por cada nacion agrega al diccionario una lista de 4 ceros.
    
    for anio in torneos.keys():
        for i in range(len(torneos[anio])): #torneos[anios] es la lista de naciones
            res[torneos[anio] [i]] [i] += 1 #res[torneos[anio][i]] [i] += 1 == res[nacion] [i] += 1 en el año correspondiente y res[nacion] [i] +=1 == [0,0,0,0] [i] += 1
    return res