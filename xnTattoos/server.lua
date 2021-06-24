QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('SmallTattoos:GetPlayerTattoos', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if xPlayer then
		exports['ghmattimysql']:execute('SELECT tattoos FROM playerskins WHERE citizenid = @identifier', {
			['@identifier'] = xPlayer.PlayerData.citizenid
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
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if xPlayer.PlayerData.money['cash'] >= price then
		xPlayer.Functions.RemoveMoney('cash', price)
		table.insert(tattooList, tattoo)

		exports['ghmattimysql']:execute('UPDATE playerskins SET tattoos = @tattoos WHERE citizenid = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.PlayerData.citizenid
		})
		TriggerClientEvent('QBCore:Notify', source, 'Purchased The '..tattooName.. ' Tattoo For $'..price, 'success')
		cb(true)
	else
		TriggerClientEvent('QBCore:Notify', source, 'Not Enough Money', 'error')
		cb(false)
	end
end)

RegisterServerEvent('SmallTattoos:RemoveTattoo')
AddEventHandler('SmallTattoos:RemoveTattoo', function (tattooList)
	local xPlayer = QBCore.Functions.GetPlayer(source)

	exports['ghmattimysql']:execute('UPDATE playerskins SET tattoos = @tattoos WHERE citizenid = @identifier', {
		['@tattoos'] = json.encode(tattooList),
		['@identifier'] = xPlayer.PlayerData.citizenid
	})
end)