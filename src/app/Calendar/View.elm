module Calendar.View exposing (yearView)

import Html exposing (..)
import Messages exposing (Msg)
import Model exposing (Model)


yearView : Model -> Html Msg
yearView model =
    div [] []
