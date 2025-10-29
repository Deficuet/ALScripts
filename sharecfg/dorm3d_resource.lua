pg = pg or {}
pg.dorm3d_resource = setmetatable({
	__name = "dorm3d_resource",
	get_id_list_by_ship_group = {
		[20220] = {
			202201,
			202202
		},
		[30221] = {
			302211,
			302212
		},
		[19903] = {
			199031,
			199032
		},
		[10517] = {
			105171,
			105173
		},
		[30707] = {
			307071,
			307073
		}
	},
	all = {
		202201,
		202202,
		302211,
		302212,
		199031,
		199032,
		105171,
		105173,
		307071,
		307073
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_resource = {
	[202201] = {
		ship_group = 20220,
		name = "シリアス",
		remarks = "",
		type = 1,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		picture = "regular",
		switch_anim = "",
		animator = "",
		wear_anim = "",
		model_id = "tianlangxing_noshoes",
		hx_model = "",
		id = 202201,
		head_Icon = "dorm3Dchar/tianlangxing",
		tags = {},
		hidden_part = {}
	},
	[202202] = {
		ship_group = 20220,
		name = "シリアス・水着",
		remarks = "",
		type = 2,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270110,
		wear_anim = "diantou",
		unlock_text = "シリアスをビーチ配置で開放",
		model_id = "tianlangxing_swim",
		hx_model = "",
		animator = "",
		id = 202202,
		head_Icon = "dorm3Dchar/tianlangxing",
		switch_anim = "ganjin",
		picture = "regular",
		tags = {
			"beach",
			"touch"
		},
		unlock = {
			5,
			4,
			20220
		},
		hidden_part = {}
	},
	[302211] = {
		ship_group = 30221,
		name = "能代通常",
		remarks = "",
		type = 1,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		picture = "regular",
		switch_anim = "",
		animator = "",
		wear_anim = "",
		model_id = "nengdai_noshoes",
		hx_model = "",
		id = 302211,
		head_Icon = "dorm3Dchar/nengdai",
		tags = {},
		hidden_part = {}
	},
	[302212] = {
		ship_group = 30221,
		name = "能代水着",
		remarks = "",
		type = 2,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270111,
		wear_anim = "shuohua_sikao",
		unlock_text = "能代をビーチ配置で開放",
		model_id = "nengdai_swim",
		hx_model = "",
		animator = "",
		id = 302212,
		head_Icon = "dorm3Dchar/nengdai",
		switch_anim = "shuohua_chuaishou",
		picture = "regular",
		tags = {
			"beach",
			"touch"
		},
		unlock = {
			5,
			4,
			30221
		},
		hidden_part = {}
	},
	[199031] = {
		ship_group = 19903,
		name = "アンカレッジ通常",
		remarks = "",
		type = 1,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		picture = "regular",
		switch_anim = "",
		animator = "",
		wear_anim = "",
		model_id = "ankeleiqi_noshoes",
		hx_model = "",
		id = 199031,
		head_Icon = "dorm3Dchar/ankeleiqi",
		tags = {},
		hidden_part = {}
	},
	[199032] = {
		ship_group = 19903,
		name = "アンカレッジ水着",
		remarks = "",
		type = 2,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270112,
		wear_anim = "",
		unlock_text = "アンカレッジをビーチ配置で開放",
		model_id = "ankeleiqi_swim",
		hx_model = "",
		animator = "",
		id = 199032,
		head_Icon = "dorm3Dchar/ankeleiqi",
		switch_anim = "",
		picture = "regular",
		tags = {
			"beach",
			"touch"
		},
		unlock = {
			5,
			4,
			19903
		},
		hidden_part = {}
	},
	[105171] = {
		ship_group = 10517,
		name = "部屋着",
		remarks = "",
		type = 1,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		picture = "regular",
		switch_anim = "",
		animator = "",
		wear_anim = "",
		model_id = "xinzexi_noshoes",
		hx_model = "",
		id = 105171,
		head_Icon = "dorm3Dchar/xinzexi",
		tags = {},
		hidden_part = {
			{
				1,
				"oversleeve",
				"all/hoodie_geo"
			}
		}
	},
	[105173] = {
		ship_group = 10517,
		name = "バニー",
		remarks = "",
		type = 2,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270113,
		wear_anim = "",
		unlock_text = "カフェで着せ替えを開放",
		model_id = "xinzexi_bunny",
		hx_model = "",
		animator = "",
		id = 105173,
		head_Icon = "dorm3Dchar/xinzexi",
		switch_anim = "",
		picture = "regular",
		tags = {
			"cafe",
			"touch"
		},
		unlock = {
			5,
			16,
			10517
		},
		hidden_part = {}
	},
	[307071] = {
		ship_group = 30707,
		name = "部屋着",
		remarks = "",
		type = 1,
		picture = "regular",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		model_id = "dafeng_noshoes",
		hx_model = "",
		switch_anim = "",
		id = 307071,
		head_Icon = "dorm3Dchar/dafeng",
		wear_anim = "",
		tags = {},
		hidden_part = {
			{
				1,
				"oversleeve",
				"all/cloth_2_geo"
			}
		},
		stocking_pos = {
			1,
			1
		},
		stocking_geo_path = {
			"all/stocking_geo_l",
			"all/stocking_geo_r"
		}
	},
	[307073] = {
		ship_group = 30707,
		name = "バニー",
		remarks = "",
		type = 2,
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270114,
		wear_anim = "",
		unlock_text = "カフェで着せ替えを開放",
		model_id = "dafeng_bunny",
		hx_model = "",
		animator = "",
		id = 307073,
		head_Icon = "dorm3Dchar/dafeng",
		switch_anim = "",
		picture = "regular",
		tags = {
			"cafe",
			"touch"
		},
		unlock = {
			5,
			16,
			30707
		},
		hidden_part = {}
	}
}
