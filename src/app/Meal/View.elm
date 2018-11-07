module Meal.View exposing (page)

import Activity.Activities exposing (..)
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

        dayView ( date, meals, cal ) =
            section []
                [ h2 []
                    [ Date.View.monthDayYear date
                    , span []
                        [ text <| Debug.toString cal
                        , text "cal"
                        ]
                    ]
                , meals
                    |> List.map Meal.Model.calPerIngredient
                    |> List.map
                        (ul [ class "meal" ] << List.map mealView)
                    |> div [ class "day" ]
                ]
    in
    main_ [ id "meal-list" ]
        [ activities
            |> List.sortBy (Date.Model.toMillis << Activity.Model.start)
            |> List.reverse
            |> Activity.Activities.calsPerDay
            --|> List.filter Activity.Model.isEating
            --|> dayGroups
            |> List.map dayView
            |> div []
        ]
