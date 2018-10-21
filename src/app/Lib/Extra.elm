module Lib.Extra exposing (withCommands, withNoCommand)

import Monocle.Lens exposing (Lens, compose)


withCommands : List (Cmd msg) -> model -> ( model, Cmd msg )
withCommands list model =
    ( model, Cmd.batch list )


withNoCommand : model -> ( model, Cmd msg )
withNoCommand =
    withCommands []
