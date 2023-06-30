local debug = CG.debug
--local chosenbank = FH.chosenbank
local door = nil
local drilled = false
local vaultopen = false
local drille = {
    spawned = false,
    obj = nil
}
local drillt = {
    spawned = false,
    obj = nil
}

local function spawnvaultzone(choice)
    local coords = choice.vaultdoor.loc
    local head = choice.vaultdoor.head
    local size = choice.vaultdoor.size
    exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        rotation = head,
        debug = debug,
        options = {
            {
                name = 'vault_thermal',
                icon = 'fa-solid fa-temperature-high',
                label = 'Use thermal drill',
                canInteract = function(_, distance)
                    return distance < 2.0 and not vaultopen and not drilled
                end,
                onSelect = function()
                    TriggerEvent('spawnthermaldrill', choice)
                    drilled = true
                    Wait(5000)
                    DeleteEntity(drillt.obj)
                    drillt.obj = nil
                    drillt.spawned = false
                    vaultopen = true
                    TriggerEvent('openvault', choice)
                end
            },
            {
                name = 'vault_electric',
                icon = 'fa-solid fa-bolt',
                label = 'Use electric drill',
                canInteract = function(_, distance)
                    return distance < 2.0 and not vaultopen and not drilled
                end,
                onSelect = function()
                    TriggerEvent('spawnelectricdrill', choice)
                    drilled = true
                    Wait(5000)
                    DeleteEntity(drille.obj)
                    drille.obj = nil
                    drille.spawned = false
                    vaultopen = true
                    TriggerEvent('openvault', choice)
                end
            },
        }
    })
end

AddEventHandler('spawnelectricdrill', function(choice)
    local elecdrill = lib.requestModel(joaat('k4mb1_prop_drill2'))
    -- for testing, changed to alta [BK.banks.chosenbank.cameras]
    local coords = choice.vaultdoor.drill
    local head = choice.vaultdoor.drillhead
    if drille.spawned then return end

    local toole = CreateObject(
        elecdrill, coords.x, coords.y, coords.z, 
        true, true, true)
    SetEntityHeading(toole, head)
    FreezeEntityPosition(toole, true)

    drille.obj = toole
    drille.spawned = true
end)

AddEventHandler('spawnthermaldrill', function(choice)
    local thermdrill = lib.requestModel(joaat('k4mb1_prop_thermaldrill'))
    -- for testing, changed to alta [BK.banks.chosenbank.cameras]
    local coords = choice.vaultdoor.drill
    local head = choice.vaultdoor.drillhead
    if drillt.spawned then return end

    local toolt = CreateObject(
        thermdrill, coords.x-0.34, coords.y, coords.z-0.4, 
        true, true, true)
    SetEntityHeading(toolt, head)
    FreezeEntityPosition(toolt, true)

    drillt.obj = toolt
    drillt.spawned = true
end)

AddEventHandler('openvault', function(choice)
    local vault = choice.vaultdoor
    door = vault.loc
    local obj = GetClosestObjectOfType(door.x, door.y, door.z, 10, vault.hash, false, false, false)
    local count = 0
    SetEntityHeading(obj, vault.head)
    repeat
        local rotation = GetEntityHeading(obj) - 0.05
        SetEntityHeading(obj, rotation)
        count = count + 1
        Wait(1)
    until count == 2000
    FreezeEntityPosition(obj, true)
end)

AddEventHandler('closevault', function(choice)
    local vault = choice.vaultdoor
    door = vault.loc
    local obj = GetClosestObjectOfType(door.x, door.y, door.z, 10, vault.hash, false, false, false)
    local count = 0
    SetEntityHeading(obj, vault.headend)
    repeat
        local rotation = GetEntityHeading(obj) + 0.05
        SetEntityHeading(obj, rotation)
        count = count + 1
        Wait(1)
    until count == 2000
    FreezeEntityPosition(obj, true)
end)

AddEventHandler('mifh:start:vault', function(choice)
    choice = choice
    spawnvaultzone(choice)
end)

RegisterCommand('bvlt', function()
    spawnvaultzone()
end, false)

RegisterCommand('bdoor1', function()
    TriggerEvent('openvault')
    Wait(1)
end, false)

RegisterCommand('bdoor2', function()
    TriggerEvent('closevault')
    Wait(1)
end, false)