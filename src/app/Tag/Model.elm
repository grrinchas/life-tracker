module Tag.Model exposing (Tag(..), toString)


type Tag
    = AutomataTheory
    | Haskell
    | Java
    | Elm


toString : Tag -> String
toString tag =
    case tag of
        AutomataTheory ->
            "Automata theory"

        Haskell ->
            "Haskell"

        Java ->
            "Java"

        Elm ->
            "Elm"
