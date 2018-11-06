module Calendar.View exposing (nextMonth, nextYear, previousMonth, previousYear, view)

import Activity.Model
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
import Maybe.Extra
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
            weekView model

        Day ->
            div [] []

        Schedule ->
            div [] []


weekView : Model -> Html Msg
weekView ({ calendar, activities } as model) =
    let
        headerView { day, month, year, weekday } =
            ul
                [ classList
                    [ ( "today"
                      , List.Extra.notMember False
                            [ day == calendar.calendar.now.day
                            , calendar.calendar.now.month == calendar.calendar.display.month
                            , calendar.calendar.now.year == year
                            ]
                      )
                    ]
                ]
            <|
                List.concat
                    [ [ li [ classList [ ( "outlier", calendar.calendar.display.month /= month ) ] ]
                            [ span [ class "weekday" ] [ Date.View.weekdayShortName weekday ]
                            , span [] [ text <| Debug.toString day ]
                            ]
                      ]
                    , List.range 1 24
                        |> List.map (\_ -> li [] [ text "" ])
                    ]

        hourView hour =
            li [] [ Date.View.militaryHour hour ]
    in
    main_ [ id "calendar", class "week-view" ] <|
        [ div [ class "body" ] <|
            List.concat
                [ [ ul [ class "hour" ] <|
                        List.concat
                            [ [ li [] [ text "H" ] ]
                            , List.range 1 24
                                |> List.map hourView
                            ]
                  ]
                , Calendar.normalizedMonthly calendar.calendar.display
                    |> List.Extra.greedyGroupsOf 7
                    |> List.Extra.find (List.member calendar.calendar.now.day << List.map .day)
                    |> Maybe.withDefault []
                    |> List.map headerView
                ]
        ]


monthView : Model -> Html Msg
monthView ({ calendar } as model) =
    main_ [ id "calendar", class "month-view" ] <|
        [ monthSmallView model calendar.calendar.display
        ]


monthSmallView : Model -> Date -> Html Msg
monthSmallView { calendar, activities } displayDate =
    let
        plotActivity activity =
            case calendar.page.view of
                Month ->
                    li [ class <| String.toLower <| Activity.Model.toString activity ]
                        [--span [] [ Date.View.militaryTime <| Activity.Model.start activity ]
                         -- , text " - "
                         -- , span [ class "title" ] [ text <| Activity.Model.toString activity ]
                        ]

                _ ->
                    text ""

        dayView ({ day, month, year } as thisDate) =
            li
                [ classList
                    [ ( "outlier", displayDate.month /= month )
                    , ( "today", Date.Model.dayEqual calendar.calendar.now thisDate )
                    ]
                ]
                [ span [] [ text <| Debug.toString day ]
                , activities
                    |> List.filter (Date.Model.dayEqual thisDate << Activity.Model.start)
                    |> List.sortBy (Date.Model.toMillis << Activity.Model.start)
                    |> List.map plotActivity
                    |> ul [ class "activities" ]
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
            |> (OnCalendar << OnCalendarChange)
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
