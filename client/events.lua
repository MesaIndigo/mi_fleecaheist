UT = {}

UT.mfhped_utils = function(ped, anim)
    TaskStartScenarioInPlace(ped, anim, 0, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end

UT.mfhremove_ped = function(ped)
    DeleteEntity(ped)
end

UT.mfhobj_utils = function(obj, model, head)
    SetEntityHeading(obj, head)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    SetEntityCollision(obj, true, true)
end

UT.mfhremove_obj = function(obj)
    DeleteEntity(obj)
end

UT.mfhroute = function(blip)
    SetBlipSprite(blip, 250)
    SetBlipColour(blip, 3)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 3)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Robbery Location')
    EndTextCommandSetBlipName(blip)
end

UT.mfhremove_blip = function(blip)
    if DoesBlipExist(blip) then
        SetBlipAsMissionCreatorBlip(blip, false)
        RemoveBlip(blip)
    end
end

UT.mfhnotify = function(id, title, desc)
    lib.notify({
        id = id,
        title = title,
        description = desc,
        position = CG.notify.position,
        style = {
            backgroundColor = CG.notify.background,
            color = CG.notify.textcolor,
            ['.description'] = {
              color = CG.notify.desccolor
            }
        },
        icon = CG.notify.icon,
        iconColor = CG.notify.iconcolor
    })
end