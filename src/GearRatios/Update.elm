module GearRatios.Update exposing (init, update)

import GearRatios.GearRatio exposing (defaultGearRatio)
import GearRatios.Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( { gearRatio = defaultGearRatio
      }
    , Cmd.none
    )
