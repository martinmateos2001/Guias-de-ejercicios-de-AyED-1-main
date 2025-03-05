import Data.Char

claves = [(a, chr ((mod (ord a + 1 - 97) 26) + 97))|a <- ['a' .. 'z']]
mensajes = ["abc", "def", "ghi"]
debeSer = ["bcd", "efg", "hij"]

codChar :: [(Char, Char)] -> Char -> Char
codChar (t:ts) c
    |fst t == c = snd t
    |otherwise = codChar ts c

codificar :: [(Char, Char)] -> [Char] -> [Char]
codificar _ [] = []
codificar claves (x:xs) = [codChar claves x] ++ codificar claves xs --Acá terminaba xd

codMensajes :: [(Char, Char)] -> [[Char]] -> [[Char]]
codMensajes _ [] = []
codMensajes claves (m:ms) = [codificar claves m] ++ codMensajes claves ms

bienCodificados :: [(Char, Char)] -> [[Char]] -> [[Char]] -> Bool
bienCodificados claves listaMensajes mensajesCodificados = (codMensajes claves listaMensajes) == mensajesCodificados