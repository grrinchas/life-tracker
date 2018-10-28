module Date.Model exposing (Date, addDays, dateDay, dateHour, dateMillisecond, dateMinute, dateMonth, dateSecond, dateWeekday, dateYear, daysInMonth, daysInYear, epoch, fromPosix, isLeapYear, monthFullName, monthList, monthShortName, toMillis, toPosix, weekdayFullName, weekdayLetterName, weekdayList, weekdayShortName)

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


dateYear : Lens Date Int
dateYear =
    Lens .year (\b a -> { a | year = b })


dateMonth : Lens Date Month
dateMonth =
    Lens .month (\b a -> { a | month = b })


dateDay : Lens Date Int
dateDay =
    Lens .day (\b a -> { a | day = b })


dateHour : Lens Date Int
dateHour =
    Lens .hour (\b a -> { a | hour = b })


dateMinute : Lens Date Int
dateMinute =
    Lens .minute (\b a -> { a | minute = b })


dateSecond : Lens Date Int
dateSecond =
    Lens .second (\b a -> { a | second = b })


dateMillisecond : Lens Date Int
dateMillisecond =
    Lens .millis (\b a -> { a | millis = b })


dateWeekday : Lens Date Weekday
dateWeekday =
    Lens .weekday (\b a -> { a | weekday = b })


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


addDays : Date -> Int -> Date
addDays date days =
    toMillis date
        |> (+) (days * 86400000)
        |> fromMillis


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
