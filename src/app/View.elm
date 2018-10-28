module View exposing (view)

import Browser exposing (Document)
import Calendar.View
import Color exposing (blue, green, orange, red)
import Component.Layout.View
import Date.Model exposing (epoch, toPosix)
import FontAwesome.Regular
import FontAwesome.Solid
import Food.Data.Diary as Diary
import Food.Data.Poultry as Poultry
import Food.Data.Supplement as Supplement
import Food.Food
import Food.View
import Html exposing (Html, a, div, img, p, span, text)
import Html.Attributes exposing (href, src)
import Meal.Model
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model exposing (Route(..))
import Svg.Path
import Time exposing (Month(..))
import TypedSvg exposing (path, svg)
import TypedSvg.Attributes exposing (color, d, fill, viewBox)
import TypedSvg.Types exposing (Fill(..))
import Unit.Price


view : Model -> Document Msg
view ({ nav } as model) =
    case nav.route of
        Home ->
            { title = "Home"
            , body =
                Component.Layout.View.notImplemented model
            }

        Calendar ->
            { title = "Calendar"
            , body =
                Calendar.View.yearView model
                    |> Component.Layout.View.simple model
            }

        Meals ->
            { title = "Meals"
            , body =
                Component.Layout.View.notImplemented model
            }

        Meal name ->
            { title = name
            , body =
                Component.Layout.View.notImplemented model
            }

        Sport ->
            { title = "Sport"
            , body =
                Component.Layout.View.notImplemented model
            }

        Nutrition ->
            { title = "Nutrition"
            , body =
                Component.Layout.View.notImplemented model
            }

        Products ->
            { title = "Products"
            , body =
                Food.View.page model
                    |> Component.Layout.View.simple model
            }


chart : Html msg
chart =
    let
        close =
            "Z"

        move x y =
            String.join ""
                [ "M", Debug.toString x, ",", Debug.toString y ]

        line x y =
            String.join ""
                [ "L", Debug.toString x, ",", Debug.toString y ]

        arc x y rotation a sweep xe xy =
            String.join ""
                [ "A"
                , Debug.toString x
                , ","
                , Debug.toString y
                , " "
                , Debug.toString rotation
                , " "
                , Debug.toString a
                , ","
                , Debug.toString sweep
                , " "
                , Debug.toString xe
                , ","
                , Debug.toString xy
                ]

        _ =
            Debug.log "" Svg.Path.arcBy

        _ =
            Debug.log "" FontAwesome.Regular.bell
    in
    svg [ viewBox -100.0 -100.0 200.0 200.0 ]
        [ path [ d <| String.join " " [ move 0 0, line 100 0, arc 100 100 0 1 1 -95.9 -28.2, close ], fill <| Fill red ] []
        , path [ d <| String.join " " [ move 0 0, line -95.9 -28.2, arc 100 100 0 0 1 65.5 -75.6, close ], fill <| Fill blue ] []
        , path [ d <| String.join " " [ move 0 0, line 65.5 -75.6, arc 100 100 0 0 1 95.9 -28.2, close ], fill <| Fill green ] []
        , path [ d <| String.join " " [ move 0 0, line 95.9 -28.2, arc 100 100 0 0 1 100 0, close ], fill <| Fill orange ] []
        ]
