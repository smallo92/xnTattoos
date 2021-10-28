local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('SmallTattoos:GetPlayerTattoos', function(source, cb)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if xPlayer then
		exports.oxmysql:execute('SELECT tattoos FROM players WHERE citizenid = ?', {
			xPlayer.PlayerData.citizenid
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

QBCore.Functions.CreateCallback('SmallTattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if xPlayer.Functions.GetMoney('cash') >= price then
		xPlayer.Functions.RemoveMoney('cash', price)
		tattooList[#tattooList + 1] = tattoo
		exports.oxmysql:update('UPDATE players SET tattoos = ? WHERE citizenid = ?', {
			json.encode(tattooList),
			xPlayer.PlayerData.citizenid
		})
		TriggerClientEvent('QBCore:Notify', src, 'You bought the '..tattooName..' tattoo for $'..price)
		cb(true)
	else
		TriggerClientEvent('QBCore:Notify', src, 'Not enough money', 'error')
		cb(false)
	end
end)

RegisterServerEvent('SmallTattoos:RemoveTattoo')
AddEventHandler('SmallTattoos:RemoveTattoo', function (tattooList)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	exports.oxmysql:update('UPDATE players SET tattoos = ? WHERE citizenid = ?', {
		json.encode(tattooList),
		xPlayer.PlayerData.citizenid
	})
end)