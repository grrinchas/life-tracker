module Date.Model exposing (Date, addDays, addYears, daysInMonth, daysInYear, epoch, fromPosix, isLeapYear, monthFullName, monthList, monthShortName, nextMonth, prevMonth, toMillis, toPosix, weekdayFullName, weekdayLetterName, weekdayList, weekdayShortName)

import Monocle.Lens exposing (Lens)
import Time exposing (Month(..), Posix, Weekday(..))


type alias Date =
    { year : Int
    , month : Month
    , day : Int
    , hour : Int
    , minute : Int
    , second : Int
    , millis : Int
    , weekday : Weekday
    }


epoch : Date
epoch =
    { year = 0
    , month = Jan
    , day = 0
    , hour = 0
    , minute = 0
    , second = 0
    , millis = 0
    , weekday = Thu
    }


weekdayList : List Weekday
weekdayList =
    [ Mon
    , Tue
    , Wed
    , Thu
    , Fri
    , Sat
    , Sun
    ]


monthList : List Month
monthList =
    [ Jan
    , Feb
    , Mar
    , Apr
    , May
    , Jun
    , Jul
    , Aug
    , Sep
    , Oct
    , Nov
    , Dec
    ]


isLeapYear : Int -> Bool
isLeapYear year =
    if modBy 4 year == 0 then
        if modBy 100 year == 0 then
            modBy 400 year == 0

        else
            True

    else
        False


daysInYear : Int -> Int
daysInYear year =
    case isLeapYear year of
        True ->
            366

        False ->
            365


monthShortName : Month -> String
monthShortName month =
    monthFullName month
        |> String.left 3


monthFullName : Month -> String
monthFullName month =
    case month of
        Jan ->
            "January"

        Feb ->
            "February"

        Mar ->
            "March"

        Apr ->
            "April"

        May ->
            "May"

        Jun ->
            "June"

        Jul ->
            "July"

        Aug ->
            "August"

        Sep ->
            "September"

        Oct ->
            "October"

        Nov ->
            "November"

        Dec ->
            "December"


daysInMonth : Int -> Month -> Int
daysInMonth year month =
    case month of
        Jan ->
            31

        Feb ->
            case isLeapYear year of
                True ->
                    29

                False ->
                    28

        Mar ->
            31

        Apr ->
            30

        May ->
            31

        Jun ->
            30

        Jul ->
            31

        Aug ->
            31

        Sep ->
            30

        Oct ->
            31

        Nov ->
            30

        Dec ->
            31


monthToInt : Month -> Int
monthToInt month =
    case month of
        Jan ->
            1

        Feb ->
            2

        Mar ->
            3

        Apr ->
            4

        May ->
            5

        Jun ->
            6

        Jul ->
            7

        Aug ->
            8

        Sep ->
            9

        Oct ->
            10

        Nov ->
            11

        Dec ->
            12


monthFromInt : Int -> Maybe Month
monthFromInt month =
    case month of
        1 ->
            Just Jan

        2 ->
            Just Feb

        3 ->
            Just Mar

        4 ->
            Just Apr

        5 ->
            Just May

        6 ->
            Just Jun

        7 ->
            Just Jul

        8 ->
            Just Aug

        9 ->
            Just Sep

        10 ->
            Just Oct

        11 ->
            Just Nov

        12 ->
            Just Dec

        _ ->
            Nothing


weekdayFullName : Weekday -> String
weekdayFullName week =
    case week of
        Mon ->
            "Monday"

        Tue ->
            "Tuesday"

        Wed ->
            "Wednesday"

        Thu ->
            "Thursday"

        Fri ->
            "Friday"

        Sat ->
            "Saturday"

        Sun ->
            "Sunday"


weekdayShortName : Weekday -> String
weekdayShortName week =
    weekdayFullName week
        |> String.left 3


weekdayLetterName : Weekday -> String
weekdayLetterName week =
    weekdayFullName week
        |> String.left 1


monthsBefore : Month -> List Month
monthsBefore month =
    case month of
        Jan ->
            []

        Feb ->
            [ Jan ]

        Mar ->
            [ Jan, Feb ]

        Apr ->
            [ Jan, Feb, Mar ]

        May ->
            [ Jan, Feb, Mar, Apr ]

        Jun ->
            [ Jan, Feb, Mar, Apr, May ]

        Jul ->
            [ Jan, Feb, Mar, Apr, May, Jul ]

        Aug ->
            [ Jan, Feb, Mar, Apr, May, Jul, Jun ]

        Sep ->
            [ Jan, Feb, Mar, Apr, May, Jul, Jun, Aug ]

        Oct ->
            [ Jan, Feb, Mar, Apr, May, Jul, Jun, Aug, Sep ]

        Nov ->
            [ Jan, Feb, Mar, Apr, May, Jul, Jun, Aug, Sep, Oct ]

        Dec ->
            [ Jan, Feb, Mar, Apr, May, Jul, Jun, Aug, Sep, Oct, Nov ]


capDay : Date -> Date
capDay ({ year, month, day } as date) =
    case compare day (daysInMonth year month) of
        GT ->
            { date | day = daysInMonth year month }

        _ ->
            date


addDays : Date -> Int -> Date
addDays date new =
    toMillis date
        |> (+) (new * 86400000)
        |> fromMillis


addYears : Int -> Date -> Date
addYears new ({ year } as date) =
    { date | year = year + new }
        |> capDay


nextMonth : Date -> Date
nextMonth ({ month, year } as date) =
    let
        next =
            case month of
                Jan ->
                    Feb

                Feb ->
                    Mar

                Mar ->
                    Apr

                Apr ->
                    May

                May ->
                    Jun

                Jun ->
                    Jul

                Jul ->
                    Aug

                Aug ->
                    Sep

                Sep ->
                    Oct

                Oct ->
                    Nov

                Nov ->
                    Dec

                Dec ->
                    Jan
    in
    case month == Dec of
        True ->
            { date | year = year + 1, month = Jan }
                |> capDay

        False ->
            { date | month = next }
                |> capDay


prevMonth : Date -> Date
prevMonth ({ month, year } as date) =
    let
        next =
            case month of
                Jan ->
                    Dec

                Feb ->
                    Jan

                Mar ->
                    Feb

                Apr ->
                    Mar

                May ->
                    Apr

                Jun ->
                    May

                Jul ->
                    Jun

                Aug ->
                    Jul

                Sep ->
                    Aug

                Oct ->
                    Sep

                Nov ->
                    Oct

                Dec ->
                    Nov
    in
    case month == Jan of
        True ->
            { date | year = year - 1, month = Dec }
                |> capDay

        False ->
            { date | month = next }
                |> capDay


fromPosix : Posix -> Date
fromPosix posix =
    { year = Time.toYear Time.utc posix
    , month = Time.toMonth Time.utc posix
    , day = Time.toDay Time.utc posix
    , hour = Time.toHour Time.utc posix
    , minute = Time.toMinute Time.utc posix
    , second = Time.toSecond Time.utc posix
    , millis = Time.toMillis Time.utc posix
    , weekday = Time.toWeekday Time.utc posix
    }


fromMillis : Int -> Date
fromMillis millis =
    Time.millisToPosix millis
        |> fromPosix


toPosix : Date -> Posix
toPosix date =
    toMillis date
        |> Time.millisToPosix


toMillis : Date -> Int
toMillis ({ year, month, day, hour, minute, second, millis } as date) =
    [ List.range 1970 (year - 1)
        |> List.map daysInYear
        |> List.foldr (+) 0
        |> (*) 86400
    , monthsBefore month
        |> List.map (daysInMonth year)
        |> List.foldr (+) 0
        |> (*) 86400
    , (day - 1) * 86400
    , hour * 3600
    , minute * 60
    , second
    ]
        |> List.foldr (+) 0
        |> (*) 1000
        |> (+) millis
