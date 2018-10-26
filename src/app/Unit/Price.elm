module Unit.Price exposing (Price, add, fromFloat, multBy, price, zero)


type Price
    = Price Int Int


zero : Price
zero =
    price 0 0


toFloat : Price -> Float
toFloat (Price a p) =
    Basics.toFloat a + (Basics.toFloat p / 100)


price : Int -> Int -> Price
price a p =
    Price (clamp 0 99999999 a) (clamp 0 99 p)


fromFloat : Float -> Price
fromFloat p =
    floor p
        |> Basics.toFloat
        |> (-) p
        |> (*) 100
        |> round
        |> price (floor p)


add : Price -> Price -> Price
add (Price a1 p1) (Price a2 p2) =
    if p1 + p2 >= 100 then
        price (a1 + a2 + 1) (modBy 100 <| p1 + p2)

    else
        price (a1 + a2) (p1 + p2)


multBy : Float -> Price -> Price
multBy scalar p =
    toFloat p
        |> (*) scalar
        |> fromFloat
