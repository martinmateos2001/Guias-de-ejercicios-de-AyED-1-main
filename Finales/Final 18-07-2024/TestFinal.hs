import Final1807
import Test.HUnit 

runFinal = runTestTT allTests

allTests = test [
    "lista valida" ~: testListaValida,
    "filas validas" ~: testFilasValidas,
    "obtener columna" ~: testObtenerColumna,
    "sacar columna" ~: testSacarColumna,
    "obtener las columnas" ~: testColumnasSudoku
    ]

testListaValida = test [
    listaValida [1,2,3,4] ~?= True,
    listaValida [1,1] ~?= False,
    listaValida [] ~?= True,
    listaValida [2] ~?= True,
    listaValida [1,2,3,4,4] ~?= False,
    listaValida [1,2,2,3] ~?= False
    ]

testFilasValidas = test [
    filasValidas [] ~?= True,
    filasValidas [[]] ~?= True,
    filasValidas [[1,2,3]] ~?= True, --Un solo elemento valido
    filasValidas [
        [1,2,3], 
        [4,5,6], 
        [7,8,9]] ~?= True, --Varios elementos validos
    filasValidas [[1,1]] ~?= False, -- un solo elemento no valido
    filasValidas [
        [1,2,3], 
        [1,1]] ~?= False, --ultimo no valido
    filasValidas [
        [1,2], 
        [1,1], 
        [1,2]] ~?= False -- medio no valido
    ]

testObtenerColumna = test[
    obtenerColumna [[1]] ~?= [1],
    obtenerColumna [[1,2]] ~?= [1],
    obtenerColumna [
        [1],
        [1]] ~?= [1,1],
    obtenerColumna [
        [1,2],
        [2,1]] ~?= [1,2],
    obtenerColumna [
        [1], []] ~?= [1],
    obtenerColumna [
        [1,2],
        [2,3],
        [3,4]] ~?= [1,2,3]
    ]

testSacarColumna = test[
    sacarColumna [] ~?= [],
    sacarColumna [[1]] ~?= [],
    sacarColumna [
        [1],
        [2],
        [3]] ~?= [],
    sacarColumna [
        [1,2,3],
        [1,2,3],
        [1,2,3]] ~?= [
            [2,3],
            [2,3], 
            [2,3]]
    ]

testColumnasSudoku = test [
    columnasSudoku [
        [1,2,3],
        [1,2,3],
        [1,2,3]
    ] ~?= [[1,1,1], [2,2,2], [3,3,3]],
    columnasSudoku [
        [1],
        [1],
        [1]] ~?= [[1,1,1]],
    columnasSudoku [
        [1,2,3,4],
        [1,2,3,4],
        [1,2,3,4],
        [1,2,3,4]
    ]  ~?= [
            [1,1,1,1],
            [2,2,2,2],
            [3,3,3,3],
            [4,4,4,4]
        ]
    ]

testEsSudokuValido = test[
        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [9,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,0,0],
            [0,0,5,0,0,0,0,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,9,0,0]
        ] ~?= True,

        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [9,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,0,0],
            [0,0,5,0,0,0,5,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,9,0,0]
        ] ~?= False,

        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [1,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,0,0],
            [0,0,5,0,0,0,0,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,9,0,0]
        ] ~?= False,

        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [9,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,8,8],
            [0,0,5,0,0,0,0,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,9,0,0]
        ] ~?= False,

        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [9,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,0,0],
            [0,0,5,0,0,0,0,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,8,0,8]
        ] ~?= True,

        esSudokuValido [
            [1,2,3,4,5,6,7,8,9],
            [9,8,7,6,4,5,3,2,1],
            [3,0,0,0,0,0,0,0,0],
            [0,4,0,0,0,0,0,0,0],
            [0,0,5,0,0,0,0,0,0],
            [0,0,0,6,0,0,0,0,0],
            [0,0,0,0,7,0,0,0,0],
            [0,0,0,0,0,8,0,0,0],
            [0,0,0,0,0,0,8,0,9]
        ] ~?= True
    ]