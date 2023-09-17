--local chosenbank = FH.chosenbank
local hacked = false
local failed = false
local vaultopen = false
local vaultmoving = false
local inside, outside


local function hackpad()
    local hackingdict = lib.requestAnimDict('anim@heists@humane_labs@emp@hack_door', 100)
    local hackingset = lib.requestAnimSet('hack_loop', 100)
    if not hacked then
        if lib.progressBar({
            duration = 10000,
            label = 'Hacking terminal',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = hackingdict,
                clip = hackingset,
            },
            prop = {
                bone = 28422,
                model = 'prop_police_phone',
                pos = vec3(0.0, 0.0, 0.0301),
                rot = vec3(0.0, 0.0, 0.0)
            },
        }) then hacked = true
            Wait(20000)
            vaultmoving = false
        else 
            hacked = false
            failed = false 
        end
    end
end

local function spawnsecpadzone1(choice)
    local coords = choice.secsystemoutside.loc
    local head = choice.secsystemoutside.head
    local size = choice.secsystemoutside.size
    inside = exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        rotation = head,
        debug = Debug,
        options = {
            {
                name = 'secpad_hack1',
                icon = 'fa-solid fa-laptop-file',
                label = 'Hack Securitypad',
                items = BK.banks.hack,
                canInteract = function(_, distance)
                    return distance < 2.0 and not hacked and not failed
                end,
                onSelect = function()
                    hackpad()
                end
            },
            {
                name = 'secpad_card1',
                icon = 'fa-solid fa-id-card-clip',
                label = 'Use keycard',
                items = BK.banks.key,
                canInteract = function(_, distance)
                    return distance < 2.0 and not hacked
                end,
                onSelect = function()
                    vaultmoving = true
                    hacked = true
                    TriggerServerEvent('server:vault:open', choice)
                    Wait(20000)
                    vaultmoving = false
                    vaultopen = true
                end
            },

            {
                name = 'secpad_vltopen1',
                icon = 'fa-solid fa-door-open',
                label = 'Open Vault',
                canInteract = function(_, distance)
                    return distance < 2.0 and hacked and not vaultmoving and not vaultopen
                end,
                onSelect = function()
                    vaultmoving = true
                    TriggerServerEvent('server:vault:open', choice)
                    UT.mfhnotify('fleecadoorop', 'Vault Opening', 'Stand clear of the door')
                    Wait(20000)
                    vaultmoving = false
                    vaultopen = true
                end
            },
            {
                name = 'secpad_vltclose1',
                icon = 'fa-solid fa-door-closed',
                label = 'Close Vault',
                canInteract = function(_, distance)
                    return distance < 2.0 and hacked and not vaultmoving and vaultopen
                end,
                onSelect = function()
                    vaultmoving = true
                    TriggerServerEvent('server:vault:close', choice)
                    UT.mfhnotify('fleecadoorcls', 'Vault Closing', 'Stand clear of the door')
                    Wait(20000)
                    vaultmoving = false
                    vaultopen = false
                end
            },
        }
    })
end

local function spawnsecpadzone2(choice)
    local coords = choice.secsysteminside.loc
    local head = choice.secsysteminside.head
    local size = choice.secsysteminside.size
    outside = exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        rotation = head,
        debug = Debug,
        options = {
            {
                name = 'secpad_vltopen2',
                icon = 'fa-solid fa-door-open',
                label = 'Open Vault',
                canInteract = function(_, distance)
                    return distance < 2.0 and hacked and not vaultmoving and not vaultopen
                end,
                onSelect = function()
                    vaultmoving = true
                    TriggerServerEvent('server:vault:open', choice)
                    UT.mfhnotify('fleecadoorop', 'Vault Opening', 'Stand clear of the door')
                    Wait(20000)
                    vaultmoving = false
                    vaultopen = true
                end
            },
            {
                name = 'secpad_vltclose2',
                icon = 'fa-solid fa-door-closed',
                label = 'Close Vault',
                canInteract = function(_, distance)
                    return distance < 2.0 and hacked and not vaultmoving and vaultopen
                end,
                onSelect = function()
                    vaultmoving = true
                    TriggerServerEvent('server:vault:close', choice)
                    UT.mfhnotify('fleecadoorcls', 'Vault Closing', 'Stand clear of the door')
                    Wait(20000)
                    vaultmoving = false
                    vaultopen = false
                end
            },
        }
    })
end

AddEventHandler('mifh:start:security', function(choice)
    spawnsecpadzone1(choice)
    spawnsecpadzone2(choice)
end)

AddEventHandler('mifh:reset:security', function(choice)
    choice = choice
    exports.ox_target:removeZone(inside)
    exports.ox_target:removeZone(outside)
    hacked = false
    failed = false
    vaultopen = false
    vaultmoving = false
end)