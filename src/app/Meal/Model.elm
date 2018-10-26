module Meal.Model exposing (Meal(..), ingredient, proteinMilkshake, simple, totalCalories)

import Food.Data.Diary exposing (skimmedMilk)
import Food.Data.Supplement exposing (wheyProtein)
import Food.Food exposing (Food)
import Unit.Model exposing (Unit, grams)


type alias Ingredient =
    { food : Food
    , amount : Unit
    }


type Meal
    = Simple (List Ingredient)


ingredient : Food -> Unit -> Ingredient
ingredient =
    Ingredient


simple : List Ingredient -> Meal
simple =
    Simple


totalCalories : Meal -> Int
totalCalories meal =
    let
        calPerFood { food, amount } =
            Unit.Model.div amount food.total
                |> (*) (Food.Food.totalCalories food |> Basics.toFloat)
                |> round
    in
    case meal of
        Simple list ->
            list
                |> List.map calPerFood
                |> List.sum


proteinMilkshake : Meal
proteinMilkshake =
    simple
        [ ingredient wheyProtein (grams 30)
        , ingredient skimmedMilk (grams 400)
        ]
