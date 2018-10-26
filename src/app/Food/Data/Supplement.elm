module Food.Data.Supplement exposing (wheyProtein)

import Food.Food exposing (Food)
import Nutrient.Model as Nut
import Route.Resource
import Tag.Model exposing (Tag(..))
import Unit.Model as Unit


wheyProtein : Food
wheyProtein =
    { tags = [ Supplement ]
    , name = "Whey Protein Powder"
    , pic = Route.Resource.proteinPowder
    , protein =
        Nut.protein <| Unit.grams 81.6
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 4.2
            , total = Unit.grams 5.5
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 2.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 3.3
            }
    , total = Unit.hectograms 1
    }
