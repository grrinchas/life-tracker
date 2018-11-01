module Component.Aside.Model exposing (Aside, asideCalendarDisplay, asideChooseDate, asideExploreMenu, asideTagsFilter, asideTagsMenu, initial)

import Food.Tag exposing (Tag)
import Monocle.Lens exposing (Lens)


type alias Aside =
    { exploreMenu : Bool
    , tagsMenu : Bool
    , chooseDate : Bool
    , calendarDisplay : Bool
    , tagsFilter : List Tag
    }


initial : Aside
initial =
    { exploreMenu = True
    , tagsMenu = True
    , chooseDate = True
    , calendarDisplay = True
    , tagsFilter = Food.Tag.list
    }


asideCalendarDisplay : Lens Aside Bool
asideCalendarDisplay =
    Lens .calendarDisplay (\b a -> { a | calendarDisplay = b })


asideChooseDate : Lens Aside Bool
asideChooseDate =
    Lens .chooseDate (\b a -> { a | chooseDate = b })


asideTagsFilter : Lens Aside (List Tag)
asideTagsFilter =
    Lens .tagsFilter (\b a -> { a | tagsFilter = b })


asideExploreMenu : Lens Aside Bool
asideExploreMenu =
    Lens .exploreMenu (\b a -> { a | exploreMenu = b })


asideTagsMenu : Lens Aside Bool
asideTagsMenu =
    Lens .exploreMenu (\b a -> { a | tagsMenu = b })
