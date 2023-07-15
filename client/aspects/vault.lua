local debug = CG.debug
--local chosenbank = FH.chosenbank
local door = nil
local drilled = false
local vaultopen = false
local drillt = {
    spawned = false,
    obj = nil
}
local vaultset

local function spawnvaultzone(choice)
    local coords = choice.vaultdoor.loc
    local head = choice.vaultdoor.head
    local size = choice.vaultdoor.size
    vaultset = exports.ox_target:addBoxZone({
        coords = coords,
        size = size,
        rotation = head,
        debug = debug,
        options = {
            {
                name = 'vault_thermal',
                icon = 'fa-solid fa-temperature-high',
                items = BK.banks.drill,
                label = 'Use thermal drill',
                canInteract = function(_, distance)
                    return distance < 2.0 and not vaultopen and not drilled
                end,
                onSelect = function()
                    TriggerEvent('spawnthermaldrill', choice)
                    UT.mfhnotify(CG.notify.title, CG.notify.title, CG.notify.description)
                    if lib.progressBar({
                        duration = 5000,
                        label = 'Setting up Drill',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                        },
                        anim = {
                            dict = 'mini@repair',
                            clip = 'fixing_a_player'
                        },
                    })
                    then 
                        lib.callback('mifh:remove:drill', false, function(source) end)
                        drilled = true
                    end
                    Wait(BK.banks.drilltime * 60000)
                    DeleteEntity(drillt.obj)
                    drillt.obj = nil
                    drillt.spawned = false
                    vaultopen = true
                    TriggerServerEvent('mifh:vault:open', choice)
                end
            },
        }
    })
end

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

RegisterNetEvent('mifh:vault:set')
AddEventHandler('mifh:vault:set', function(choice, netid)
    local vault = choice.vaultdoor
    
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
    spawnvaultzone(choice)
end)

AddEventHandler('mifh:reset:vault', function(choice)
    choice = choice
    exports.ox_target:removeZone(vaultset)
    DeleteEntity(drillt.obj)
    TriggerEvent('closevault', choice)
    drillt.obj = nil
    drillt.spawned = false
    vaultopen = false
    drilled = false
end)