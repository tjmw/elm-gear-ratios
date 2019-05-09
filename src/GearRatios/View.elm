module GearRatios.View exposing (view)

import GearRatios.GearRatio exposing (GearRatio, getCogValue, getRatioValue, getRingValue)
import GearRatios.Types exposing (Model, Msg(..))
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import SingleSlider as Slider
import String exposing (fromFloat, fromInt)


view : Model -> Html Msg
view { ringSlider, gearRatio } =
    div []
        [ renderSlider ringSlider
        , renderGearRatio
            gearRatio
        ]


renderSlider : Slider.Model -> Html Msg
renderSlider slider =
    div []
        [ text "Ring Size: "
        , Slider.view slider |> Html.map SliderMsg
        ]


renderGearRatio : GearRatio -> Html Msg
renderGearRatio gearRatio =
    div []
        [ div [] [ text "Ring Size: ", text <| fromInt <| getRingValue gearRatio ]
        , div [] [ text "Cog Size: ", text <| fromInt <| getCogValue gearRatio ]
        , div [] [ text "Ratio: ", text <| fromFloat <| getRatioValue gearRatio ]
        ]
