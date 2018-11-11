module Food.Data.Sweet exposing (brownies)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


brownies : Food
brownies =
    { tags = [ Sweet ]
    , name = "Brownies"
    , protein = Nut.protein <| Unit.grams 6
    , pic = Route.Resource.brownies
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.zero
            , total = Unit.grams 50
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 7
            , mono = Unit.grams 11
            , poly = Unit.grams 9
            , total = Unit.grams 29
            }
    , total = Unit.hectograms 1
    }
