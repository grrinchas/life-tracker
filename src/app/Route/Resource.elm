module Route.Resource exposing (milk, path, proteinPowder, rawChickenBreast, redLentils)


path : String
path =
    "/images/"


proteinPowder =
    path ++ "protein_powder.jpg"


milk =
    path ++ "milk.jpg"


rawChickenBreast =
    path ++ "raw_chicken_breast.jpg"


redLentils =
    path ++ "red_lentils.jpg"
