module Nutrient.Page exposing (Page, calorieMouseEvent, calorieZoomIn, initial)

import Html.Events.Extra.Mouse exposing (Event)
import Monocle.Lens exposing (Lens)


type alias Page =
    { calorieMouseEvent : Maybe Event
    , zoomIn : Float
    }


initial : Page
initial =
    { calorieMouseEvent = Nothing
    , zoomIn = 50
    }


calorieZoomIn : Lens Page Float
calorieZoomIn =
    Lens .zoomIn (\b a -> { a | zoomIn = b })


calorieMouseEvent : Lens Page (Maybe Event)
calorieMouseEvent =
    Lens .calorieMouseEvent (\b a -> { a | calorieMouseEvent = b })
