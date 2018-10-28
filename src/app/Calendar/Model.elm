module Calendar.Model exposing
    ( Model
    , calendarCalendar
    , calendarPage
    , initial
    )

import Calendar.Calendar exposing (Calendar)
import Calendar.Page exposing (Page)
import Date.Model exposing (Date)
import Monocle.Lens exposing (Lens)


type alias Model =
    { page : Page
    , calendar : Calendar
    }


initial : Date -> Model
initial now =
    { page = Calendar.Page.initial
    , calendar = Calendar.Calendar.initial now
    }


calendarCalendar : Lens Model Calendar
calendarCalendar =
    Lens .calendar (\b a -> { a | calendar = b })


calendarPage : Lens Model Page
calendarPage =
    Lens .page (\b a -> { a | page = b })
