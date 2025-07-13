pg = pg or {}
pg.dorm3d_camera_volume_template = {
	[2] = {
		unlock_text = "親愛度Lv1で開放",
		name = "コントラスト",
		volume = "contrast_volume",
		rarity = 2,
		id = 2,
		icon = "Props/drom3d_camera1001",
		desc = "入手するとカメラ機能で「コントラスト」フィルターを適用可能",
		unlock = {}
	},
	[3] = {
		unlock_text = "親愛度Lv9で開放",
		name = "トワイライト",
		volume = "dusk_volume",
		rarity = 2,
		id = 3,
		icon = "Props/drom3d_camera1001",
		desc = "入手するとカメラ機能で「トワイライト」フィルターを適用可能",
		unlock = {
			1,
			20220,
			9
		}
	},
	[4] = {
		unlock_text = "親愛度Lv13で開放",
		name = "ソフトライト",
		volume = "soft_volume",
		rarity = 2,
		id = 4,
		icon = "Props/drom3d_camera1001",
		desc = "入手するとカメラ機能で「ソフトライト」フィルターを適用可能",
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
