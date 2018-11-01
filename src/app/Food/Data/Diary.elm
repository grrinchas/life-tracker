module Food.Data.Diary exposing (fageTotalZero, skimmedMilk)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


skimmedMilk : Food
skimmedMilk =
    { tags = [ Diary ]
    , name = "Skimmed Milk"
    , pic = Route.Resource.milk
    , protein =
        Nut.protein <| Unit.grams 3.6
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 5.0
            , total = Unit.grams 5.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.5
            }
    , total = Unit.hectomilliliters 1
    }


fageTotalZero : Food
fageTotalZero =
    { tags = [ Diary, Yogurt ]
    , name = "Fage Total 0%"
    , pic = Route.Resource.fageTotalZero
    , protein =
        Nut.protein <| Unit.grams 10.3
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 3.0
            , total = Unit.grams 3.0
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
