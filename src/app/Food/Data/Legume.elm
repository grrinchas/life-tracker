module Food.Data.Legume exposing (redLentils, riceBasmati, riceWhite)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
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


riceBasmati : Food
riceBasmati =
    { tags = [ Legume ]
    , name = "Sainsbury Basmati Rice"
    , pic = Route.Resource.riceBasmatiSainsbury
    , protein =
        Nut.protein <| Unit.grams 8.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.2
            , sugar = Unit.zero
            , total = Unit.grams 77.1
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.6
            }
    , total = Unit.hectograms 1
    }


riceWhite : Food
riceWhite =
    { tags = [ Legume ]
    , name = "Sainsbury White Rice"
    , pic = Route.Resource.riceWhiteSainsbury
    , protein =
        Nut.protein <| Unit.grams 7.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 1.3
            , sugar = Unit.zero
            , total = Unit.grams 79.9
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.7
            }
    , total = Unit.hectograms 1
    }
