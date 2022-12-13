local connected = false

AddEventHandler("playerSpawned", function()
	if not connected then
		TriggerServerEvent("rocademption:playerConnected")
		connected = true
	end
end)

RegisterNetEvent('neey')
AddEventHandler('neey', function()
	local me = GetPlayerServerId(i)
	local target2 =  GetPlayerServerId(closestPlayer)
	print("Oczyszczanie...")
	exports['mumble-voip']:removePlayerFromRadio()
	exports['mumble-voip']:removePlayerFromCall()
	Citizen.Wait(50)
	NetworkClearVoiceChannel()
	MumbleIsConnected()
	NetworkSetTalkerProximity(3.5 + 0.0)
	print("Voice: Załadowano...")	
end)

CreateThread(function()
    while true do
        SetDiscordAppId(APPID)
        SetDiscordRichPresenceAsset('logo')
       
        SetDiscordRichPresenceAction(0, "Strona", "")
        SetDiscordRichPresenceAction(1, "Discord", "")

        SetDiscordRichPresenceAssetText("ID: "..GetPlayerServerId(PlayerId()).." | "..GetPlayerName(PlayerId()).." ")
        SetRichPresence('ID: ' .. GetPlayerServerId(PlayerId()) .. ' | '.. GetPlayerName(PlayerId()) .. ' | ' .. tostring(exports['esx_scoreboard']:BierFrakcje('players')) .. '/64')
        Citizen.Wait(60000)
    end
end)