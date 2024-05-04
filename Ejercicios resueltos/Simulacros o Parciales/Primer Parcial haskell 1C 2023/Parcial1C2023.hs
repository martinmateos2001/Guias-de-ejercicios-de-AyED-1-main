module Parcial1C2023 where

--1.1
votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int
votosEnBlanco formulas votos cantidadTotalDeVotos 
    |formulasValidas(formulas) == True && votosValidos(votos) == True && numElemLista (formulas) == numElemLista(votos) && votosTotales(votos) <= cantidadTotalDeVotos = cantidadTotalDeVotos - votosTotales(votos)

-- numero de elementos de una lista.
numElemLista :: (Eq a) => [a] -> Int
numElemLista [] = 0
numElemLista (elem:restoDeElementos) |(elem:restoDeElementos) /= [] = 1 + numElemLista(restoDeElementos)

votosTotales :: [Int]->Int
votosTotales [x]=x
votosTotales (voto:restoDeVotos) = voto + votosTotales(restoDeVotos)

votosValidos :: [Int] -> Bool
votosValidos [] = False
votosValidos [x]|x>=0=True
votosValidos (voto:restoDeVotos) = voto>=0 && votosValidos(restoDeVotos)

--1.2
formulasValidas :: [(String,String)] -> Bool -- evaluo si cada formula de la lista es formula valida.
formulasValidas [] = False
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
*elementos de votos >=0 y al menos uno >0
*num(formulas)>0

asegura:
*res = porcentaje de votos obtenidos sobre el total de formula encabezada por presidente
    osea que necesito sacar el porcentaje de la formula de presidente.
    total de votos ---- %100
    votos del presidente -- x= votos del presidente*100/total de votos
    %votosDelPresidente= (votos del presidente *100)/total de votos
-}

--porcentajeVotos :: String ->[(String,String)] -> [Integer] -> Float
--porcentajeVotos presidente formulas votos
--    |requierePorcentajeVotos formulas votos == True && presidente == (fst(head formulas)) =

porcentajeVotos :: String -> [(String,String)] -> [Int]->Float --devuelve el porcentaje de votos del candidato a presidente seleccionado
porcentajeVotos presidente formulas votos
    |requierePorcentajeVotos formulas votos ==True = dividir ((votosPresidente presidente formulas votos)*100) (votosTotales votos)

votosPresidente :: String -> [(String,String)] -> [Int]->Int --recorre la lista de formulas buscando si el primer parametro de las duplas es igual a presidente y devuelve voto.
votosPresidente presidente ((xPresidente,vice):restoDeFormulas) (voto:restoDeVotos)
    |presidente==xPresidente = voto
    |otherwise = votosPresidente presidente restoDeFormulas restoDeVotos

requierePorcentajeVotos :: [(String, String)] -> [Int] -> Bool --Condiciones para que se ejecuta porcentajeVotos
requierePorcentajeVotos formulas votos = formulasValidas(formulas) && numElemLista(formulas) == numElemLista(votos) && numElemLista(formulas) >0 && votosValidos(votos) && votoMayorACero(votos)

votoMayorACero :: [Int]->Bool --Al menos un voto es mayor que cero
votoMayorACero [] = False
votoMayorACero [x] |x>0=True
votoMayorACero (voto:restoDeVotos) = voto>0 || votoMayorACero(restoDeVotos) 


dividir :: Int->Int->Float --toma dos parametros int y luego los divide transformandolos al tipo Float
dividir a b = (fromIntegral a)/(fromIntegral b)

