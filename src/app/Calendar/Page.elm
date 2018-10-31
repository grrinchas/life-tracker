module Calendar.Page exposing
    ( Page
    , View(..)
    , initial
    , pageCalendarView
    , viewList
    , viewToString
    )

import Monocle.Lens exposing (Lens)


type alias Page =
    { view : View
    }


initial : Page
initial =
    { view = Week
    }


type View
    = Year
    | Month
    | Week
    | Day
    | Schedule


viewList : List View
viewList =
    [ Day
    , Week
    , Month
    , Year
    , Schedule
    ]


viewToString : View -> String
viewToString view =
    case view of
        Year ->
            "Year"

        Month ->
            "Month"

        Week ->
            "Week"

        Day ->
            "Day"

        Schedule ->
            "Schedule"


pageCalendarView : Lens Page View
pageCalendarView =
    Lens .view (\b a -> { a | view = b })
