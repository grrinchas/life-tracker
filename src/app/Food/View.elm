module Food.View exposing (page)

import Food.Food exposing (Food)
import Html exposing (..)
import Html.Attributes exposing (..)
import List.Extra
import Messages exposing (Msg)
import Model exposing (Model)
import Nutrient.Model
import Nutrient.View
import Tag.View
import Unit.Model
import Unit.View


card : Food -> Html Msg
card ({ tags, pic, protein, carbs, fats, total, name } as food) =
    let
        calPerNutView ( nutrient, unit, cal ) =
            li []
                [ div []
                    [ span [ class "name" ]
                        [ Nutrient.View.simple nutrient
                        , text ": "
                        , Unit.View.simple unit
                        ]
                    , text " = "
                    , text <| Debug.toString cal
                    , text "cal"
                    ]
                ]
    in
    section []
        [ div [ class "left" ]
            [ img [ src pic ] []
            ]
        , div [ class "right" ]
            [ h3 []
                [ span []
                    [ text name
                    , text " "
                    , Unit.View.simple total
                    ]
                , span [ class "total" ]
                    [ text <| Debug.toString <| Food.Food.totalCalories food
                    , text "cal"
                    ]
                ]
            , ul [] <|
                List.map calPerNutView (Food.Food.calPerNut food)
            , footer []
                [ Tag.View.listView tags ]
            ]
        ]


page : Model -> Html Msg
page { food } =
    div [ id "food-list" ]
        [ h1 []
            [ text "Food List"
            , text " ("
            , text <| Debug.toString <| List.length food.data
            , text ")"
            ]
        , div [ class "food-list" ] <|
            List.map card food.data
        ]
