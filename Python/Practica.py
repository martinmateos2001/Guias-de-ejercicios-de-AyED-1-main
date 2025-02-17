def determinante2x2 (matriz2x2:'list[list[int]]') -> int:
    res = matriz2x2[0][0]*matriz2x2[1][1] - matriz2x2[0][1]*matriz2x2[1][0]
    return res

"""especificacion:
Problema subMatriz(in matriz:[[Int]], in fila:Int, in columna:int): [[Int]]
    requiere: |matriz| > 1
    asegura: res es igual a la matriz resultante de eliminar la fila y columna mencionada
"""
def subMatriz (matriz:'list[list[int]]', fila:int, columna:int) -> 'list[list[int]]':
    #res:list = [fila_matriz for fila_matriz in matriz if matriz.index(fila_matriz) != fila]
    res = []
    for f in matriz:
        aux = []
        for e in f:
            aux.append(e)
        res.append(aux)
    
    res.pop(fila)
    for f in res:
        f.pop(columna)

    return res

"""matriz = [
        [1,2,3],
        [4,5,6],
        [7,8,9]]

fila = 2
columna = 0

print(subMatriz(matriz, fila, columna))
print(matriz)"""

""" especificación:
Problema determinante3x3 (in matriz: [[int]]): int
    requiere: |matriz| = 3
    requiere: sea e pertenenciente a matriz, |e| = 3
    asegura: res es igual al calculo del determinante por producto mixto
"""
def determinante3x3 (matriz:'list[list[int]]') -> int:
    res = matriz[0][0] * determinante2x2(subMatriz(matriz, 0, 0)) 
    - matriz[0][1] * determinante2x2(subMatriz(matriz,0,1)) 
    + matriz[0][2] * determinante2x2(subMatriz(matriz, 0, 2))
    return res

