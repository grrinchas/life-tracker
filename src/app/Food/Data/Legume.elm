module Food.Data.Legume exposing (chickpeasCanned, redKidneyBeansCanned, redLentils, riceBasmati, riceCakeLowFat, riceWhite)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


riceCakeLowFat : Food
riceCakeLowFat =
    { tags = [ Legume ]
    , name = "Rice Cake Low Fat"
    , pic = Route.Resource.riceCakeLowFat
    , protein =
        Nut.protein <| Unit.grams 0.6
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 0.5
            , sugar = Unit.grams 0.5
            , total = Unit.grams 6.1
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.grams 0.1
            , poly = Unit.grams 0.1
            , total = Unit.grams 0.5
            }
    , total = Unit.custom "1 Cake" 7.5
    }


chickpeasCanned : Food
chickpeasCanned =
    { tags = [ Legume, Canned ]
    , name = "Chickpeas Canned"
    , pic = Route.Resource.chickpeasCanned
    , protein =
        Nut.protein <| Unit.grams 9.2
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 7.3
            , sugar = Unit.grams 0.6
            , total = Unit.grams 19.8
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.grams 0.5
            , poly = Unit.grams 0.8
            , total = Unit.grams 1.7
            }
    , total = Unit.custom "1/2 Can" 120
    }


redKidneyBeansCanned : Food
redKidneyBeansCanned =
    { tags = [ Legume, Canned ]
    , name = "Red Kidney Beans Canned"
    , pic = Route.Resource.beansCanned
    , protein =
        Nut.protein <| Unit.grams 9.7
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 9.4
            , sugar = Unit.grams 0.6
            , total = Unit.grams 15.4
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.grams 0.1
            , poly = Unit.grams 0.5
            , total = Unit.grams 1.7
            }
    , total = Unit.custom "1/2 Can" 126
    }


redLentils : Food
redLentils =
    { tags = [ Legume ]
    , name = "Red Lentils"
    , pic = Route.Resource.redLentils
    , protein =
        Nut.protein <| Unit.grams 26.0
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 31.0
            , sugar = Unit.grams 2.0
            , total = Unit.grams 60.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.grams 0.2
            , poly = Unit.grams 0.5
            , total = Unit.grams 1.1
            }
    , total = Unit.hectograms 1
    }


riceBasmati : Food
riceBasmati =
    { tags = [ Legume ]
    , name = "Sainsbury Basmati Rice"
    , pic = Route.Resource.riceBasmatiSainsbury
    , protein =
        Nut.protein <| Unit.grams 8.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.2
            , sugar = Unit.zero
            , total = Unit.grams 77.1
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.6
            }
    , total = Unit.hectograms 1
    }


riceWhite : Food
riceWhite =
    { tags = [ Legume ]
    , name = "Sainsbury White Rice"
    , pic = Route.Resource.riceWhiteSainsbury
    , protein =
        Nut.protein <| Unit.grams 7.1
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 1.3
            , sugar = Unit.zero
            , total = Unit.grams 79.9
            }
    , fats =
        Nut.fats
            { sat = Unit.zero
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.7
            }
    , total = Unit.hectograms 1
    }
