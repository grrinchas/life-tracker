module Date.View exposing (militaryDate, militaryHour, militaryTime, monthDayYear, monthFullName, monthShortName, weekdayFullName, weekdayLetterName, weekdayShortName)

import Date.Model exposing (Date)
import Html exposing (..)
import Time exposing (Month, Weekday)


monthDayYear : Date -> Html msg
monthDayYear { month, year, day } =
    span []
        [ monthFullName month
        , text ", "
        , text <| Debug.toString day
        , text " "
        , text <| Debug.toString year
        ]


militaryDate : Date -> Html msg
militaryDate { hour, minute, month, day, year, second } =
    span []
        [ militaryHour day
        , text "/"
        , militaryHour <| Date.Model.monthToInt month
        , text "/"
        , text <| Debug.toString year
        , text " "
        , militaryHour hour
        , text ":"
        , militaryHour minute
        , text ":"
        , militaryHour second
        ]


militaryTime : Date -> Html msg
militaryTime { hour, minute } =
    span []
        [ militaryHour hour
        , text ":"
        , militaryHour minute
        ]


militaryHour : Int -> Html msg
militaryHour int =
    if int < 10 then
        "0"
            ++ Debug.toString int
            |> text

    else
        Debug.toString int
            |> text


weekdayShortName : Weekday -> Html msg
weekdayShortName week =
    Date.Model.weekdayShortName week
        |> text


weekdayLetterName : Weekday -> Html msg
weekdayLetterName week =
    Date.Model.weekdayLetterName week
        |> text


weekdayFullName : Weekday -> Html msg
weekdayFullName week =
    Date.Model.weekdayFullName week
        |> text


monthShortName : Month -> Html msg
monthShortName month =
    Date.Model.monthShortName month
        |> text


monthFullName : Month -> Html msg
monthFullName month =
    Date.Model.monthFullName month
        |> text
