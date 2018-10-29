module Date.View exposing (monthFullName, monthShortName, weekdayFullName, weekdayLetterName)

import Date.Model
import Html exposing (..)
import Time exposing (Month, Weekday)


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
