local QBCore = exports['qb-core']:GetCoreObject()
local success, msg = lib.checkDependency('oxmysql', '2.7.3')
if success then
    success, msg = lib.checkDependency('ox_lib', '3.10.0')
end

---@diagnostic disable-next-line: param-type-mismatch
if not success then return warn(msg) end

local cfg = lib.require('shared.config')

GangWash = {}

lib.callback.register('ds-gangs:callback:WasherInUse', function(source, id)
    local washer = cfg.moneywash[id]
    local stashName = washer.name
	for itemName, itemData in pairs(cfg.allowed) do
		local count = exports.ox_inventory:GetItemCount(stashName, itemName)
		if count >= 1 then
			return true
		end
	end
	return false
end)

local function ProcessMoneyWash()
    for i = 1, #cfg.moneywash do
        local washer = cfg.moneywash[i]
        local stashName = washer.name
        for itemName, itemData in pairs(cfg.allowed) do
            local count = exports.ox_inventory:GetItemCount(stashName, itemName)
            if count >= 1 then
            	if count >= cfg.moneywashamount then count = cfg.moneywashamount else count = count end
                exports.ox_inventory:RemoveItem(stashName, itemName, count) -- removes the shit
                Wait(250) -- quarter of a second wait between, just bc
                exports.ox_inventory:AddItem(stashName, 'money', (itemData.payout * count)) -- adds money to the machine
            end
        end
    end

    SetTimeout(60000*cfg.moneywashtime, ProcessMoneyWash)
end

ProcessMoneyWash()

-- do not touch puuuuuuuuuhlease
Citizen.CreateThread(function()
	for i=1, #cfg.moneywash do
		exports.ox_inventory:RegisterStash(('LaundryMat_%s'):format(i), cfg.moneywash[i].name, cfg.moneywash[i].slots, 100000, nil)
	end
end)
