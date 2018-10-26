module Unit.View exposing (simple)

import Html exposing (Html, text)
import Unit.Model exposing (Unit)


simple : Unit -> Html msg
simple unit =
    text <| Unit.Model.toString unit
