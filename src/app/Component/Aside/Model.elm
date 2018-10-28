module Component.Aside.Model exposing (Aside, asideCalendarDisplay, asideChooseYear, asideExploreMenu, asideTagsFilter, asideTagsMenu, initial)

import Monocle.Lens exposing (Lens)
import Tag.Model exposing (Tag)


type alias Aside =
    { exploreMenu : Bool
    , tagsMenu : Bool
    , chooseYear : Bool
    , calendarDisplay : Bool
    , tagsFilter : List Tag
    }


initial : Aside
initial =
    { exploreMenu = True
    , tagsMenu = True
    , chooseYear = True
    , calendarDisplay = True
    , tagsFilter = Tag.Model.list
    }


asideCalendarDisplay : Lens Aside Bool
asideCalendarDisplay =
    Lens .calendarDisplay (\b a -> { a | calendarDisplay = b })


asideChooseYear : Lens Aside Bool
asideChooseYear =
    Lens .chooseYear (\b a -> { a | chooseYear = b })


asideTagsFilter : Lens Aside (List Tag)
asideTagsFilter =
    Lens .tagsFilter (\b a -> { a | tagsFilter = b })


asideExploreMenu : Lens Aside Bool
asideExploreMenu =
    Lens .exploreMenu (\b a -> { a | exploreMenu = b })


asideTagsMenu : Lens Aside Bool
asideTagsMenu =
    Lens .exploreMenu (\b a -> { a | tagsMenu = b })
