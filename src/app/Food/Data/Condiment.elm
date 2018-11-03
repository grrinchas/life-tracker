module Food.Data.Condiment exposing (ceasarDressingLowFat, elPasoHerbsMixFajitas, ketchup, oilSunflowerSpray, tikkaCurryPaste)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag(..))
import Nutrient.Model as Nut
import Route.Resource
import Unit.Model as Unit


tikkaCurryPaste : Food
tikkaCurryPaste =
    { tags = [ Condiment ]
    , name = "Tikka Curry Paste"
    , pic = Route.Resource.tikkaCurryPaste
    , protein =
        Nut.protein <| Unit.grams 3.6
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 6.0
            , sugar = Unit.grams 8.2
            , total = Unit.grams 14.2
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.7
            , mono = Unit.grams 4.0
            , poly = Unit.grams 1.7
            , total = Unit.grams 6.6
            }
    , total = Unit.custom "1/2 Pot" 100
    }


elPasoHerbsMixFajitas : Food
elPasoHerbsMixFajitas =
    { tags = [ Condiment ]
    , name = "El Paso Fajita Seasoning Mix"
    , pic = Route.Resource.herbsMixElPasoFajitas
    , protein =
        Nut.protein <| Unit.grams 2.4
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 1.2
            , sugar = Unit.grams 1.6
            , total = Unit.grams 14.8
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.2
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.6
            }
    , total = Unit.custom "1/4 Pack" 21.2
    }


ceasarDressingLowFat : Food
ceasarDressingLowFat =
    { tags = [ Condiment ]
    , name = "Ceasar Dressing Low Fat"
    , pic = Route.Resource.ceasarDressingLowFat
    , protein =
        Nut.protein <| Unit.grams 1.0
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 4.9
            , sugar = Unit.grams 3.5
            , total = Unit.grams 8.4
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.4
            , mono = Unit.grams 1.4
            , poly = Unit.grams 0.8
            , total = Unit.grams 2.9
            }
    , total = Unit.hectograms 1
    }


ketchup : Food
ketchup =
    { tags = [ Condiment ]
    , name = "Sainsbury Tomato Ketchup"
    , pic = Route.Resource.ketchup
    , protein =
        Nut.protein <| Unit.grams 1.9
    , carbs =
        Nut.carbs
            { fibre = Unit.grams 2.3
            , sugar = Unit.grams 19.5
            , total = Unit.grams 22.0
            }
    , fats =
        Nut.fats
            { sat = Unit.grams 0.1
            , mono = Unit.zero
            , poly = Unit.zero
            , total = Unit.grams 0.5
            }
    , total = Unit.hectograms 1
    }


oilSunflowerSpray : Food
oilSunflowerSpray =
    { tags = [ Condiment ]
    , name = "ASDA Sunflower Oil Spray"
    , pic = Route.Resource.oilSunflowerSpray
    , protein =
        Nut.protein <| Unit.grams 0
    , carbs = Nut.zeroCarbs
    , fats =
        Nut.fats
            { sat = Unit.grams 0.5
            , mono = Unit.grams 1.25
            , poly = Unit.grams 2.65
            , total = Unit.grams 4.6
            }
    , total = Unit.custom "25 Sprays" 5
    }
