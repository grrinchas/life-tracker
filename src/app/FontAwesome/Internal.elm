module FontAwesome.Internal exposing (icon)

import Html exposing (Html)
import Svg exposing (path, svg)
import Svg.Attributes exposing (d, fill, viewBox)


type alias Path =
    String


icon : Path -> Html msg
icon path =
    svg [ viewBox "0 0 512 512" ]
        [ Svg.path
            [ fill "currentColor"
            , d path
            ]
            []
        ]
