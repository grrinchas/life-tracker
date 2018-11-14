module Nutrient.View exposing (chart, simple)

import Activity.Activities
import Activity.Model
import Axis
import Color
import Curve
import Date.Model
import Html exposing (..)
import Html.Attributes exposing (id)
import Html.Events.Extra.Mouse
import List.Extra
import Maybe.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Nutrient.Messages exposing (NutrientMsg(..))
import Nutrient.Model exposing (Nutrient)
import Nutrient.Page exposing (calorieMouseEvent)
import Path exposing (Path)
import Scale exposing (ContinuousScale)
import Shape
import Time
import TypedSvg exposing (circle, g, path, polyline, svg)
import TypedSvg.Attributes exposing (class, cx, cy, d, fill, points, r, stroke, transform, viewBox)
import TypedSvg.Attributes.InPx exposing (strokeWidth)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Fill(..), Transform(..), px)


simple : Nutrient -> Html Msg
simple nutrient =
    text <| Nutrient.Model.toString nutrient


w : Float
w =
    900


h : Float
h =
    450


padding : Float
padding =
    40


chart : Model -> Html Msg
chart { activities, nutrient } =
    let
        xScale =
            Scale.time Time.utc
                ( 0, w - 2 * padding )
                ( activities
                    |> Activity.Activities.firstMeal
                    |> Maybe.map (\( date, _, _ ) -> Date.Model.toPosix date)
                    |> Maybe.withDefault (Time.millisToPosix 0)
                , activities
                    |> Activity.Activities.lastMeal
                    |> Maybe.map (\( date, _, _ ) -> Date.Model.toPosix date)
                    |> Maybe.withDefault (Time.millisToPosix 0)
                )

        yScale =
            Scale.linear ( h - 2 * padding, 0 ) ( 0, 3000 )

        xAxis model =
            Axis.bottom
                [ Axis.tickCount (List.length model)
                , Axis.tickFormat
                    (\data ->
                        case Date.Model.fromPosix data of
                            { day } ->
                                Debug.toString day
                    )
                ]
                xScale

        yAxis =
            Axis.left
                [ Axis.tickCount 5
                ]
                yScale

        transformToLineData ( x, y ) =
            Just ( Scale.convert xScale x, Scale.convert yScale y )

        tranfromToAreaData ( x, y ) =
            Just
                ( ( Scale.convert xScale x, Tuple.first (Scale.rangeExtent yScale) )
                , ( Scale.convert xScale x, Scale.convert yScale y )
                )

        line =
            List.map transformToLineData mealsModel
                |> Shape.line Shape.linearCurve

        area =
            List.map tranfromToAreaData mealsModel
                |> Shape.area Shape.linearCurve

        mealsModel =
            Activity.Activities.calsPerDay activities
                |> List.map (\( date, meals, cals ) -> ( Date.Model.toPosix date, toFloat cals ))

        intercept { offsetPos } =
            let
                ( x, y ) =
                    ( Tuple.first offsetPos - padding, h - Tuple.second offsetPos - padding )
            in
            List.map transformToLineData mealsModel
                |> Maybe.Extra.values
                |> (Maybe.withDefault [] << List.tail)
                |> List.Extra.zip (List.map transformToLineData mealsModel |> Maybe.Extra.values)
                |> List.Extra.find (\( ( x1, y1 ), ( x2, y2 ) ) -> x >= x1 && x <= x2)
                |> Maybe.map
                    (\( ( x1, y1 ), ( x2, y2 ) ) ->
                        case x1 - x2 == 0 of
                            True ->
                                ( ( x1, y1 ), Just ( x2, y2 ) )

                            False ->
                                ( ( x, (y1 - y2) / (x1 - x2) * (x - x1) + y1 ), Nothing )
                    )

        circleView ( ( x1, y1 ), second ) =
            case second of
                Just ( x2, y2 ) ->
                    [ Path.element [ Curve.linear [ ( x1, y1 ), ( x2, y2 ) ] ]
                        [ transform [ Translate padding padding ]
                        , strokeWidth 5
                        ]
                    ]

                Nothing ->
                    [ circle [ cx (px x1), cy (px y1), r (px 4), transform [ Translate padding padding ] ] []
                    , circle
                        [ cx (px x1)
                        , cy (px y1)
                        , r (px 7)
                        , transform [ Translate padding padding ]
                        , stroke (Color.rgb 0 0 0)
                        , strokeWidth 1
                        , fill FillNone
                        ]
                        []
                    ]

        lineView ( ( x1, y1 ), second ) =
            Path.element [ Curve.linear [ ( x1, 0 ), ( x1, h - padding - padding ) ] ]
                [ transform [ Translate padding padding ]
                , strokeWidth 1
                , stroke (Color.rgb 0 0 0)
                ]

        view =
            svg
                [ viewBox 0 0 w h
                , Html.Events.Extra.Mouse.onMove (\event -> OnNutrient <| OnPageChange <| calorieMouseEvent.set (Just event) nutrient)
                , Html.Events.Extra.Mouse.onLeave (\event -> OnNutrient <| OnPageChange <| calorieMouseEvent.set Nothing nutrient)
                ]
            <|
                List.concat
                    [ [ g
                            [ transform [ Translate padding padding ]
                            , class [ "series" ]
                            ]
                            [ Path.element area
                                [ strokeWidth 3
                                , fill <| Fill <| Color.rgba 1 0 0 0.54
                                ]
                            , Path.element line [ stroke (Color.rgb 1 0 0), strokeWidth 3, fill FillNone ]
                            ]
                      , g [ transform [ Translate (padding - 1) padding ] ]
                            [ yAxis ]
                      , g [ transform [ Translate (padding - 1) (h - padding) ] ]
                            [ xAxis mealsModel ]
                      ]
                    , Maybe.map intercept nutrient.calorieMouseEvent
                        |> Maybe.Extra.join
                        |> Maybe.map circleView
                        |> Maybe.withDefault []
                    , [ Maybe.map intercept nutrient.calorieMouseEvent
                            |> Maybe.Extra.join
                            |> Maybe.map lineView
                            |> Maybe.withDefault (g [] [])
                      ]
                    ]
    in
    main_ [ id "nutrition" ]
        [ view
        ]
