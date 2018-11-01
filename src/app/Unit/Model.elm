module Unit.Model exposing
    ( Unit
    , addGrams
    , custom
    , div
    , grams
    , hectograms
    , hectomilliliters
    , kilograms
    , milligrams
    , milliliters
    , mult
    , scalar
    , subGrams
    , toFloat
    , toGrams
    , toLetter
    , toString
    , toValue
    , zero
    )


type Unit
    = Grams Float
    | Milligrams Float
    | Kilograms Float
    | Hectograms Float
    | Milliliters Float
    | Hectomilliliters Float
    | Scalar Float
    | Custom String Float


zero : Unit
zero =
    scalar 0.0


custom : String -> Float -> Unit
custom =
    Custom


scalar : Float -> Unit
scalar =
    Scalar


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


milliliters : Float -> Unit
milliliters =
    Milliliters


hectomilliliters : Float -> Unit
hectomilliliters =
    Hectomilliliters


toValue : Unit -> Float
toValue unit =
    case unit of
        Grams val ->
            val

        Scalar val ->
            val

        Custom _ val ->
            val

        Milliliters val ->
            val

        Milligrams val ->
            val

        Hectograms val ->
            val

        Hectomilliliters val ->
            val

        Kilograms val ->
            val


toGrams : Unit -> Unit
toGrams unit =
    case unit of
        Grams val ->
            val |> grams

        Scalar val ->
            val |> grams

        Milliliters val ->
            val |> grams

        Custom _ val ->
            val |> grams

        Milligrams val ->
            val / 1000 |> grams

        Hectograms val ->
            val * 100 |> grams

        Hectomilliliters val ->
            val * 100 |> grams

        Kilograms val ->
            val * 1000 |> grams


toString : Unit -> String
toString unit =
    let
        hectoString val =
            if val == 1 then
                toLetter unit

            else
                Debug.toString (toValue unit) ++ " (" ++ toLetter unit ++ ")"
    in
    case unit of
        Hectograms val ->
            hectoString val

        Hectomilliliters val ->
            hectoString val

        Custom name val ->
            name ++ " (" ++ toString (toGrams <| grams val) ++ ")"

        _ ->
            Debug.toString (toValue unit) ++ toLetter unit


toLetter : Unit -> String
toLetter unit =
    case unit of
        Grams val ->
            "g"

        Scalar val ->
            ""

        Custom _ val ->
            ""

        Milligrams val ->
            "mg"

        Milliliters val ->
            "ml"

        Hectograms val ->
            "100g"

        Hectomilliliters val ->
            "100ml"

        Kilograms val ->
            "kg"


toFloat : Unit -> Float
toFloat unit =
    case unit of
        Grams val ->
            val

        Scalar val ->
            val

        Custom _ val ->
            val

        Milligrams val ->
            val

        Milliliters val ->
            val

        Hectograms val ->
            val

        Hectomilliliters val ->
            val

        Kilograms val ->
            val


mult : Float -> Unit -> Unit
mult to unit =
    case unit of
        Grams val ->
            grams <| to * val

        Scalar val ->
            scalar <| to * val

        Custom _ val ->
            grams <| to * val

        Milligrams val ->
            milligrams <| to * val

        Hectograms val ->
            hectograms <| to * val

        Hectomilliliters val ->
            hectomilliliters <| to * val

        Kilograms val ->
            kilograms <| to * val

        Milliliters val ->
            milliliters <| to * val


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
