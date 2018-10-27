module Tag.Model exposing (Tag(..), list, toString)


type Tag
    = Fruit
    | Vegetable
    | Meat
    | Fish
    | Poultry
    | Nut
    | Seed
    | Supplement
    | Legume
    | Diary
    | Yogurt


list : List Tag
list =
    [ Fruit
    , Vegetable
    , Meat
    , Fish
    , Poultry
    , Nut
    , Seed
    , Supplement
    , Legume
    , Diary
    , Yogurt
    ]


toString : Tag -> String
toString tag =
    case tag of
        Yogurt ->
            "Yogurt"

        Fruit ->
            "Fruit"

        Vegetable ->
            "Vegetable"

        Meat ->
            "Meat"

        Fish ->
            "Fish"

        Poultry ->
            "Poultry"

        Nut ->
            "Nut"

        Seed ->
            "Seed"

        Supplement ->
            "Supplement"

        Legume ->
            "Legume"

        Diary ->
            "Diary"
