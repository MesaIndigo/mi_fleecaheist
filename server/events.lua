----------------------------------------
-- method to spawn guards
RegisterNetEvent('mifh:server:set:guards')
AddEventHandler('mifh:server:set:guards', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:guards', -1)
end)

----------------------------------------
-- method to spawn manager
RegisterNetEvent('mifh:server:set:manager')
AddEventHandler('mifh:server:set:manager', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:manager', -1)
end)

----------------------------------------
-- method to spawn cameras
RegisterNetEvent('mifh:server:set:cameras')
AddEventHandler('mifh:server:set:cameras', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:cameras', -1)
end)

----------------------------------------
-- method to set up security system
RegisterNetEvent('mifh:server:set:security')
AddEventHandler('mifh:server:set:security', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:security', -1)
end)

----------------------------------------
-- method to set up vault system
RegisterNetEvent('mifh:server:set:vault')
AddEventHandler('mifh:server:set:vault', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:vault', -1)
end)

----------------------------------------
-- method to set up cash trollys
RegisterNetEvent('mifh:server:set:trollys')
AddEventHandler('mifh:server:set:trollys', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:set:trollys', -1)
end)

----------------------------------------
-- method to spawn backup
RegisterNetEvent('mifh:server:run:backup')
AddEventHandler('mifh:server:run:backup', function()
    -- call event to client side
    TriggerClientEvent('mifh:client:run:backup', -1)
end)
