module Calendar.View exposing (yearView)

import Calendar.Calendar as Calendar
import Date.Model exposing (Date)
import Date.View
import Html exposing (..)
import Html.Attributes exposing (..)
import List.Extra
import Messages exposing (Msg)
import Model exposing (Model)


yearView : Model -> Html Msg
yearView { calendar } =
    let
        dayView currMonth { day, month } =
            li
                [ classList
                    [ ( "outlier", currMonth /= month )
                    , ( "today", day == calendar.calendar.now.day && calendar.calendar.now.month == month )
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
    main_ [ id "calendar" ] <|
        List.map (div []) <|
            List.Extra.greedyGroupsOf 4 <|
                List.map monthView <|
                    Calendar.yearly calendar.calendar.now
