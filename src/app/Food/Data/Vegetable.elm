module Food.Data.Vegetable exposing (avocado, cucumber, mixedVegetableCanned, redBellPepper, romanianLettuce)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


avocado : Food
avocado =
    { tags = [ Vegetable, Fresh ]
    , name = "Avocado"
    , pic = Route.Resource.avocado
    , protein =
        Nut.protein <| Unit.grams 4
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 13
            , sugar = Unit.grams 1.3
            , total = Unit.grams 17
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 4.3
            , mono = Unit.grams 20
            , poly = Unit.grams 3.9
            , total = Unit.grams 29
            }
    , total = Unit.custom "1 unit" 201
    }


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


cucumber : Food
cucumber =
    { tags = [ Fresh, Vegetable ]
    , name = "Cucumber"
    , pic = Route.Resource.cucumber
    , protein =
        Nut.protein <| Unit.grams 2
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2
            , sugar = Unit.grams 5
            , total = Unit.grams 11
            }
    , fats = Nut.zeroFats
    , total = Unit.custom "1 Large" 301
    }


romanianLettuce : Food
romanianLettuce =
    { tags = [ Fresh, Vegetable ]
    , name = "Romanian Lettuce"
    , pic = Route.Resource.romanianLettuce
    , protein =
        Nut.protein <| Unit.grams 8
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 13
            , sugar = Unit.grams 7
            , total = Unit.grams 21
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.grams 0.1
            , poly = Unit.grams 1
            , total = Unit.grams 1.9
            }
    , total = Unit.custom "1 Head" 626
    }
