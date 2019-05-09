module GearRatios.GearRatio exposing (Cog(..), GearRatio(..), Ring(..), defaultGearRatio, getCogValue, getRatioValue, getRingValue, ringDefault, ringMax, ringMin, updateRingSize)


type Cog
    = Cog Int


type Ring
    = Ring Int


type GearRatio
    = GearRatio Ring Cog


ringMin =
    40


ringMax =
    53


ringDefault =
    50


defaultGearRatio =
    GearRatio (Ring ringDefault) (Cog 16)


getRingValue : GearRatio -> Int
getRingValue (GearRatio (Ring value) (Cog _)) =
    value


getCogValue : GearRatio -> Int
getCogValue (GearRatio (Ring _) (Cog value)) =
    value


getRatioValue : GearRatio -> Float
getRatioValue (GearRatio (Ring ringValue) (Cog cogValue)) =
    toFloat ringValue / toFloat cogValue


updateRingSize : GearRatio -> Ring -> GearRatio
updateRingSize (GearRatio _ cog) ring =
    GearRatio ring cog
