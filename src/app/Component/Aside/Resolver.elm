module Component.Aside.Resolver exposing (resolve)

import Component.Aside.Messages exposing (AsideMsg(..))
import Lib.Extra
import Messages exposing (Msg(..))
import Model exposing (Model, modelAside)
import Monocle.Lens


resolve : AsideMsg -> Model -> ( Model, Cmd Msg )
resolve message model =
    case message of
        OnAsideChange aside ->
            model
                |> modelAside.set aside
                |> Lib.Extra.withNoCommand
