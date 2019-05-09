module GearRatios.GearRatio exposing
    ( Cog(..)
    , GearRatio(..)
    , Ring(..)
    , cogDefault
    , cogMax
    , cogMin
    , defaultGearRatio
    , getCogValue
    , getRatioValue
    , getRingValue
    , ringDefault
    , ringMax
    , ringMin
    , setCogSize
    , setRingSize
    )


type Cog
    = Cog Int


type Ring
    = Ring Int


type GearRatio
    = GearRatio Ring Cog


cogMin =
    11


cogMax =
    36


cogDefault =
    16


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


setRingSize : GearRatio -> Ring -> GearRatio
setRingSize (GearRatio _ cog) ring =
    GearRatio ring cog


setCogSize : GearRatio -> Cog -> GearRatio
setCogSize (GearRatio ring _) cog =
    GearRatio ring cog
