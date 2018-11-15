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
import Html.Events.Extra.Wheel
import List.Extra
import Maybe.Extra
import Messages exposing (Msg(..))
import Model exposing (Model)
import Nutrient.Messages exposing (NutrientMsg(..))
import Nutrient.Model exposing (Nutrient)
import Nutrient.Page exposing (calorieMouseEvent, calorieZoomIn)
import Path exposing (Path)
import Scale exposing (ContinuousScale)
import Shape exposing (StackConfig)
import Statistics
import Time
import TypedSvg exposing (circle, g, path, polyline, svg)
import TypedSvg.Attributes exposing (class, cx, cy, d, fill, height, points, r, stroke, transform, viewBox, width)
import TypedSvg.Attributes.InPx exposing (strokeWidth)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (Fill(..), Transform(..), px)


simple : Nutrient -> Html Msg
simple nutrient =
    text <| Nutrient.Model.toString nutrient


w : Float
w =
    800


h : Float
h =
    300


padding : Float
padding =
    20


chart : Model -> Html Msg
chart model =
    main_ [ id "nutrition" ]
        [ bidChart model
        , askChart model
        ]


askChart : Model -> Html Msg
askChart { activities, nutrient } =
    let
        xScale =
            Scale.linear ( 0, w - padding ) ( midPrice, 5400 )

        yScale =
            Scale.linear ( h - padding, 0 ) ( 0, 50 )

        xAxis =
            Axis.bottom [ Axis.tickCount 10 ] xScale

        yAxis =
            Axis.left [ Axis.tickCount 5 ] yScale

        line =
            orderBook.asks
                |> List.map (\{ price, amount } -> Just ( Scale.convert xScale price, Scale.convert yScale amount ))
                |> Shape.line Shape.linearCurve

        area =
            orderBook.asks
                |> List.map (\{ price, amount } -> Just ( ( Scale.convert xScale price, Tuple.first (Scale.rangeExtent yScale) ), ( Scale.convert xScale price, Scale.convert yScale amount ) ))
                |> Shape.area Shape.linearCurve
    in
    svg [ viewBox 0 0 w h, width (px w), height (px h) ]
        [ g [ transform [ Translate 0 (h - padding) ] ] [ xAxis ]
        , g [ transform [ Translate (w - 1) 0 ] ] [ yAxis ]
        , g [ transform [ Translate 0 0 ] ]
            [ Path.element line [ strokeWidth 2, stroke (Color.rgb 0 1 0), fill FillNone ]
            , Path.element area [ fill <| Fill <| Color.rgba 0 1 0 0.3 ]
            ]
        ]


bidChart : Model -> Html Msg
bidChart { nutrient } =
    let
        xBidScale =
            Scale.linear ( 0, w / 2 ) (zoomBidPrice nutrient.zoomIn)

        xAskScale =
            Scale.linear ( w / 2, w ) (zoomAskPrice nutrient.zoomIn)

        yScale =
            Scale.linear ( h - padding, 0 ) ( 0, getRange nutrient.zoomIn )

        xAskAxis =
            Axis.bottom [ Axis.tickCount 5 ] xAskScale

        xBidAxis =
            Axis.bottom [ Axis.tickCount 5 ] xBidScale

        yLeftAxis =
            Axis.right [ Axis.tickCount 10 ] yScale

        yRightAxis =
            Axis.left [ Axis.tickCount 10 ] yScale

        askLine =
            orderBook.asks
                |> List.map (\{ price, amount } -> Just ( Scale.convert xAskScale price, Scale.convert yScale amount ))
                |> Shape.line Shape.linearCurve

        bidLine =
            orderBook.bids
                |> List.map (\{ price, amount } -> Just ( Scale.convert xBidScale price, Scale.convert yScale amount ))
                |> Shape.line Shape.linearCurve

        askArea =
            orderBook.asks
                |> List.map (\{ price, amount } -> Just ( ( Scale.convert xAskScale price, Tuple.first (Scale.rangeExtent yScale) ), ( Scale.convert xAskScale price, Scale.convert yScale amount ) ))
                |> Shape.area Shape.linearCurve

        bidArea =
            orderBook.bids
                |> List.map (\{ price, amount } -> Just ( ( Scale.convert xBidScale price, Tuple.first (Scale.rangeExtent yScale) ), ( Scale.convert xBidScale price, Scale.convert yScale amount ) ))
                |> Shape.area Shape.linearCurve
    in
    svg
        [ viewBox 0 0 w h
        , width (px w)
        , height (px h)
        , Html.Events.Extra.Wheel.onWheel
            (\{ deltaY } ->
                let
                    increment =
                        if nutrient.zoomIn + 5 * sign < 10 then
                            10

                        else
                            nutrient.zoomIn + 5 * sign

                    sign =
                        case 0 < deltaY of
                            True ->
                                1

                            False ->
                                -1
                in
                OnNutrient <| OnPageChange <| calorieZoomIn.set increment nutrient
            )
        ]
        [ g [ transform [ Translate 0 (h - padding) ] ] [ xBidAxis ]
        , g [ transform [ Translate 0 (h - padding) ] ] [ xAskAxis ]
        , g [ transform [ Translate 0 0 ] ] [ yLeftAxis ]
        , g [ transform [ Translate (w - 1) 0 ] ] [ yRightAxis ]
        , g [ transform [ Translate 0 0 ] ]
            [ Path.element bidLine [ strokeWidth 2, stroke (Color.rgb 0 1 0), fill FillNone ]
            , Path.element bidArea [ fill <| Fill <| Color.rgba 0 1 0 0.3 ]
            , Path.element askLine [ strokeWidth 2, stroke (Color.rgb 1 0 0), fill FillNone ]
            , Path.element askArea [ fill <| Fill <| Color.rgba 1 0 0 0.3 ]
            ]
        ]



{-
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
-}


type alias Record =
    { price : Float
    , amount : Float
    }


type alias OrderBook =
    { bids : List Record
    , asks : List Record
    }


getRange : Float -> Float
getRange zoom =
    max (getAskAmount <| Tuple.second <| zoomAskPrice zoom)
        (getBidAmount <| Tuple.first <| zoomBidPrice zoom)


getAskAmount : Float -> Float
getAskAmount price =
    orderBook.asks
        |> List.tail
        |> Maybe.withDefault []
        |> List.Extra.zip orderBook.asks
        |> List.Extra.find (\( fst, snd ) -> price > fst.price && price <= snd.price)
        |> Maybe.map (\( { amount }, snd ) -> amount)
        |> Maybe.withDefault 0


getBidAmount : Float -> Float
getBidAmount price =
    orderBook.bids
        |> List.tail
        |> Maybe.withDefault []
        |> List.Extra.zip orderBook.bids
        |> List.Extra.find (\( fst, snd ) -> price >= fst.price && price < snd.price)
        |> Maybe.map (\( { amount }, snd ) -> amount)
        |> Maybe.withDefault 0


midPrice : Float
midPrice =
    let
        bid =
            List.Extra.maximumBy .price orderBook.bids
                |> Maybe.map .price
                |> Maybe.withDefault 0

        ask =
            List.Extra.minimumBy .price orderBook.asks
                |> Maybe.map .price
                |> Maybe.withDefault 0
    in
    (bid + ask) * 0.5


zoomAskPrice : Float -> ( Float, Float )
zoomAskPrice percent =
    let
        ( min, max ) =
            askPriceRange
    in
    ( min, min + percent )


zoomBidPrice : Float -> ( Float, Float )
zoomBidPrice percent =
    let
        ( min, max ) =
            bidPriceRange
    in
    ( max - percent, max )


askPriceRange : ( Float, Float )
askPriceRange =
    List.map .price orderBook.asks
        |> Statistics.extent
        |> Maybe.map (\( _, max ) -> ( midPrice, max ))
        |> Maybe.withDefault ( 0, 0 )


bidPriceRange : ( Float, Float )
bidPriceRange =
    List.map .price orderBook.bids
        |> Statistics.extent
        |> Maybe.map (\( min, _ ) -> ( min, midPrice ))
        |> Maybe.withDefault ( 0, 0 )


orderBook : OrderBook
orderBook =
    let
        toRecord list =
            case list of
                [ price, amount ] ->
                    case ( String.toFloat price, String.toFloat amount ) of
                        ( Just p, Just a ) ->
                            Just (Record p a)

                        _ ->
                            Nothing

                _ ->
                    Nothing
    in
    { bids =
        List.map toRecord bids
            |> Maybe.Extra.values
            |> List.sortBy .price
            |> List.Extra.scanr1 (\fst snd -> Record fst.price (fst.amount + snd.amount))
    , asks =
        List.map toRecord asks
            |> Maybe.Extra.values
            |> List.sortBy .price
            |> List.Extra.scanl1 (\fst snd -> Record fst.price (fst.amount + snd.amount))
    }


bids =
    [ [ "5369.37", "0.148" ], [ "5367.75", "1" ], [ "5359.35", "3.7075" ], [ "5356.36", "0.04" ], [ "5353.69", "0.1" ], [ "5346.19", "17.0933" ], [ "5343.31", "0.03" ], [ "5339.22", "0.0025119" ], [ "5333.64", "1" ], [ "5321.25", "0.00359499" ], [ "5308.46", "0.00411548" ], [ "5296.52", "0.00403962" ], [ "5293.51", "0.00381304" ], [ "5269.69", "0.0315" ], [ "5251.65", "0.02746565" ], [ "5245.01", "0.5" ], [ "5169.69", "0.01934" ], [ "5168.94", "0.2" ], [ "5100.87", "0.1" ], [ "5100", "0.23370016" ], [ "5069.69", "0.01972" ], [ "5040.41", "0.1" ], [ "5001.01", "0.01" ], [ "5000", "0.25" ], [ "4969.69", "0.0202" ], [ "4962.11", "0.001" ], [ "4864.38", "0.0321932" ], [ "4645", "0.31265303" ], [ "4500", "0.24" ], [ "4395", "3.04265514" ], [ "4300", "0.1" ], [ "4200", "1.66333204" ], [ "4001.1", "0.19362925" ], [ "4000", "2.08030885" ], [ "3501.97", "0.34959585" ], [ "3075", "0.5" ], [ "3000", "0.49" ], [ "2556.02", "0.02" ], [ "2221.2", "0.10000392" ], [ "2000.01", "0.05" ], [ "1710", "0.10002616" ], [ "1056.02", "1.16" ], [ "1000.01", "0.1" ], [ "1000", "0.05" ], [ "556", "0.08" ], [ "500.01", "4.2" ], [ "256", "0.12" ], [ "206.02", "0.02" ], [ "200.02", "0.10447975" ], [ "200.01", "10.5" ], [ "200", "2.6" ], [ "120", "27" ], [ "114", "0.017" ], [ "111.01", "64.95540942" ], [ "111", "18.41441441" ], [ "103", "50" ], [ "102", "70" ], [ "100.01", "1" ], [ "100", "0.1" ], [ "62", "210" ], [ "50.01", "2" ], [ "25", "35" ], [ "10", "2" ], [ "5", "5" ], [ "2.03", "48.41695414" ], [ "2.02", "70" ], [ "1.2", "70" ], [ "1.1", "70" ], [ "1", "10" ], [ "0.5", "70" ], [ "0.3", "70" ], [ "0.24", "47.47513654" ], [ "0.23", "70" ], [ "0.22", "70" ], [ "0.21", "70" ], [ "0.2", "110.55" ], [ "0.19", "70" ], [ "0.18", "70" ], [ "0.17", "70" ], [ "0.16", "70" ], [ "0.15", "70" ], [ "0.14", "70" ], [ "0.13", "1470" ], [ "0.12", "70" ], [ "0.11", "70" ], [ "0.1", "140" ], [ "0.09", "70" ], [ "0.08", "70" ], [ "0.07", "70" ], [ "0.06", "70" ], [ "0.05", "70" ], [ "0.04", "137.15735116" ], [ "0.03", "70" ], [ "0.02", "78.75" ], [ "0.01", "140" ] ]


asks =
    [ [ "5378.93", "3.8279" ], [ "5388.7", "0.148" ], [ "5388.71", "15.78224331" ], [ "5396.74", "0.046" ], [ "5406.88", "0.1" ], [ "5407.86", "1" ], [ "5422.4", "10" ], [ "5494.65", "0.5" ], [ "5558.78", "0.025" ], [ "5558.79", "0.2" ], [ "5599.99", "1" ], [ "5600", "0.94" ], [ "5649", "1.60000871" ], [ "5994", "0.69201274" ], [ "5999", "0.0128" ], [ "6000", "0.13" ], [ "6151.27", "0.001" ], [ "6160", "0.3801265" ], [ "6200", "0.0714" ], [ "6208.4", "1.44929308" ], [ "6250", "0.18463468" ], [ "6262.25", "0.001" ], [ "6295", "0.16" ], [ "6296.03", "0.001" ], [ "6300", "1.35319822" ], [ "6310", "0.25" ], [ "6320", "0.001" ], [ "6325", "0.52684855" ], [ "6330", "0.001" ], [ "6339.99", "0.01142408" ], [ "6340", "0.001" ], [ "6350", "0.001" ], [ "6355.1", "0.00689369" ], [ "6360", "0.003" ], [ "6364.38", "0.02" ], [ "6370", "0.003" ], [ "6371.69", "0.01291415" ], [ "6380", "0.002" ], [ "6382.44", "0.001814" ], [ "6385.98", "0.001" ], [ "6397.15", "0.00173197" ], [ "6398.41", "0.005" ], [ "6400", "2.12268484" ], [ "6407", "0.01480971" ], [ "6407.84", "0.5" ], [ "6420.55", "0.02426033" ], [ "6429.06", "0.001" ], [ "6440", "0.23233421" ], [ "6448.28", "1.10714684" ], [ "6449", "0.01604862" ], [ "6450", "3.944171" ], [ "6480", "0.6388486" ], [ "6484", "0.8" ], [ "6493", "0.001" ], [ "6494.21", "0.05042925" ], [ "6500", "0.51264712" ], [ "6502.39", "0.00274944" ], [ "6510", "1.6377999" ], [ "6518.54", "0.00179" ], [ "6520", "0.001" ], [ "6525", "0.1" ], [ "6530", "0.133" ], [ "6533", "0.01" ], [ "6535", "0.1" ], [ "6539.2", "0.036617" ], [ "6540", "0.101" ], [ "6545", "0.1" ], [ "6550", "9.801" ], [ "6555", "0.1" ], [ "6560", "0.15" ], [ "6565", "0.1" ], [ "6570", "0.1184826" ], [ "6575", "0.1" ], [ "6580", "0.1" ], [ "6585", "0.1" ], [ "6590", "0.1" ], [ "6595", "0.1" ], [ "6600", "0.101" ], [ "6605", "0.1" ], [ "6610", "0.1" ], [ "6615", "0.1" ], [ "6620", "0.1" ], [ "6654.95", "0.001" ], [ "6669", "0.75" ], [ "6690", "0.139" ], [ "6700", "0.13056717" ], [ "6750", "0.00339538" ], [ "6790", "0.01537615" ], [ "6798", "0.20053252" ], [ "6799", "0.48860017" ], [ "6903", "0.065192" ], [ "7000", "0.25238989" ], [ "7195", "0.007" ], [ "7200", "4.87375404" ], [ "7250", "0.00787704" ], [ "7395", "0.006" ], [ "7400", "0.03" ], [ "7471.06", "0.001" ], [ "7488.19", "0.00104" ], [ "7795", "0.0074983" ], [ "8000", "0.0935714" ], [ "8660", "0.00504727" ], [ "8989", "0.005" ], [ "8999", "0.22572801" ], [ "9000", "0.11" ], [ "9600", "0.111" ], [ "9660", "0.3" ], [ "9777.99", "0.2" ], [ "9999.99", "0.01" ], [ "10000", "1.41023769" ], [ "11000", "0.5075" ], [ "12000", "0.08292484" ], [ "12777.99", "0.20740919" ], [ "13500", "0.002" ], [ "14777.99", "0.7" ], [ "14999.99", "0.01" ], [ "15000", "0.23845442" ], [ "17000", "0.17536598" ], [ "17400", "0.90454979" ], [ "19345", "0.001" ], [ "19999.99", "0.01" ], [ "24749", "0.005" ], [ "24777.99", "0.9" ], [ "24999.99", "0.01" ], [ "25000", "0.1" ], [ "38449", "0.005" ], [ "59000", "0.107" ], [ "89989", "0.005" ], [ "95000", "0.375" ], [ "98888", "0.1" ], [ "99999.99", "0.001" ], [ "100000", "2.9" ], [ "217439", "0.005" ], [ "300000", "0.1" ], [ "444449", "0.005" ], [ "644439", "0.005" ], [ "750000", "0.1" ], [ "999999.99", "0.001" ], [ "4248999", "0.005" ], [ "10000000", "0.001" ], [ "100000000", "0.011" ], [ "985254354", "0.005" ], [ "8999999999", "0.7" ], [ "9999999999", "0.1" ] ]


orderExample : OrderBook
orderExample =
    { bids =
        [ Record 1 5, Record 3 8, Record 2 3, Record 4 1 ]
            |> List.sortBy .price
            |> List.reverse
    , asks =
        [ Record 1 5, Record 3 8, Record 2 3, Record 4 1 ]
            |> List.sortBy .price
    }
