module Food.Data.Vegetable exposing (avocado, broccoli, brusselsSprouts, cucumber, greenBeans, jalapenosCanned, kale, leeks, mixedVegetableCanned, potatoes, redBellPepper, romanianLettuce, spinach, tomatoesChoppedCanned)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


spinach : Food
spinach =
    { tags = [ Vegetable, Fresh ]
    , name = "Spinach"
    , pic = Route.Resource.spinach
    , protein =
        Nut.protein <| Unit.grams 2.9
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.2
            , sugar = Unit.grams 0.4
            , total = Unit.grams 3.6
            }
    , fats = Nut.zeroFats
    , total = Unit.hectograms 1
    }


potatoes : Food
potatoes =
    { tags = [ Vegetable, Fresh ]
    , name = "Potatoes"
    , pic = Route.Resource.potatoes
    , protein =
        Nut.protein <| Unit.grams 2
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.2
            , sugar = Unit.grams 0.8
            , total = Unit.grams 17
            }
    , fats = Nut.zeroFats
    , total = Unit.hectograms 1
    }


brusselsSprouts : Food
brusselsSprouts =
    { tags = [ Vegetable, Fresh ]
    , name = "Brussels Sprouts"
    , pic = Route.Resource.brusselsSprouts
    , protein =
        Nut.protein <| Unit.grams 0.6
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 0.7
            , sugar = Unit.grams 0.4
            , total = Unit.grams 1.7
            }
    , fats = Nut.zeroFats
    , total = Unit.custom "1 Unit" 19
    }


greenBeans : Food
greenBeans =
    { tags = [ Vegetable, Fresh ]
    , name = "Green Beens"
    , pic = Route.Resource.beansGreen
    , protein =
        Nut.protein <| Unit.grams 2.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 4.1
            , sugar = Unit.grams 3.0
            , total = Unit.grams 7.1
            }
    , fats = Nut.zeroFats
    , total = Unit.hectograms 1
    }


jalapenosCanned : Food
jalapenosCanned =
    { tags = [ Vegetable, Canned ]
    , name = "Jalapenos Canned"
    , pic = Route.Resource.yalapenosCanned
    , protein =
        Nut.protein <| Unit.grams 1.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 1.4
            , sugar = Unit.grams 1.3
            , total = Unit.grams 3.4
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.3
            }
    , total = Unit.hectograms 1
    }


tomatoesChoppedCanned : Food
tomatoesChoppedCanned =
    { tags = [ Vegetable, Canned ]
    , name = "Tomatoes Chopped Canned"
    , pic = Route.Resource.tomatoesChoppedCanned
    , protein =
        Nut.protein <| Unit.grams 2.6
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2
            , sugar = Unit.grams 7.2
            , total = Unit.grams 9.2
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.4
            }
    , total = Unit.custom "1/2 Can" 200
    }


broccoli : Food
broccoli =
    { tags = [ Vegetable, Fresh ]
    , name = "Broccoli"
    , pic = Route.Resource.broccoli
    , protein =
        Nut.protein <| Unit.grams 4.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 8
            , sugar = Unit.grams 5.2
            , total = Unit.grams 20
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.zero
            , poly = Unit.grams 0.2
            , total = Unit.grams 1.2
            }
    , total = Unit.custom "1 Whole" 335
    }


leeks : Food
leeks =
    { tags = [ Vegetable, Fresh ]
    , name = "Leeks"
    , pic = Route.Resource.leeks
    , protein =
        Nut.protein <| Unit.grams 1.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 1.6
            , sugar = Unit.grams 3.6
            , total = Unit.grams 13
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.grams 0.1
            , total = Unit.grams 0.3
            }
    , total = Unit.custom "1 Medium" 89
    }


kale : Food
kale =
    { tags = [ Vegetable, Fresh ]
    , name = "Kale"
    , pic = Route.Resource.kale
    , protein =
        Nut.protein <| Unit.grams 4.3
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2
            , sugar = Unit.zero
            , total = Unit.grams 9
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.grams 0.1
            , poly = Unit.grams 0.3
            , total = Unit.grams 0.9
            }
    , total = Unit.hectograms 1
    }


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
