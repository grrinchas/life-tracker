module Calendar.Calendar exposing (Calendar, calendarDisplay, calendarNow, initial, normalizedMonthly, rangeInDays, yearly)

import Date.Model as Date exposing (Date, epoch)
import List.Extra
import Monocle.Lens exposing (Lens)
import Time exposing (Weekday(..))


type alias Calendar =
    { now : Date
    , display : Date
    }


initial : Date -> Calendar
initial date =
    { now = date
    , display = date
    }


calendarDisplay : Lens Calendar Date
calendarDisplay =
    Lens .display (\b a -> { a | display = b })


calendarNow : Lens Calendar Date
calendarNow =
    Lens .now (\b a -> { a | now = b })


rangeInDays : Date -> Int -> List Date
rangeInDays date days =
    List.range 1 days
        |> List.map (\num -> num * 86400000 + Date.toMillis date)
        |> List.map Time.millisToPosix
        |> List.map Date.fromPosix


yearly : Date -> List Date
yearly { year } =
    Date.monthList
        |> List.map (\month -> { epoch | year = year, month = month })


normalizedMonthly : Date -> List Date
normalizedMonthly ({ month, year } as date) =
    (Date.daysInMonth year month + 20)
        |> rangeInDays (Date.addDays { date | day = 1 } -7)
        |> List.Extra.dropWhile ((/=) Mon << .weekday)
        |> List.take 42
