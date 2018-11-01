module Component.Aside.View exposing (view)

import Calendar.Calendar exposing (calendarDisplay)
import Calendar.Messages exposing (CalendarMsg(..))
import Calendar.Page exposing (View(..), pageCalendarView)
import Calendar.View exposing (..)
import Component.Aside.Messages exposing (AsideMsg(..))
import Component.Aside.Model exposing (asideTagsFilter)
import Date.Model
import Date.View exposing (..)
import FontAwesome.Solid
import Food.Tag
import Food.View
import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Lib.Filter
import List.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Route.Model exposing (Route(..))
import Route.View


view : Model -> Html Msg
view ({ nav, config, aside, calendar } as model) =
    let
        nutritionLinks =
            [ Route.Model.nutrition
            , Route.Model.products
            , Route.Model.meals
            ]
                |> List.map (Route.View.textIconLink model)
                |> List.map (\a -> li [] [ a ])
                |> ul []

        getIcon bool =
            case bool of
                False ->
                    FontAwesome.Solid.plus

                True ->
                    FontAwesome.Solid.minus

        exploreMenu =
            section [ classList [ ( "menu", True ), ( "active", aside.exploreMenu ) ] ]
                [ h3 [ onClick (OnAside <| OnAsideChange { aside | exploreMenu = not aside.exploreMenu }) ]
                    [ text "Explore", getIcon aside.exploreMenu ]
                , nutritionLinks
                ]

        tagsMenu =
            section [ classList [ ( "menu tags", True ), ( "active", aside.tagsMenu ) ] ]
                [ h3 [ onClick (OnAside <| OnAsideChange { aside | tagsMenu = not aside.tagsMenu }) ]
                    [ text "Tags", getIcon aside.tagsMenu ]
                , div []
                    [ Food.View.tagList
                        { tags = Food.Tag.list
                        , action =
                            Just
                                (\tag ->
                                    asideTagsFilter.set (Lib.Filter.toggle aside.tagsFilter tag) aside
                                        |> (OnAside << OnAsideChange)
                                )
                        , classes = \tag -> [ ( "inactive", not <| List.member tag aside.tagsFilter ) ]
                        }
                    ]
                ]

        chooseDateMenu =
            section [ classList [ ( "menu", True ), ( "active", aside.calendarDisplay ) ] ]
                [ h3 [ onClick (OnAside <| OnAsideChange { aside | calendarDisplay = not aside.calendarDisplay }) ]
                    [ text "Display"
                    , getIcon aside.calendarDisplay
                    ]
                , Calendar.Page.viewList
                    |> List.map
                        (\calView ->
                            li []
                                [ a
                                    [ href <| Route.Model.toPath config Route.Model.calendar
                                    , classList [ ( "active", calendar.page.view == calView ) ]
                                    , calendar.page
                                        |> pageCalendarView.set calView
                                        |> OnPageChange
                                        |> OnCalendar
                                        |> onClick
                                    ]
                                    [ text <| Calendar.Page.viewToString calView ]
                                ]
                        )
                    |> ul []
                ]

        sortMenu =
            div [] []
    in
    case nav.route of
        Meals ->
            Html.aside []
                [ exploreMenu
                ]

        Nutrition ->
            Html.aside [ class "nutrition" ]
                [ exploreMenu
                ]

        Products ->
            Html.aside []
                [ exploreMenu
                , tagsMenu
                ]

        Calendar ->
            Html.aside []
                [ section [ classList [ ( "menu", True ), ( "active", aside.chooseDate ) ] ]
                    [ h3 [ onClick (OnAside <| OnAsideChange { aside | chooseDate = not aside.chooseDate }) ]
                        [ text "Choose Date"
                        , getIcon aside.chooseDate
                        ]
                    , div [ class "choose-date" ]
                        [ case calendar.page.view of
                            Month ->
                                header [ class "month-view" ]
                                    [ h4 [] [ text <| Debug.toString calendar.calendar.display.year ]
                                    , div [ class "chooser" ]
                                        [ Calendar.View.previousMonth model
                                        , h2 [] [ Date.View.monthShortName calendar.calendar.display.month ]
                                        , Calendar.View.nextMonth model
                                        ]
                                    ]

                            _ ->
                                header [ class "year-view" ]
                                    [ Calendar.View.previousYear model False
                                    , h2 [] [ text <| Debug.toString calendar.calendar.display.year ]
                                    , Calendar.View.nextYear model False
                                    ]
                        , span
                            [ class "btn"
                            , calendar.calendar
                                |> calendarDisplay.set calendar.calendar.now
                                |> OnCalendarChange
                                |> OnCalendar
                                |> onClick
                            ]
                            [ text "Today" ]
                        ]
                    ]
                , chooseDateMenu
                ]

        _ ->
            Html.aside []
                [ text "Not implemented."
                ]
