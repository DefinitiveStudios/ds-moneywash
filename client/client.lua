local cfg = lib.require('shared.config') -- remove local if you want to use this as a global // leave alone if you dont have an idea what you are doing

RegisterNetEvent('ds-gangs:moneywash:access:Washer', function(id)
	if cfg.cantopen then
		local inuse = lib.callback.await('ds-gangs:callback:WasherInUse', false, id)
		if inuse then TriggerEvent('QBCore:Notify', 'Washer is in use! Come back later', 'error') return end
	end
	TriggerEvent('QBCore:Notify', 'Make sure to only use 1 slot when using the machine [;')
	exports.ox_inventory:openInventory('stash', ('LaundryMat_%s'):format(id))
end)

EstablishZones = function()
	DeleteWasherZones()
	for i=1, #cfg.moneywash do
		local data = cfg.moneywash[i]
	    exports.ox_target:addSphereZone({
	    	name = 'MoneyWasher_'..i,
	    	coords = vector3(data.coords[1], data.coords[2], data.coords[3]),
	    	radius = 0.3,
	    	debug = cfg.debug,
	    	drawSprite = cfg.sprite,
	    	options = {
	    		{
	    			label = 'Washing Machine',
	    			icon = 'fa-solid fa-soap',
	    			distance = 1.5,
	    			onSelect = function()
	    				TriggerEvent('ds-gangs:moneywash:access:Washer', i)
	    			end,
	    		},
	    	}
	    })
	end
end

DeleteWasherZones = function()
    for i=1, #cfg.moneywash do
        local data = cfg.moneywash [i]
        local name = 'MoneyWasher_'..i
        exports.ox_target:removeZone(name)
    end
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    EstablishZones()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    EstablishZones()
end)


RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    DeleteWasherZones()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        EstablishZones()
    end
end)