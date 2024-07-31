"""
problema esSudokuvalido (in m:seq(seq(Z)):Bool{
requiere: {todos los elementos de m tienen longitud 9}
requiere: {|m|=9}
requiere: {todos los elementos en todas las secuencias de m son numeros del 0 al 9}
asegura: {(res = True) <-> en cada fila de de m no se repiten numeros del 1 al 9 && en cada columna de m no
            se repiten numeros del 1 al 9}
}
"""
def esRepetido(lista:'list[int]', n:int):
    apariciones:int = 0
    for e in lista:
        if n == e:
            apariciones += 1
    if apariciones > 1:
        return True
    else:
        return False

def fila_o_columna_valida(lista:'list[int]') -> bool:
    res:bool = False
    numeros:'list[int]' = []
    for i in range(1,10):
        numeros.append(i)

    for num in numeros:
        if esRepetido(lista, num):
            return res
    res = True
    return res

def obtenerColumnas(m:'list[list[int]]') -> 'list[list[int]]':
    res:list = []
    for i in range(0, 9):
        columna:list[int] = []
        for fila in m:
            columna.append(fila[i])
        res.append(columna)
    return res

def esSudokuValido(m:'list[list[int]]') -> bool:
    res:bool = False
    for s in m:
        if fila_o_columna_valida(s) == False:
            return res
    
    
    columnas = obtenerColumnas(m)
    for c in columnas:
        if fila_o_columna_valida(c) == False:
            return res

    res = True
    return res

m = [
    [1,2,3,4,5,6,7,8,9],
    [9,8,7,6,4,5,3,2,1],
    [0,0,0,0,0,0,1,0,0],
    [0,0,0,0,0,4,0,0,0],
    [0,0,0,0,6,0,0,0,0],
    [0,0,0,5,0,0,0,0,0],
    [0,0,4,0,0,0,0,0,0],
    [0,3,0,0,0,0,0,0,0],
    [2,0,0,0,0,0,0,0,0]
]
print(obtenerColumnas(m))
print(esSudokuValido(m))

