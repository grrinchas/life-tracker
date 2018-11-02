module Exercise.Model exposing (Exercise)


type Exercise
    = Walking
    | Strength


toString : Exercise -> String
toString ex =
    case ex of
        Walking ->
            "Walking"

        Strength ->
            "Strength"
