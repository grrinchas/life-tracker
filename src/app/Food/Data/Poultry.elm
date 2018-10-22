module Food.Data.Poultry exposing (rawChickenBreast)

import Food.Model exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Unit.Model as Unit


rawChickenBreast : Food
rawChickenBreast =
    { tags = [ Meat, Poultry ]
    , protein = Nut.protein <| Unit.grams 23.1
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
