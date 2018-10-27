module Tag.Model exposing (Tag(..), list, toString)


type Tag
    = Fruit
    | Vegetable
    | Meat
    | Fish
    | Grain
    | Poultry
    | Nut
    | Seed
    | Supplement
    | Legume
    | Diary
    | Yogurt
    | Berry


list : List Tag
list =
    [ Fruit
    , Vegetable
    , Meat
    , Fish
    , Grain
    , Poultry
    , Nut
    , Berry
    , Seed
    , Supplement
    , Legume
    , Diary
    , Yogurt
    ]


toString : Tag -> String
toString tag =
    case tag of
        Berry ->
            "Berry"

        Yogurt ->
            "Yogurt"

        Grain ->
            "Grain"

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
