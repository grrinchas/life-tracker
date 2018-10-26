module Food.Data.Legume exposing (redLentils)

import Food.Food exposing (Food)
import Nutrient.Model as Nut
import Route.Resource
import Tag.Model exposing (Tag(..))
import Unit.Model as Unit


redLentils : Food
redLentils =
    { tags = [ Legume ]
    , name = "Red Lentils"
    , pic = Route.Resource.redLentils
    , protein =
        Nut.protein <| Unit.grams 26.0
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 31.0
            , sugar = Unit.grams 2.0
            , total = Unit.grams 60.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.grams 0.2
            , poly = Unit.grams 0.5
            , total = Unit.grams 1.1
            }
    , total = Unit.hectograms 1
    }
