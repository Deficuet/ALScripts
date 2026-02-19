pg = pg or {}
pg.dorm3d_resource = setmetatable({
	__name = "dorm3d_resource",
	get_id_list_by_ship_group = {
		[20220] = {
			202201,
			202202,
			202203
		},
		[30221] = {
			302211,
			302212
		},
		[19903] = {
			199031,
			199032,
			199033
		},
		[10517] = {
			105171,
			105173
		},
		[30707] = {
			307071,
			307073
		},
		[49905] = {
			499051,
			499053
		}
	},
	all = {
		202201,
		202202,
		202203,
		302211,
		302212,
		199031,
		199032,
		199033,
		105171,
		105173,
		307071,
		307073,
		499051,
		499053
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_resource = {
	[202201] = {
		ship_group = 20220,
		name = "天狼星",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_tianlangxing_db_noshoes_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/tianlangxing",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "tianlangxing_noshoes",
		id = 202201,
		hidden_part_apply_in_timeline = 0,
		tags = {},
		hidden_part = {}
	},
	[202202] = {
		ship_group = 20220,
		name = "天狼星泳装",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270110,
		origin_model = "pre_char_tianlangxing_swim_noshoes_mod",
		unlock_text = "在沙滩中邀请天狼星解锁",
		animator = "",
		switch_anim = "ganjin",
		head_Icon = "dorm3Dchar/tianlangxing",
		hx_component = "",
		picture = "regular",
		wear_anim = "diantou",
		model_id = "tianlangxing_swim",
		id = 202202,
		hidden_part_apply_in_timeline = 0,
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
	[202203] = {
		ship_group = 20220,
		name = "天狼星兔女郎",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270116,
		origin_model = "pre_char_tianlangxing_bunny_mod",
		unlock_text = "在咖啡馆中购买角色皮肤",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/tianlangxing",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "tianlangxing_bunny",
		id = 202203,
		hidden_part_apply_in_timeline = 0,
		tags = {
			"cafe",
			"touch"
		},
		unlock = {
			5,
			16,
			20220
		},
		hidden_part = {}
	},
	[302211] = {
		ship_group = 30221,
		name = "{namecode:50}常服",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_nengdai_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/nengdai",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "nengdai_noshoes",
		id = 302211,
		hidden_part_apply_in_timeline = 0,
		tags = {},
		hidden_part = {}
	},
	[302212] = {
		ship_group = 30221,
		name = "{namecode:50}泳装",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270111,
		origin_model = "pre_char_nengdai_swim_mod",
		unlock_text = "在沙滩中邀请能代解锁",
		animator = "",
		switch_anim = "shuohua_chuaishou",
		head_Icon = "dorm3Dchar/nengdai",
		hx_component = "",
		picture = "regular",
		wear_anim = "shuohua_sikao",
		model_id = "nengdai_swim",
		id = 302212,
		hidden_part_apply_in_timeline = 0,
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
		name = "安克雷奇常服",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_ankeleiqi_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/ankeleiqi",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "ankeleiqi_noshoes",
		id = 199031,
		hidden_part_apply_in_timeline = 0,
		tags = {},
		hidden_part = {}
	},
	[199032] = {
		ship_group = 19903,
		name = "安克雷奇泳装",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270112,
		origin_model = "pre_char_ankeleiqi_swim_mod",
		unlock_text = "在沙滩中邀请安克雷奇解锁",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/ankeleiqi",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "ankeleiqi_swim",
		id = 199032,
		hidden_part_apply_in_timeline = 0,
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
	[199033] = {
		ship_group = 19903,
		name = "安克雷奇丝袜常服",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_ankeleiqi_stock_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/ankeleiqi",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "ankeleiqi_stock",
		id = 199033,
		hidden_part_apply_in_timeline = 0,
		tags = {},
		hidden_part = {}
	},
	[105171] = {
		ship_group = 10517,
		name = "{namecode:199}常服",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_xinzexi_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/xinzexi",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "xinzexi_noshoes",
		id = 105171,
		hidden_part_apply_in_timeline = 0,
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
		name = "{namecode:199}兔女郎",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270113,
		origin_model = "pre_char_xinzexi_bunny_mod",
		unlock_text = "在咖啡馆中购买角色皮肤",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/xinzexi",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "xinzexi_bunny",
		id = 105173,
		hidden_part_apply_in_timeline = 0,
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
		name = "{namecode:97}常服",
		type = 1,
		remarks = "",
		origin_model = "pre_char_dafeng_mod",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/dafeng",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "dafeng_noshoes",
		id = 307071,
		hidden_part_apply_in_timeline = 0,
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
		name = "{namecode:97}兔女郎",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270114,
		origin_model = "pre_char_dafeng_bunny_mod",
		unlock_text = "在咖啡馆中购买角色皮肤",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/dafeng",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "dafeng_bunny",
		id = 307073,
		hidden_part_apply_in_timeline = 0,
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
	},
	[499051] = {
		ship_group = 49905,
		name = "{namecode:480}常服",
		type = 1,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		origin_model = "pre_char_aijier_mod",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/aijier",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "aijier_noshoes",
		id = 499051,
		hidden_part_apply_in_timeline = 0,
		tags = {},
		hidden_part = {}
	},
	[499053] = {
		ship_group = 49905,
		name = "{namecode:480}兔女郎",
		type = 2,
		remarks = "",
		stocking_pos = "",
		stocking_geo_path = "",
		shop_id = 270115,
		origin_model = "pre_char_aijier_bunny_mod",
		unlock_text = "在咖啡馆中购买角色皮肤",
		animator = "",
		switch_anim = "",
		head_Icon = "dorm3Dchar/aijier",
		hx_component = "",
		picture = "regular",
		wear_anim = "",
		model_id = "aijier_bunny",
		id = 499053,
		hidden_part_apply_in_timeline = 0,
		tags = {
			"cafe",
			"touch"
		},
		unlock = {
			5,
			16,
			49905
		},
		hidden_part = {}
	}
}
