local active, uni = true, nil

local rndmz_anim = function(model)
    local list = {
        [1] = {'WORLD_HUMAN_AA_COFFEE'}, [2] = {'WORLD_HUMAN_AA_SMOKE'},
        [3] = {'WORLD_HUMAN_STAND_IMPATIENT_CLUBHOUSE'}, [4] = {'WORLD_HUMAN_TOURIST_MOBILE'},
    }
    model = list[math.random(1, #list)]
    return model
end

RegisterNetEvent('mifh:client:load:mngr')
AddEventHandler('mifh:client:load:mngr', function(bank)
    if not active then return end
        if active then
        local model, anim = lib.requestModel(RandomizeList(data.manager.model)), lib.requestModel(rndmz_anim)
        uni = CreatePed(1, model, bank.loc.x, bank.loc.y, bank.loc.z-1, bank.loc.w, true, false)
        TaskStartScenarioInPlace(uni, anim, 0, true)

        local mngr_ops = {
            {
                -- bribe manager
                name = 'sec_getjob',
                label = Locale('mngr_card_bribe'),
                icon = 'fa-solid fa-user-clock',
                canInteract = function(_, distance)
                    return distance < 1.5 and not IsEntityDead(uni)
                end,
                onSelect = function()
                    -- doshit
                end
            },
            {
                -- threaten manager
                name = 'sec_getjob',
                label = Locale('mngr_card_take'),
                icon = 'fa-solid fa-user-clock',
                canInteract = function(_, distance)
                    return distance < 1.5 and not IsEntityDead(uni)
                end,
                onSelect = function()
                    -- doshit
                end
            },
            {
                -- killed manager
                name = 'sec_getjob',
                label = Locale('mngr_card_kill'),
                icon = 'fa-solid fa-user-clock',
                canInteract = function(_, distance)
                    return distance < 1.5 and IsEntityDead(uni)
                end,
                onSelect = function()
                    -- doshit
                end
            },
        }
        exports.ox_target:addLocalEntity(uni, mngr_ops)
    end
end)