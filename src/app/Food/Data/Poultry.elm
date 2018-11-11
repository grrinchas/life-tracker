module Food.Data.Poultry exposing (chickenBreastSlicedAsda, eggs, porkLoin, rawChickenBreast, sausagesBerlinki, turkeySliced)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


sausagesBerlinki : Food
sausagesBerlinki =
    { tags = [ Meat ]
    , name = "Sausages Berlinki"
    , protein = Nut.protein <| Unit.grams 7.5
    , pic = Route.Resource.sausagesBerlinki
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 0.4
            , total = Unit.grams 1.6
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 3.75
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 10.5
            }
    , total = Unit.custom "1 Sausage" 50
    }


porkLoin : Food
porkLoin =
    { tags = [ Meat ]
    , name = "Smoked Pork Loin"
    , protein = Nut.protein <| Unit.grams 19
    , pic = Route.Resource.porkLoin
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 1.3
            , total = Unit.grams 1.3
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 1.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 3.3
            }
    , total = Unit.hectograms 1
    }


turkeySliced : Food
turkeySliced =
    { tags = [ Poultry, Meat ]
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
    , protein = Nut.protein <| Unit.grams 24
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
