module GearRatios.View exposing (view)

import GearRatios.GearRatio exposing (GearRatio, getCogValue, getRatioValue, getRingValue)
import GearRatios.Types exposing (Model, Msg(..))
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Round exposing (round)
import SingleSlider as Slider
import String exposing (fromFloat, fromInt)


view : Model -> Html Msg
view { cogSlider, ringSlider, gearRatio } =
    div []
        [ renderRingSlider ringSlider
        , renderCogSlider cogSlider
        , renderGearRatio gearRatio
        ]


renderRingSlider : Slider.Model -> Html Msg
renderRingSlider slider =
    div []
        [ text "Ring Size: "
        , Slider.view slider |> Html.map RingSliderMsg
        ]


renderCogSlider : Slider.Model -> Html Msg
renderCogSlider slider =
    div []
        [ text "Cog Size: "
        , Slider.view slider |> Html.map CogSliderMsg
        ]


renderGearRatio : GearRatio -> Html Msg
renderGearRatio gearRatio =
    div []
        [ div [] [ text "Ring Size: ", text <| fromInt <| getRingValue gearRatio ]
        , div [] [ text "Cog Size: ", text <| fromInt <| getCogValue gearRatio ]
        , div [] [ text "Ratio: ", text <| round 2 <| getRatioValue gearRatio ]
        ]
