module Route.Model exposing
    ( Navigation
    , Route(..)
    , about
    , home
    , parse
    , routeRoute
    , toPath
    )

import Browser.Navigation exposing (Key)
import Config.Model exposing (Config, Mode(..))
import Monocle.Lens exposing (Lens)
import Url exposing (Url)


type alias Navigation =
    { key : Key
    , route : Route
    }


routeRoute : Lens Navigation Route
routeRoute =
    Lens .route (\b a -> { a | route = b })


type Route
    = Home
    | About


parse : String -> Maybe Route
parse path =
    case String.split "/" path of
        [] ->
            Just Home

        [ "about" ] ->
            Just About

        _ ->
            Nothing


toPath : Config -> Route -> String
toPath { mode } route =
    case route of
        Home ->
            "/"

        About ->
            "/about"


home : Route
home =
    Home


about : Route
about =
    About
