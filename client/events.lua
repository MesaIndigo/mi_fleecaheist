-- remove blip info
RemBlipInfo = function(blip)
    if DoesBlipExist(blip) then
        SetBlipAsMissionCreatorBlip(blip, false)
        RemoveBlip(blip)
    end
end

-- set blip info
SetBlipInfo = function(blip, sprite, color, route, name)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipRoute(blip, route)
    SetBlipRouteColour(blip, color)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
end

-- notify player
Notify = function(id, title, desc, icon)
    lib.notify({
        id = id,
        title = title,
        description = desc,
        position = Ntfy.pos,
        style = {
            backgroundColor = Ntfy.bgndclr,
            color = Ntfy.txtclr,
            ['.description'] = {
              color = Ntfy.descclr
            }
        },
        icon = icon,
        iconColor = Ntfy.iconclr
    })
end