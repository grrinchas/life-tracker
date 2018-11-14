module Resolver exposing (resolve)

import Calendar.Resolver
import Component.Aside.Resolver
import Messages exposing (Msg(..))
import Model exposing (Model)
import Nutrient.Resolver
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

        OnCalendar msg ->
            Calendar.Resolver.resolve msg model

        OnNutrient msg ->
            Nutrient.Resolver.resolve msg model
