module Component.Header.View exposing (simple)

import FontAwesome.Brands
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (href)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model
import Route.View


simple : Model -> Html Msg
simple ({ config } as model) =
    header []
        [ nav []
            [ Route.View.breadcrumb model
            ]
        , nav [] <|
            List.map (Route.View.iconLink model)
                [ Route.Model.calendar
                , Route.Model.sport
                , Route.Model.nutrition
                ]
        ]
