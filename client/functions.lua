QBCore = exports['qb-core']:GetCoreObject()

Functions = {
    Open = function(jobName)
        IsOpen = false
        CurrentJobName = jobName

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open"
        })
    end,

    Close = function()
        IsOpen = false
        SetNuiFocus(false, false)
    end,

    ErrorPrint = function(text)
        while true do
            Wait(1000)
            print(text)
        end
    end,

    AwaitResource = function(resourceName)
        local proximityState = GetResourceState(resourceName)
        if proximityState ~= "missing" then
            while proximityState ~= "started" do
                Wait(2500)
                proximityState = GetResourceState(resourceName)
            end

            return true
        else
            return false
        end
    end,

    StartOpenListener = function()
        while isInZone do
            if PlayerData and PlayerData.job and PlayerData.job.name == zoneJobName then
                if IsControlJustReleased(0, Config.Polyzones.KeyNumber) then
                    Functions.Open(zoneJobName)
                end
            else
                break
            end
            Citizen.Wait(0)
        end
    end
}
