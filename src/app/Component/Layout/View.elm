module Component.Layout.View exposing (notImplemented, simple)

import Component.Aside.View
import Component.Header.View
import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Model exposing (Model)


simple : Model -> Html Msg -> List (Html Msg)
simple model body =
    [ Component.Header.View.simple model
    , div [ class "main-wrapper" ]
        [ Component.Aside.View.view model
        , body
        ]
    ]


notImplemented : Model -> List (Html Msg)
notImplemented model =
    [ Component.Header.View.simple model
    , div [ class "main-wrapper" ]
        [ Component.Aside.View.view model
        , main_ [] [ text "Not Implemented" ]
        ]
    ]
