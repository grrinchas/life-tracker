module Food.Model exposing
    ( Model
    , foodPage
    , initial
    )

import Food.Data.Diary as Diary
import Food.Data.Legume as Legume
import Food.Data.Poultry as Poultry
import Food.Data.Supplement as Supplement
import Food.Food exposing (Food)
import Food.Page exposing (Page)
import Monocle.Lens exposing (Lens)


type alias Model =
    { page : Page
    , data : List Food
    }


foodPage : Lens Model Page
foodPage =
    Lens .page (\b a -> { a | page = b })


initial : Model
initial =
    { page = Food.Page.initial
    , data =
        [ Poultry.rawChickenBreast
        , Supplement.wheyProtein
        , Diary.skimmedMilk
        , Legume.redLentils
        ]
    }
