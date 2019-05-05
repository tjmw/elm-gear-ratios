module GearRatios.View exposing (view)

import GearRatios.Types exposing (Model, Msg(..))
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]
