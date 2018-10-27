module Lib.Filter exposing (apply, intersection, toggle)

import List.Extra


toggle : List a -> a -> List a
toggle filter el =
    case List.member el filter of
        True ->
            List.filter ((/=) el) filter

        False ->
            el :: filter


intersection : List a -> List a -> List a
intersection listA listB =
    List.filter (\a -> List.member a listB) listA


apply : List b -> (b -> List a) -> List a -> List b
apply original func filter =
    let
        application b =
            func b
                |> intersection filter
                |> (not << List.isEmpty)
    in
    List.filter application original
