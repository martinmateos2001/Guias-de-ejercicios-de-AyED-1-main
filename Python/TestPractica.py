from Practica import *
import unittest

class TestDeterminante2x2 (unittest.TestCase):
    def test_positivo(self):
        res = determinante2x2([
            [1,2], 
            [2,1]])
        self.assertEqual(res, -3)
    
    def test_negativo(self):
        res = determinante2x2(
            [[-1,1],
             [1,1]]
        )
        self.assertEqual(res, -2)
    
    def test_resPositivo(self):
        res = determinante2x2(
            [[4,2],
             [3,3]]
        )
        self.assertEqual(res, 6)

matriz = [
        [1,2,3],
        [4,5,6],
        [7,8,9]]
class TestSubMatriz (unittest.TestCase):
    
    
    def test1 (self):
        resT1 = subMatriz(matriz,0,0)
        self.assertEqual(resT1, [[5,6], [8,9]])
    
    def test2(self):
        resT2 = subMatriz(matriz, 0, 1)
        self.assertEqual(resT2, [[4,6],[7,9]])
    
    def test3(self):
        resT3 = subMatriz(matriz, 0,2)
        self.assertEqual(resT3, [[4,5], [7,8]])

    def test4(self):
        x=[
            [1,2,3],
            [1,5,3],
            [7,3,1]
        ]
        res = subMatriz(x, 0, 0)
        self.assertEqual(res, [[5,3], [3,1]])

    def test5(self):
        x=[
            [1,2,3],
            [1,5,3],
            [7,3,1]
        ]
        res = subMatriz(x, 0, 1)
        self.assertEqual(res, [[1,3], [7,1]])
    
    def test6(self):
        x=[
            [1,2,3],
            [1,5,3],
            [7,3,1]
        ]
        res = subMatriz(x, 0, 2)
        self.assertEqual(res, [[1,5], [7,3]])

class TestDeterminanteMatriz3x3(unittest.TestCase):
    
    def test1(self):
        x = [
        [0,0,0],
        [1,2,3],
        [1,2,3]
    ]
        res = determinante3x3(x)
        self.assertEqual(res, 0)
    
    def test2(self):
        x=[
            [1,2,3],
            [1,5,3],
            [7,3,1]
        ]
        res = determinante3x3(x)
        self.assertEqual(res, -60)

class Test_tieneTilde(unittest.TestCase):
    def test(self):
        res1 = tieneTilde("osó")
        self.assertEqual(res1, True)

        res2 = tieneTilde("óso")
        self.assertEqual(res2, True)

        res3 = tieneTilde("oso")
        self.assertEqual(res3, False)
        
class Test_quitarTilde(unittest.TestCase):
    

if __name__ == '__main__':
    unittest.main()