module Parcial1C2023 where

--1.1
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int 
votosEnBlanco formulas votos cantidadTotalDeVotos 
    |formulasValidas(formulas) == True && numElemLista (formulas) == numElemLista(votos) && votosTotales(votos) <= cantidadTotalDeVotos = cantidadTotalDeVotos - votosTotales(votos)

-- numero de elementos de una lista.
numElemLista :: (Eq a) => [a] -> Int
numElemLista [] = 0
numElemLista (elem:restoDeElementos) |(elem:restoDeElementos) /= [] = 1 + numElemLista(restoDeElementos)

votosTotales :: [Int]->Int
votosTotales []=0
votosTotales (voto:restoDeVotos) = voto + votosTotales(restoDeVotos)

votosValidos :: [Int] -> Bool
votosValidos [] = True
votosValidos (voto:restoDeVotos) = voto>=0 && votosValidos(restoDeVotos)

--1.2
formulasValidas :: [(String,String)] -> Bool -- evaluo si cada formula de la lista es formula valida.
formulasValidas [x] = formulaValida [x]
formulasValidas (formula:restoFormulas) = formulaValida (formula:restoFormulas) && formulasValidas restoFormulas
   
formulaValida :: [(String,String)] -> Bool --está definida así porque la recursividad no está definida para que haya un solo elemento.
formulaValida [(a,b)] 
    |a=="" && b=="" = True
    |a/=b=True
    |otherwise = False
formulaValida ((a,b):(c,d):restoFormulas)
    |a==b && (a,b)/=("","") = False -- mismo candidato es falso
    |(a==c || b==d || a==d || b==c) = False -- no puede haber formulas repetidas ni personas en otras listas
    |otherwise= formulaValida ((a,b):restoFormulas) -- veo si la formula no se repite.
{-
1.3
funcion:
-porcentajeVotos
parametros:
-presidente:String
-formulas:[(String, String)]
-votos: [Int]
resultado: Integer

requiere:
*La primera componente de la lista de formulas es presidente
*formulasValidas(formulas)
*num(formulas)=num(votos)
*
-}

