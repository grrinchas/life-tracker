module Component.Breadcrumb.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Route.Model exposing (Breadcrumb)


view : Model -> Html msg
view { config, nav } =
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
