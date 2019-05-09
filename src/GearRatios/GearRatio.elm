module GearRatios.GearRatio exposing (Cog(..), GearRatio(..), Ring(..), defaultGearRatio, getCogValue, getRatioValue, getRingValue)


type Cog
    = Cog Int


type Ring
    = Ring Int


type GearRatio
    = GearRatio Ring Cog


defaultGearRatio =
    GearRatio (Ring 50) (Cog 16)


getRingValue : GearRatio -> Int
getRingValue (GearRatio (Ring value) (Cog _)) =
    value


getCogValue : GearRatio -> Int
getCogValue (GearRatio (Ring _) (Cog value)) =
    value


getRatioValue : GearRatio -> Float
getRatioValue (GearRatio (Ring ringValue) (Cog cogValue)) =
    toFloat ringValue / toFloat cogValue
