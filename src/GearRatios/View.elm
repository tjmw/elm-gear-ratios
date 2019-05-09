module GearRatios.View exposing (view)

import GearRatios.GearRatio exposing (GearRatio, getCogValue, getRatioValue, getRingValue)
import GearRatios.Types exposing (Model, Msg(..))
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import String exposing (fromFloat, fromInt)


view : Model -> Html Msg
view { gearRatio } =
    div []
        [ renderGearRatio
            gearRatio
        ]


renderGearRatio : GearRatio -> Html Msg
renderGearRatio gearRatio =
    div []
        [ div [] [ text <| fromInt <| getRingValue gearRatio ]
        , div [] [ text <| fromInt <| getCogValue gearRatio ]
        , div [] [ text <| fromFloat <| getRatioValue gearRatio ]
        ]
