module Component.Card.View exposing (foodCard)

import Food.Food exposing (Food)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Nutrient.View


foodCard : Food -> Html Msg
foodCard { tags, pic, protein, carbs, fats, total } =
    div [ class "card food" ]
        [ div [ class "left" ]
            [ img [ src pic ] []
            ]
        , div [ class "right" ]
            [ ul []
                [ li []
                    [ span [] [ Nutrient.View.simple protein ]
                    , span [] []
                    ]
                , li [] []
                , li [] []
                ]
            ]
        ]
