module Parcial where

{-
Ejercicio 1
Tenemos una lista llamada registro con la siguiente estructra, ["nombre y apellido", [Notas]],
por lo tanto registro = [String, [Int]]

problema aproboMasDeNMaterias :: [([Char], [Int])] -> [Char] -> Int -> Bool
REQUIERE:
1- No hay alumnos repetidos en registro
2- Las notas entre [0,10]
3- n > 0
4- Alumno pertenece a registro
ASEGURA: 
- res = True si y solo si alumno aprobo mas de n notas mayores o iguales a 4.
-}



aproboMasDeNMaterias :: [([Char], [Int])] -> [Char] -> Int -> Bool
aproboMasDeNMaterias registro alumno n 
    |repetidos registro == False && notasValidasDelRegistro registro == True && pertenece registro alumno == True && n > 0 = aproboMasDeNMateriasAux registro alumno n

notasAprobadas :: [Int] -> Int
notasAprobadas [x] 
    |x>=4 = 1
    |otherwise = 0
notasAprobadas (x:xs) 
    |x>=4 = 1 + notasAprobadas xs
    |otherwise = 0 + notasAprobadas xs

aproboMasDeNMateriasAux :: [([Char], [Int])] -> [Char] -> Int -> Bool
aproboMasDeNMateriasAux [(alumno, notas)] persona n = n >= notasAprobadas notas
aproboMasDeNMateriasAux ((alumno, notas):registro) persona n 
    |persona == alumno = n >= notasAprobadas notas
    |persona /= alumno = aproboMasDeNMateriasAux registro persona n

--requiere1 
repetido :: [([Char], [Int])] -> Bool -- comprueba si la primera lista de char se repite, si es asi da True
repetido [(alumno, notas)] = False
repetido ((alumno1, notas1):(alumno2, notas2):registro) 
    |alumno1 == alumno2 = True
    |alumno1 /= alumno2 = repetido ((alumno1, notas1):registro)

repetidos :: [([Char], [Int])] -> Bool -- comprueba repetido para todos los elementos de la lista, si hay por lo menos uno que se repite da True, caso contrario False
repetidos [(alumno, notas)] = False
repetidos ((alumno1,notas1):registro) = repetido ((alumno1,notas1):registro) || repetido registro

-- Requiere 2
notasValidas :: [Int] -> Bool -- dada la lista de notas de un alumno, si estan entre cero y diez da True.
notasValidas [x]= x>=0 && x<=10
notasValidas (x:xs) = x>=0 && x<=10 && notasValidas xs

notasValidasDelRegistro :: [([Char], [Int])] -> Bool
notasValidasDelRegistro [(alumno, notas)] = notasValidas notas 
notasValidasDelRegistro ((alumno, notas):registro) = notasValidas notas && notasValidasDelRegistro registro

--requiere 4
pertenece :: [([Char], [Int])] -> [Char] -> Bool
pertenece [(alumno, notas)] persona = persona == alumno
pertenece ((alumno, notas):registro) persona
    |persona == alumno = True
    |otherwise = pertenece registro persona

{-
Ejercicio 2
Problema buenosAlumnos :: [([Char], [Int])] -> [[Char]]
REQUIERES:
1- No hay Nombres de alumnos repetidos, osea repetidos(registro)
2- Todas las notas n son n>=0 && n<=10, osea notasValidasDelRegistro(registro)
ASEGURA:
Lista de nombres de los alumnos con promedio mayor o igual a 8 y sin notas menores o iguales a 4
-}

{- buenosAlumnos :: [([Char], [Int])] -> [[Char]]
buenosAlumnos registro
    |repetidos registro == False && notasValidasDelRegistro registro == True = -} 

numElementos :: (Eq t) => [t] -> Int
numElementos [] = 0
numElementos (x:xs) 
    |(x:xs) /= [] = 1 + numElementos xs

sumNumeros :: [Int] -> Int
sumNumeros [] = 0
sumNumeros (x:xs) = x + sumNumeros

promedio :: [Int] -> Float
promedio lista = fromInt(sumNumeros lista)/fromInt(numElementos lista)