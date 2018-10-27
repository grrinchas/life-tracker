module Component.Aside.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model exposing (Route(..))
import Tag.Model
import Tag.View


view : Model -> Html Msg
view { nav, config } =
    let
        linksView route =
            li [ classList [ ( "active", route == nav.route ) ] ]
                [ a [ href <| Route.Model.toPath config route ]
                    [ text <| Route.Model.toName route ]
                ]

        nutritionLinks =
            ul [] <|
                List.map linksView
                    [ Route.Model.nutrition
                    , Route.Model.products
                    , Route.Model.meals
                    ]
    in
    case nav.route of
        Meals ->
            aside [ class "nutrition" ]
                [ h3 [] [ text "Links" ]
                , nutritionLinks
                ]

        Nutrition ->
            aside [ class "nutrition" ]
                [ h3 [] [ text "Links" ]
                , nutritionLinks
                ]

        Products ->
            aside []
                [ h3 [] [ text "Links" ]
                , nutritionLinks
                , h3 [] [ text "Tags" ]
                , Tag.View.listView Tag.Model.list
                ]

        _ ->
            aside [] [ text "Not implemented." ]
