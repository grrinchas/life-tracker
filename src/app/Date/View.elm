module Date.View exposing (militaryHour, monthFullName, monthShortName, weekdayFullName, weekdayLetterName, weekdayShortName)

import Date.Model
import Html exposing (..)
import Time exposing (Month, Weekday)


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
