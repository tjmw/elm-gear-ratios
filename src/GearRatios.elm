module GearRatios exposing (main)

import Browser
import GearRatios.Types exposing (Model, Msg)
import GearRatios.Update as Update
import GearRatios.View as View


main : Program () Model Msg
main =
    Browser.element
        { view = View.view
        , init = \_ -> Update.init
        , update = Update.update
        , subscriptions = Update.subscriptions
        }
