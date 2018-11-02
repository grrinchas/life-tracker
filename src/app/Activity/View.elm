module Activity.View exposing (hourWithTitle)

import Activity.Model exposing (Activity)
import Html exposing (..)
import Messages exposing (Msg)


hourWithTitle : Activity -> Html Msg
hourWithTitle =
    div [] []
