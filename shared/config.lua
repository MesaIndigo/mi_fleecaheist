-- config variables
Debug = true
Target = exports.ox_target
Inventory = exports.ox_inventory
Locale = lib.locale

-- current framework options: OX
Framework = 'OX'

-- current locale options: en
Language = 'en'

-- notification configuration for script
Ntfy = {
    id = 'notify',          -- don't worry about this
    pos ='top-right',       -- position of the notification
    bgndclr = '#76448A',    -- color of the background
    txtclr = '#ECF0F1',     -- color of the text
    descclr = '#F4D03F',    -- color of the description
    iconclr = '#F4D03F'     -- color of the icon
}

-- config data for heist
Heist = {}

-- set the data to follow the map installed.
-- choices: default, gabz
Heist.map = 'gabz'

-- time in minutes before being able to start another heist
Heist.timer = 30

-- items configuration for other inventories
Heist.items = {
    -- card item taken from manager
    card = '',

    -- hacking tool to break system
    hack = '',

    -- drill item to open vault door
    drill = '',
}

-- 
Heist.money = {
    -- true = give player item / false = give player cash
    use_item = true,

    -- name of item reward to give
    item_name = 'bag_blackmoney',

    -- amount of item reward to give
    item_amt = math.random(1,3),

    -- name of cash reward to give
    cash_name = 'black_money',

    -- amount of cash reward to give
    cash_amt = math.random(25000,75000),
}