module Date.Model exposing (Date, epoch, toPosix)

import Time exposing (Month(..), Posix)


type alias Date =
    { year : Int
    , month : Month
    , day : Int
    , hour : Int
    , minute : Int
    , second : Int
    , millis : Int
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
    }


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


daysInMonth : Bool -> Month -> Int
daysInMonth leap month =
    case month of
        Jan ->
            31

        Feb ->
            case leap of
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


toPosix : Date -> Posix
toPosix ({ year, month, day, hour, minute, second, millis } as date) =
    [ List.range 1970 (year - 1)
        |> List.map daysInYear
        |> List.foldr (+) 0
        |> (*) 86400
    , monthsBefore month
        |> List.map (daysInMonth <| isLeapYear year)
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
        |> Time.millisToPosix
