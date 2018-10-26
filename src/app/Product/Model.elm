module Product.Model exposing (Product)

import Food.Food exposing (Food)
import Product.Shop exposing (Shop)
import Unit.Model exposing (Unit)
import Unit.Price exposing (Price)


type alias Product =
    { food : Food
    , shop : Shop
    , price : Price
    , net : Unit
    , name : String
    }
