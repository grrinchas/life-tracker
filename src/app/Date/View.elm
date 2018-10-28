module Date.View exposing (monthFullName, weekdayLetterName)

import Date.Model
import Html exposing (..)
import Time exposing (Month, Weekday)


weekdayLetterName : Weekday -> Html msg
weekdayLetterName week =
    Date.Model.weekdayLetterName week
        |> text


monthFullName : Month -> Html msg
monthFullName month =
    Date.Model.monthFullName month
        |> text
