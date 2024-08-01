def maximoValor (seq:'list[int]') -> int:
    res:int = 0
    for v in seq:
        if (v>res):
            res = v
    return res

def subSeqHastaNInclusive(s:'list[int]', n:int) -> 'list[int]':
    res:'list[int]' = []
    for i in range(n+1):
        res.append(s[i])
    return res

def maximosDeSubsecuencia(s1:'list[int]', s2:'list[int]') -> 'list[int]':
    res:'list[int]'=[]
    for i in range(len(s1)):
        e = s1[i]
        if e > len(s2):
            res.append(0)
        else:
            subseq = subSeqHastaNInclusive(s2, e)
            res.append(maximoValor(subseq))
    s1 = res
    return s1

s1 = [3,2,3,5,1]
s2 = [-1,2,3,1,5,4,3]
a = maximosDeSubsecuencia(s1, s2)
print(str(a))