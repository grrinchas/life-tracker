module Unit.Model exposing
    ( Unit
    , addGrams
    , div
    , grams
    , hectograms
    , kilograms
    , milligrams
    , subGrams
    , toFloat
    , toGrams
    , zero
    )


type Unit
    = Grams Float
    | Milligrams Float
    | Kilograms Float
    | Hectograms Float


zero : Unit
zero =
    grams 0.0


grams : Float -> Unit
grams =
    Grams


milligrams : Float -> Unit
milligrams =
    Milligrams


hectograms : Float -> Unit
hectograms =
    Hectograms


kilograms : Float -> Unit
kilograms =
    Kilograms


toGrams : Unit -> Unit
toGrams unit =
    case unit of
        Grams val ->
            grams val

        Milligrams val ->
            val / 1000 |> grams

        Hectograms val ->
            val * 100 |> grams

        Kilograms val ->
            val * 1000 |> grams


toFloat : Unit -> Float
toFloat unit =
    case unit of
        Grams val ->
            val

        Milligrams val ->
            val

        Hectograms val ->
            val

        Kilograms val ->
            val


addGrams : Unit -> Unit -> Unit
addGrams a b =
    [ a, b ]
        |> List.map (toFloat << toGrams)
        |> List.sum
        |> Grams


subGrams : Unit -> Unit -> Unit
subGrams a b =
    let
        first =
            toGrams a |> toFloat

        second =
            toGrams b |> toFloat
    in
    first
        - second
        |> grams


div : Unit -> Unit -> Float
div a b =
    let
        first =
            toGrams a |> toFloat

        second =
            toGrams b |> toFloat
    in
    first / second
