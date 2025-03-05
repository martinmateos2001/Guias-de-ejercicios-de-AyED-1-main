def codificar(claves:list[tuple], mensaje:str) ->str:
    res = ""
    for c in mensaje:
        for t in claves:
            if c == t[0]:
                res = res + t[1]
    return res

clavesOr = [chr(x) for x in range(97, 97+26)]
print(clavesOr)
clavesDes = []
i = len(clavesOr) - 1
while i > -1:
    clavesDes.append(clavesOr[i])
    i = i -1
print(clavesDes)
claves = [(clavesOr[i], clavesDes[i]) for i in range(0, len(clavesOr))]

print(claves)
ms = "hola"
print(codificar(claves, ms))