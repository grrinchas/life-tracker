module Component.Aside.View exposing (view)

import Html exposing (..)
import Messages exposing (Msg)
import Model exposing (Model)
import Tag.Model
import Tag.View


view : Model -> Html Msg
view model =
    aside []
        [ h3 [] [ text "Tags" ]
        , Tag.View.listView Tag.Model.list
        ]
