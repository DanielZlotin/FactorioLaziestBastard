
script.on_event(defines.events.on_player_created, function (event)
	local player = game.players[event.player_index]
	if player and player.character then
		player.character_build_distance_bonus=100
		player.character_reach_distance_bonus=100
		player.character_running_speed_modifier=1
	end
end)
