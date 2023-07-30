-- trolley variables
local trolly1, trolly2, trolly3
local trollys1 = {
    spawned = false,
    obj = nil
}
local trollys2 = {
    spawned = false,
    obj = nil
}
local trollys3 = {
    spawned = false,
    obj = nil
}

local function spawntrolly1(choice)
    local loc = choice.money.loc
    local model = lib.requestModel(joaat('hei_prop_hei_cash_trolly_01'))
    -- for testing, changed to alta [BK.banks.chosenbank.cameracontrol]
    local coords = loc[1]
    if trollys1.spawned then return end

    trolly1 = CreateObject(
        model, coords.x, coords.y, coords.z-1, 
        true, true, true)
    SetEntityHeading(trolly1, coords.w)
    FreezeEntityPosition(trolly1, true)

    trollys1.obj = trolly1
    

    local pad_options = {
        {
            name = 'flctrolly1',
            label = 'Steal Money',
            icon = 'fa-solid fa-sack-dollar',
            canInteract = function(_, distance)
                return distance < 1.5
            end,
            onSelect = function()
                
                TriggerEvent('mifh:anim:takemoney', trollys1.obj)
                exports.ox_target:removeLocalEntity(trollys1.obj, { 'flctrolly1' })
                Citizen.Wait(38000)
                lib.callback('mifh:give:moneybag', false, function(source)
                    Wait(10)
                end)
            end
        }
    }
    exports.ox_target:addLocalEntity(trollys1.obj, pad_options)
end

local function spawntrolly2(choice)
    local loc = choice.money.loc
    local model = lib.requestModel(joaat('hei_prop_hei_cash_trolly_01'))
    local coords = loc[2]
    if trollys2.spawned then return end

    trolly2 = CreateObject(
        model, coords.x, coords.y, coords.z-1, 
        true, true, true)
    SetEntityHeading(trolly2, coords.w)
    FreezeEntityPosition(trolly2, true)

    trollys2.obj = trolly2
    

    local pad_options = {
        {
            name = 'flctrolly2',
            label = 'Steal Money',
            icon = 'fa-solid fa-sack-dollar',
            canInteract = function(_, distance)
                return distance < 1.5
            end,
            onSelect = function()
                TriggerEvent('mifh:anim:takemoney', trollys2.obj)
                exports.ox_target:removeLocalEntity(trollys2.obj, { 'flctrolly2' })
                Citizen.Wait(38000)
                lib.callback('mifh:give:moneybag', false, function(source)
                    Wait(10)
                end)
            end
        }
    }
    exports.ox_target:addLocalEntity(trollys2.obj, pad_options)
end

local function spawntrolly3(choice)
    local loc = choice.money.loc
    local model = lib.requestModel(joaat('hei_prop_hei_cash_trolly_01'))
    local coords = loc[3]
    if trollys3.spawned then return end

    trolly3 = CreateObject(
        model, coords.x, coords.y, coords.z-1, 
        true, true, true)
    SetEntityHeading(trolly3, coords.w)
    FreezeEntityPosition(trolly3, true)

    trollys3.obj = trolly3
    

    local pad_options = {
        {
            name = 'flctrolly3',
            label = 'Steal Money',
            icon = 'fa-solid fa-sack-dollar',
            canInteract = function(_, distance)
                return distance < 1.5
            end,
            onSelect = function()
                TriggerEvent('mifh:anim:takemoney', trollys3.obj)
                exports.ox_target:removeLocalEntity(trollys3.obj, { 'flctrolly3' })
                Citizen.Wait(38000)
                lib.callback('mifh:give:moneybag', false, function(source)
                    Wait(10)
                end)
            end
        }
    }
    exports.ox_target:addLocalEntity(trollys3.obj, pad_options)
end

AddEventHandler('mifh:anim:takemoney', function(trolly)
    local player = GetPlayerPed(-1)
    local grabcash = lib.requestAnimDict('anim@heists@ornate_bank@grab_cash', 100)
    local bag = lib.requestModel('hei_p_m_bag_var22_arm_s', 100)
    local mod_empty = lib.requestModel('hei_prop_hei_cash_trolly_03', 100)
    local plyrcrd, plyrrot = GetEntityCoords(player), GetEntityRotation(player)
    local cartcrd, cartrot = GetEntityCoords(trolly), GetEntityRotation(trolly)
    
    -- netscene intro
    while not HasAnimDictLoaded(grabcash) and not HasModelLoaded(bag) and not HasModelLoaded(mod_empty) do
        Citizen.Wait(100)
    end
    while not NetworkHasControlOfEntity(trolly) do
        Citizen.Wait(10)
        NetworkRequestControlOfEntity(trolly)
    end
    -- start scene
    local obj_bag = CreateObject(bag, plyrcrd.x, plyrcrd.y, plyrcrd.z, true, true, false)
    local heist_start = NetworkCreateSynchronisedScene(
        cartcrd.x, cartcrd.y, cartcrd.z,
        cartrot.x, cartrot.y, cartrot.z, 
        2, false, false, 1065353216, 0, 1.3)
	NetworkAddPedToSynchronisedScene(player, heist_start, grabcash, 'intro', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(obj_bag, heist_start, grabcash, 'bag_intro', 4.0, -8.0, 1)
    SetPedComponentVariation(player, 5, 0, 0, 0)
	NetworkStartSynchronisedScene(heist_start)
    Citizen.Wait(1500)
    -- mid scene
    local heist_mid = NetworkCreateSynchronisedScene(
        cartcrd.x, cartcrd.y, cartcrd.z, 
        cartrot.x, cartrot.y, cartrot.z, 
        2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(player, heist_mid, grabcash, 'grab', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(obj_bag, heist_mid, grabcash, 'bag_grab', 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(trolly, heist_mid, grabcash, 'cart_cash_dissapear', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(heist_mid)
    Citizen.Wait(37000)
    -- end scene
    local heist_end = NetworkCreateSynchronisedScene(
        cartcrd.x, cartcrd.y, cartcrd.z, 
        cartrot.x, cartrot.y, cartrot.z, 
        2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(player, heist_end, grabcash, 'exit', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(obj_bag, heist_end, grabcash, 'bag_exit', 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(heist_end)
    local newtrolly = CreateObject(mod_empty, cartcrd.x, cartcrd.y, cartcrd.z, true, false, false)
    SetEntityRotation(newtrolly,  cartrot.x, cartrot.y, cartrot.z, 2, false)
    while not NetworkHasControlOfEntity(trolly) do
        Citizen.Wait(1)
        NetworkRequestControlOfEntity(trolly)
    end
    DeleteObject(trolly)
    while DoesEntityExist(trolly) do
        Citizen.Wait(1)
        DeleteObject(trolly)
    end
    PlaceObjectOnGroundProperly(newtrolly)
    Citizen.Wait(1800)
	if DoesEntityExist(obj_bag) then
        DeleteEntity(obj_bag)
    end
    SetModelAsNoLongerNeeded(mod_empty)
end)

AddEventHandler('mifh:start:trollys', function(choice)
    choice = choice
    spawntrolly1(choice)
    spawntrolly2(choice)
    spawntrolly3(choice)
end)

AddEventHandler('mifh:reset:trollys', function(choice)
    UT.mfhremove_obj(trolly1)
    trollys1.spawned = false
    UT.mfhremove_obj(trolly2)
    trollys2.spawned = false
    UT.mfhremove_obj(trolly3)
    trollys3.spawned = false
end)