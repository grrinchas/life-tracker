module Food.View exposing (page)

import Food.Food exposing (Food)
import Html exposing (..)
import Html.Attributes exposing (..)
import Lib.Filter
import List.Extra
import Messages exposing (Msg)
import Model exposing (Model)
import Nutrient.Model
import Nutrient.View
import Tag.View
import Unit.Model
import Unit.View


card : Model -> Food -> Html Msg
card model ({ tags, pic, protein, carbs, fats, total, name } as food) =
    let
        filtered =
            Lib.Filter.apply model.food.data .tags model.aside.tagsFilter

        totalCalories =
            Food.Food.totalCalories food

        getPercentage cal =
            totalCalories
                |> toFloat
                |> (/) (toFloat cal)
                |> (*) 100
                |> round
                |> Debug.toString
                |> (\result -> result ++ "%")

        calPerNutView ( nutrient, unit, cal ) =
            li
                [ classList
                    [ ( String.toLower <| Nutrient.Model.toString nutrient, True )
                    ]
                ]
                [ span [ class "name" ]
                    [ Nutrient.View.simple nutrient
                    ]
                , span [ class "info" ]
                    [ span []
                        [ Unit.View.simple unit
                        , text " / "
                        , text <| Debug.toString cal
                        , text "cal"
                        , text " / "
                        , text <| getPercentage cal
                        ]
                    , span [ class "bar", style "width" (getPercentage cal) ] []
                    ]
                ]
    in
    section [ classList [ ( "hidden", not <| List.member food filtered ) ] ]
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
                    [ text <| Debug.toString totalCalories
                    , text "cal"
                    ]
                ]
            , ul [] <|
                List.map calPerNutView (Food.Food.calPerNut food)
            , footer []
                [ Tag.View.listView
                    { tags = tags
                    , action = Nothing
                    , classes = \_ -> []
                    }
                ]
            ]
        ]


page : Model -> Html Msg
page ({ food, aside } as model) =
    main_ [ id "food-list" ]
        [ h1 []
            [ text "Food List"
            , text " ("
            , text <| Debug.toString <| List.length food.data
            , text ")"
            ]
        , div [ class "food-list" ] <|
            List.map (card model) food.data
        ]
