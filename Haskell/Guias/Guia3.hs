dobleMe :: Int -> Int
dobleMe x = x+x

--ejercicio 3
estanRelacionados :: Integer->Integer->Bool
estanRelacionados a b 
    |mod a b == 0 = True
    |otherwise = False
    
-- ejercicio 4
--b
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a, b) (c, d) = (a < c) && (b < d)

--todoMenor t1 t2 = (fst t1) < (fst t2) && (snd t1) < (snd t2)

--f
posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (x,y,z)    |mod x 2 == 0 = 0
                        |mod y 2 == 0 = 1
                        |mod z 2 == 0 = 2
                        |otherwise = 4

-- ejercicio 6
bisiesto :: Int -> Bool
bisiesto x  
    |mod x 100 == 0 = mod x 400 == 0
    |otherwise = mod x 4 == 0


--ejercicio 7
absoluto :: Float -> Float
absoluto x  |x < 0 = -x
            |otherwise = x
distanciaManhattan :: (Float,Float,Float)->(Float,Float,Float)->Float
distanciaManhattan (x1,y1,z1) (x2, y2, z2) = absoluto(x1-x2) + absoluto(y1-y2)+ absoluto(z1-z2)

-- ejercicio 8
unidades :: Integer -> Integer 
unidades x = mod x 10
decenas :: Integer->Integer
decenas x = mod x 100

dosCifras :: Integer->Integer
dosCifras x = decenas x + unidades x

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = unidades(abs x) + (mod (div (abs x) 10) 10) 

comparar :: Integer -> Integer -> Integer
comparar a b    
    |(sumaUltimosDosDigitos a) < (sumaUltimosDosDigitos b) = 1
    |(sumaUltimosDosDigitos a) > (sumaUltimosDosDigitos b) = -1
    |otherwise = 0

-- ejercicio 9
f4 :: Float -> Float -> Float 
f4 x y = (x+y)/2
{- Suma dos variables del tipo Float, los suma y luego divide el resultado por dos
La especificacion puede ser:
problema distanciaMedia (x:R, y:R) : R{
    requiere:{True}
    asegura:res=(x+y)/2
    } 
-}
f5 :: (Float, Float) -> Float
f5 (x, y) = (x+y)/2
{-Toma los valores de la dupla y realiza el mismo calcula que f4
especificacion:
problema distanciaMedia2 (b:(RxR)): R{
    requiere: {True}
    asegura: res = (b_0 + b_1)/2
    }
-}

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b
{-
Si la parte entera de a es igual a b devuelve true
Especificacion:
problema compararParteReal (a:Q, b:Z): Bool {
    requiere:{True}
    asegura: {(res=True) <--> a-  = b}
    }   
-}