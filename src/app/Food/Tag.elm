module Food.Tag exposing (Tag(..), list, toString)


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
    | Canned
    | Fresh
    | Condiment
    | Bakery


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
    , Bakery
    , Canned
    , Fresh
    , Condiment
    ]


toString : Tag -> String
toString tag =
    case tag of
        Condiment ->
            "Condiment"

        Bakery ->
            "Bakery"

        Fresh ->
            "Fresh"

        Canned ->
            "Canned"

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
