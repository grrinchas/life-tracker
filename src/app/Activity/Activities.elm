module Activity.Activities exposing (actPerDay, allMeals, calsPerDay, maxDayCals, mealsPerDay)

import Activity.Model exposing (Activity, getMeal)
import Date.Model exposing (Date)
import List.Extra
import Maybe.Extra
import Meal.Model exposing (Meal)


allMeals : List Activity -> List Meal
allMeals activities =
    activities
        |> List.map Activity.Model.getMeal
        |> Maybe.Extra.values


actPerDay : List Activity -> List ( Date, List Activity )
actPerDay activities =
    activities
        |> List.Extra.gatherWith
            (\a b -> Date.Model.dayEqual (Activity.Model.start a) (Activity.Model.start b))
        |> List.map (\( act, list ) -> ( Activity.Model.start act, act :: list ))


mealsPerDay : List Activity -> List ( Date, List Meal )
mealsPerDay activities =
    activities
        |> actPerDay
        |> List.map
            (\( date, list ) ->
                ( date, List.map Activity.Model.getMeal list |> Maybe.Extra.values )
            )


maxDayCals : List Activity -> Maybe ( Date, List Meal, Int )
maxDayCals activities =
    activities
        |> calsPerDay
        |> List.Extra.maximumBy (\( _, _, cal ) -> cal)


calsPerDay : List Activity -> List ( Date, List Meal, Int )
calsPerDay activities =
    activities
        |> mealsPerDay
        |> List.map
            (\( date, meals ) ->
                ( date, meals, List.map Meal.Model.totalCalories meals |> List.sum )
            )
