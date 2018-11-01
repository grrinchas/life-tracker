module Activity.Data.Year2018.October exposing (activities)

import Activity.Model exposing (Activity)
import Date.Model exposing (Date, epoch)
import Food.Data.Diary exposing (skimmedMilk)
import Food.Data.Legume exposing (redLentils)
import Food.Data.Poultry exposing (rawChickenBreast)
import Food.Data.Supplement exposing (wheyProtein)
import Food.Data.Vegetable exposing (redBellPepper)
import Meal.Model exposing (Meal(..), foodIngredient)
import Time exposing (Month(..))
import Unit.Model exposing (grams, scalar)


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
    [ proteinMilkshake
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


activities : List Activity
activities =
    List.concat
        [ day8
        ]
