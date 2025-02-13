def determinante2x2 (matriz2x2:list[list[int]]) -> int:
    res = matriz2x2[0][0]*matriz2x2[1][1] - matriz2x2[0][1]*matriz2x2[1][0]
    return res


def subMatriz (matriz:list[list[int]], fila:int, columna:int) -> list[list[int]]:
    res:list = []
    for e in matriz:
        res.append(e)
    #res = matriz

    res.pop(fila) #elimino la fila con la que no trabajo
    for n in range(len(res)):
        res[n].pop(columna) #elimino la columna con la que no trabajo

    return res

def determinante3x3 (matriz:list[list[int]]) -> int:
    res = matriz[0][0] * determinante2x2(subMatriz(matriz, 0, 0)) 
    - matriz[0][1] * determinante2x2(subMatriz(matriz,0,1)) 
    + matriz[0][2] * determinante2x2(subMatriz(matriz, 0, 2))
    return res

