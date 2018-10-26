module Tag.Model exposing (Tag(..), toString)


type Tag
    = Fruit
    | Vegetables
    | Meat
    | Fish
    | Poultry
    | Nut
    | Seed
    | Supplement
    | Legume
    | Diary


toString : Tag -> String
toString tag =
    case tag of
        Fruit ->
            "Fruit"

        Vegetables ->
            "Vegetables"

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
