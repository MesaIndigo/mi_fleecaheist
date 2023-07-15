local debug = CG.debug
local Inventory = exports.ox_inventory
local door 

lib.callback.register('mifh:give:securitycard', function(source)
    Inventory:AddItem(source, BK.banks.key, 1)
end)

lib.callback.register('mifh:give:moneybag', function(source)
    Inventory:AddItem(source, BK.banks.money, 1)
end)

lib.callback.register('mifh:remove:drill', function(source)
    Inventory:RemoveItem(source, BK.banks.drill, 1)
end)

lib.callback.register('mifh:remove:key', function(source)
    Inventory:RemoveItem(source, BK.banks.key, 1)
end)

RegisterServerEvent('mifh:vault:open')
AddEventHandler('mifh:vault:open', function(choice, netid)
    local vault = choice.vaultdoor
    local count = 0
    SetEntityHeading(netid, vault.head)
    repeat
        local rotation = GetEntityHeading(netid) - 0.05
        SetEntityHeading(netid, rotation)
        count = count + 1
        Wait(1)
    until count == 2000
    FreezeEntityPosition(netid, true)
end)
