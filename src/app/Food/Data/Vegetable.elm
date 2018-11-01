module Food.Data.Vegetable exposing (mixedVegetableCanned, redBellPepper)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


redBellPepper : Food
redBellPepper =
    { tags = [ Vegetable, Fresh ]
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


mixedVegetableCanned : Food
mixedVegetableCanned =
    { tags = [ Vegetable, Canned ]
    , name = "Mixed Vegetables in Water"
    , pic = Route.Resource.vegetableMixedCanned
    , protein =
        Nut.protein <| Unit.grams 6.0
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 6.2
            , sugar = Unit.grams 2.2
            , total = Unit.grams 14.1
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.5
            }
    , total = Unit.custom "1 Can" 195
    }
