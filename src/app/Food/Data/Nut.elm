module Food.Data.Nut exposing (cashewsRoastedSalted)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


cashewsRoastedSalted : Food
cashewsRoastedSalted =
    { tags = [ Nut ]
    , name = "Cashews Dry Roasted Salted"
    , pic = Route.Resource.cashewsSalted
    , protein =
        Nut.protein <| Unit.grams 17
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 3.3
            , sugar = Unit.grams 5
            , total = Unit.grams 30
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 8
            , mono = Unit.grams 26
            , poly = Unit.grams 9
            , total = Unit.grams 48
            }
    , total = Unit.hectograms 1
    }
