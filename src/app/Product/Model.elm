module Product.Model exposing (Product)

import Food.Model exposing (Food)
import Product.Shop exposing (Shop)
import Unit.Model exposing (Unit)


type alias Product =
    { food : Food
    , shop : Shop
    , price : Int
    , net : Unit
    , name : String
    }
