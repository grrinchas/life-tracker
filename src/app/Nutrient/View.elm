module Nutrient.View exposing (chart, simple)

import Activity.Activities
import Activity.Model
import Color
import Html exposing (..)
import Html.Attributes exposing (id)
import List.Extra
import Maybe.Extra
import Model exposing (Model)
import Nutrient.Model exposing (Nutrient)
import Svg.Path exposing (horizontalBy, lineBy, lineTo, open, pathToString, startAt, subpath, verticalBy)
import TypedSvg exposing (path, polyline, svg)
import TypedSvg.Attributes exposing (class, d, fill, points, stroke, viewBox)


simple : Nutrient -> Html msg
simple nutrient =
    text <| Nutrient.Model.toString nutrient


chart : Model -> Html msg
chart { activities } =
    let
        calories =
            List.map Activity.Model.getMeal activities
                |> Maybe.Extra.values
    in
    main_ [ id "nutrition" ]
        [ svg [ class [ "chart" ], viewBox 0 0 1000 500 ]
            [ polyline
                [ class [ "axis", "y-axis" ]
                , points [ ( 50, 50 ), ( 50, 450 ), ( 950, 450 ) ]
                ]
                []
            , path
                [ class [ "axis" ]
                , List.concat
                    [ List.Extra.initialize 40 (\i -> i * 10 + 50)
                        |> List.map
                            (\y -> subpath (startAt ( 45, toFloat y )) open <| [ horizontalBy 10 ])
                    , List.Extra.initialize 90 (\i -> i * 10 + 60)
                        |> List.map
                            (\x -> subpath (startAt ( toFloat x, 445 )) open <| [ verticalBy 10 ])
                    ]
                    |> pathToString
                    |> d
                ]
                []
            , polyline
                [ class [ "axis" ]
                , Activity.Activities.calsPerDay activities
                    |> List.map (\( { day }, meals, cal ) -> ( toFloat day * 20, (toFloat cal / 10) + 60 ))
                    |> points
                ]
                []
            ]

        --path [ d <| String.join " " [ move 0 0, line 100 0, arc 100 100 0 1 1 -95.9 -28.2, close ], fill <| Fill red ] []
        -- , path [ d <| String.join " " [ move 0 0, line -95.9 -28.2, arc 100 100 0 0 1 65.5 -75.6, close ], fill <| Fill blue ] []
        -- , path [ d <| String.join " " [ move 0 0, line 65.5 -75.6, arc 100 100 0 0 1 95.9 -28.2, close ], fill <| Fill green ] []
        -- , path [ d <| String.join " " [ move 0 0, line 95.9 -28.2, arc 100 100 0 0 1 100 0, close ], fill <| Fill orange ] []
        ]
