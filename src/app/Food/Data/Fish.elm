module Food.Data.Fish exposing (salmonFillets)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


salmonFillets : Food
salmonFillets =
    { tags = [ Fish, Meat ]
    , name = "Salmon Fillets"
    , pic = Route.Resource.salmonFilletsRaw
    , protein =
        Nut.protein <| Unit.grams 20.7
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.zero
            , total = Unit.grams 0.5
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 3.2
            , mono = Unit.zero
            , poly = Unit.grams 5.4
            , total = Unit.grams 19.3
            }
    , total = Unit.custom "1 Fillet" 120
    }
