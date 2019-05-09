module GearRatios.Types exposing (Model, Msg(..))

import GearRatios.GearRatio exposing (GearRatio)


type alias Model =
    { gearRatio : GearRatio
    }


type Msg
    = NoOp
