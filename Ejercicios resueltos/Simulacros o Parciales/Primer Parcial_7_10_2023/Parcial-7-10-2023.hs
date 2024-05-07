{-Primos en Cero
Dada una secuencia s de enteros, la devuelve pero en la posicion que habia un numero primo lo cambia por un cero.-}

primosEnCero :: [Int] -> [Int]

esPrimo :: Int -> Bool -- es Primo si la cantidad de divisores es igual 4 {-1, 1, -n, n}
esPrimo n = cantDivisores n n == 4

cantDivisores :: Int -> Int -> Int -- divido a n por a  y si da cero es divisor, a entre [-n, n]
cantDivisores n a 
    |a==(-n) = 1
    |a==0 = cantDivisores n (-1)
cantDivisores n a 
    |a > (-n) && a <= n && mod n a == 0 = 1 + cantDivisores n (a-1) 
    |a > (-n) && a <= n && mod n a /= 0 = 0 + cantDivisores n (a-1)