-- local variables
local ped = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:set:manager')
AddEventHandler('mifh:client:set:manager', function(data)

end)

RegisterCommand('mfmanager', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:set:manager')
    end
end, false)