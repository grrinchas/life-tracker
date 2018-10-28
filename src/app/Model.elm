module Model exposing
    ( Model
    , initial
    , modelAside
    , modelCalendar
    , modelConfig
    , modelFood
    , modelNav
    )

import Calendar.Model
import Component.Aside.Model
import Config.Model exposing (Config)
import Date.Model exposing (Date)
import Food.Model
import Monocle.Lens exposing (Lens)
import Route.Model exposing (Navigation)
import Time


type alias Model =
    { nav : Navigation
    , config : Config
    , food : Food.Model.Model
    , aside : Component.Aside.Model.Aside
    , calendar : Calendar.Model.Model
    }


initial : Config -> Navigation -> Model
initial config nav =
    { nav = nav
    , config = config
    , food = Food.Model.initial
    , aside = Component.Aside.Model.initial
    , calendar = Calendar.Model.initial Date.Model.epoch
    }


modelCalendar : Lens Model Calendar.Model.Model
modelCalendar =
    Lens .calendar (\b a -> { a | calendar = b })


modelAside : Lens Model Component.Aside.Model.Aside
modelAside =
    Lens .aside (\b a -> { a | aside = b })


modelFood : Lens Model Food.Model.Model
modelFood =
    Lens .food (\b a -> { a | food = b })


modelConfig : Lens Model Config
modelConfig =
    Lens .config (\b a -> { a | config = b })


modelNav : Lens Model Navigation
modelNav =
    Lens .nav (\b a -> { a | nav = b })
