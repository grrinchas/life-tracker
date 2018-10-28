module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key)
import Calendar.Calendar exposing (calendarNow)
import Calendar.Messages exposing (CalendarMsg(..))
import Calendar.Model exposing (calendarCalendar)
import Config.Decoder exposing (decodeConfig)
import Config.Model
import Date.Model exposing (epoch)
import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (Value)
import List.Extra
import Messages exposing (Msg(..))
import Model exposing (Model, modelCalendar)
import Monocle.Lens
import Resolver
import Route.Messages exposing (RouteMsg(..))
import Route.Model
import Route.Resolver
import Route.View
import Task
import Time
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

        nowMsg posix =
            model.calendar.calendar
                |> calendarNow.set (Date.Model.fromPosix posix)
                |> (OnCalendar << OnCalendarChange)
    in
    ( model
    , Cmd.batch
        [ commands
        , Task.perform nowMsg Time.now
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
