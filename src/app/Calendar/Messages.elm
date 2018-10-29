module Calendar.Messages exposing (CalendarMsg(..))

import Calendar.Calendar exposing (Calendar)
import Calendar.Page exposing (Page)


type CalendarMsg
    = OnCalendarChange Calendar
    | OnPageChange Page
