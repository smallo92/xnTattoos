ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('SmallTattoos:GetPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
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

ESX.RegisterServerCallback('SmallTattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})

		TriggerClientEvent('esx:showNotification', source, "You have bought the ~y~" .. tattooName .. "~s~ tattoo for ~g~$" .. price)
		cb(true)
	else
		TriggerClientEvent('esx:showNotification', source, "You do not have enough money for this tattoo")
		cb(false)
	end
end)

RegisterServerEvent('SmallTattoos:RemoveTattoo')
AddEventHandler('SmallTattoos:RemoveTattoo', function (tattooList)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
		['@tattoos'] = json.encode(tattooList),
		['@identifier'] = xPlayer.identifier
	})
end)