QBCore = exports['qb-core']:GetCoreObject()

Functions = {
    Open = function(jobName)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh > 0 then
            IsOpen = false
            CurrentJobName = jobName

            SetVehicleModKit(veh, 0)
            SendNUIMessage({
                action = "setupTabs",
                newTabs = Functions.GetTabData(veh)
            })

            SetNuiFocus(true, true)
            SendNUIMessage({action = "open"})
        end
    end,

    HandleOptionClick = function(tabId, optionId) end,

    PreviewClick = function(tabId, optionId) end,

    UnPreviewClick = function(tabId, optionId) end,

    GetPricingFromIdx = function(idx1, idx2)
        if idx1 and idx2 then
            local data = Config.VehicleCustomisation[idx1]
            if data then
                local price = Config.Prices[data.pricing]
                if price == nil then
                    return 0
                elseif type(price) == "table" then
                    return price[idx2]
                else
                    return price
                end
            end
        end

        return 0
    end,

    GetTabData = function(veh)
        local tabData = {}

        for i = 1, #Config.VehicleCustomisation, 1 do
            local tab = Config.VehicleCustomisation[i]
            local tabFormatted = {}

            tabFormatted.label = tab.category
            tabFormatted.name = tostring(tab.id)

            if tab.sub then
                tabFormatted.subCategories = {}

                for i2 = 1, #tab.sub, 1 do
                    local subTab = tab.sub[i2]
                    local subTabFormatted = {}

                    subTabFormatted.name = tostring(subTab.id)
                    subTabFormatted.label = subTab.name

                    table.insert(tabFormatted.subCategories, subTabFormatted)
                end
            elseif tab.options then
                tabFormatted.options = {}

                for i2 = 1, #tab.options, 1 do
                    local option = tab.options[i2]
                    local optionFormatted = {}

                    optionFormatted.name = tostring(option.id)
                    optionFormatted.label = option.name

                    table.insert(tabFormatted.options, optionFormatted)
                end
            else
                tabFormatted.options = {}

                local modNum = GetNumVehicleMods(veh, tonumber(tab.id))
                for i2 = 1, modNum, 1 do
                    local label = GetLabelText(
                                      GetModTextLabel(veh, tonumber(tab.id), i2))
                    local price = Functions.GetPricingFromIdx(i, i2)

                    if label == "NULL" then
                        table.insert(tabFormatted.options, {
                            name = tostring(i2),
                            label = tab.category .. " " .. tostring(i2),
                            price = price
                        })
                    else
                        table.insert(tabFormatted.options, {
                            name = tostring(i2),
                            label = label,
                            price = price
                        })
                    end
                end
            end

            if #tabFormatted.options >= 1 then
                table.insert(tabData, tabFormatted)
            end
        end

        return tabData
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
            if PlayerData and PlayerData.job and PlayerData.job.name ==
                zoneJobName then
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

