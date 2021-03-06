module Calendar.Resolver exposing (resolve)

import Calendar.Messages exposing (CalendarMsg(..))
import Calendar.Model exposing (calendarCalendar, calendarPage)
import Lib.Extra
import Messages exposing (Msg(..))
import Model exposing (Model, modelAside, modelCalendar)
import Monocle.Lens as Lens


resolve : CalendarMsg -> Model -> ( Model, Cmd Msg )
resolve message model =
    case message of
        OnCalendarChange calendar ->
            model
                |> (Lens.compose modelCalendar calendarCalendar).set calendar
                |> Lib.Extra.withNoCommand

        OnPageChange page ->
            model
                |> (Lens.compose modelCalendar calendarPage).set page
                |> Lib.Extra.withNoCommand
