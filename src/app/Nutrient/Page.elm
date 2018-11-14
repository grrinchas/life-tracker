module Nutrient.Page exposing (Page, calorieMouseEvent, initial)

import Html.Events.Extra.Mouse exposing (Event)
import Monocle.Lens exposing (Lens)


type alias Page =
    { calorieMouseEvent : Maybe Event
    }


initial : Page
initial =
    { calorieMouseEvent = Nothing
    }


calorieMouseEvent : Lens Page (Maybe Event)
calorieMouseEvent =
    Lens .calorieMouseEvent (\b a -> { a | calorieMouseEvent = b })
