module Messages exposing (Msg(..))

import Browser exposing (UrlRequest)
import Component.Aside.Messages exposing (AsideMsg)
import Route.Messages exposing (RouteMsg)


type Msg
    = Nop
    | OnRoute RouteMsg
    | OnAside AsideMsg
