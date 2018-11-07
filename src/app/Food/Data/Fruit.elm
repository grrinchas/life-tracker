module Food.Data.Fruit exposing (apples, banana, dates, grapes, mango)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


apples : Food
apples =
    { tags = [ Fruit, Fresh ]
    , name = "Apples"
    , pic = Route.Resource.apples
    , protein = Nut.protein <| Unit.grams 0.5
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 4.4
            , sugar = Unit.grams 19
            , total = Unit.grams 25
            }
    , fats = Nut.zeroFats
    , total = Unit.custom "1 Medium" 182
    }


grapes : Food
grapes =
    { tags = [ Fruit, Fresh ]
    , name = "Grapes"
    , pic = Route.Resource.grapes
    , protein = Nut.protein <| Unit.zero
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 1
            , total = Unit.grams 1
            }
    , fats = Nut.zeroFats
    , total = Unit.custom "1 Grape" 2.4
    }


mango : Food
mango =
    { tags = [ Fruit, Fresh ]
    , name = "Mango"
    , pic = Route.Resource.mango
    , protein =
        Nut.protein <| Unit.grams 2.8
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 5
            , sugar = Unit.grams 45
            , total = Unit.grams 50
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.3
            , mono = Unit.grams 0.5
            , poly = Unit.grams 0.2
            , total = Unit.grams 1.3
            }
    , total = Unit.custom "1 Fruit" 336
    }


dates : Food
dates =
    { tags = [ Fruit, Dried ]
    , name = "Dates"
    , pic = Route.Resource.dates
    , protein =
        Nut.protein <| Unit.grams 2.5
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 8
            , sugar = Unit.grams 63
            , total = Unit.grams 75
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.4
            }
    , total = Unit.hectograms 1
    }


banana : Food
banana =
    { tags = [ Fruit, Fresh ]
    , name = "Banana"
    , pic = Route.Resource.banana
    , protein =
        Nut.protein <| Unit.grams 1.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 3.1
            , sugar = Unit.grams 14.0
            , total = Unit.grams 27.0
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.grams 0.1
            , total = Unit.grams 0.4
            }
    , total = Unit.custom "1 medium" 118.0
    }
