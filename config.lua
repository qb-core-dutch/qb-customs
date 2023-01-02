Config = Config or {}
Config.Target = {}
Config.Proximity = {}
Config.Polyzones = {}

-- normal, target or proximity
-- normal: Uses qb-core draw texts with polyzones
-- target: Uses targetting (Config.TargetScript)
-- proximity: Uses zerio-proximityprompt
Config.OpenType = "normal"

-- Only for Config.OpenType "target"
-- qb-target or ox_target
Config.Target.Script = "ox_target"
Config.Target.UsageDistance = 2.5
Config.Target.Icon = "fa-solid fa-wrench"
Config.Target.Size = {2,2,2} -- 2 numbers if qb-target, 3 numbers if ox_target

-- Only for Config.OpenType "proximity"
Config.Proximity.DrawDistance = 3
Config.Proximity.UsageDistance = 1.5
Config.Proximity.Key = "E"
Config.Proximity.HoldTime = 1000

-- Only for Config.OpenType "normal"
Config.Polyzones.Size = {2,2}
Config.Polyzones.KeyLabel = "E"
Config.Polyzones.KeyNumber = 38 -- https://docs.fivem.net/docs/game-references/controls/

Config.Positions = {
    ["mechanic"] = {
        pos = vector4(-338.8177, -135.7519, 39.0026, 82.3405)
    }
}
