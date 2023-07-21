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

RegisterServerEvent('server:vault:open')
AddEventHandler('server:vault:open', function()
    TriggerClientEvent('openvault', -1)
end)

RegisterServerEvent('server:vault:close')
AddEventHandler('server:vault:close', function()
    TriggerClientEvent('closevault', -1)
end)

RegisterServerEvent('server:vault:reset')
AddEventHandler('server:vault:reset', function()
    TriggerClientEvent('resetvault', -1)
end)

RegisterServerEvent('server:vault:drill')
AddEventHandler('server:vault:drill', function()
    TriggerClientEvent('spawnthermaldrill', -1)
end)