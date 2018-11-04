module Food.Data.Bakery exposing (breadHovisSeeded, tortillaWrapsWholemeal)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


tortillaWrapsWholemeal : Food
tortillaWrapsWholemeal =
    { tags = [ Bakery ]
    , name = "Tortilla Wraps Wholemeal"
    , pic = Route.Resource.tortillaWrapsWholemeal
    , protein =
        Nut.protein <| Unit.grams 5.6
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 5.1
            , sugar = Unit.grams 1.5
            , total = Unit.grams 30.1
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 1.9
            , mono = Unit.grams 1.4
            , poly = Unit.grams 0.6
            , total = Unit.grams 4.1
            }
    , total = Unit.custom "1 Wrap" 44
    }


breadHovisSeeded : Food
breadHovisSeeded =
    { tags = [ Bakery ]
    , name = "Hovis Seeded Bread"
    , pic = Route.Resource.breadHovisSeeded
    , protein =
        Nut.protein <| Unit.grams 4.4
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.3
            , sugar = Unit.grams 18.5
            , total = Unit.grams 18.5
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.3
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 2.9
            }
    , total = Unit.custom "1 Slice" 44
    }
