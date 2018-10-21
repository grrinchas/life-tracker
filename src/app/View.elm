module View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (href)
import Messages exposing (Msg)
import Model exposing (Model)


view : Model -> Document Msg
view model =
    { title = "Dennis Blog"
    , body =
        [ div [] [ a [ href "https://www.google.co.uk" ] [ text "external" ] ]
        , div [] [ a [ href "/about" ] [ text "about" ] ]
        ]
    }
