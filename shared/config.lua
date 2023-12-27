return {
    debug = false, -- put to false to remove the target zones
    sprite = true, -- put to false to remove the indicator to show a zone is there
    cantopen = false, -- if this is true then you will not be able to open the washing machine UNTIL the money is cleaned, aka no one can steal / take out money as it cleans
    moneywashtime = 10, -- in minutes
    moneywashamount = 25, -- amount able to be washed every x minutes [time defined as moneywashtime]
    moneywash = {
        {name = 'LaundryMat_1', slots = 2, coords = vector3(1139.74, -991.77, 46.11)}, -- dont touch unless you know what you are doing but can add more if you want
        {name = 'LaundryMat_2', slots = 2, coords = vector3(1139.61, -991.06, 46.11)}, -- dont touch unless you know what you are doing but can add more if you want
        {name = 'LaundryMat_3', slots = 2, coords = vector3(1139.52, -990.35, 46.11)}, -- dont touch unless you know what you are doing but can add more if you want
        {name = 'LaundryMat_4', slots = 2, coords = vector3(1139.43, -989.65, 46.11)}, -- dont touch unless you know what you are doing but can add more if you want
    },
    allowed = { -- only tested this with one item, should work but then you will need to add more slots above
        ['moneyrolls'] = { -- item i use in my server for 'dirty money'
            payout = 25, -- cash payout per
        },
    },
}

    -- if you want to use the same item thats listed above, make sure to put this in your items list in QB-Core // i do not have an image yet, so just make one / use one already in qb
    -- ['moneyrolls']                     = {
    --     ['name'] = 'moneyrolls',                       
    --     ['label'] = 'Money Rolls',              
    --     ['weight'] = 0,         
    --     ['type'] = 'item',         
    --     ['image'] = 'moneyrolls.png',             
    --     ['unique'] = false,          
    --     ['useable'] = false,     
    --     ['shouldClose'] = true,      
    --     ['combinable'] = nil,   
    --     ['description'] = 'Rolled up bills?'},