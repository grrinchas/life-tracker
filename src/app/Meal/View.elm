module Meal.View exposing (page)

import Activity.Model
import Calendar.Calendar
import Date.Model
import Date.View
import Html exposing (..)
import Html.Attributes exposing (class, id, src)
import List.Extra
import Maybe.Extra
import Meal.Model
import Messages exposing (Msg)
import Model exposing (Model)
import Unit.Model
import Unit.View


page : Model -> Html Msg
page ({ food, aside, activities } as model) =
    let
        weekGroups =
            activities
                |> List.Extra.gatherWith
                    (\a b -> Calendar.Calendar.isSameWeek (Activity.Model.start a) (Activity.Model.start b))

        dayGroups values =
            values
                |> List.Extra.gatherWith
                    (\a b -> Date.Model.dayEqual (Activity.Model.start a) (Activity.Model.start b))

        mealView ( { ingredient, amount }, total ) =
            li []
                [ img [ src ingredient.pic ] []
                , span []
                    [ text ingredient.name
                    , text " "
                    , ingredient.total
                        |> Unit.Model.toGrams
                        |> Unit.Model.mult amount
                        |> Unit.View.simple
                    , text " ("
                    , text <| Debug.toString total
                    , text " cal)"
                    ]
                ]

        dayView ( day, list ) =
            section []
                [ h2 []
                    [ Activity.Model.start day |> Date.View.monthDayYear
                    , span []
                        [ (::) day list
                            |> List.map Activity.Model.getMeal
                            |> Maybe.Extra.values
                            |> List.map Meal.Model.totalCalories
                            |> List.sum
                            |> (text << Debug.toString)
                        , text "cal"
                        ]
                    ]
                , (::) day list
                    |> List.map Activity.Model.getMeal
                    |> Maybe.Extra.values
                    |> List.map Meal.Model.calPerIngredient
                    |> List.map
                        (ul [ class "meal" ] << List.map mealView)
                    |> div [ class "day" ]
                ]
    in
    main_ [ id "meal-list" ]
        [ activities
            |> List.filter Activity.Model.isEating
            |> List.sortBy (Date.Model.toMillis << Activity.Model.start)
            |> dayGroups
            |> List.map dayView
            |> div []
        ]
