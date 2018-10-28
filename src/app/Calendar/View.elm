module Calendar.View exposing (yearView)

import Calendar.Calendar as Calendar exposing (calendarDisplay)
import Calendar.Messages exposing (CalendarMsg(..))
import Date.Model exposing (Date, dateYear)
import Date.View
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Monocle.Lens


yearView : Model -> Html Msg
yearView { calendar } =
    let
        dayView currMonth { day, month, year } =
            li
                [ classList
                    [ ( "outlier", currMonth /= month )
                    , ( "today", day == calendar.calendar.now.day && calendar.calendar.now.month == month && calendar.calendar.now.year == year )
                    ]
                ]
                [ span [] [ text <| Debug.toString day ]
                ]

        monthView ({ month } as date) =
            section [ class "month" ]
                [ h1 [] [ Date.View.monthFullName month ]
                , div [ class "body" ] <|
                    List.concat
                        [ [ ul [ class "weekdays" ] <|
                                List.map (\day -> li [] [ span [] [ Date.View.weekdayLetterName day ] ]) Date.Model.weekdayList
                          ]
                        , Calendar.normalizedMonthly date
                            |> List.Extra.greedyGroupsOf 7
                            |> List.map (ul [] << List.map (dayView month))
                        ]
                ]
    in
    main_ [ id "calendar" ]
        [ span
            [ calendar.calendar
                |> (Monocle.Lens.compose calendarDisplay dateYear).set (calendar.calendar.display.year - 1)
                |> OnCalendarChange
                |> OnCalendar
                |> onClick
            ]
            [ FontAwesome.Solid.chevron_left ]
        , div [] <|
            List.map (div []) <|
                List.Extra.greedyGroupsOf 4 <|
                    List.map monthView <|
                        Calendar.yearly calendar.calendar.display
        , span
            [ calendar.calendar
                |> (Monocle.Lens.compose calendarDisplay dateYear).set (calendar.calendar.display.year + 1)
                |> OnCalendarChange
                |> OnCalendar
                |> onClick
            ]
            [ FontAwesome.Solid.chevron_right
            ]
        ]
