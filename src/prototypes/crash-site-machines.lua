local sounds = require("__base__/prototypes/entity/sounds.lua")
local crash_site_sprite_priority = "very-low"

function csMachinesFlags()
	return {
		"placeable-player",
		"placeable-neutral",
		"player-creation",
		"not-rotatable"
	}
end

local csChest1 = data.raw["container"]["crash-site-chest-1"]
local csChest2 = data.raw["container"]["crash-site-chest-2"]
local csSpaceship = data.raw["container"]["crash-site-spaceship"]
csChest1["minable"] = { mining_time = 0.5, result = "crash-site-chest-1" }
csChest2["minable"] = { mining_time = 0.5, result = "crash-site-chest-2" }
csChest1["max_health"] = 100
csChest2["max_health"] = 100
csChest1["flags"] = csMachinesFlags()
csChest2["flags"] = csMachinesFlags()
csChest1["inventory_size"] = 4
csChest2["inventory_size"] = 4
csSpaceship["max_health"] = 1000
csSpaceship["inventory_size"] = 64
csSpaceship["open_sound"] = sounds.cargo_wagon_open
csSpaceship["close_sound"] = sounds.cargo_wagon_close
csSpaceship["minable"] = { mining_time = 5.0, result = nil },

data:extend(
		{
			{
				type = "lab",
				name = "crash-site-lab",
				icon = path .. "/graphics/icons/crash-site-lab.png",
				icon_size = 64, icon_mipmaps = 4,
				flags = csMachinesFlags(),
				minable = { mining_time = 0.5, result = "crash-site-lab" },
				map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
				max_health = 300,
				corpse = "big-remnants",
				dying_explosion = "medium-explosion",
				collision_box = { { -2.2, -1.2 }, { 2.2, 1.2 } },
				selection_box = { { -2.5, -1.5 }, { 2.5, 1.5 } },
				entity_info_icon_shift = util.by_pixel(32, 0),
				light = { intensity = 0.9, size = 12, color = { r = 1.0, g = 1.0, b = 1.0 }, shift = { 1.5, 0.5 } },
				integration_patch_render_layer = "decals",
				integration_patch = {
					filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab-ground.png",
					priority = crash_site_sprite_priority,
					width = 352,
					height = 170,
					shift = util.by_pixel(-48, 12),
					frame_count = 1,
					line_length = 1,
					hr_version = {
						filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab-ground.png",
						priority = crash_site_sprite_priority,
						width = 700,
						height = 344,
						shift = util.by_pixel(-49, 11),
						frame_count = 1,
						line_length = 1,
						scale = 0.5
					}
				},

				on_animation = {
					layers = {
						{
							filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab.png",
							priority = crash_site_sprite_priority,
							width = 244,
							height = 126,
							frame_count = 1,
							line_length = 1,
							repeat_count = 24,
							animation_speed = 1 / 3,
							shift = util.by_pixel(-18, 14),
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab.png",
								priority = crash_site_sprite_priority,
								width = 488,
								height = 252,
								frame_count = 1,
								line_length = 1,
								repeat_count = 24,
								animation_speed = 1 / 3,
								shift = util.by_pixel(-18, 14),
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab-beams.png",
							priority = crash_site_sprite_priority,
							width = 68,
							height = 50,
							frame_count = 24,
							line_length = 6,
							animation_speed = 1 / 3,
							shift = util.by_pixel(36, -20),
							blend_mode = "additive",
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab-beams.png",
								priority = crash_site_sprite_priority,
								width = 130,
								height = 100,
								frame_count = 24,
								line_length = 6,
								animation_speed = 1 / 3,
								shift = util.by_pixel(37, -20),
								blend_mode = "additive",
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab-shadow.png",
							priority = crash_site_sprite_priority,
							width = 350,
							height = 148,
							frame_count = 1,
							line_length = 1,
							repeat_count = 24,
							animation_speed = 1 / 3,
							shift = util.by_pixel(-12, 12),
							draw_as_shadow = true,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab-shadow.png",
								priority = crash_site_sprite_priority,
								width = 696,
								height = 302,
								frame_count = 1,
								line_length = 1,
								repeat_count = 24,
								animation_speed = 1 / 3,
								shift = util.by_pixel(-11, 12),
								scale = 0.5,
								draw_as_shadow = true
							}
						}
					}
				},
				off_animation = {
					layers = {
						{
							filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab.png",
							priority = crash_site_sprite_priority,
							width = 244,
							height = 126,
							frame_count = 1,
							line_length = 1,
							repeat_count = 24,
							animation_speed = 1 / 3,
							shift = util.by_pixel(-18, 14),
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab.png",
								priority = crash_site_sprite_priority,
								width = 488,
								height = 252,
								frame_count = 1,
								line_length = 1,
								repeat_count = 24,
								animation_speed = 1 / 3,
								shift = util.by_pixel(-18, 14),
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-lab/crash-site-lab-shadow.png",
							priority = crash_site_sprite_priority,
							width = 350,
							height = 148,
							frame_count = 1,
							line_length = 1,
							repeat_count = 24,
							animation_speed = 1 / 3,
							shift = util.by_pixel(-12, 12),
							draw_as_shadow = true,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-lab/hr-crash-site-lab-shadow.png",
								priority = crash_site_sprite_priority,
								width = 696,
								height = 302,
								frame_count = 1,
								line_length = 1,
								repeat_count = 24,
								animation_speed = 1 / 3,
								shift = util.by_pixel(-11, 12),
								scale = 0.5,
								draw_as_shadow = true
							}
						}
					}
				},
				working_sound = {
					sound = {
						filename = "__base__/sound/lab.ogg",
						volume = 0.7
					},
					audible_distance_modifier = 0.7,
					fade_in_ticks = 4,
					fade_out_ticks = 20
				},
				vehicle_impact_sound = sounds.generic_impact,
				open_sound = sounds.machine_open,
				close_sound = sounds.machine_close,
				energy_source = {
					type = "electric",
					usage_priority = "secondary-input",
					emissions_per_minute = 4
				},
				energy_usage = "60kW",
				researching_speed = 1,
				inputs = { "automation-science-pack" }
			},
		})-- lab

crash_site_assembling_machine_1_animation_speed = 1
crash_site_assembling_machine_2_animation_speed = 1

data:extend(
		{
			{
				type = "assembling-machine",
				name = "crash-site-assembling-machine-1",
				icon = path .. "/graphics/icons/crash-site-assembling-machine-1.png",
				icon_size = 64, icon_mipmaps = 4,
				flags = csMachinesFlags(),
				minable = { mining_time = 0.5, result = "crash-site-assembling-machine-1" },
				map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
				max_health = 300,
				corpse = "big-remnants",
				dying_explosion = "medium-explosion",
				resistances = {
					{
						type = "fire",
						percent = 70
					}
				},
				collision_box = { { -1.2, -0.7 }, { 1.2, 0.7 } },
				selection_box = { { -1.5, -1 }, { 1.5, 1 } },
				alert_icon_shift = util.by_pixel(-3, -12),
				integration_patch_render_layer = "decals",
				integration_patch = {
					filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-ground.png",
					priority = crash_site_sprite_priority,
					width = 208,
					height = 116,
					shift = util.by_pixel(-24, 12),
					frame_count = 1,
					line_length = 1,
					hr_version = {
						filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-ground.png",
						priority = crash_site_sprite_priority,
						width = 446,
						height = 234,
						shift = util.by_pixel(-31, 12),
						frame_count = 1,
						line_length = 1,
						scale = 0.5
					}
				},

				animation = {
					layers = {
						{
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1.png",
							priority = crash_site_sprite_priority,
							width = 142,
							height = 92,
							frame_count = 20,
							line_length = 5,
							shift = util.by_pixel(-12, 2),
							animation_speed = crash_site_assembling_machine_1_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1.png",
								priority = crash_site_sprite_priority,
								width = 282,
								height = 182,
								frame_count = 20,
								line_length = 5,
								shift = util.by_pixel(-12, 3),
								animation_speed = crash_site_assembling_machine_1_animation_speed,
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-shadow.png",
							priority = crash_site_sprite_priority,
							width = 140,
							height = 84,
							frame_count = 20,
							line_length = 5,
							draw_as_shadow = true,
							shift = util.by_pixel(4, 6),
							animation_speed = crash_site_assembling_machine_1_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-shadow.png",
								priority = crash_site_sprite_priority,
								width = 278,
								height = 168,
								frame_count = 20,
								line_length = 5,
								draw_as_shadow = true,
								shift = util.by_pixel(4, 6),
								animation_speed = crash_site_assembling_machine_1_animation_speed,
								scale = 0.5
							}
						}
					}
				},
				working_visualisations = {
					{
						animation = {
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-1-light.png",
							priority = crash_site_sprite_priority,
							width = 78,
							height = 64,
							frame_count = 20,
							line_length = 5,
							shift = util.by_pixel(10, -10),
							blend_mode = "additive",
							animation_speed = crash_site_assembling_machine_1_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-1-light.png",
								priority = crash_site_sprite_priority,
								width = 162,
								height = 120,
								frame_count = 20,
								line_length = 5,
								shift = util.by_pixel(12, -8),
								blend_mode = "additive",
								animation_speed = crash_site_assembling_machine_1_animation_speed,
								scale = 0.5
							}
						}
					}
				},
				crafting_categories = { "crafting", "basic-crafting", "advanced-crafting" },
				crafting_speed = 0.5,
				energy_source = {
					type = "electric",
					usage_priority = "secondary-input",
					emissions_per_minute = 4
				},
				energy_usage = "90kW",
				ingredient_count = 3,
				open_sound = sounds.machine_open,
				close_sound = sounds.machine_close,
				vehicle_impact_sound = sounds.generic_impact,
				working_sound = {
					sound = {
						{
							filename = path .. "/sound/crash-site-assembling-machine.ogg",
							volume = 0.8
						},
					},
					--idle_sound = { filename = path .. "/sound/idle1.ogg", volume = 0.3 },
					--max_sounds_per_type = 2,
				}
			}, -- rotation 1 repaired
			{
				type = "assembling-machine",
				name = "crash-site-assembling-machine-2",
				icon = path .. "/graphics/icons/crash-site-assembling-machine-2.png",
				icon_size = 64, icon_mipmaps = 4,
				flags = csMachinesFlags(),
				minable = { mining_time = 0.5, result = "crash-site-assembling-machine-2" },
				map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
				max_health = 300,
				corpse = "big-remnants",
				dying_explosion = "medium-explosion",
				resistances = {
					{
						type = "fire",
						percent = 70
					}
				},
				collision_box = { { -0.7, -1.2 }, { 0.7, 1.2 } },
				selection_box = { { -1, -1.5 }, { 1, 1.5 } },
				alert_icon_shift = util.by_pixel(-3, -12),
				integration_patch_render_layer = "decals",
				integration_patch = {
					filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-ground.png",
					priority = crash_site_sprite_priority,
					width = 146,
					height = 106,
					shift = util.by_pixel(-8, -4),
					frame_count = 1,
					line_length = 1,
					hr_version = {
						filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-ground.png",
						priority = crash_site_sprite_priority,
						width = 290,
						height = 238,
						shift = util.by_pixel(-8, -10),
						frame_count = 1,
						line_length = 1,
						scale = 0.5
					}
				},

				animation = {
					layers = {
						{
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2.png",
							priority = crash_site_sprite_priority,
							width = 100,
							height = 98,
							frame_count = 20,
							line_length = 5,
							shift = util.by_pixel(-4, -10),
							animation_speed = crash_site_assembling_machine_2_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2.png",
								priority = crash_site_sprite_priority,
								width = 198,
								height = 200,
								frame_count = 20,
								line_length = 5,
								shift = util.by_pixel(-4, -11),
								animation_speed = crash_site_assembling_machine_2_animation_speed,
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-shadow.png",
							priority = crash_site_sprite_priority,
							width = 106,
							height = 86,
							frame_count = 20,
							line_length = 5,
							draw_as_shadow = true,
							shift = util.by_pixel(2, -8),
							animation_speed = crash_site_assembling_machine_2_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-shadow.png",
								priority = crash_site_sprite_priority,
								width = 208,
								height = 174,
								frame_count = 20,
								line_length = 5,
								draw_as_shadow = true,
								shift = util.by_pixel(3, -9),
								animation_speed = crash_site_assembling_machine_2_animation_speed,
								scale = 0.5
							}
						}
					}
				},
				working_visualisations = {
					{
						animation = {
							filename = path .. "/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-light.png",
							priority = crash_site_sprite_priority,
							width = 84,
							height = 62,
							frame_count = 20,
							line_length = 5,
							shift = util.by_pixel(-8, -6),
							blend_mode = "additive",
							animation_speed = crash_site_assembling_machine_2_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-light.png",
								priority = crash_site_sprite_priority,
								width = 174,
								height = 124,
								frame_count = 20,
								line_length = 5,
								shift = util.by_pixel(-7, -4),
								blend_mode = "additive",
								animation_speed = crash_site_assembling_machine_2_animation_speed,
								scale = 0.5
							}
						}
					}
				},
				crafting_categories = { "crafting", "basic-crafting", "advanced-crafting" },
				crafting_speed = 0.5,
				energy_source = {
					type = "electric",
					usage_priority = "secondary-input",
					emissions_per_minute = 4
				},
				energy_usage = "90kW",
				ingredient_count = 3,
				open_sound = sounds.machine_open,
				close_sound = sounds.machine_close,
				vehicle_impact_sound = sounds.generic_impact,
				working_sound = {
					sound = {
						{
							filename = path .. "/sound/crash-site-assembling-machine.ogg",
							volume = 0.8
						},
					},
					--idle_sound = { filename = path .. "/sound/idle1.ogg", volume = 0.3 },
					--max_sounds_per_type = 2,
					fade_in_ticks = 4,
					fade_out_ticks = 20
				}
			}, -- rotation 2 repaired
		})-- assembling-machine

crash_site_generator_animation_speed = 1

data:extend(
		{
			{
				type = "electric-energy-interface",
				name = "crash-site-generator",
				icon = path .. "/graphics/icons/crash-site-generator.png",
				icon_size = 64, icon_mipmaps = 4,
				flags = csMachinesFlags(),
				minable = { mining_time = 0.5, result = "crash-site-generator" },
				map_color = { r = 0, g = 0.365, b = 0.58, a = 1 },
				max_health = 300,
				corpse = "medium-remnants",
				--subgroup = "other",
				collision_box = { { -1.5, -0.9 }, { 0.9, 0.9 } },
				selection_box = { { -1.5, -0.9 }, { 0.9, 0.9 } },
				allow_copy_paste = false,
				energy_source = {
					type = "electric",
					buffer_capacity = "1MJ",
					usage_priority = "tertiary",
					input_flow_limit = "0kW",
					output_flow_limit = "1MW"
				},

				energy_production = "1MW",
				energy_usage = "0kW",
				light = { intensity = 0.75, size = 6, color = { r = 1.0, g = 1.0, b = 1.0 }, shift = { 64 / 64, -140 / 64 } },
				continuous_animation = true,
				integration_patch_render_layer = "decals",
				-- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
				integration_patch = {
					filename = path .. "/graphics/entity/crash-site-generator/crash-site-generator-ground.png",
					priority = crash_site_sprite_priority,
					width = 192,
					height = 180,
					shift = util.by_pixel(-28, -38),
					frame_count = 1,
					line_length = 1,
					hr_version = {
						filename = path .. "/graphics/entity/crash-site-generator/hr-crash-site-generator-ground.png",
						priority = crash_site_sprite_priority,
						width = 384,
						height = 360,
						shift = util.by_pixel(-28, -38),
						frame_count = 1,
						line_length = 1,
						scale = 0.5
					}
				},

				animation = {
					layers = {
						{
							filename = path .. "/graphics/entity/crash-site-generator/crash-site-generator.png",
							priority = crash_site_sprite_priority,
							width = 142,
							height = 128,
							frame_count = 5,
							line_length = 5,
							repeat_count = 16,
							shift = util.by_pixel(-10, -24),
							animation_speed = crash_site_generator_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-generator/hr-crash-site-generator.png",
								priority = crash_site_sprite_priority,
								width = 286,
								height = 252,
								frame_count = 5,
								line_length = 5,
								repeat_count = 16,
								animation_speed = crash_site_generator_animation_speed,
								shift = util.by_pixel(-11, -23),
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-generator/crash-site-generator-beams.png",
							priority = crash_site_sprite_priority,
							width = 48,
							height = 116,
							frame_count = 16,
							line_length = 4,
							repeat_count = 5,
							shift = util.by_pixel(24, -30),
							animation_speed = crash_site_generator_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-generator/hr-crash-site-generator-beams.png",
								priority = crash_site_sprite_priority,
								width = 224,
								height = 232,
								frame_count = 16,
								line_length = 4,
								repeat_count = 5,
								animation_speed = crash_site_generator_animation_speed,
								shift = util.by_pixel(-8, -30),
								scale = 0.5
							}
						},
						{
							filename = path .. "/graphics/entity/crash-site-generator/crash-site-generator-shadow.png",
							priority = crash_site_sprite_priority,
							width = 236,
							height = 78,
							frame_count = 1,
							line_length = 1,
							repeat_count = 80,
							shift = util.by_pixel(26, 4),
							draw_as_shadow = true,
							animation_speed = crash_site_generator_animation_speed,
							hr_version = {
								filename = path .. "/graphics/entity/crash-site-generator/hr-crash-site-generator-shadow.png",
								priority = crash_site_sprite_priority,
								width = 474,
								height = 152,
								frame_count = 1,
								line_length = 1,
								repeat_count = 80,
								draw_as_shadow = true,
								shift = util.by_pixel(25, 5),
								animation_speed = crash_site_generator_animation_speed,
								scale = 0.5
							}
						},
					}
				},
				vehicle_impact_sound = sounds.generic_impact
			},

		})
