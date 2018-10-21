module Route.Resolver exposing (parseRoute, resolve)

import Browser exposing (UrlRequest(..))
import Browser.Navigation
import Config.Model exposing (Config, Mode(..))
import Lib.Extra exposing (withCommands, withNoCommand)
import Messages exposing (Msg)
import Model exposing (Model, modelNav)
import Monocle.Lens exposing (compose)
import Route.Messages exposing (RouteMsg(..))
import Route.Model exposing (Navigation, Route, routeRoute)
import Url exposing (Url)


parseRoute : Url -> Model -> ( Model, Cmd Msg )
parseRoute url ({ nav, config } as model) =
    case Route.Model.parse <| Maybe.withDefault "" url.fragment of
        Nothing ->
            model
                |> withNoCommand

        Just newRoute ->
            case newRoute == nav.route of
                True ->
                    model |> withNoCommand

                False ->
                    model
                        |> (compose modelNav routeRoute).set newRoute
                        |> withCommands
                            [ Browser.Navigation.pushUrl nav.key <| Url.toString url
                            ]


resolve : RouteMsg -> Model -> ( Model, Cmd Msg )
resolve msg ({ nav } as model) =
    case msg of
        OnUrlRequest req ->
            case req of
                Internal url ->
                    parseRoute url model

                External href ->
                    model
                        |> withCommands
                            [ Browser.Navigation.load href
                            ]

        OnUrlChange url ->
            parseRoute url model
