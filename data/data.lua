----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- model list for managers
ListManagers = {
    [1] = {'a_f_y_business_01'}, [2] = {'a_f_y_business_02'}, [3] = {'a_f_y_business_03'}, [4] = {'a_f_y_business_04'},
    [5] = {'a_m_y_busicas_01'},  [6] = {'a_m_y_business_01'}, [7] = {'a_m_y_business_02'}, [8] = {'a_m_y_business_03'}
}

ListGuards = {
    [1] = {''}, [2] = {''}, [3] = {''}, [4] = {''}
}

ListBackup = {
    [1] = {''}, [2] = {''}, [3] = {''}, [4] = {''}
}

ListVehicles = {
    [1] = {''}, [2] = {''}, [3] = {''}, [4] = {''}
}

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-- map data for Gabz Fleeca Interior
Gabz = {
-- ALTA BANK
    alta = {
        -- outside vault panel
        secsys1 = {
            loc = vec4(0,0,0,0)
        },
        -- outside vault panel
        secsys2 = {
            loc = vec4(0,0,0,0)
        },
        -- vaultdoor locations
        vault = {
            hash = 2121050683,
            loc = vec3(312.858, -283.730, 54.303),
            head = 250.865,
            size = vec3(2, 1.9, 2.5),
            headend = 150.865,
        },
        -- location for drill
        drill = {
            loc = vec3(0,0,0),
            head = 70
        },
        -- location & model for camera
        cameras = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        },
        -- locations for guards
        guards = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        },
        -- locations for manager
        manager = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        },
        -- locations for backup
        backup = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        },
        -- locations for cash trollies
        money = {
            [1] = vec4(0,0,0,0),
            [2] = vec4(0,0,0,0),
            [3] = vec4(0,0,0,0),
        },
    },
}
