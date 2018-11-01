module Food.Data.Grain exposing (granolaTropical)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


granolaTropical : Food
granolaTropical =
    { tags = [ Grain ]
    , name = "Granola Tropical"
    , pic = Route.Resource.granolaTropical
    , protein =
        Nut.protein <| Unit.grams 8.4
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 44.5
            , sugar = Unit.grams 23.5
            , total = Unit.grams 68.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 5.2
            , mono = Unit.grams 3.8
            , poly = Unit.grams 3.1
            , total = Unit.grams 12.6
            }
    , total = Unit.hectograms 1
    }
