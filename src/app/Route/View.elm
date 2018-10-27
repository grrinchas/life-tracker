module Route.View exposing (breadcrumb, iconLink, textIconLink, textLink)

import FontAwesome.Brands
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model exposing (Route(..))


breadcrumb : Model -> Html msg
breadcrumb { config, nav } =
    let
        crumb route =
            li [ classList [ ( "active", route == nav.route ) ] ]
                [ a [ href <| Route.Model.toPath config route ]
                    [ text <| Route.Model.toName route
                    ]
                ]
    in
    ul [ class "breadcrumb" ] <|
        (Route.Model.breadcrumb nav.route
            |> List.map crumb
            |> List.intersperse (li [] [ text "/" ])
            |> (::) (li [] [ text "/" ])
        )


icon : Route -> Html msg
icon route =
    case route of
        Home ->
            FontAwesome.Solid.home

        Calendar ->
            FontAwesome.Solid.calendar_alt

        Products ->
            FontAwesome.Solid.leaf

        Nutrition ->
            FontAwesome.Solid.bolt

        Meals ->
            FontAwesome.Solid.utensils

        Meal _ ->
            FontAwesome.Brands.apple

        Sport ->
            FontAwesome.Solid.futbol


iconLink : Model -> Route -> Html msg
iconLink { config, nav } route =
    a [ classList [ ( "active", nav.route == route ) ], href <| Route.Model.toPath config route ] [ icon route ]


textLink : Model -> Route -> Html msg
textLink { config, nav } route =
    a [ classList [ ( "active", nav.route == route ) ], href <| Route.Model.toPath config route ] [ text <| Route.Model.toName route ]


textIconLink : Model -> Route -> Html msg
textIconLink ({ config, nav } as model) route =
    a [ classList [ ( "active", nav.route == route ) ], href <| Route.Model.toPath config route ]
        [ icon route
        , text <| Route.Model.toName route
        ]
