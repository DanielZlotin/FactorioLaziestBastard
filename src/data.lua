data.raw["utility-sprites"]["default"].pollution_visualization.filename = "__FastLazyBastard__/graphics/white-pollution-visualization.png"

-- crash-site machines:

local csAssembling1 = data.raw["assembling-machine"]["crash-site-assembling-machine-1-repaired"]
local csAssembling2 = data.raw["assembling-machine"]["crash-site-assembling-machine-2-repaired"]
local csGenerator = data.raw["electric-energy-interface"]["crash-site-generator"]
local csLab = data.raw["lab"]["crash-site-lab-repaired"]
local csChest1 = data.raw["container"]["crash-site-chest-1"]
local csChest2 = data.raw["container"]["crash-site-chest-2"]
local machines = {csAssembling1, csAssembling2, csGenerator, csLab, csChest1, csChest2}

for k,machine in ipairs(machines) do
	for i,k in ipairs(machine["flags"]) do
		if k == "not-repairable" then
			table.remove(machine["flags"], i)
		end
	end
	table.insert(machine["flags"], "placeable-player")
	table.insert(machine["flags"], "placeable-neutral")
	table.insert(machine["flags"], "player-creation")
	machine["minable"] = { mining_time = 2.0 , result = nil}
	machine["max_health"] = 300
end
csAssembling1["ingredient_count"] = 3
csAssembling2["ingredient_count"] = 3
csGenerator["energy_source"]["buffer_capacity"] = "1MJ"
csGenerator["energy_source"]["output_flow_limit"] = "1MW"
csGenerator["energy_production"] = "1MW"
