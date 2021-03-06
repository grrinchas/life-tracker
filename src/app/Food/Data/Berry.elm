module Food.Data.Berry exposing (blueberriesAsda)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


blueberriesAsda : Food
blueberriesAsda =
    { tags = [ Berry, Fresh ]
    , name = "Blueberries"
    , pic = Route.Resource.blueberriesAsda
    , protein =
        Nut.protein <| Unit.grams 0.9
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 9.1
            , total = Unit.grams 9.1
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.zero
            }
    , total = Unit.hectograms 1
    }
