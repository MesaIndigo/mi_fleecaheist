BK = {}

--[[ ideas
what if door + security camera set for each bank
if camera active and player enters zone, alert police
if they fail to disable the camera, cameras turn on
if they use drill on door, cameras turn on
if use pad or card, no security sys alert
option to open / close vault door with inside / outside pad

]]

BK.banks  = {

    key = 'scard_fleeca',

    hack = 'hack_tablet',

    drill = 'drill_thermal',
    drilltime = 0.5, -- time in minutes

    money = {
        cash = true, -- if true, gives player money / false gives player bag item
        amt = math.random(85000, 145000),
        item1 = 'money',

        item2 = 'bag_blackmoney',
    },

    alta = {
        secsystemoutside = {
            loc = vec3(311.053, -284.734, 54.364),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(312.772, -285.051, 54.364),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(312.858, -283.730, 54.303),
            head = 250.865,
            size = vec3(2, 1.9, 2.5),
            headend = 150.865, -- head - 100.00
            drill = vec3(311.810, -283.530, 54.303),
            drillhead = 70.000
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(316.241, -282.126, 54.164, 64.575),
                [2] = vec4(289.563, -318.885, 49.864, 158.638),
                [3] = vec4(303.659, -276.756, 54.166, 45.574)
            }
        },
        money = {
            loc = {
                [1] = vec4(315.467, -284.806, 54.142, 65.479),
                [2] = vec4(311.255, -288.659, 54.143, 339.541),
                [3] = vec4(315.149, -287.406, 54.143, 70.666)
            },
        }
    },

    legion = {
        secsystemoutside = {
            loc = vec3(146.721, -1046.367, 29.568),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(148.439, -1046.685, 29.568),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(148.626, -1045.363, 29.506),
            head = 249.865,
            size = vec3(2, 1.9, 2.5),
            headend = 149.865, -- head - 100.00
            drill = vec3(147.476, -1045.163, 29.506),
            drillhead = 70.000
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(130.697, -1036.227, 29.433, 75.925),
                [2] = vec4(142.057, -1043.885, 29.368, 251.146),
                [3] = vec4(142.057, -1043.885, 29.368, 251.146)
            }
        },
        money = {
            loc = {
                [1] = vec4(151.130, -1046.527, 29.367, 69.95),
                [2] = vec4(147.061, -1048.404, 29.367, 250.575),
                [3] = vec4(149.094, -1049.866, 29.367, 204.148)
            },
        }
    },

    burton = {
        secsystemoutside = {
            loc = vec3(-354.006, -55.598, 49.236),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(-352.282, -55.886, 49.236),
            head = 160.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(-352.136, -54.572, 49.175),
            head = 250.865,
            size = vec3(2, 1.9, 2.5),
            headend = 150.865, -- head - 100.00
            drill = vec3(-353.336, -54.572, 49.175),
            drillhead = 70.000
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(-368.051, -71.355, 45.673, 167.081),
                [2] = vec4(-350.230, -52.661, 49.036, 155.145),
                [3] = vec4(-362.363, -38.153, 49.036, 158.509)
            }
        },
        money = {
            loc = {
                [1] = vec4(-349.975, -54.869, 49.036, 110.735),
                [2] = vec4(-351.293, -59.793, 49.036, 341.214),
                [3] = vec4(-353.252, -59.104, 49.036, 314.426)
            },
        }
    },

    delperro = {
        secsystemoutside = {
            loc = vec3(-1210.685, -336.880, 37.981),
            head = 206.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(-1209.280, -335.840, 37.981),
            head = 206.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(-1210.160, -334.959, 37.919),
            head = 296.865,
            size = vec3(2, 1.9, 2.5),
            headend = 196.865, -- head - 100.00
            drill = vec3(-1211.160, -335.349, 37.919),
            drillhead = 115.000
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(-1217.055, -326.568, 37.642, 17.579),
                [2] = vec4(-1213.434, -339.065, 42.119, 304.317),
                [3] = vec4(-1213.693, -332.900, 37.780, 351.523)
            }
        },
        money = {
            loc = {
                [1] = vec4(-1207.879, -333.773, 37.780, 112.616),
                [2] = vec4(-1205.776, -337.496, 37.780, 66.275),
                [3] = vec4(-1208.036, -338.558, 37.780, 315.656)
            },
        }
    },

    chumash = {
        secsystemoutside = {
            loc = vec3(-2956.232, 481.636, 15.897),
            head = 268.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(-2956.452, 483.370, 15.897),
            head = 268.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(-2957.738, 482.970, 15.835),
            head = 358.00,
            size = vec3(2, 1.9, 2.5),
            headend = 258.00, -- head - 100.00
            drill = vec3(-2957.738, 481.700, 15.835),
            drillhead = 178.000
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(-2947.203, 481.789, 15.259, 271.886),
                [2] = vec4(-2957.417, 470.447, 15.468, 177.783),
                [3] = vec4(-2964.417, 477.244, 15.696, 352.665)
            }
        },
        money = {
            loc = {
                [1] = vec4(-2957.541, 485.744, 15.696, 171.884),
                [2] = vec4(-2954.331, 482.768, 15.696, 355.756),
                [3] = vec4(-2953.318, 485.455, 15.696, 133.891)
            },
        }
    },

    harmony = {
        secsystemoutside = {
            loc = vec3(1176.077, 2713.191, 38.288),
            head = 180.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        secsysteminside = {
            loc = vec3(1174.3541, 2712.898, 38.288),
            head = 180.00,
            size = vec3(0.5, 0.2, 0.6),
        },
        vaultdoor = {
            hash = 2121050683,
            loc = vec3(1174.942, 2711.661, 38.226),
            head = 90.00,
            size = vec3(2, 1.9, 2.5),
            headend = 350.00, -- head - 100.00
            drill = vec3(1176.431, 2711.661, 38.226),
            drillhead = 270.00
        },
        manager = {
            ped = 'a_f_y_business_01',
            anim = 'WORLD_HUMAN_DRINKING_FACILITY',
            loc = {
                [1] = vec4(1181.822, 2702.050, 38.168, 150.811),
                [2] = vec4(1176.651, 2723.681, 38.004, 355.615),
                [3] = vec4(1172.111, 2705.411, 38.087, 268.774)
            }
        },
        money = {
            loc = {
                [1] = vec4(1172.172, 2711.919, 38.087, 232.757),
                [2] = vec4(1174.050, 2715.751, 38.087, 128.241),
                [3] = vec4(1171.633, 2715.009, 38.087, 265.16)
            },
        }
    },
}

