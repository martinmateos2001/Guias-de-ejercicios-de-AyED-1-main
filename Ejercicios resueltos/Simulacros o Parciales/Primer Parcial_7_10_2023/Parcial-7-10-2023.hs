{-Primos en Cero
Dada una secuencia s de enteros, la devuelve pero en la posicion que habia un numero primo lo cambia por un cero.-}

primosEnCero :: [Int] -> [Int]
primosEnCero [x]
    |esPrimo x == True = [0]
    |esPrimo x == False = [x]
primosEnCero (x:xs) 
    |esPrimo x == True = 0:(primosEnCero xs)
    |esPrimo x == False = x:(primosEnCero xs)

esPrimo :: Int -> Bool -- es Primo si la cantidad de divisores es igual 4 {-1, 1, -n, n}
esPrimo n = cantDivisores n n == 4

cantDivisores :: Int -> Int -> Int -- divido a n por a  y si da cero es divisor, a entre [-n, n]
cantDivisores n a 
    |n>0 && a==n = 1 + cantDivisores n (a-1) -- caso inicial para n>0, n n
    |n>0 && a==(-n) = 1 -- caso final para n>0, n -n
    |n>0 && a==0 = cantDivisores n (-1) -- no puedo dividir por cero y lo salteo.
    |n<0 && a==0 = cantDivisores n (1) -- no puedo dividir por cero y lo salteo.
    |n<0 && a == n = 1 + cantDivisores n (a+1) -- caso inicial para n<0, seria -n -n
    |n<0 && a == (-n) = 1 -- caso final para n<0, seria -n n
cantDivisores n a 
    |n > 0 && a > (-n) && a < n && mod n a == 0 = 1 + cantDivisores n (a-1) 
    |n > 0 && a > (-n) && a < n && mod n a /= 0 = 0 + cantDivisores n (a-1)
    |n < 0 && a > (-n) && a < n && mod n a == 0 = 1 + cantDivisores n (a+1)
    |n < 0 && a > (-n) && a < n && mod n a /= 0 = 0 + cantDivisores n (a+1)