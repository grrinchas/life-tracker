module Activity.Data.Year2018.October exposing (activities)

import Activity.Model exposing (Activity)
import Date.Model exposing (Date, epoch)
import Food.Data.Berry exposing (blueberriesAsda)
import Food.Data.Diary exposing (skimmedMilk)
import Food.Data.Fruit exposing (banana)
import Food.Data.Grain exposing (granolaTropical)
import Food.Data.Legume exposing (redLentils)
import Food.Data.Poultry exposing (rawChickenBreast)
import Food.Data.Supplement exposing (wheyProtein)
import Food.Data.Vegetable exposing (redBellPepper)
import Meal.Model exposing (Meal(..), foodIngredient)
import Time exposing (Month(..))
import Unit.Model exposing (grams, milliliters, scalar)


proteinMilkshake : Meal
proteinMilkshake =
    FoodList
        [ foodIngredient wheyProtein (grams 30)
        , foodIngredient skimmedMilk (grams 400)
        ]


day8 : List Activity
day8 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 8, hour = hour, minute = min }
    in
    [ "Strength"
        |> Activity.Model.exercising
            { start = today8 13 30
            , end = today8 14 30
            }
    , proteinMilkshake
        |> Activity.Model.eating
            { start = today8 14 30
            , end = today8 15 0
            }
    , FoodList
        [ foodIngredient rawChickenBreast (grams 300)
        , foodIngredient redLentils (grams 75)
        , foodIngredient redBellPepper (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day9 : List Activity
day9 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 9, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient skimmedMilk (milliliters 100)
        , foodIngredient granolaTropical (grams 65)
        , foodIngredient wheyProtein (grams 30)
        , foodIngredient blueberriesAsda (grams 50)
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Cardio"
        |> Activity.Model.exercising
            { start = today8 13 30
            , end = today8 14 30
            }
    , proteinMilkshake
        |> Activity.Model.eating
            { start = today8 14 30
            , end = today8 15 0
            }
    , FoodList
        [ foodIngredient rawChickenBreast (grams 300)
        , foodIngredient redLentils (grams 75)
        , foodIngredient redBellPepper (scalar 1)
        , foodIngredient banana (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


activities : List Activity
activities =
    List.concat
        [ day8
        , day9
        ]
