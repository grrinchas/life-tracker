module Model exposing
    ( Model
    , initial
    , modelConfig
    , modelFood
    , modelNav
    )

import Config.Model exposing (Config)
import Food.Model
import Monocle.Lens exposing (Lens)
import Route.Model exposing (Navigation)


type alias Model =
    { nav : Navigation
    , config : Config
    , food : Food.Model.Model
    }


initial : Config -> Navigation -> Model
initial config nav =
    { nav = nav
    , config = config
    , food = Food.Model.initial
    }


modelFood : Lens Model Food.Model.Model
modelFood =
    Lens .food (\b a -> { a | food = b })


modelConfig : Lens Model Config
modelConfig =
    Lens .config (\b a -> { a | config = b })


modelNav : Lens Model Navigation
modelNav =
    Lens .nav (\b a -> { a | nav = b })
