-- ejercicio 1, serie de fibonacci
fibonacci :: Integer -> Integer
{-fibonacci n 
    |n>=0 && n==0 = 0
    |n>=0 && n==1 = 1
    |n>1 = fibonacci(n-1) + fibonacci(n-2)-}
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n |n>1= fibonacci(n-1) + fibonacci(n-2)

{- 
Ejercicio 2,
|n>=0 && n<1 -> 0
|n>=1 && n<10 -> {1, 2, ... , 9}
|n>=10 && n<100 -> {10, 11, 12, ... , 99}
                    {100, ... , 999}
                    {1000, ... , 9999}
-}


parteEntera :: Float-> Integer
parteEntera n
    |n>=0 && n<1 = 0
    |n>=1 = 1 + parteEntera(n-1)
    |otherwise = (-1) + parteEntera(n+1)
 {-suma unos hasta que que n es cero, para los negativos es al revés-}

-- ejercicio 3
resta::Integer->Integer->Integer
resta x y = x-y

esDivisible :: Integer->Integer->Bool
esDivisible x y 
    |x-y==0=True
    |x-y<0=False
    |otherwise= esDivisible (resta x y) y 

--repaso implementar factorial, ¿que es pattern matching?
factorial::Integer->Integer
factorial n
    |n==0=1
    |n>0=n*factorial(n-1)

{-
Usando pattern matching la funcion se ve asi:
factorial 0=1
factorial n=n*factorial(n-1)
-}

--Ejercicio 4, suma de los primeros n numeros impares
sumaImpares :: Int -> Int
sumaImpares n
    |n==0 = 0 
    |n>=1 = (2*n-1) + sumaImpares (n-1)


-- Ejercicio 5, implentar medioFact donde n!!= n*(n-2)*(n-4)... | i=0 -> (n-1)/2 sum (n-2i)
medioFact ::Integer->Integer
medioFact n 
    |n==0 = 1
    |n==1 = 1
    |n>1 = n*medioFact(n-2)

--Ejercicio 6, calcular la suma de los digitos de un numero

sumaDigitos :: Integer -> Integer
sumaDigitos n 
    |n>0 && n<10 = n 
    |otherwise = (digitoUnidades n + sumaDigitos(sacarUnidades n))

{-Ejercicio 7, indica si todos los digitos de un numero natural son iguales-}

--Funciones auxiliares
digitoUnidades :: Integer->Integer
digitoUnidades n = mod n 10

sacarUnidades :: Integer-> Integer 
sacarUnidades n = div n 10

todosDigitosIguales :: Integer->Bool
todosDigitosIguales n
    |n<10 = True
    |otherwise = (digitoUnidades n == digitoUnidades(sacarUnidades n)) && todosDigitosIguales(sacarUnidades n)


--Proxima clase se retoma en ejercicio 8
cantDigitos :: Integer-> Integer
cantDigitos n
    |n <10 = 1
    |otherwise = 1 + cantDigitos(sacarUnidades n)
    

-- ejercicio 13 
problemaDobleSumaPotencias :: Integer-> Integer->Integer
problemaDobleSumaPotencias 1 m = sumaDePotencias 1 m 
problemaDobleSumaPotencias n m = sumaDePotencias n m + problemaDobleSumaPotencias (n-1) m

sumaDePotencias :: Integer->Integer->Integer
sumaDePotencias n 1 = n
sumaDePotencias n m = n^m + sumaDePotencias n (m-1)

-- Ejercicio 16
-- a)
{-
el menor divisor es menor que n y es multiplo de n -}

menorDivisor ::  Integer->Integer
menorDivisor n = menorDivisorHasta n 2 

menorDivisorHasta :: Integer->Integer->Integer
menorDivisorHasta n i 
    |mod n i == 0 = i
    |otherwise = menorDivisorHasta n (i+1)

-- Ejercicio 17
esFib :: Integer -> Bool -- Uso la funcion fib para ver si n es uno de los terminos de la susecion de fibonacci, comenzando desde el termino 1.
esFib n = fib n 1

fib :: Integer->Integer ->Bool 
fib n k 
    |n==fibonacci k = True
    |n>fibonacci k = fib n (k+1)
    |otherwise = False
{-
fib prueba si n es igual k-esimo numero de fibonacci bajo los siguientes casos:
+Si son iguales da verdadero.
+Si n es mayor al k enesimo numero, prueba de nuevo con el siguiente termino de la sucesion.
+Si no es ninguno de los casos, osea n es menor a k-esimo numero de la suscesion, da falso.
-}
------------------ Ejercicio 19
esSumaDePrimos :: Int -> Bool
esSumaDePrimos n = esSumaDePrimerosKPrimos 1 n -- Comprueba si n es igual a la suma de los primeros k primos, ejecutando esSumaDePrimerosKPrimos con k=1

esSumaDePrimerosKPrimos :: Int->Int->Bool 
esSumaDePrimerosKPrimos k n
    |(sumaKPrimos k) == n = True
    |(sumaKPrimos k) > n = False
    |otherwise = esSumaDePrimerosKPrimos (k+1) n
{-
Comprueba si la suma de k primos es igual a n
Si son iguales devuelve True
Si la suma es mayor entonces devuelve False
Si no es ninguno de los casos anteriores, repite el proceso pero con la suma de los k+1 primos 
-}

sumaKPrimos::Int->Int --Es la sumatoria de los primeros k primos
sumaKPrimos 0 = 0
sumaKPrimos k = 2*k-1 + sumaKPrimos(k-1)

{-
Ejercicio 20

Especificar e implementar la función tomaValorMax :: Int ->Int ->Int que dado un número entero n1 ≥ 1 y un n2 ≥ n1 
devuelve algún m entre n1 y n2 tal que sumaDivisores(m) = max{sumaDivisores(i) | n1 ≤ i ≤ n2}
 

tomaValorMaxEntre :: Int ->Int ->Int
tomaValorMaxEntre n1 n2

maximo :: Int -> Int-> Int
maximo a b 
    |a>=b = a 
    |otherwise = b

sumaDivisores :: Int -> Int -> Int
sumaDivisores 
-}

{-
Ejercicio 21, implementar pitagoras :: Integer ->Integer ->Integer ->Integer, con m, n, r >= 0, que cuente la cantidad de pares (p,q) que satisfacen
0<=p<=m && 0<=q<=n que satisfacen p**2 + q**2 <= r**2
-}

--pitagoras :: Integer ->Integer ->Integer ->Integer
