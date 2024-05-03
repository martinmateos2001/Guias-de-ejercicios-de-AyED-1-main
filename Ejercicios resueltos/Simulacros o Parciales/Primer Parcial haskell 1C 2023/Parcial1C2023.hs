module Parcial1C2023 where
--1.1
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int 
votosEnBlanco 
   
--el numero de elementos de la lista de formulas es igual al de votos
{-
numeroFormulas :: [(String,String)]->Int
numeroFormulas [] = 0
numeroFormulas (formula:restoFormulas) |(formula:restoFormulas) /= [] = 1 + numeroFormulas restoFormulas

numeroVotos :: [Int]->Int
numeroVotos []=0
numeroVotos (voto:votos) |(voto >= 0) && ((voto:votos) /= []) = 1 + numeroVotos(votos)
-}
numElemLista :: (Eq a) => [a] -> Int
numElemLista [] = 0
numElemLista (elem:restoDeElementos) |(elem:restoDeElementos) /= [] = 1 numElemLista(restoDeElementos)

votosTotales :: [Int]->Int
votosTotales []=0
votosTotales (voto:restoDeVotos) = voto + votosTotales(restoDeVotos)

--Entonces el voto en blanco es igual votos totales menos la resta de las lista que no son ("","")
numVotosEnBlanco :: [(String,String)]->[Int]->Int
numVotosEnBlanco

--1.2
formulasValidas :: [(String,String)] -> Bool -- evaluo si cada formula de la lista es formula valida.
formulasValidas [x] = formulaValida [x]
formulasValidas (formula:restoFormulas) = formulaValida (formula:restoFormulas) && formulasValidas restoFormulas
   
formulaValida :: [(String,String)] -> Bool 
formulaValida [(a,b)] --está definida así porque la recursividad no está definida para que haya un solo elemento.
    |a=="" && b=="" = True
    |a/=b=True
    |otherwise = False
formulaValida ((a,b):(c,d):restoFormulas)
    |a==b && (a,b)/=("","") = False -- mismo candidato es falso
    |(a==c || b==d || a==d || b==c) = False -- no puede haber formulas repetidas ni personas en otras listas
    |otherwise= formulaValida ((a,b):restoFormulas) -- veo si la formula