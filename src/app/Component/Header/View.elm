module Component.Header.View exposing (simple)

import FontAwesome.Brands
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (href)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model


simple : Model -> Html Msg
simple { config } =
    header []
        [ nav []
            [ a [ href <| Route.Model.toPath config <| Route.Model.home ] [ FontAwesome.Solid.home ]
            ]
        , nav []
            [ a [ href <| Route.Model.toPath config <| Route.Model.calendar ] [ FontAwesome.Solid.calendar_alt ]
            , a [ href <| Route.Model.toPath config <| Route.Model.products ] [ FontAwesome.Solid.leaf ]
            , a [ href <| Route.Model.toPath config <| Route.Model.meals ] [ FontAwesome.Solid.utensils ]
            ]
        ]
