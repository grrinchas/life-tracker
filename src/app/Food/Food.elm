module Food.Food exposing
    ( Food
    , calPerNut
    , nutrients
    , totalCalories
    , totalGrams
    , totalPhantom
    )

import List.Extra
import Maybe.Extra
import Nutrient.Model as Nut exposing (Nutrient)
import Tag.Model exposing (Tag)
import Unit.Model as Unit exposing (Unit)


type alias Food =
    { tags : List Tag
    , pic : String
    , protein : Nutrient
    , carbs : Nutrient
    , fats : Nutrient
    , total : Unit
    , name : String
    }


totalGrams : Food -> Unit
totalGrams food =
    nutrients food
        |> List.map Nut.totalUnits
        |> List.foldr Unit.addGrams Unit.zero


totalPhantom : Food -> Unit
totalPhantom ({ total } as food) =
    totalGrams food
        |> Unit.subGrams total


nutrients : Food -> List Nutrient
nutrients { protein, carbs, fats } =
    [ protein, carbs, fats ]


calPerNut : Food -> List ( Nutrient, Unit, Int )
calPerNut food =
    nutrients food
        --|> List.map Nut.phantom
        --|> Maybe.Extra.values
        --|> (++) (nutrients food)
        |> List.map Nut.calPerNut


totalCalories : Food -> Int
totalCalories food =
    nutrients food
        |> List.map Nut.calories
        |> List.sum
