module Route.Model exposing
    ( Navigation
    , Route(..)
    , calendar
    , home
    , isCalendar
    , isMeal
    , isMeals
    , isProducts
    , meal
    , meals
    , parse
    , products
    , routeRoute
    , toPath
    )

import Browser.Navigation exposing (Key)
import Config.Model exposing (Config, Mode(..))
import Monocle.Lens exposing (Lens)
import Url exposing (Url)


type alias Navigation =
    { key : Key
    , route : Route
    }


routeRoute : Lens Navigation Route
routeRoute =
    Lens .route (\b a -> { a | route = b })


type Route
    = Home
    | Calendar
    | Products
    | Meals
    | Meal String


parse : String -> Maybe Route
parse path =
    case List.filter ((/=) "") <| String.split "/" <| String.replace "#" "" path of
        [] ->
            Just Home

        [ "calendar" ] ->
            Just Calendar

        [ "products" ] ->
            Just Products

        [ "meals" ] ->
            Just Meals

        [ "meals", name ] ->
            Just (Meal name)

        _ ->
            Nothing


toPath : Config -> Route -> String
toPath { mode } route =
    case route of
        Home ->
            "/#"

        Calendar ->
            "#calendar"

        Products ->
            "#products"

        Meals ->
            "#meals"

        Meal name ->
            "#meals/" ++ name


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


isHome : Route -> Bool
isHome =
    (==) Home


isCalendar : Route -> Bool
isCalendar =
    (==) Calendar


isProducts : Route -> Bool
isProducts =
    (==) Products
