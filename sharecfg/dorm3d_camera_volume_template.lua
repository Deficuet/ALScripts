pg = pg or {}
pg.dorm3d_camera_volume_template = {
	[2] = {
		unlock_text = "Unlocked at Intimacy Lv. 1.",
		name = "Contrast",
		volume = "contrast_volume",
		rarity = 2,
		id = 2,
		icon = "Props/drom3d_camera1001",
		desc = "Unlocks the Contrast filter for the camera feature.",
		unlock = {}
	},
	[3] = {
		unlock_text = "Unlocked at Intimacy Lv. 9.",
		name = "Twilight",
		volume = "dusk_volume",
		rarity = 2,
		id = 3,
		icon = "Props/drom3d_camera1001",
		desc = "Unlocks the Twilight filter for the camera feature.",
		unlock = {
			1,
			20220,
			9
		}
	},
	[4] = {
		unlock_text = "Unlocked at Intimacy Lv. 13.",
		name = "Soft Light",
		volume = "soft_volume",
		rarity = 2,
		id = 4,
		icon = "Props/drom3d_camera1001",
		desc = "Unlocks the Soft Light filter for the camera feature.",
		unlock = {
			1,
			20220,
			13
		}
	},
	all = {
		2,
		3,
		4
	}
}
