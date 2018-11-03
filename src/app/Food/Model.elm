module Food.Model exposing
    ( Model
    , foodPage
    , initial
    )

import Food.Data.Bakery as Bakery
import Food.Data.Berry as Berry
import Food.Data.Condiment as Condiment
import Food.Data.Diary as Diary
import Food.Data.Fruit as Fruit
import Food.Data.Grain as Grain
import Food.Data.Legume as Legume
import Food.Data.Nut as Nut
import Food.Data.Poultry as Poultry
import Food.Data.Supplement as Supplement
import Food.Data.Vegetable as Vegetable
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
        , Legume.riceBasmati
        , Legume.riceWhite
        , Vegetable.redBellPepper
        , Diary.fageTotalZero
        , Condiment.ketchup
        , Grain.granolaTropical
        , Berry.blueberriesAsda
        , Fruit.banana
        , Vegetable.mixedVegetableCanned
        , Diary.yogurtArlaSkyr
        , Poultry.chickenBreastSlicedAsda
        , Bakery.breadHovisSeeded
        , Vegetable.cucumber
        , Vegetable.romanianLettuce
        , Diary.yogurtMullerLight
        , Vegetable.avocado
        , Poultry.eggs
        , Condiment.oilSunflowerSpray
        , Vegetable.kale
        , Vegetable.leeks
        , Diary.cheeseParmesanGrated
        , Fruit.dates
        , Condiment.ceasarDressingLowFat
        , Diary.sourCreamLowFat
        , Bakery.tortillaWrapsWholemeal
        , Vegetable.broccoli
        , Fruit.mango
        , Diary.butter
        , Legume.redKidneyBeansCanned
        , Vegetable.tomatoesChoppedCanned
        , Vegetable.jalapenosCanned
        , Nut.cashewsRoastedSalted
        , Fruit.grapes
        , Poultry.turkeySliced
        , Legume.chickpeasCanned
        , Diary.greekCheeseSaladLowFat
        , Condiment.elPasoHerbsMixFajitas
        , Condiment.tikkaCurryPaste
        , Vegetable.greenBeans
        ]
    }
