module Config.Model exposing
    ( Config
    , Mode(..)
    , initial
    , modeFromString
    )


type alias Config =
    { mode : Mode
    }


initial : Config
initial =
    { mode = Development
    }


type Mode
    = Development
    | Production


modeToString : Mode -> String
modeToString mode =
    case mode of
        Development ->
            "Development"

        Production ->
            "Production"


modeFromString : String -> Maybe Mode
modeFromString string =
    case String.toLower string of
        "development" ->
            Just Development

        "production" ->
            Just Production

        _ ->
            Nothing
