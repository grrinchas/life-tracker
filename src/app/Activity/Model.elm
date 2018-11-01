module Activity.Model exposing (Activity, Info, defaultInfo, eating, end, exercising, start, toString)

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
    | Exercising Info


start : Activity -> Date
start act =
    case act of
        Eating info _ ->
            info.start

        Exercising info ->
            info.start


end : Activity -> Date
end act =
    case act of
        Eating info _ ->
            info.end

        Exercising info ->
            info.end


toString : Activity -> String
toString act =
    case act of
        Eating _ _ ->
            "Eating"

        Exercising _ ->
            "Exercising"


eating : Info -> Meal -> Activity
eating =
    Eating


exercising : Info -> Activity
exercising =
    Exercising



{-
   activityTag : Lens Activity Tag
   activityTag =
       Lens .tag (\b a -> { a | tag = b })
-}
