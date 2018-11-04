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
import Food.Data.Nut exposing (..)
import Food.Data.Poultry exposing (..)
import Food.Data.Supplement exposing (..)
import Food.Data.Vegetable exposing (..)
import Meal.Model exposing (Meal(..), foodIngredient)
import Time exposing (Month(..), Weekday(..))
import Unit.Model exposing (grams, milliliters, scalar)


proteinMilkshake : Meal
proteinMilkshake =
    FoodList
        [ foodIngredient wheyProtein 0.3
        , foodIngredient skimmedMilk 4
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient redBellPepper 1
        , foodIngredient yogurtArlaSkyr 1
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
        [ foodIngredient skimmedMilk 1
        , foodIngredient granolaTropical 0.65
        , foodIngredient wheyProtein 0.3
        , foodIngredient blueberriesAsda 0.5
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient redBellPepper 1
        , foodIngredient banana 1
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
        [ foodIngredient yogurtArlaSkyr 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient riceWhite 0.65
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient mixedVegetableCanned 1
        , foodIngredient ketchup 0.8
        , foodIngredient banana 1
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
        [ foodIngredient chickenBreastSlicedAsda 5
        , foodIngredient breadHovisSeeded 1
        , foodIngredient cucumber 0.25
        , foodIngredient romanianLettuce 0.4
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient redBellPepper 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient banana 1
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient granolaTropical 0.65
        , foodIngredient banana 1
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient avocado 1
        , foodIngredient breadHovisSeeded 2
        , foodIngredient eggs 4
        , foodIngredient fageTotalZero 0.5
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 12 0
            , end = today8 12 15
            }
    , FoodList
        [ foodIngredient rawChickenBreast 3
        , foodIngredient tortillaWrapsWholemeal 3
        , foodIngredient kale 1
        , foodIngredient leeks 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient cheeseParmesanGrated 0.15
        , foodIngredient ceasarDressingLowFat 0.2
        , foodIngredient sourCreamLowFat 0.5
        , foodIngredient elPasoHerbsMixFajitas 1
        ]
        |> Activity.Model.eating
            { start = today8 13 0
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient dates 2
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 12 0
            , end = today8 12 15
            }
    , FoodList
        [ foodIngredient salmonFillets 2
        , foodIngredient riceWhite 1
        , foodIngredient kale 1
        , foodIngredient broccoli 1
        , foodIngredient redBellPepper 1
        , foodIngredient eggs 2
        , foodIngredient butter 1
        ]
        |> Activity.Model.eating
            { start = today8 13 0
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient mango 1
        , foodIngredient yogurtMullerLight 3
        , foodIngredient banana 1
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
        [ foodIngredient granolaTropical 0.65
        , foodIngredient banana 1
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient tortillaWrapsWholemeal 2
        , foodIngredient leeks 1
        , foodIngredient cheeseParmesanGrated 0.15
        , foodIngredient ceasarDressingLowFat 0.2
        , foodIngredient sourCreamLowFat 0.5
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient granolaTropical 0.65
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient avocado 1
        , foodIngredient breadHovisSeeded 2
        , foodIngredient eggs 4
        , foodIngredient fageTotalZero 0.5
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient granolaTropical 0.65
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient greenBeans 1
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 2
        , foodIngredient oilSunflowerSpray 1
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
        [ foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient greenBeans 1
        , foodIngredient dates 1
        , foodIngredient mango 1
        , foodIngredient oilSunflowerSpray 1
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
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient tortillaWrapsWholemeal 3
        , foodIngredient kale 1
        , foodIngredient leeks 1
        , foodIngredient ceasarDressingLowFat 0.6
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient mango 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day20 : List Activity
day20 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 20, weekday = Sat, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient dates 1
        ]
        |> Activity.Model.eating
            { start = today8 9 0
            , end = today8 9 15
            }
    , FoodList
        [ foodIngredient breadHovisSeeded 2
        , foodIngredient eggs 3
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient redKidneyBeansCanned 1
        , foodIngredient tomatoesChoppedCanned 1
        , foodIngredient brusselsSprouts 7
        , foodIngredient leeks 1
        ]
        |> Activity.Model.eating
            { start = today8 14 0
            , end = today8 15 0
            }
    , FoodList
        [ foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient mango 0.5
        , foodIngredient grapes 10
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 17 0
            , end = today8 18 0
            }
    ]


day21 : List Activity
day21 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 21, weekday = Sun, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient breadHovisSeeded 2
        , foodIngredient eggs 4
        , foodIngredient redKidneyBeansCanned 1
        , foodIngredient tomatoesChoppedCanned 1
        , foodIngredient leeks 1
        , foodIngredient brusselsSprouts 7
        , foodIngredient jalapenosCanned 0.3
        ]
        |> Activity.Model.eating
            { start = today8 12 0
            , end = today8 13 0
            }
    , FoodList
        [ foodIngredient banana 1
        , foodIngredient mango 0.5
        , foodIngredient grapes 10
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 16 0
            , end = today8 16 30
            }
    , FoodList
        [ foodIngredient banana 1
        , foodIngredient cashewsRoastedSalted 1
        ]
        |> Activity.Model.eating
            { start = today8 17 0
            , end = today8 17 15
            }
    ]


day22 : List Activity
day22 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 22, weekday = Mon, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient redBellPepper 1
        , foodIngredient greenBeans 1
        , foodIngredient cashewsRoastedSalted 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day23 : List Activity
day23 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 23, weekday = Tue, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
        , foodIngredient banana 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient redBellPepper 1
        , foodIngredient greenBeans 1
        , foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient mango 0.5
        , foodIngredient grapes 10
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day24 : List Activity
day24 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 24, weekday = Wed, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient turkeySliced 3
        , foodIngredient breadHovisSeeded 1
        , foodIngredient cucumber 0.25
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient cucumber 0.25
        , foodIngredient romanianLettuce 0.4
        , foodIngredient tortillaWrapsWholemeal 2
        , foodIngredient ceasarDressingLowFat 0.6
        , foodIngredient jalapenosCanned 0.5
        , foodIngredient yogurtMullerLight 2
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day25 : List Activity
day25 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 25, weekday = Thu, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient cucumber 0.25
        , foodIngredient romanianLettuce 0.4
        , foodIngredient tortillaWrapsWholemeal 3
        , foodIngredient ceasarDressingLowFat 0.6
        , foodIngredient jalapenosCanned 0.5
        , foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day26 : List Activity
day26 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 26, weekday = Fri, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient avocado 1
        , foodIngredient breadHovisSeeded 3
        , foodIngredient eggs 6
        , foodIngredient fageTotalZero 0.5
        , foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient mango 0.5
        , foodIngredient grapes 10
        , foodIngredient blueberriesAsda 0.5
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day27 : List Activity
day27 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 27, weekday = Sat, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 14 0
            , end = today8 14 15
            }
    , FoodList
        [ foodIngredient rawChickenBreast 2
        , foodIngredient chickpeasCanned 0.5
        , foodIngredient leeks 1
        , foodIngredient greenBeans 2
        , foodIngredient greekCheeseSaladLowFat 1
        , foodIngredient skimmedMilk 2.5
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient tomatoesChoppedCanned 0.5
        , foodIngredient tikkaCurryPaste 0.5
        , foodIngredient riceBasmati 1.2
        ]
        |> Activity.Model.eating
            { start = today8 15 0
            , end = today8 16 0
            }
    , FoodList
        [ foodIngredient dates 2
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 19 0
            , end = today8 19 30
            }
    ]


day28 : List Activity
day28 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 28, weekday = Sun, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 14 0
            , end = today8 14 15
            }
    , FoodList
        [ foodIngredient rawChickenBreast 2
        , foodIngredient chickpeasCanned 0.5
        , foodIngredient leeks 1
        , foodIngredient greenBeans 2
        , foodIngredient greekCheeseSaladLowFat 1
        , foodIngredient skimmedMilk 2.5
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient tomatoesChoppedCanned 0.5
        , foodIngredient tikkaCurryPaste 0.5
        , foodIngredient riceBasmati 1.2
        ]
        |> Activity.Model.eating
            { start = today8 15 0
            , end = today8 16 0
            }
    , FoodList
        [ foodIngredient dates 1
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 19 0
            , end = today8 19 30
            }
    ]


day29 : List Activity
day29 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 29, weekday = Mon, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient avocado 1
        , foodIngredient breadHovisSeeded 3
        , foodIngredient eggs 6
        , foodIngredient fageTotalZero 0.5
        , foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day30 : List Activity
day30 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 30, weekday = Tue, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient cucumber 0.25
        , foodIngredient romanianLettuce 0.4
        , foodIngredient tortillaWrapsWholemeal 3
        , foodIngredient ceasarDressingLowFat 0.6
        , foodIngredient jalapenosCanned 0.5
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day31 : List Activity
day31 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Oct, day = 31, weekday = Wed, hour = hour, minute = min }
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
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 0.75
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient broccoli 0.5
        , foodIngredient dates 2
        , foodIngredient yogurtMullerLight 1
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
        , day20
        , day21
        , day22
        , day23
        , day24
        , day25
        , day26
        , day27
        , day28
        , day29
        , day30
        , day31
        ]
