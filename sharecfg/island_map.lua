pg = pg or {}
pg.island_map = {
	[1001] = {
		name = "Farm",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1001,
		desc = "The center of the island abounds with rich soil, ranches, and farmland. Greens are constantly growing and being brought to dinner tables from the fertile earth here.",
		sceneName = "Island/ScenesRes/Scenes/Ranch/map_xyd_ranch",
		save_transform = 1,
		default_bgm = "story-richang-10",
		born_object = 10010064,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1002] = {
		name = "Island Harbor",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1002,
		desc = "The glittering pearl in the south of the island – ships are always coming and going from this harbor. A café sits alongside the pier, and even amid all the efficiency-oriented logistics buildings, there is still warmth to be found.",
		sceneName = "Island/ScenesRes/Scenes/Fishery/map_xyd_fishery",
		save_transform = 1,
		default_bgm = "story-richang-2",
		born_object = 10020001,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1003] = {
		name = "Get-Together Island",
		minigame_id = 0,
		time = "always",
		loading = 1,
		id = 1003,
		desc = "Located away from the island proper, this is a closed-off and special place. It's the only one where the winds carry greetings from afar, and its replies, too, are sent on long journeys.",
		sceneName = "Island/ScenesRes/Scenes/jhs_autumn/map_jhs_autumn",
		save_transform = 1,
		default_bgm = "theme-myisland",
		born_object = 10030001,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1004] = {
		name = "Plains",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1004,
		desc = "Covered in thick trees and home to untouched and abundant minerals, this western part of the island offers much aid to the island's development in the form of nigh-endless lumber and ore.",
		sceneName = "Island/ScenesRes/Scenes/Fell/map_xyd_fell",
		save_transform = 1,
		default_bgm = "story-richang-10",
		born_object = 10040024,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1005] = {
		name = "Plantation",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1005,
		desc = "Located in the south of the island is a lush green orchard that smells wonderfully. Sweet fruits grow unimpaired here, graced by the sun's warming light.",
		sceneName = "Island/ScenesRes/Scenes/Orchard/map_xyd_orchard",
		save_transform = 1,
		default_bgm = "story-richang-10",
		born_object = 10050001,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1006] = {
		name = "Commercial",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1006,
		desc = "The commercial area, where flavors from all around the world dance together. With its wide array of culinary experiences on offer, this place is the most vibrant and bustling leisure spot on the whole island.",
		sceneName = "Island/ScenesRes/Scenes/Commercial/map_xyd_commercial",
		save_transform = 1,
		default_bgm = "story-richang-6",
		born_object = 10060001,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1007] = {
		name = "Island Base",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1007,
		desc = "At the island's center is where the rumble of factories and the spark of ingenuity resound. Here, cutting-edge research is carried out, and productivity improvements and innovations are a daily occurrence. Still, bear in mind that it's a secret base.",
		sceneName = "island/scenesres/scenes/factory/map_xyd_factory_01",
		save_transform = 1,
		default_bgm = "story-richang-9",
		born_object = 10070001,
		camera_zoom = {
			0.5,
			1,
			0.5
		}
	},
	[1009] = {
		name = "Café Manjuu",
		minigame_id = 0,
		time = "always",
		loading = 0,
		id = 1009,
		desc = "",
		sceneName = "Island/ScenesRes/Scenes/CoffeeShop/map_coffeeshop_01",
		save_transform = 1,
		default_bgm = "story-richang-4",
		born_object = 10090001,
		camera_zoom = {
			0.3,
			0.8,
			0.5
		}
	},
	[1010] = {
		name = "Café Manjuu",
		minigame_id = 1,
		time = "always",
		loading = 0,
		id = 1010,
		desc = "",
		sceneName = "Island/ScenesRes/Scenes/CoffeeShop/map_coffeeshop_01",
		save_transform = 0,
		default_bgm = "story-battle-16bit-SFC",
		born_object = 10100001,
		camera_zoom = {
			0.3,
			0.8,
			0.5
		}
	},
	all = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1009,
		1010
	}
}
