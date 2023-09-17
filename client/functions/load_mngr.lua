local heistactive = true
local manager
local mngrped = {
    spawned = false,
    ped = nil
}
local function spawnmanager(choice)
    -- varables for ped
    if not CG.options.manager then 
        UT.mfhnotify('fleecamanageroff', 'Manager on Vataction', 'One less thing to worry about right?')
    else
        if heistactive then
            local mngrloc = choice.manager.loc
            local mngr = choice.manager
            local loc = mngrloc[math.random(1, #mngrloc)]
            mngrloc = loc
    
            -- spawn ped
            local model = lib.requestmodel(joaat(mngr.ped))
            local coords = mngrloc
            local anim = mngr.anim
            
            if mngrped.spawned then return 
            else
                manager = CreatePed(1, model, coords.x, coords.y, coords.z-1, coords.w, false, false)
                TaskStartScenarioInPlace(manager, anim, 0, true)
                FreezeEntityPosition(manager, false)
                SetEntityInvincible(manager, false)
                SetBlockingOfNonTemporaryEvents(manager, false)
                mngr.ped = manager
                mngrped.spawned = true
    
                local ped_options = {
                    {
                        name = 'mngrdead',
                        label = 'Retrieve recurity card',
                        icon = 'fa-solid fa-id-card-clip',
                        canInteract = function(_, distance)
                            return distance < 2.5 and IsEntityDead(manager)
                        end,
                        onSelect = function()
                            lib.callback('mifh:give:securitycard', false, function(source)
                                Wait(10)
                                UT.mfhnotify(CG.notify.title, CG.notify.title, CG.notify.description)
                                exports.ox_target:removeLocalEntity(mngr.ped, { 'mngrdead' })
                            end)
                        end
                    },
                }
                exports.ox_target:addLocalEntity(mngr.ped, ped_options)
            end
        end
    end
end

AddEventHandler('mifh:start:mngr', function(choice)
    choice = choice
    spawnmanager(choice)
end)

AddEventHandler('mifh:reset:mngr', function(choice)
    choice = choice
    UT.mfhremove_ped(manager)
    mngrped.spawned = false
end)