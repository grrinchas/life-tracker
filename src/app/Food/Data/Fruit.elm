module Food.Data.Fruit exposing (banana)

import Food.Food exposing (Food)
import Nutrient.Model as Nut
import Route.Resource
import Tag.Model exposing (Tag(..))
import Unit.Model as Unit


banana : Food
banana =
    { tags = [ Fruit, Fresh ]
    , name = "Banana"
    , pic = Route.Resource.banana
    , protein =
        Nut.protein <| Unit.grams 1.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 3.1
            , sugar = Unit.grams 14.0
            , total = Unit.grams 27.0
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.grams 0.1
            , total = Unit.grams 0.4
            }
    , total = Unit.custom "1 medium" 118.0
    }
