module View exposing (view)

import Browser exposing (Document)
import Date.Model exposing (epoch, toPosix)
import Food.Data.Poultry as Poultry
import Food.Model
import Html exposing (Html, a, div, p, span, text)
import Html.Attributes exposing (href)
import Messages exposing (Msg)
import Model exposing (Model)
import Time exposing (Month(..))


view : Model -> Document Msg
view model =
    { title = "Dennis Blog"
    , body =
        [ div [] [ a [ href "https://www.google.co.uk" ] [ text "external" ] ]
        , div [] [ a [ href "/about" ] [ text "about" ] ]
        , { epoch | year = 2589, day = 3, month = Jan, hour = 23, minute = 0, second = 10, millis = 1000 }
            |> toPosix
            |> (\pos ->
                    div []
                        [ span [] [ text <| Debug.toString <| Time.toYear Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toMonth Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toDay Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toHour Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toMinute Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toSecond Time.utc pos ]
                        , span [] [ text <| Debug.toString <| Time.toMillis Time.utc pos ]
                        , p [] [ text <| Debug.toString <| Food.Model.calPerNut Poultry.rawChickenBreast ]
                        , p [] [ text <| Debug.toString <| Food.Model.totalPhantom Poultry.rawChickenBreast ]
                        , p [] [ text <| Debug.toString <| Food.Model.totalGrams Poultry.rawChickenBreast ]
                        , p [] [ text <| Debug.toString <| Food.Model.totalCalories Poultry.rawChickenBreast ]
                        ]
               )
        ]
    }
