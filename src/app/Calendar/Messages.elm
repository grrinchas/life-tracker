module Calendar.Messages exposing (CalendarMsg(..))

import Calendar.Calendar exposing (Calendar)


type CalendarMsg
    = OnCalendarChange Calendar
