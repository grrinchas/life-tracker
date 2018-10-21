module Config.Decoder exposing (decodeConfig, decodeMode)

import Config.Model exposing (Config, Mode)
import Json.Decode exposing (Decoder, andThen, fail, string, succeed)
import Json.Decode.Pipeline exposing (required)


decodeConfig : Decoder Config
decodeConfig =
    succeed Config
        |> required "mode" decodeMode


decodeMode : Decoder Mode
decodeMode =
    let
        convert raw =
            case Config.Model.modeFromString raw of
                Just mode ->
                    succeed mode

                Nothing ->
                    fail <| "can't decode mode: " ++ raw
    in
    string |> andThen convert
