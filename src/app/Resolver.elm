module Resolver exposing (resolve)

import Component.Aside.Resolver
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route.Resolver


resolve : Msg -> Model -> ( Model, Cmd Msg )
resolve message model =
    case message of
        Nop ->
            ( model, Cmd.none )

        OnRoute msg ->
            Route.Resolver.resolve msg model

        OnAside msg ->
            Component.Aside.Resolver.resolve msg model
