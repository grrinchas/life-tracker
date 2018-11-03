module Food.Data.Poultry exposing (chickenBreastSlicedAsda, eggs, rawChickenBreast, turkeySliced)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


turkeySliced : Food
turkeySliced =
    { tags = [ Poultry ]
    , name = "Turkey Slices"
    , protein = Nut.protein <| Unit.grams 4.3
    , pic = Route.Resource.turkeySlicedAsda
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 0.2
            , sugar = Unit.grams 0.2
            , total = Unit.grams 0.5
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.grams 0.1
            , poly = Unit.grams 0.1
            , total = Unit.grams 0.3
            }
    , total = Unit.custom "1 Slice" 20
    }


eggs : Food
eggs =
    { tags = [ Poultry ]
    , name = "Eggs"
    , protein = Nut.protein <| Unit.grams 6
    , pic = Route.Resource.eggs
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 0.6
            , total = Unit.grams 0.6
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 1.6
            , mono = Unit.grams 2
            , poly = Unit.grams 0.7
            , total = Unit.grams 5
            }
    , total = Unit.custom "1 Large" 50
    }


rawChickenBreast : Food
rawChickenBreast =
    { tags = [ Meat, Poultry ]
    , name = "Raw Chicken Breast"
    , protein = Nut.protein <| Unit.grams 23.1
    , pic = Route.Resource.rawChickenBreast
    , carbs =
        Nut.zeroCarbs
    , fats =
        Nut.fats
            { sat = Unit.grams 0.3
            , mono = Unit.grams 0.3
            , poly = Unit.zero
            , total = Unit.grams 1.2
            }
    , total = Unit.hectograms 1
    }


chickenBreastSlicedAsda : Food
chickenBreastSlicedAsda =
    { tags = [ Meat, Poultry ]
    , name = "Chicken breast sliced ASDA"
    , protein = Nut.protein <| Unit.grams 4.8
    , pic = Route.Resource.chickenBreastSlicedAsda
    , carbs = Nut.zeroCarbs
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.grams 0.1
            , poly = Unit.zero
            , total = Unit.grams 0.3
            }
    , total = Unit.custom "1 Slice" 19
    }
