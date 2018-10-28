module Calendar.Calendar exposing (Calendar, initial)

import Date.Model exposing (Date)


type alias Calendar =
    { now : Date
    }


initial : Date -> Calendar
initial date =
    { now = date
    }
