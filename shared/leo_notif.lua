--[[--------------------------------------------------
                    NOTICE HERE
This is where you can connect your police notifications. 
If you do not have one set up, I have one here that will
do the bare minimum of alerting the criminals, police,
and setting a marker for police.

At some point I will make my own script for that, but
for now I can't be bothered.

-- use [https://fontawesome.com/search?m=free&o=r] for icons
-- use [https://htmlcolorcodes.com] for colors
]]----------------------------------------------------

local policejob = {'police', 'leo', 'lssd', 'bcso'}
local notify = {
    pos ='top-right', bgc = '#ffffff',
    txc = '#141517', dcc = '#141517',
    ics = 'circle-exclamation', icc = '#FF0000'
}

function NotifyPolice(alarm, loc)
    -- If you have an export for your resource,
    -- then replace what I have in here with it
    ----------------------------------------------------
    if alarm then
        -- alert the hoes
        -- create blip
        -- gtfo
    end
    ----------------------------------------------------
end

--[[
    -- reference for cd_dispatch
    
    local data = exports['cd_dispatch']:GetPlayerInfo()
    TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police'}, 
        coords = targetCoords,
        title = '10-15 - Store Robbery',
        message = 'A '..data.sex..' robbing a store at '..data.street, 
        flash = 0,
        unique_id = tostring(math.random(0000000,9999999)),
        blip = {
            sprite = 431, 
            scale = 1.2, 
            colour = 3,
            flashes = false, 
            text = '911 - Store Robbery',
            time = (5601000),
            sound = 1,
        }
    })
]]