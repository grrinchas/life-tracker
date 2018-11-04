module Activity.Model exposing (Activity, Info, defaultInfo, eating, end, exercising, getMeal, isEating, isExercising, start, toString)

import Date.Model exposing (Date)
import Meal.Model exposing (Meal)
import Monocle.Lens exposing (Lens)


type alias Info =
    { start : Date
    , end : Date
    }


defaultInfo : Info
defaultInfo =
    { start = Date.Model.epoch
    , end = Date.Model.epoch
    }


type Activity
    = Eating Info Meal
    | Exercising Info String


start : Activity -> Date
start act =
    case act of
        Eating info _ ->
            info.start

        Exercising info _ ->
            info.start


end : Activity -> Date
end act =
    case act of
        Eating info _ ->
            info.end

        Exercising info _ ->
            info.end


toString : Activity -> String
toString act =
    case act of
        Eating _ _ ->
            "Eating"

        Exercising _ _ ->
            "Exercising"


getMeal : Activity -> Maybe Meal
getMeal act =
    case act of
        Eating _ meal ->
            Just meal

        _ ->
            Nothing


eating : Info -> Meal -> Activity
eating =
    Eating


isExercising : Activity -> Bool
isExercising act =
    case act of
        Exercising _ _ ->
            True

        _ ->
            False


isEating : Activity -> Bool
isEating act =
    case act of
        Eating _ _ ->
            True

        _ ->
            False


exercising : Info -> String -> Activity
exercising =
    Exercising



{-
   activityTag : Lens Activity Tag
   activityTag =
       Lens .tag (\b a -> { a | tag = b })
-}
