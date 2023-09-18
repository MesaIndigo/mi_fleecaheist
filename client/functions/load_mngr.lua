local active, uni = true, nil

local rndmz_mngr = function(model)
    local list = {
        [1] = {'a_f_y_business_01'}, [2] = {'a_f_y_business_04'},
        [3] = {'a_m_y_business_02'}, [4] = {'a_m_y_business_01'},
    }
    model = list[math.random(1, #list)]
    return model
end

local rndmz_anim = function(model)
    local list = {
        [1] = {'WORLD_HUMAN_AA_COFFEE'}, [2] = {'WORLD_HUMAN_AA_SMOKE'},
        [3] = {'WORLD_HUMAN_STAND_IMPATIENT_CLUBHOUSE'}, [4] = {'WORLD_HUMAN_TOURIST_MOBILE'},
    }
    model = list[math.random(1, #list)]
    return model
end

local load_mngr = function(loc)
    if not BK.options.manager then
        Notify('mngr_nonactive', Locale('mngr_false1'), Locale('mngr_false2'))
    else
        if not active then return end
        if active then
            local model, anim = lib.requestModel(rndmz_mngr), lib.requestModel(rndmz_anim)
            uni = CreatePed(1, model, loc.x, loc.y, loc.z-1, loc.w, true, false)
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
    end
end