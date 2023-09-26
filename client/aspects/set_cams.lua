-- local variables
local model_camera = 'prop_cctv_cam_04c'
local obj = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:set:cameras')
AddEventHandler('mifh:client:set:cameras', function(data)

end)

RegisterCommand('mfcameras', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:set:cameras')
    end
end, false)