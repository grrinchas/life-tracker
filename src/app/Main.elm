module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key)
import Config.Decoder exposing (decodeConfig)
import Config.Model
import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (Value)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Resolver
import Route.Messages exposing (RouteMsg(..))
import Route.Model
import Route.Resolver
import Url exposing (Url)
import View


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        []


initial : Value -> Url -> Key -> ( Model, Cmd Msg )
initial flags url key =
    let
        nav =
            { key = key
            , route = Route.Model.home
            }

        config =
            flags
                |> Json.Decode.decodeValue decodeConfig
                |> Result.withDefault Config.Model.initial

        ( model, commands ) =
            Model.initial config nav
                |> Route.Resolver.parseRoute url
    in
    ( model
    , Cmd.batch
        [ commands
        ]
    )


main : Program Value Model Msg
main =
    Browser.application
        { init = initial
        , view = View.view
        , update = Resolver.resolve
        , subscriptions = subscriptions
        , onUrlRequest = OnRoute << OnUrlRequest
        , onUrlChange = OnRoute << OnUrlChange
        }
