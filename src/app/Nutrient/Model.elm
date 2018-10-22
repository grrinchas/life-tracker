module Nutrient.Model exposing
    ( Carb
    , Fat
    , Nutrient
    , calPerNut
    , calories
    , carbs
    , fats
    , phantom
    , protein
    , totalUnits
    , zeroCarbs
    , zeroFats
    )

import Unit.Model as Unit exposing (Unit)


type Nutrient
    = Protein Unit
    | Carbs Carb
    | Fats Fat
    | PhantomCarbs Unit
    | PhantomFats Unit


type alias Fat =
    { sat : Unit
    , poly : Unit
    , mono : Unit
    , total : Unit
    }


type alias Carb =
    { fibre : Unit
    , sugar : Unit
    , total : Unit
    }


zeroCarbs : Nutrient
zeroCarbs =
    carbs
        { fibre = Unit.zero
        , sugar = Unit.zero
        , total = Unit.zero
        }


zeroFats : Nutrient
zeroFats =
    fats
        { sat = Unit.zero
        , poly = Unit.zero
        , mono = Unit.zero
        , total = Unit.zero
        }


totalUnits : Nutrient -> Unit
totalUnits nutrient =
    case nutrient of
        Protein val ->
            val

        Fats { total } ->
            total

        Carbs { total } ->
            total

        PhantomCarbs val ->
            val

        PhantomFats val ->
            val


protein : Unit -> Nutrient
protein =
    Protein


carbs : Carb -> Nutrient
carbs =
    Carbs


fats : Fat -> Nutrient
fats =
    Fats


phantom : Nutrient -> Maybe Nutrient
phantom nutrient =
    case nutrient of
        Carbs { total, sugar, fibre } ->
            [ fibre, sugar ]
                |> List.foldr Unit.addGrams Unit.zero
                |> Unit.subGrams total
                |> (Just << PhantomCarbs)

        Fats { total, sat, poly, mono } ->
            [ sat, poly, mono ]
                |> List.foldr Unit.addGrams Unit.zero
                |> Unit.subGrams total
                |> (Just << PhantomFats)

        _ ->
            Nothing


calPerNut : Nutrient -> ( Nutrient, Int )
calPerNut nutrient =
    ( nutrient, calories nutrient )


calories : Nutrient -> Int
calories nutrient =
    case nutrient of
        Protein size ->
            Unit.grams 4.0
                |> Unit.multGrams size
                |> Unit.toFloat
                |> round

        Carbs { total } ->
            Unit.grams 4.0
                |> Unit.multGrams total
                |> Unit.toFloat
                |> round

        PhantomCarbs total ->
            Unit.grams 4.0
                |> Unit.multGrams total
                |> Unit.toFloat
                |> round

        Fats { total } ->
            Unit.grams 9.0
                |> Unit.multGrams total
                |> Unit.toFloat
                |> round

        PhantomFats total ->
            Unit.grams 9.0
                |> Unit.multGrams total
                |> Unit.toFloat
                |> round
