module Activity.Data.Year2018.October exposing (activities)

import Activity.Model exposing (Activity)
import Date.Model exposing (Date, epoch)
import Food.Data.Bakery exposing (breadHovisSeeded)
import Food.Data.Berry exposing (..)
import Food.Data.Condiment exposing (..)
import Food.Data.Diary exposing (..)
import Food.Data.Fruit exposing (..)
import Food.Data.Grain exposing (..)
import Food.Data.Legume exposing (..)
import Food.Data.Poultry exposing (..)
import Food.Data.Supplement exposing (..)
import Food.Data.Vegetable exposing (..)
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
        , foodIngredient yogurtArlaSkyr (scalar 1)
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


day10 : List Activity
day10 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 10, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtArlaSkyr (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Strength"
        |> Activity.Model.exercising
            { start = today8 14 0
            , end = today8 15 0
            }
    , proteinMilkshake
        |> Activity.Model.eating
            { start = today8 15 0
            , end = today8 15 30
            }
    , FoodList
        [ foodIngredient rawChickenBreast (grams 300)
        , foodIngredient riceWhite (grams 65)
        , foodIngredient mixedVegetableCanned (scalar 1)
        , foodIngredient ketchup (grams 80)
        , foodIngredient banana (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day11 : List Activity
day11 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 11, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient chickenBreastSlicedAsda (scalar 5)
        , foodIngredient breadHovisSeeded (scalar 1)
        , foodIngredient cucumber (scalar (1.0 / 4.0))
        , foodIngredient romanianLettuce (scalar (1.0 / 6.0))
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Cardio"
        |> Activity.Model.exercising
            { start = today8 15 30
            , end = today8 16 30
            }
    , proteinMilkshake
        |> Activity.Model.eating
            { start = today8 16 30
            , end = today8 17 0
            }
    , FoodList
        [ foodIngredient rawChickenBreast (grams 300)
        , foodIngredient redLentils (grams 75)
        , foodIngredient redBellPepper (scalar 1)
        , foodIngredient banana (scalar 1)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtArlaSkyr (scalar 1)
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
        , day10
        , day11
        ]
