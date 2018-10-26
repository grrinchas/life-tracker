module Nutrient.View exposing (simple)

import Html exposing (Html, text)
import Nutrient.Model exposing (Nutrient)


simple : Nutrient -> Html msg
simple nutrient =
    text <| Nutrient.Model.toString nutrient
