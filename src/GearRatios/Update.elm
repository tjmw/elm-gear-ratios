module GearRatios.Update exposing (init, subscriptions, update)

import GearRatios.GearRatio
    exposing
        ( Cog(..)
        , Ring(..)
        , cogDefault
        , cogMax
        , cogMin
        , defaultGearRatio
        , ringDefault
        , ringMax
        , ringMin
        , setCogSize
        , setRingSize
        )
import GearRatios.Types exposing (Model, Msg(..))
import SingleSlider as Slider


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RingSliderMsg sliderMsg ->
            handleRingSliderMsg sliderMsg model

        CogSliderMsg sliderMsg ->
            handleCogSliderMsg sliderMsg model

        _ ->
            ( model, Cmd.none )


handleRingSliderMsg : Slider.Msg -> Model -> ( Model, Cmd Msg )
handleRingSliderMsg msg model =
    let
        ( newSlider, cmd, updateResults ) =
            Slider.update msg model.ringSlider

        newModel =
            { model
                | ringSlider = newSlider
                , gearRatio = setRingSize model.gearRatio (Ring <| round newSlider.value)
            }

        newCmd =
            if updateResults then
                Cmd.batch [ Cmd.map RingSliderMsg cmd, Cmd.none ]

            else
                Cmd.none
    in
    ( newModel, newCmd )


handleCogSliderMsg : Slider.Msg -> Model -> ( Model, Cmd Msg )
handleCogSliderMsg msg model =
    let
        ( newSlider, cmd, updateResults ) =
            Slider.update msg model.cogSlider

        newModel =
            { model
                | cogSlider = newSlider
                , gearRatio = setCogSize model.gearRatio (Cog <| round newSlider.value)
            }

        newCmd =
            if updateResults then
                Cmd.batch [ Cmd.map CogSliderMsg cmd, Cmd.none ]

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
      , cogSlider =
            { initialSliderModel
                | min = cogMin
                , max = cogMax
                , step = 1
                , value = cogDefault
            }
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions { cogSlider, ringSlider } =
    Sub.batch
        [ Sub.map RingSliderMsg <| Slider.subscriptions ringSlider
        , Sub.map CogSliderMsg <| Slider.subscriptions cogSlider
        ]
