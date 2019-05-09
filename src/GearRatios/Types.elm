module GearRatios.Types exposing (Model, Msg(..))

import GearRatios.GearRatio exposing (GearRatio)
import SingleSlider as Slider exposing (..)


type alias Model =
    { gearRatio : GearRatio
    , ringSlider : Slider.Model
    }


type Msg
    = NoOp
    | SliderMsg Slider.Msg
