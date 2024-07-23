import Test.HUnit 
import Parcial 

exTestRepetido = runTestTT testRepetido --Funciona

testRepetido = test [
                    "Con repetidos" ~: (repetido [(['m','a','r','t','o'], [0]), (['m','a','r','t','o'], [0,0,4,4,4])] ) ~?= True,
                    "Sin repetidos" ~: (repetido [(['m','a','r','t','o'], [0]), (['m','a','r','t','o','N'], [0,0,4,4,4])] ) ~?= False
                    ]

exRepetidos = runTestTT testRepetidos -- Funciona

testRepetidos = test [
                    "Con repetidos" ~: (repetidos [(['m','a','r','t','o'], [0]), (['l', 'u', 'i', 's'], [0,0,4,4,4]), (['l','u','i','s'], [0])] ) ~?= True,
                    "Sin repetidos" ~: (repetidos [(['m','a','r','t','o'], [0]), (['m','a','r','t','o','N'], [0,0,4,4,4]), (['l','u','i','s'], [0])] ) ~?= False
                    ]

exNotasValidasDelRegistro = runTestTT testNotasValidasDelRegistro --Funciona

testNotasValidasDelRegistro = test [
    "notas validas" ~: (notasValidasDelRegistro [(['a'], [1,2,3]), (['b'], [5,8,3]) ]) ~?= True,
    "Notas no validas" ~: (notasValidasDelRegistro [ (['a'], [1,5,7]), (['b'], [-7,86]) ]) ~?= False,
    "Notas no validas" ~: (notasValidasDelRegistro [ (['a'], [1,5,7]), (['b'], [10,9,12]) ]) ~?= False  
    ]


exPertenece = runTestTT testPertenece --Funciona
testPertenece = test [
    "Pertenece" ~: (pertenece [(['a'], [1]), (['b'], [2]), (['c'], [3])] ['c']) ~?= True,
    "No pertenece" ~: (pertenece [(['a'], [1]), (['b'], [2]), (['c'], [3])] ['d']) ~?= False
    ]

exEj1 = runTestTT testAproboMasDeNMaterias
testAproboMasDeNMaterias = test [
    "Aprobó mas o igual de n materias" ~: (aproboMasDeNMaterias [(['a'], [1,2,3,4]), (['b'], [10, 9, 5])] ['b'] 3) ~?= True,
    "No aprobó mas de n materias" ~: (aproboMasDeNMaterias [(['a'], [1,2,3,4]), (['b'], [10, 9, 5])] ['b'] 2) ~?= False
    ]