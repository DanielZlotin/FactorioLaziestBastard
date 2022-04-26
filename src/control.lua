
local spaceshipMachines = {
	"crash-site-assembling-machine-1",
	"crash-site-assembling-machine-2",
	"crash-site-generator",
	"crash-site-lab",
	"crash-site-chest-1",
	"crash-site-chest-2"
}

function disableHandCrafting ()
	local group = game.permissions.get_group("Default")
	if group then
		group.set_allows_action(defines.input_action.craft, false)
	end
end

function insertStartingItems()
	-- local created_items = remote.call("freeplay", "get_created_items")
	-- created_items["small-electric-pole"] = 2
	-- remote.call("freeplay", "set_created_items", created_items)
end

function rotate(origin, angle)
    local x = origin[1]
    local y = origin[2]
    local x_ = x * math.cos(angle) - y * math.sin(angle)
    local y_ = x * math.sin(angle) + y * math.cos(angle)
    return {x_, y_}
end

function randOffset()
	local entryAngle = 2.7
	local angleRand = (math.random() - 0.5) * 0.20
	local angle = entryAngle + angleRand
	local distance = math.random(8, 30)
	return rotate({distance, 0}, angle)
end

function findMachinePos(surface, spaceshipPos, machine)
	local offset = randOffset()
	local x = (spaceshipPos[1] or spaceshipPos.x) + offset[1]
	local y = (spaceshipPos[2] or spaceshipPos.y) + offset[2]
	local center = {x,y}
	return surface.find_non_colliding_position(machine, center, 0, 3, true)
end

function createExplosions(surface, position)
	surface.create_entity {
	    name = "crash-site-fire-flame",
	    position = position
	}
	surface.create_entity {
	    name = "crash-site-fire-smoke",
	    position = position,
	    time_to_live = math.random(60 * 10, 60 * 20)
	}
end

function addCrashSiteMachine(surface, spaceshipPos, machine)
	local position = findMachinePos(surface, spaceshipPos, machine)
	local entity = surface.create_entity({
        	name = machine,
            position = position,
            force = "player" })
	
	if game.entity_prototypes[machine].type == "container" then
		entity.insert({name="iron-plate", count=1})
		entity.insert({name="repair-pack", count=1})
		entity.insert({name="small-electric-pole", count=3})
		entity.insert({name="cliff-explosives", count=20})
	end
	entity.health = entity.health * 0.6
	createExplosions(surface, position)
end

function addCrashSiteMachines(player)
	local surface = player.surface
    local spaceshipPos = surface.find_entities_filtered {
    	position = player.force.get_spawn_position(surface),
	    radius = 100,
	    name = "crash-site-spaceship"
	    } [1].position

	for k, machine in ipairs(spaceshipMachines) do
		addCrashSiteMachine(surface, spaceshipPos, machine)
	end
end

script.on_init(function()
	if not remote.interfaces["freeplay"] then return end
	remote.call("freeplay", "set_disable_crashsite", false)
	insertStartingItems()
end)

script.on_event(defines.events.on_player_created, function(event)
	if not remote.interfaces["freeplay"] then return end

	disableHandCrafting()
	local player = game.players[event.player_index]
	addCrashSiteMachines(player)
end)
