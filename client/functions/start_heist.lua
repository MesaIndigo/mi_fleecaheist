local databank, blip, ped, inprogress = nil, nil, nil, false

-- set ped actions / data
local setped = function(ent)
    TaskStartScenarioInPlace(ent, 'PROP_HUMAN_SEAT_COMPUTER', 0, true)
    FreezeEntityPosition(ent, true)
    SetBlockingOfNonTemporaryEvents(ent, true)
end

-- options to load heist starter
local loadheistlocation = function()
    local data = DB.alta
    local model = lib.requestModel(RandomizeList(data.manager.model), 300)
    local coords = RandomizeList(data.manager.loc)

    ped = lib.callback('mifh:sever:spawn:ped', false, function() end, model, coords)
    setped(ped)
end

RegisterCommand('hststart', function()
    
end, false)