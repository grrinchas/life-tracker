module Meal.Model exposing (Meal(..), foodIngredient, foodList, mealIngredient, mealList, singleFood, totalCalories)

import Food.Data.Diary exposing (skimmedMilk)
import Food.Data.Supplement exposing (wheyProtein)
import Food.Food exposing (Food)
import Unit.Model exposing (Unit, grams)


type alias Ingredient a =
    { ingredient : a
    , amount : Unit
    }


type Meal
    = FoodList (List (Ingredient Food))
    | MealList (List (Ingredient Meal))
    | SingleFood Food Unit


mealList : List (Ingredient Meal) -> Meal
mealList =
    MealList


foodList : List (Ingredient Food) -> Meal
foodList =
    FoodList


singleFood : Food -> Unit -> Meal
singleFood =
    SingleFood


mealIngredient : Meal -> Unit -> Ingredient Meal
mealIngredient =
    Ingredient


foodIngredient : Food -> Unit -> Ingredient Food
foodIngredient =
    Ingredient


totalCalories : Meal -> Int
totalCalories mainMeal =
    let
        calPerFood { ingredient, amount } =
            Unit.Model.div amount ingredient.total
                |> (*) (Food.Food.totalCalories ingredient |> Basics.toFloat)
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
            calPerFood { ingredient = food, amount = amount }

        MealList list ->
            list
                |> List.map calPerMeal
                |> List.sum
