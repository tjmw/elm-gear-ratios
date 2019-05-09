module GearRatios.Update exposing (init, subscriptions, update)

import GearRatios.GearRatio exposing (Ring(..), defaultGearRatio, ringDefault, ringMax, ringMin, updateRingSize)
import GearRatios.Types exposing (Model, Msg(..))
import SingleSlider as Slider


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SliderMsg sliderMsg ->
            handleSliderMsg sliderMsg model

        _ ->
            ( model, Cmd.none )


handleSliderMsg : Slider.Msg -> Model -> ( Model, Cmd Msg )
handleSliderMsg msg model =
    let
        ( newSlider, cmd, updateResults ) =
            Slider.update msg model.ringSlider

        newModel =
            { model
                | ringSlider = newSlider
                , gearRatio = updateRingSize model.gearRatio (Ring <| round newSlider.value)
            }

        newCmd =
            if updateResults then
                Cmd.batch [ Cmd.map SliderMsg cmd, Cmd.none ]

            else
                Cmd.none
    in
    ( newModel, newCmd )


init : ( Model, Cmd Msg )
init =
    let
        initialSliderModel =
            Slider.defaultModel
    in
    ( { gearRatio = defaultGearRatio
      , ringSlider =
            { initialSliderModel
                | min = ringMin
                , max = ringMax
                , step = 1
                , value = ringDefault
            }
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions { ringSlider } =
    Sub.batch
        [ Sub.map SliderMsg <|
            Slider.subscriptions ringSlider
        ]
