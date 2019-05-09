module GearRatios.Types exposing (Model, Msg(..))

import GearRatios.GearRatio exposing (GearRatio)
import SingleSlider as Slider exposing (..)


type alias Model =
    { gearRatio : GearRatio
    , ringSlider : Slider.Model
    , cogSlider : Slider.Model
    }


type Msg
    = NoOp
    | CogSliderMsg Slider.Msg
    | RingSliderMsg Slider.Msg
