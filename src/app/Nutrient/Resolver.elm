module Nutrient.Resolver exposing (resolve)

import Lib.Extra
import Messages exposing (Msg(..))
import Model exposing (Model, modelAside, modelCalendar, modelNutrient)
import Monocle.Lens as Lens
import Nutrient.Messages exposing (NutrientMsg(..))


resolve : NutrientMsg -> Model -> ( Model, Cmd Msg )
resolve message model =
    case message of
        OnPageChange value ->
            model
                |> modelNutrient.set value
                |> Lib.Extra.withNoCommand
