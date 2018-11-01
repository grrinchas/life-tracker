module Food.View exposing (page, tagList)

import Food.Food exposing (Food)
import Food.Tag exposing (Tag)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Lib.Filter
import List.Extra
import Messages exposing (Msg)
import Model exposing (Model)
import Nutrient.Model
import Nutrient.View
import Unit.Model
import Unit.View


type alias TagsView msg =
    { tags : List Tag
    , action : Maybe (Tag -> msg)
    , classes : Tag -> List ( String, Bool )
    }


tagList : TagsView msg -> Html msg
tagList { tags, action, classes } =
    let
        tagView tag =
            li
                [ Maybe.map (\a -> onClick <| a tag) action |> Maybe.withDefault (class "")
                , classList <| classes tag
                ]
                [ text <| Food.Tag.toString tag
                , span [] []
                ]
    in
    ul [ class "tag-list" ] <|
        List.map tagView tags


card : Model -> Food -> Html Msg
card model ({ tags, pic, protein, carbs, fats, total, name } as food) =
    let
        filtered =
            Lib.Filter.apply model.food.data .tags model.aside.tagsFilter

        totalCalories =
            Food.Food.totalCalories food

        getPercentage cal =
            totalCalories
                |> toFloat
                |> (/) (toFloat cal)
                |> (*) 100
                |> round
                |> Debug.toString
                |> (\result -> result ++ "%")

        calPerNutView ( nutrient, unit, cal ) =
            li
                [ classList
                    [ ( String.toLower <| Nutrient.Model.toString nutrient, True )
                    ]
                ]
                [ span [ class "name" ]
                    [ Nutrient.View.simple nutrient
                    ]
                , span [ class "info" ]
                    [ span []
                        [ Unit.View.simple unit
                        , text " / "
                        , text <| Debug.toString cal
                        , text "cal"
                        , text " / "
                        , text <| getPercentage cal
                        ]
                    , span [ class "bar", style "width" (getPercentage cal) ] []
                    ]
                ]
    in
    section [ classList [ ( "hidden", not <| List.member food filtered ) ] ]
        [ div [ class "left" ]
            [ img [ src pic ] []
            ]
        , div [ class "right" ]
            [ h3 []
                [ span []
                    [ text name
                    , text " "
                    , Unit.View.simple total
                    ]
                , span [ class "total" ]
                    [ text <| Debug.toString totalCalories
                    , text "cal"
                    ]
                ]
            , ul [] <|
                List.map calPerNutView (Food.Food.calPerNut food)
            , footer []
                [ tagList
                    { tags = tags
                    , action = Nothing
                    , classes = \_ -> []
                    }
                ]
            ]
        ]


page : Model -> Html Msg
page ({ food, aside } as model) =
    main_ [ id "food-list" ]
        [ div [ class "food-list" ] <|
            List.map (card model) food.data
        ]
