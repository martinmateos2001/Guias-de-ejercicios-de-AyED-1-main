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



if __name__ == '__main__':
    unittest.main()