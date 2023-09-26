-- local variables
local ped = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:run:backup')
AddEventHandler('mifh:client:run:backup', function(data)

end)

RegisterCommand('mfbackup', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:run:backup')
    end
end, false)