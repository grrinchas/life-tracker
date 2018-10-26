module Food.Data.Vegetable exposing (redBellPepper)

import Food.Food exposing (Food)
import Nutrient.Model as Nut
import Route.Resource
import Tag.Model exposing (Tag(..))
import Unit.Model as Unit


redBellPepper : Food
redBellPepper =
    { tags = [ Vegetable ]
    , name = "Red Bell Pepper"
    , pic = Route.Resource.redBellPepper
    , protein =
        Nut.protein <| Unit.grams 0.9
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 0.7
            , sugar = Unit.grams 2.3
            , total = Unit.grams 4.3
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.zero
            }
    , total = Unit.custom "1 unit" 45
    }
