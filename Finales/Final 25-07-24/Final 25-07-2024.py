def maximoValor (s:'list[int]') -> int:
    res:int = 0
    for e in s:
        if (e>res):
            res = e
    return res

def subSeqHastaNInclusive(s:'list[int]', n) -> 'list[int]':
    res:'list[int]' = []
    for i in range(n+1):
        res.append(s[i])

def maximosDeSubsecuencias(s1:'list[int]', s2:'list[int]') -> 'list[int]':
    res:'list[int]'=[]
    for i in range(len(s1)):
        e = s1[i]
        if e > len(s2):
            res.append(0)
        else:
            res.append(maximoValor(subSeqHastaNInclusive(s2, e)))
    s1 = res
    return s1

s1 = [3,2,3,5,1]
s2 = [-1,2,3,1,5,4,3]
res = maximosDeSubsecuencias(s1, s2)
print(res)