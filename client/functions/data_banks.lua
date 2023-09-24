DB = {}

DB.Alta = {

    -- outside vault panel
    secsys1 = {
        loc = vec4(0,0,0,0)
    },

    -- outside vault panel
    secsys2 = {
        loc = vec4(0,0,0,0)
    },

    -- vaultdoor locations
    vaultd = {
        hash = 2121050683,
        loc = vec3(312.858, -283.730, 54.303),
        head = 250.865,
        size = vec3(2, 1.9, 2.5),
        headend = 150.865,
    },

    -- location for drill
    drill = {
        model = 'k4mb1_prop_thermaldrill',
        loc = vec3(0,0,0),
        head = 70
    },

    -- location & model for camera
    cameras = {
        model = 'prop_cctv_cam_04c',
        loc = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        }
    },

    -- locations / weapon / model for guard
    guards = {
        model = 'S_M_M_Security_01',
        wepn = 'weapon_combatpistol',
        loc = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        }
    },

    -- locations / models for manager
    manager = {
        model = {
            [1] = {'a_f_y_business_01'},
            [2] = {'a_f_y_business_04'},
            [3] = {'a_m_y_business_02'},
            [4] = {'a_m_y_business_01'},
        },
        loc = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        }
    },

    -- locations / weapon / model for backup
    backup = {
        model = 's_m_m_chemsec_01',
        wepn = 'weapon_combatpistol',
        vehcl = '',
        loc = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        }
    },

    money = {
        full = 'hei_prop_hei_cash_trolly_01',
        empt = 'hei_prop_hei_cash_trolly_03',
        loc = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        }
    },


}