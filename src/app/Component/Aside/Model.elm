module Component.Aside.Model exposing (Aside, asideExploreMenu, asideTagsFilter, asideTagsMenu, initial)

import Monocle.Lens exposing (Lens)
import Tag.Model exposing (Tag)


type alias Aside =
    { exploreMenu : Bool
    , tagsMenu : Bool
    , tagsFilter : List Tag
    }


initial : Aside
initial =
    { exploreMenu = True
    , tagsMenu = True
    , tagsFilter = Tag.Model.list
    }


asideTagsFilter : Lens Aside (List Tag)
asideTagsFilter =
    Lens .tagsFilter (\b a -> { a | tagsFilter = b })


asideExploreMenu : Lens Aside Bool
asideExploreMenu =
    Lens .exploreMenu (\b a -> { a | exploreMenu = b })


asideTagsMenu : Lens Aside Bool
asideTagsMenu =
    Lens .exploreMenu (\b a -> { a | tagsMenu = b })
