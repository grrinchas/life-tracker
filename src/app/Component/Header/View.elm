module Component.Header.View exposing (simple)

import Component.Breadcrumb.View
import FontAwesome.Brands
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (href)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model


simple : Model -> Html Msg
simple ({ config } as model) =
    header []
        [ nav []
            [ Component.Breadcrumb.View.view model
            ]
        , nav []
            [ a [ href <| Route.Model.toPath config <| Route.Model.calendar ] [ FontAwesome.Solid.calendar_alt ]
            , a [ href <| Route.Model.toPath config <| Route.Model.sport ] [ FontAwesome.Solid.futbol ]
            , a [ href <| Route.Model.toPath config <| Route.Model.nutrition ] [ FontAwesome.Solid.utensils ]
            ]
        ]
