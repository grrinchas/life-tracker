module Calendar.View exposing (nextMonth, nextYear, previousMonth, previousYear, view)

import Calendar.Calendar as Calendar exposing (calendarDisplay)
import Calendar.Messages exposing (CalendarMsg(..))
import Calendar.Page exposing (View(..), pageCalendarView)
import Date.Model exposing (Date)
import Date.View
import FontAwesome.Solid
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Monocle.Lens


view : Model -> Html Msg
view ({ calendar } as model) =
    case calendar.page.view of
        Year ->
            yearView model

        Month ->
            monthView model

        Week ->
            div [] []

        Day ->
            div [] []

        Schedule ->
            div [] []


monthView : Model -> Html Msg
monthView ({ calendar } as model) =
    main_ [ id "calendar", class "month-view" ] <|
        [ monthSmallView model calendar.calendar.display
        ]


monthSmallView : Model -> Date -> Html Msg
monthSmallView { calendar } displayDate =
    let
        dayView { day, month, year } =
            li
                [ classList
                    [ ( "outlier", displayDate.month /= month )
                    , ( "today"
                      , List.Extra.notMember False
                            [ day == calendar.calendar.now.day
                            , calendar.calendar.now.month == displayDate.month
                            , calendar.calendar.now.year == year
                            ]
                      )
                    ]
                ]
                [ span [] [ text <| Debug.toString day ]
                ]

        getWeekdayName day =
            case calendar.page.view of
                Year ->
                    li [] [ span [] [ Date.View.weekdayLetterName day ] ]

                _ ->
                    li [] [ span [] [ Date.View.weekdayFullName day ] ]
    in
    div [ class "body" ] <|
        List.concat
            [ [ ul [ class "weekdays" ] <|
                    List.map getWeekdayName Date.Model.weekdayList
              ]
            , Calendar.normalizedMonthly displayDate
                |> List.Extra.greedyGroupsOf 7
                |> List.map (ul [] << List.map dayView)
            ]


previousYear : Model -> Bool -> Html Msg
previousYear ({ calendar } as model) bool =
    span
        [ calendar.calendar
            |> calendarDisplay.set (Date.Model.addYears -1 calendar.calendar.display)
            |> OnCalendarChange
            |> OnCalendar
            |> onClick
        ]
        [ case bool of
            True ->
                FontAwesome.Solid.chevron_circle_left

            False ->
                FontAwesome.Solid.chevron_left
        ]


nextYear : Model -> Bool -> Html Msg
nextYear ({ calendar } as model) bool =
    span
        [ calendar.calendar
            |> calendarDisplay.set (Date.Model.addYears 1 calendar.calendar.display)
            |> OnCalendarChange
            |> OnCalendar
            |> onClick
        ]
        [ case bool of
            True ->
                FontAwesome.Solid.chevron_circle_right

            False ->
                FontAwesome.Solid.chevron_right
        ]


nextMonth : Model -> Html Msg
nextMonth ({ calendar } as model) =
    span
        [ calendar.calendar
            |> calendarDisplay.set (Date.Model.nextMonth calendar.calendar.display)
            |> OnCalendarChange
            |> OnCalendar
            |> onClick
        ]
        [ FontAwesome.Solid.chevron_right
        ]


previousMonth : Model -> Html Msg
previousMonth ({ calendar } as model) =
    span
        [ calendar.calendar
            |> calendarDisplay.set (Date.Model.prevMonth calendar.calendar.display)
            |> OnCalendarChange
            |> OnCalendar
            |> onClick
        ]
        [ FontAwesome.Solid.chevron_left
        ]


yearView : Model -> Html Msg
yearView ({ calendar } as model) =
    main_ [ id "calendar", class "year-view" ]
        [ previousYear model True
        , div [] <|
            List.map (div []) <|
                List.Extra.greedyGroupsOf 4 <|
                    List.map
                        (\date ->
                            section [ class "month" ]
                                [ h1
                                    [ calendar.page
                                        |> pageCalendarView.set Month
                                        |> OnPageChange
                                        |> OnCalendar
                                        |> onClick
                                    ]
                                    [ Date.View.monthFullName date.month ]
                                , monthSmallView model date
                                ]
                        )
                    <|
                        Calendar.yearly calendar.calendar.display
        , nextYear model True
        ]
