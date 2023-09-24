-- FX Information
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

-- Resource Information
name 'mi_fleecaheist'
author 'MI_Agimir'
version '2.0.0'
repository 'https://github.com/MIAgimir/mi_fleecaheist'
description 'get money you nerd'

-- Manifest
files {
    'locales/*.json'
}

shared_scripts {
	'@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'client/functions/*.lua',
    'client/data.banks.lua',
    'client/events.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/version.lua',
    'server/events.lua'
}

dependencies {
    'ox_inventory',
    'ox_lib',
    'ox_target'
}