module Food.Data.Condiment exposing (ketchup)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


ketchup : Food
ketchup =
    { tags = [ Condiment ]
    , name = "Sainsbury Tomato Ketchup"
    , pic = Route.Resource.ketchup
    , protein =
        Nut.protein <| Unit.grams 1.9
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.3
            , sugar = Unit.grams 19.5
            , total = Unit.grams 22.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.5
            }
    , total = Unit.hectograms 1
    }
