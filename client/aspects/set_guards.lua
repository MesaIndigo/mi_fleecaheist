-- local variables
local ped = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:set:guards')
AddEventHandler('mifh:client:set:guards', function(data)

end)

RegisterCommand('mfguards', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:set:guards')
    end
end, false)