local model_drill, vault_hash = 'k4mb1_prop_thermaldrill', 2121050683
-- local variables
local ped = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:set:vault')
AddEventHandler('mifh:client:set:vault', function(data)

end)

RegisterCommand('mfvault', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:set:vault')
    end
end, false)