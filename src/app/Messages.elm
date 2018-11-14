module Messages exposing (Msg(..))

import Browser exposing (UrlRequest)
import Calendar.Messages exposing (CalendarMsg)
import Component.Aside.Messages exposing (AsideMsg)
import Nutrient.Messages exposing (NutrientMsg)
import Route.Messages exposing (RouteMsg)


type Msg
    = Nop
    | OnRoute RouteMsg
    | OnAside AsideMsg
    | OnCalendar CalendarMsg
    | OnNutrient NutrientMsg
