module Route.View exposing (view)

import Browser exposing (Document)
import Component.Layout.View
import Food.View
import Html exposing (div, text)
import Messages exposing (Msg)
import Model exposing (Model)
import Route.Model exposing (Route(..))


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
                Component.Layout.View.notImplemented model
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

        Products ->
            { title = "Products"
            , body =
                Food.View.page model
                    |> Component.Layout.View.simple model
            }
