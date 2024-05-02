module Simulacro where

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas (t1:t2:ts) = not(hayElementosDeTuplasIguales (t1:t2:ts)) && not (hayRepetidos(t1:t2:ts))
    
    {-
    |hayElementosDeTuplasIguales (t1:t2:ts) == False && hayRepetidos (t1:t2:ts) == False = True
    |otherwise = False
-}

elementosIguales :: (String,String)->Bool -- si los elementos de la tupla son iguales da verdadero, caso contrario falso
elementosIguales t 
    |fst t == snd t = True
    |otherwise = False

hayElementosDeTuplasIguales :: [(String,String)] ->Bool --empleo la funcion elementosIguales a cada tupla de la lista, si hay una que tiene elementos iguales da true, caso contrario falso.
hayElementosDeTuplasIguales (x:[]) = elementosIguales x
hayElementosDeTuplasIguales (t:ts) = elementosIguales t || hayElementosDeTuplasIguales ts

sonIguales :: (String,String) -> (String,String) -> Bool -- si los elementos de las tuplas son iguales sin importar su orden da verdadero, caso contrario falso
sonIguales t1 t2 
    |(fst t1 == fst t2 && snd t1 == snd t2) || (fst t1 == snd t2 && snd t1 == fst t2) = True -- ejemplo: (a,b) y (a,b) ó ejemplo: (a,b) y (b,a)
    |otherwise = False

repetido :: [(String,String)] -> Bool   -- dada la lista, comparo el primer elemento con los demas, si encuentro que es igual a alguno da verdadero y si no falso
repetido (t1:[]) = False                -- si la tupla es el unico elemento de la lista entonces no está repetido y da falso
repetido (t1:t2:ts) -- pregunta si el primer elemento es igual al siguiente, si así lo son da verdadero, si no es así repito el proceso con el siguiente elemento en la lista.
    |sonIguales t1 t2 == True = True
    |otherwise = repetido (t1:ts)

hayRepetidos :: [(String,String)]->Bool -- si hay algun elemento de la lista repetido da True, caso contrario False
hayRepetidos (x:[]) = False
hayRepetidos (t1:t2:ts) = repetido (t1:t2:ts) || hayRepetidos (t2:ts)