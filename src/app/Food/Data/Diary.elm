module Food.Data.Diary exposing (butter, cheeseParmesanGrated, fageTotalZero, greekCheeseSaladLowFat, skimmedMilk, sourCreamLowFat, yogurtArlaSkyr, yogurtMullerLight)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


greekCheeseSaladLowFat : Food
greekCheeseSaladLowFat =
    { tags = [ Diary, Cheese ]
    , name = "Greek Cheese Salad Low Fat"
    , pic = Route.Resource.cheeseSalad
    , protein =
        Nut.protein <| Unit.grams 18.5
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 1
            , total = Unit.grams 1
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 8.5
            , mono = Unit.grams 1.8
            , poly = Unit.grams 1
            , total = Unit.grams 11.5
            }
    , total = Unit.hectograms 1
    }


butter : Food
butter =
    { tags = [ Diary ]
    , name = "Butter"
    , pic = Route.Resource.butter
    , protein =
        Nut.protein <| Unit.grams 0.2
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 0.2
            , total = Unit.grams 0.2
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 9.8
            , mono = Unit.grams 4.2
            , poly = Unit.grams 0.4
            , total = Unit.grams 16.6
            }
    , total = Unit.custom "1 piece" 20
    }


sourCreamLowFat : Food
sourCreamLowFat =
    { tags = [ Diary ]
    , name = "Sour Cream Low Fat"
    , pic = Route.Resource.sourCreamLowFat
    , protein =
        Nut.protein <| Unit.grams 6.9
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 6.6
            , total = Unit.grams 6.6
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 1.6
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 2.7
            }
    , total = Unit.hectomilliliters 1
    }


cheeseParmesanGrated : Food
cheeseParmesanGrated =
    { tags = [ Diary, Cheese ]
    , name = "Cheese"
    , pic = Route.Resource.cheeseParmesanGrated
    , protein =
        Nut.protein <| Unit.grams 32.4
    , carbs = Nut.zeroCarbs
    , fats =
        Nut.fats
            { sat = Unit.grams 19.6
            , mono = Unit.grams 9.3
            , poly = Unit.grams 0.8
            , total = Unit.grams 29.7
            }
    , total = Unit.hectograms 1
    }


skimmedMilk : Food
skimmedMilk =
    { tags = [ Diary ]
    , name = "Skimmed Milk"
    , pic = Route.Resource.milk
    , protein =
        Nut.protein <| Unit.grams 3.6
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 5.0
            , total = Unit.grams 5.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.5
            }
    , total = Unit.hectomilliliters 1
    }


fageTotalZero : Food
fageTotalZero =
    { tags = [ Diary, Yogurt ]
    , name = "Fage Total 0%"
    , pic = Route.Resource.fageTotalZero
    , protein =
        Nut.protein <| Unit.grams 17.51
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 5.1
            , total = Unit.grams 5.1
            }
    , fats = Nut.zeroFats
    , total = Unit.custom "1 Pot" 170
    }


yogurtArlaSkyr : Food
yogurtArlaSkyr =
    { tags = [ Diary, Yogurt ]
    , name = "Arla Skyr Icelandic Yogurt "
    , pic = Route.Resource.yogurtArlaSkyr
    , protein =
        Nut.protein <| Unit.grams 14.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 0.3
            , sugar = Unit.grams 11.7
            , total = Unit.grams 12
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.3
            }
    , total = Unit.custom "1 Pot" 150
    }


yogurtMullerLight : Food
yogurtMullerLight =
    { tags = [ Diary, Yogurt ]
    , name = "Muller Light Yogurt"
    , pic = Route.Resource.yogurtMullerLight
    , protein =
        Nut.protein <| Unit.grams 7.5
    , carbs =
        Nut.carbs
            { fibre = Unit.zero
            , sugar = Unit.grams 12
            , total = Unit.grams 13
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.875
            }
    , total = Unit.custom "1 Pot" 175
    }
