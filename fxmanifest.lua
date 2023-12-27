fx_version 'cerulean'
games { 'gta5' }
author 'd00kiesh0es'
description 'ds_moneywash 0.0.1'
lua54 'yes'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

dependencies {
    'PolyZone',
    'qb-core',
    'ox_lib',
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    'server/*.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

