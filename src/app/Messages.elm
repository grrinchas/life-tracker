module Messages exposing (Msg(..))

import Browser exposing (UrlRequest)
import Route.Messages exposing (RouteMsg)


type Msg
    = Nop
    | OnRoute RouteMsg
