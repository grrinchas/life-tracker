module Route.Model exposing
    ( Breadcrumb
    , Navigation
    , Route(..)
    , breadcrumb
    , calendar
    , home
    , isCalendar
    , isMeal
    , isMeals
    , isNutrition
    , isProducts
    , isSport
    , meal
    , meals
    , nutrition
    , parse
    , products
    , routeRoute
    , sport
    , toName
    , toPath
    )

import Browser.Navigation exposing (Key)
import Config.Model exposing (Config, Mode(..))
import Monocle.Lens exposing (Lens)
import String.Extra
import Url exposing (Url)


type alias Navigation =
    { key : Key
    , route : Route
    }


type alias Breadcrumb =
    List Route


routeRoute : Lens Navigation Route
routeRoute =
    Lens .route (\b a -> { a | route = b })


type Route
    = Home
    | Calendar
    | Products
    | Nutrition
    | Meals
    | Meal String
    | Sport


parse : String -> Maybe Route
parse path =
    let
        _ =
            Debug.log "" path
    in
    case List.filter ((/=) "") <| String.split "/" <| String.replace "#" "" path of
        [] ->
            Just Home

        [ "calendar" ] ->
            Just Calendar

        [ "sport" ] ->
            Just Sport

        [ "nutrition" ] ->
            Just Nutrition

        [ "nutrition", "products" ] ->
            Just Products

        [ "nutrition", "meals" ] ->
            Just Meals

        [ "nutrition", "meals", name ] ->
            Just (Meal name)

        _ ->
            Nothing


toPath : Config -> Route -> String
toPath { mode } route =
    breadcrumb route
        |> List.map toName
        |> List.map (String.replace "home" "")
        |> String.join "/"
        |> (++) "#"


toName : Route -> String
toName route =
    case route of
        Home ->
            "home"

        Calendar ->
            "calendar"

        Sport ->
            "sport"

        Nutrition ->
            "nutrition"

        Products ->
            "products"

        Meals ->
            "meals"

        Meal name ->
            String.Extra.dasherize name


breadcrumb : Route -> Breadcrumb
breadcrumb route =
    case route of
        Home ->
            [ Home ]

        Calendar ->
            [ Home, Calendar ]

        Sport ->
            [ Home, Sport ]

        Nutrition ->
            [ Home, Nutrition ]

        Products ->
            [ Home, Nutrition, Products ]

        Meals ->
            [ Home, Nutrition, Meals ]

        Meal name ->
            [ Home, Nutrition, Meals, Meal name ]


nutrition : Route
nutrition =
    Nutrition


home : Route
home =
    Home


meals : Route
meals =
    Meals


meal : String -> Route
meal =
    Meal


calendar : Route
calendar =
    Calendar


products : Route
products =
    Products


sport : Route
sport =
    Sport


isNutrition : Route -> Bool
isNutrition =
    (==) Nutrition


isMeals : Route -> Bool
isMeals =
    (==) Meals


isMeal : Route -> Bool
isMeal route =
    case route of
        Meal _ ->
            True

        _ ->
            False


isSport : Route -> Bool
isSport =
    (==) Sport


isHome : Route -> Bool
isHome =
    (==) Home


isCalendar : Route -> Bool
isCalendar =
    (==) Calendar


isProducts : Route -> Bool
isProducts =
    (==) Products
