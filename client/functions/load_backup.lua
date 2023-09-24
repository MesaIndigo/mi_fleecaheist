-- file for back up call
local ped, veh, arrived = nil, nil, false
local spawn = vec4(271.981, 950.258, 211.015, 98.025)
local dest = vec4(-136.405, 966.516, 235.845, 339.907)

local function onEnter(ped)
    print('entered zone', ped)
end

RegisterCommand('callbackup', function()
    local chase = true
    if chase then
        local char = lib.requestModel(SO.office.job.model, 300)
        ped = lib.callback('mifh:sever:spawn:ped', false, function() end, char, spawn)

        local model = SO.office.spn.veh1.model
        
        veh = lib.callback('misj:sever:spawn:bkpvehicle', false, function() end, model, spawn)
        SetEntityAsMissionEntity(veh, true, true)

        SetPedIntoVehicle(ped, veh, -1)
        Citizen.Wait(1000)
        TaskVehicleDriveToCoord(ped, veh, dest.x, dest.y, dest.z, 30.0, 1.0, model, 28, 2.0, 4 )

        local sphere = lib.zones.sphere({
            coords = vec3(dest.x, dest.y, dest.z),
            radius = 10,
            debug = true,
            onEnter = onEnter,
        })

    end
end, false)

RegisterCommand('call1', function()
    local chase = true
    if chase then
        local char = lib.requestModel(SO.office.job.model, 300)
        local model = 'stockade'
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end

        TriggerServerEvent('mifh:sever:spawn:backup', veh, model, char, spawn)

        Citizen.Wait(1000)
        TaskVehicleDriveToCoord(ped, veh, dest.x, dest.y, dest.z, 30.0, 1.0, model, 28, 2.0, 4 )

        local sphere = lib.zones.sphere({
            coords = vec3(dest.x, dest.y, dest.z),
            radius = 10,
            debug = true,
            onEnter = onEnter,
        })

    end
end, false)