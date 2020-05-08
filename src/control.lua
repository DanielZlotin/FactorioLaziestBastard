function disableHandCrafting ()
	local group = game.permissions.get_group("Default")
	if group then
		group.set_allows_action(defines.input_action.craft, false)
	end
end

function insertMinimumEquipment(player)
	if player then
		player.insert{name="assembling-machine-1", count=1}
    	player.insert{name="small-electric-pole", count=1}
    	player.insert{name="offshore-pump", count=1}
    	player.insert{name="boiler", count=1}
    	player.insert{name="steam-engine", count=1}
    end
end

script.on_event(defines.events.on_player_created, function (event)
	disableHandCrafting()
	local player = game.players[event.player_index]
	insertMinimumEquipment(player)
end)
