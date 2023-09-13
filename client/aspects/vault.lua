--local chosenbank = FH.chosenbank
local door = nil
local drilled = false
local vaultopen = false
local toolt = nil
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
        debug = Debug,
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
                    if lib.progressBar({
                        duration = 5000,
                        label = 'Setting up Drill',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
                            dict = 'mini@repair',
                            clip = 'fixing_a_player'
                        },
                    })
                    then
                        TriggerServerEvent('server:vault:drill', choice)
                        UT.mfhnotify(CG.notify.title, CG.notify.title, CG.notify.description)
                        lib.callback('mifh:remove:drill', false, function(source) end)
                        drilled = true
                    end
                    Citizen.Wait(BK.banks.drilltime * 60000)
                    TriggerServerEvent('server:drill:remove', choice)
                    vaultopen = true
                    TriggerServerEvent('server:vault:open', choice)
                    UT.mfhnotify('fleecadoorop', 'Vault Opening', 'Stand clear of the door')
                end
            },
        }
    })
end



RegisterNetEvent('spawnthermaldrill')
AddEventHandler('spawnthermaldrill', function(choice)
    local thermdrill = lib.requestModel('k4mb1_prop_thermaldrill')
    local coords = choice.vaultdoor.drill
    local head = choice.vaultdoor.drillhead
    if drillt.spawned then return end

    toolt = CreateObject(
        thermdrill, coords.x-0.34, coords.y, coords.z-0.45, 
        true, true, true)
    SetEntityHeading(toolt, head)
    FreezeEntityPosition(toolt, true)

    local dict, anim = 'scr_gr_bunk', 'scr_gr_bunk_lathe_metal_shards'
    if not HasNamedPtfxAssetLoaded(dict) then
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Wait(1)
        end
    end

    UseParticleFxAssetNextCall(dict)
    local shinyshit = StartParticleFxLoopedAtCoord(anim,
    coords.x+0.2, coords.y-0.4, coords.z-0.25,
    0.0, 0.0, 0.0, 3.0, false, false, false, false)
    Wait(BK.banks.drilltime * 60000)
    StopParticleFxLooped(shinyshit, true)

    --drillt.obj = toolt
    drillt.spawned = true
end)

RegisterNetEvent('deletethermaldrill')
AddEventHandler('deletethermaldrill', function(choice)
    DeleteEntity(toolt)
    drillt.obj = nil
    drillt.spawned = false
end)

RegisterNetEvent('openvault')
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

RegisterNetEvent('closevault')
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

RegisterNetEvent('resetvault')
AddEventHandler('resetvault', function(choice)
    choice = choice
    exports.ox_target:removeZone(vaultset)
    DeleteEntity(drillt.obj)
    TriggerEvent('closevault', choice)
    drillt.obj = nil
    drillt.spawned = false
    vaultopen = false
    drilled = false
end)