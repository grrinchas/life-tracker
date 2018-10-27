module Tag.View exposing (listView)

import Html exposing (..)
import Html.Attributes exposing (class)
import Tag.Model exposing (Tag)


listView : List Tag -> Html msg
listView list =
    let
        tagView tag =
            li [] [ text <| Tag.Model.toString tag, span [] [] ]
    in
    ul [ class "tag-list" ] <|
        List.map tagView list
