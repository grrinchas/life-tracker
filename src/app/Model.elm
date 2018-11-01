module Model exposing
    ( Model
    , initial
    , modelActivities
    , modelAside
    , modelCalendar
    , modelConfig
    , modelFood
    , modelNav
    )

import Activity.Model exposing (Activity)
import Activity.Record
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
    , activities : List Activity
    }


initial : Config -> Navigation -> Model
initial config nav =
    { nav = nav
    , config = config
    , food = Food.Model.initial
    , aside = Component.Aside.Model.initial
    , calendar = Calendar.Model.initial Date.Model.epoch
    , activities = Activity.Record.all
    }


modelActivities : Lens Model (List Activity)
modelActivities =
    Lens .activities (\b a -> { a | activities = b })


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
