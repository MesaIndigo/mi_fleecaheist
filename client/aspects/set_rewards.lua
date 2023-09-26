local model_full, model_empty = 'hei_prop_hei_cash_trolly_01', 'hei_prop_hei_cash_trolly_03'
-- local variables
local ped = nil

-- local function to set model when randomized
local setmodel = function(model)

end

-- call event
RegisterNetEvent('mifh:client:set:rewards')
AddEventHandler('mifh:client:set:rewards', function(data)

end)

RegisterCommand('mfrewards', function()
    if not Debug then
        print('debug: false | set debug to true to test this command')
    else
        TriggerServerEvent('mifh:server:set:rewards')
    end
end, false)