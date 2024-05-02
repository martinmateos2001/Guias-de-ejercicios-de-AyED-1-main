import Simulacro
import Test.HUnit

ejecutar = runTestTT testRelacionesValidas

-- "nombre" ~: (funcion parametros) ~?= resultado_esperado

testRelacionesValidas = test [
  "componentes repetidas" ~: (relacionesValidas [("ana", "ana")]) ~?= False, -- aprobó
  "tupla repetida" ~: (relacionesValidas [("ana", "pedro"), ("ana", "pedro")]) ~?= False, --aprobó
  "tupla repetida invertida" ~: (relacionesValidas [("ana", "pedro"), ("pedro", "ana")]) ~?= False, --aprobó
  "todas diferentes" ~: (relacionesValidas [("ana", "pedro"), ("ana", "carlos")]) ~?= True --aprobó
  ]

-- -- EJEMPLOS

-- USUARIO1 = "JUAN"
-- USUARIO2 = "NATALIA"
-- USUARIO3 = "PEDRO"

-- RELACION1_2 = (USUARIO1, USUARIO2)
-- RELACION1_1 = (USUARIO1, USUARIO1)
-- RELACION1_3 = (USUARIO1, USUARIO3)


-- -- FUNCIONES PARA TESTING, NO BORRAR
-- -- EXPECTANY PERMITE SABER SI EL ELEMENOT QUE DEVUELVE LA FUNCIÓN ES ALGUNO DE LOS ESPERADOS
-- EXPECTANY ACTUAL EXPECTED = ELEM ACTUAL EXPECTED ~? ("EXPECTED ANY OF: " ++ SHOW EXPECTED ++ "\N BUT GOT: " ++ SHOW ACTUAL)


-- -- SONIGUALES PERMITE VER QUE DOS LISTAS SEAN IGUALES SI NO IMPORTA EL ORDEN
-- QUITAR :: (EQ T) => T -> [T] -> [T]
-- -- REQUIERE X PERTENECE A Y
-- QUITAR X (Y:YS)
-- | X == Y = YS
-- | OTHERWISE = Y : QUITAR X YS

-- INCLUIDO :: (EQ T) => [T] -> [T] -> BOOL
-- INCLUIDO [] L = TRUE
-- INCLUIDO (X:C) L = ELEM X L && INCLUIDO C (QUITAR X L)

-- SONIGUALES :: (EQ T) => [T] -> [T] -> BOOL
-- SONIGUALES XS YS = INCLUIDO XS YS && INCLUIDO YS XS 
