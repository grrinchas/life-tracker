module Food.Data.Poultry exposing (rawChickenBreast)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


rawChickenBreast : Food
rawChickenBreast =
    { tags = [ Meat, Poultry ]
    , name = "Raw Chicken Breast"
    , protein = Nut.protein <| Unit.grams 23.1
    , pic = Route.Resource.rawChickenBreast
    , carbs = Nut.zeroCarbs
    , fats =
        Nut.fats
            { sat = Unit.grams 0.3
            , mono = Unit.grams 0.3
            , poly = Unit.zero
            , total = Unit.grams 1.2
            }
    , total = Unit.hectograms 1
    }
