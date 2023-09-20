FH = {}

-- set the data to follow the map installed.
-- choices: default, gabz
FH.map = 'gabz'

-- time before heist can be planned again
FH.heistcooldown = 30

FH.start = {

    loc = vec4(1276.001, -1710.265, 54.771, 297.869),

    size = vec3(0.5, 1, 1),

    head = 25,

}

FH.options  = {

    itm_key = 'scard_fleeca',

    itm_hack = 'hack_tablet',

    itm_drill = 'drill_thermal',

    time_drill = 0.5, -- time in minutes

    itm_money = {
        -- true gives bag item / false gives cash item
        itm_give = true,

        amt = math.random(85000, 145000),

        cash = 'money',

        item = 'bag_blackmoney',
    },

}

FH.locations = {

    alta = {

        cameras = {
            model = '',
            loc = vec4(0,0,0,0)
        },

        guards = {
            model = '',
            loc = vec4(0,0,0,0)
        },

        manager = {
            model = '',
            loc = vec4(0,0,0,0)
        },

        backup = {
            model = '',
            loc = vec4(0,0,0,0)
        },

    },
}