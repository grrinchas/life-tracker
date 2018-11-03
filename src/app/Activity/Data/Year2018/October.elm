module Activity.Data.Year2018.October exposing (activities)

import Activity.Model exposing (Activity)
import Date.Model exposing (Date, epoch)
import Food.Data.Bakery exposing (..)
import Food.Data.Berry exposing (..)
import Food.Data.Condiment exposing (..)
import Food.Data.Diary exposing (..)
import Food.Data.Fish exposing (salmonFillets)
import Food.Data.Fruit exposing (..)
import Food.Data.Grain exposing (..)
import Food.Data.Legume exposing (..)
import Food.Data.Poultry exposing (..)
import Food.Data.Supplement exposing (..)
import Food.Data.Vegetable exposing (..)
import Meal.Model exposing (Meal(..), foodIngredient)
import Time exposing (Month(..), Weekday(..))
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
            { epoch | year = 2018, month = Oct, day = 8, weekday = Mon, hour = hour, minute = min }
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
        , foodIngredient oilSunflowerSpray (scalar 1)
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
            { epoch | year = 2018, month = Oct, day = 9, weekday = Tue, hour = hour, minute = min }
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
        , foodIngredient oilSunflowerSpray (scalar 1)
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
            { epoch | year = 2018, month = Oct, day = 10, weekday = Wed, hour = hour, minute = min }
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
        , foodIngredient oilSunflowerSpray (scalar 1)
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
            { epoch | year = 2018, month = Oct, day = 11, weekday = Thu, hour = hour, minute = min }
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
        , foodIngredient oilSunflowerSpray (scalar 1)
        , foodIngredient banana (scalar 1)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day12 : List Activity
day12 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 12, weekday = Fri, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient granolaTropical (grams 65)
        , foodIngredient banana (scalar 1)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtMullerLight (scalar 1)
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
            { start = today8 16 30
            , end = today8 17 0
            }
    , FoodList
        [ foodIngredient avocado (scalar 1)
        , foodIngredient breadHovisSeeded (scalar 2)
        , foodIngredient eggs (scalar 4)
        , foodIngredient fageTotalZero (scalar 0.5)
        , foodIngredient banana (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day13 : List Activity
day13 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 13, weekday = Sat, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 12 0
            , end = today8 12 15
            }
    , FoodList
        [ foodIngredient rawChickenBreast (grams 300)
        , foodIngredient tortillaWrapsWholemeal (scalar 3)
        , foodIngredient kale (grams 100)
        , foodIngredient leeks (scalar 1)
        , foodIngredient oilSunflowerSpray (scalar 1)
        , foodIngredient cheeseParmesanGrated (grams 15)
        , foodIngredient ceasarDressingLowFat (milliliters 20)
        , foodIngredient sourCreamLowFat (grams 50)
        , foodIngredient elPasoHerbsMixFajitas (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 13 0
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient dates (grams 200)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 0
            , end = today8 18 30
            }
    ]


day14 : List Activity
day14 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 14, weekday = Sun, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 12 0
            , end = today8 12 15
            }
    , FoodList
        [ foodIngredient salmonFillets (scalar 2)
        , foodIngredient riceWhite (grams 100)
        , foodIngredient kale (grams 100)
        , foodIngredient broccoli (scalar 1)
        , foodIngredient redBellPepper (scalar 1)
        , foodIngredient eggs (scalar 2)
        , foodIngredient butter (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 13 0
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient mango (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 3)
        , foodIngredient banana (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 0
            , end = today8 18 30
            }
    ]


day15 : List Activity
day15 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 15, weekday = Mon, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient granolaTropical (grams 65)
        , foodIngredient banana (scalar 1)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Strength"
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
        , foodIngredient tortillaWrapsWholemeal (scalar 2)
        , foodIngredient leeks (scalar 1)
        , foodIngredient cheeseParmesanGrated (grams 15)
        , foodIngredient ceasarDressingLowFat (milliliters 20)
        , foodIngredient sourCreamLowFat (grams 50)
        , foodIngredient elPasoHerbsMixFajitas (scalar 1)
        , foodIngredient oilSunflowerSpray (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day16 : List Activity
day16 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 16, weekday = Tue, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient granolaTropical (grams 65)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtMullerLight (scalar 1)
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
        [ foodIngredient avocado (scalar 1)
        , foodIngredient breadHovisSeeded (scalar 2)
        , foodIngredient eggs (scalar 4)
        , foodIngredient fageTotalZero (scalar 0.5)
        , foodIngredient banana (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day17 : List Activity
day17 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 17, weekday = Wed, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient granolaTropical (grams 65)
        , foodIngredient blueberriesAsda (grams 50)
        , foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Strength"
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
        , foodIngredient greenBeans (grams 100)
        , foodIngredient banana (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 2)
        , foodIngredient oilSunflowerSpray (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day18 : List Activity
day18 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 18, weekday = Thu, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana (scalar 1)
        , foodIngredient yogurtMullerLight (scalar 1)
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
        , foodIngredient greenBeans (grams 100)
        , foodIngredient dates (grams 100)
        , foodIngredient mango (scalar 1)
        , foodIngredient oilSunflowerSpray (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day19 : List Activity
day19 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 19, weekday = Fri, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight (scalar 1)
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , "Strength"
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
        , foodIngredient tortillaWrapsWholemeal (scalar 3)
        , foodIngredient kale (grams 100)
        , foodIngredient leeks (scalar 1)
        , foodIngredient ceasarDressingLowFat (milliliters 60)
        , foodIngredient oilSunflowerSpray (scalar 1)
        , foodIngredient elPasoHerbsMixFajitas (scalar 1)
        , foodIngredient mango (scalar 1)
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
        , day12
        , day13
        , day14
        , day15
        , day16
        , day17
        , day18
        , day19
        ]
