module Tag.View exposing (listView)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)
import Tag.Model exposing (Tag)


type alias TagsView msg =
    { tags : List Tag
    , action : Maybe (Tag -> msg)
    , classes : Tag -> List ( String, Bool )
    }


listView : TagsView msg -> Html msg
listView { tags, action, classes } =
    let
        tagView tag =
            li
                [ Maybe.map (\a -> onClick <| a tag) action |> Maybe.withDefault (class "")
                , classList <| classes tag
                ]
                [ text <| Tag.Model.toString tag
                , span [] []
                ]
    in
    ul [ class "tag-list" ] <|
        List.map tagView tags
