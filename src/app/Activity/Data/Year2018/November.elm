module Activity.Data.Year2018.November exposing (activities)

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
import Food.Data.Sweet exposing (..)
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


day1 : List Activity
day1 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 1, weekday = Thu, hour = hour, minute = min }
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
        , foodIngredient redLentils 0.75
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient yogurtMullerLight 1
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


day2 : List Activity
day2 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 2, weekday = Fri, hour = hour, minute = min }
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
        , foodIngredient eggs 7
        , foodIngredient fageTotalZero 0.5
        , foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient yogurtMullerLight 1
        , foodIngredient mango 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day3 : List Activity
day3 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 3, weekday = Sat, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 2
        , foodIngredient turkeySliced 3
        , foodIngredient breadHovisSeeded 2
        , foodIngredient cucumber 0.25
        ]
        |> Activity.Model.eating
            { start = today8 8 0
            , end = today8 8 15
            }
    , FoodList
        [ foodIngredient dates 2
        , foodIngredient banana 1
        , foodIngredient cashewsRoastedSalted 2
        ]
        |> Activity.Model.eating
            { start = today8 13 30
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient yogurtMullerLight 1
        ]
        |> Activity.Model.eating
            { start = today8 19 0
            , end = today8 19 15
            }
    ]


day4 : List Activity
day4 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 4, weekday = Sun, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient yogurtMullerLight 1
        , foodIngredient banana 1
        , foodIngredient grapes 30
        ]
        |> Activity.Model.eating
            { start = today8 13 30
            , end = today8 14 0
            }
    , FoodList
        [ foodIngredient rawChickenBreast 3
        , foodIngredient redLentils 1
        , foodIngredient elPasoHerbsMixFajitas 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient broccoli 1
        , foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 16 0
            , end = today8 17 0
            }
    , FoodList
        [ foodIngredient riceCakeLowFat 11
        , foodIngredient dates 2
        , foodIngredient yogurtMullerLight 2
        ]
        |> Activity.Model.eating
            { start = today8 18 0
            , end = today8 18 30
            }
    ]


day5 : List Activity
day5 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 5, weekday = Mon, hour = hour, minute = min }
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
        , foodIngredient broccoli 0.5
        , foodIngredient banana 2
        , foodIngredient dates 1
        , foodIngredient mango 1
        , foodIngredient yogurtMullerLight 2
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day6 : List Activity
day6 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 6, weekday = Tue, hour = hour, minute = min }
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
        [ foodIngredient avocado 1
        , foodIngredient breadHovisSeeded 4
        , foodIngredient eggs 6
        , foodIngredient fageTotalZero 0.5
        , foodIngredient banana 2
        , foodIngredient yogurtMullerLight 2
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day7 : List Activity
day7 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 7, weekday = Wed, hour = hour, minute = min }
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
        [ foodIngredient banana 1
        , foodIngredient apples 2
        , foodIngredient grapes 15
        , foodIngredient yogurtMullerLight 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient tomatoesChoppedCanned 1
        , foodIngredient redKidneyBeansCanned 1
        , foodIngredient ketchup 1
        , foodIngredient leeks 1
        , foodIngredient redBellPepper 1
        , foodIngredient potatoes 2.5
        , foodIngredient spinach 1
        , foodIngredient eggs 4
        , foodIngredient porkLoin 1
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


day8 : List Activity
day8 =
    let
        today8 hour min =
            { epoch | year = 2018, month = Nov, day = 8, weekday = Thu, hour = hour, minute = min }
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
        [ foodIngredient banana 1
        , foodIngredient oilSunflowerSpray 1
        , foodIngredient tomatoesChoppedCanned 1
        , foodIngredient redKidneyBeansCanned 1
        , foodIngredient ketchup 1
        , foodIngredient leeks 1
        , foodIngredient potatoes 2.5
        , foodIngredient spinach 2
        , foodIngredient eggs 6
        , foodIngredient porkLoin 0.5
        , foodIngredient dates 1
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
            { epoch | year = 2018, month = Nov, day = 9, weekday = Fri, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient banana 1
        ]
        |> Activity.Model.eating
            { start = today8 10 0
            , end = today8 10 15
            }
    , FoodList
        [ foodIngredient salmonFillets 2
        , foodIngredient butter 2
        , foodIngredient broccoli 1
        , foodIngredient riceWhite 0.5
        , foodIngredient tomatoesChoppedCanned 1
        , foodIngredient breadHovisSeeded 2
        , foodIngredient mango 1
        , foodIngredient yogurtMullerLight 1
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
            { epoch | year = 2018, month = Nov, day = 10, weekday = Sat, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient mango 1
        , foodIngredient yogurtMullerLight 1
        , foodIngredient butter 2
        , foodIngredient riceWhite 1
        , foodIngredient brownies 0.5
        ]
        |> Activity.Model.eating
            { start = today8 10 0
            , end = today8 10 15
            }
    , FoodList
        [ foodIngredient sausagesBerlinki 5
        , foodIngredient butter 2
        , foodIngredient riceWhite 1
        , foodIngredient breadHovisSeeded 4
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
            { epoch | year = 2018, month = Nov, day = 11, weekday = Sun, hour = hour, minute = min }
    in
    [ FoodList
        [ foodIngredient sausagesBerlinki 4
        , foodIngredient butter 1
        , foodIngredient breadHovisSeeded 2
        ]
        |> Activity.Model.eating
            { start = today8 10 0
            , end = today8 10 15
            }
    , FoodList
        [ foodIngredient dates 1
        , foodIngredient banana 2
        ]
        |> Activity.Model.eating
            { start = today8 18 30
            , end = today8 19 30
            }
    ]


activities : List Activity
activities =
    List.concat
        [ day1
        , day2
        , day3
        , day4
        , day5
        , day6
        , day7
        , day8
        , day9
        , day10
        , day11
        ]
