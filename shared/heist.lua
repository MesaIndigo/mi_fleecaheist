FH = {}

-- set the data to follow the map installed.
-- choices: default, gabz
FH.map = 'gabz'

-- time in minutes before heist can be planned again
FH.heistcooldown = 30

FH.itm_key = 'scard_fleeca'

FH.itm_hack = 'hack_tablet'

FH.itm_drill = 'drill_thermal'

FH.time_drill = 0.5 -- time in minutes

FH.itm_money = {
    -- true gives bag item / false gives cash item
    itm_give = true,

    amt = math.random(85000, 145000),

    cash = 'money',

    item = 'bag_blackmoney',
}