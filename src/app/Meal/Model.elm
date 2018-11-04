module Meal.Model exposing (Meal(..), calPerIngredient, foodIngredient, foodList, ingredients, mealIngredient, mealList, singleFood, totalCalories)

import Food.Data.Diary exposing (skimmedMilk)
import Food.Data.Supplement exposing (wheyProtein)
import Food.Food exposing (Food)
import Unit.Model exposing (Unit, grams)


type alias Ingredient a =
    { ingredient : a
    , amount : Float
    }


type Meal
    = FoodList (List (Ingredient Food))
    | MealList (List (Ingredient Meal))
    | SingleFood Food Float


mealList : List (Ingredient Meal) -> Meal
mealList =
    MealList


foodList : List (Ingredient Food) -> Meal
foodList =
    FoodList


singleFood : Food -> Float -> Meal
singleFood =
    SingleFood


mealIngredient : Meal -> Float -> Ingredient Meal
mealIngredient =
    Ingredient


foodIngredient : Food -> Float -> Ingredient Food
foodIngredient =
    Ingredient


calPerIngredient : Meal -> List ( Ingredient Food, Int )
calPerIngredient mainMeal =
    ingredients mainMeal
        |> List.map
            (\({ ingredient, amount } as ing) ->
                ( ing, amount * (Food.Food.totalCalories ingredient |> toFloat) |> round )
            )


ingredients : Meal -> List (Ingredient Food)
ingredients mainMeal =
    case mainMeal of
        FoodList list ->
            list

        SingleFood food amount ->
            foodIngredient food amount
                |> List.singleton

        MealList list ->
            []


totalCalories : Meal -> Int
totalCalories mainMeal =
    let
        calPerFood { ingredient, amount } =
            Food.Food.totalCalories ingredient
                |> toFloat
                |> (*) amount
                |> round

        calPerMeal { ingredient, amount } =
            0

        {-
           Unit.Model.div amount food.total
               |> (*) (Food.Food.totalCalories food |> Basics.toFloat)
               |> round
        -}
    in
    case mainMeal of
        FoodList list ->
            list
                |> List.map calPerFood
                |> List.sum

        SingleFood food amount ->
            calPerFood
                { ingredient = food, amount = amount }

        MealList list ->
            list
                |> List.map calPerMeal
                |> List.sum
