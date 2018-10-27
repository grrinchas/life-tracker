module Component.Aside.View exposing (view)

import Component.Aside.Messages exposing (AsideMsg(..))
import Component.Aside.Model exposing (asideTagsFilter)
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Lib.Filter
import List.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route.Model exposing (Route(..))
import Route.View
import Tag.Model
import Tag.View


view : Model -> Html Msg
view ({ nav, config, aside } as model) =
    let
        nutritionLinks =
            [ Route.Model.nutrition
            , Route.Model.products
            , Route.Model.meals
            ]
                |> List.map (Route.View.textIconLink model)
                |> List.map (\a -> li [] [ a ])
                |> ul []

        getIcon bool =
            case bool of
                False ->
                    FontAwesome.Solid.plus

                True ->
                    FontAwesome.Solid.minus

        exploreMenu =
            section [ classList [ ( "menu", True ), ( "active", aside.exploreMenu ) ] ]
                [ h3 [ onClick (OnAside <| OnAsideChange { aside | exploreMenu = not aside.exploreMenu }) ]
                    [ text "Explore", getIcon aside.exploreMenu ]
                , nutritionLinks
                ]

        tagsMenu =
            section [ classList [ ( "menu", True ), ( "active", aside.tagsMenu ) ] ]
                [ h3 [ onClick (OnAside <| OnAsideChange { aside | tagsMenu = not aside.tagsMenu }) ]
                    [ text "Tags", getIcon aside.tagsMenu ]
                , Tag.View.listView
                    { tags = Tag.Model.list
                    , action =
                        Just
                            (\tag ->
                                asideTagsFilter.set (Lib.Filter.toggle aside.tagsFilter tag) aside
                                    |> (OnAside << OnAsideChange)
                            )
                    , classes = \tag -> [ ( "inactive", not <| List.member tag aside.tagsFilter ) ]
                    }
                ]

        sortMenu =
            div [] []
    in
    case nav.route of
        Meals ->
            Html.aside []
                [ exploreMenu
                ]

        Nutrition ->
            Html.aside [ class "nutrition" ]
                [ exploreMenu
                ]

        Products ->
            Html.aside []
                [ exploreMenu
                , tagsMenu
                ]

        _ ->
            Html.aside []
                [ text "Not implemented."
                ]
