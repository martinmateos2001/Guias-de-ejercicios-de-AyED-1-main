import Test.HUnit
import Parcial1C2023

ejecutarNumeroVotos = runTestTT testNumeroVotos

testNumeroVotos = test [
    "lista vacia" ~: (numeroVotos []) ~?= 0
    "voto negativo" ~: (numeroVotos [-1]) ~?= 1 --pongo  pero en realidad espero un error
    "ejemplo correcto" ~: (numeroVotos [1,2,3]) ~?= 3    
]

ejecutarNumeroFormulas = runTestTT testNumeroFormulas

testNumeroFormulas = test [
    "lista vacia" ~: (numeroFormulas []) ~?= 0
    "lista correcta" ~: (numeroFormulas [("a","b"),("c","d")]) ~?= 2
]