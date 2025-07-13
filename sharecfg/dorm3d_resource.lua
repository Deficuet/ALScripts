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
		105173
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_resource = {
	[202201] = {
		ship_group = 20220,
		name = "Sirius",
		picture = "regular",
		type = 1,
		remarks = "",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		model_id = "tianlangxing_noshoes",
		switch_anim = "",
		wear_anim = "",
		id = 202201,
		head_Icon = "dorm3Dchar/tianlangxing",
		tags = {},
		hidden_part = {}
	},
	[202202] = {
		ship_group = 20220,
		name = "Sirius (Swimsuit)",
		picture = "regular",
		type = 2,
		remarks = "",
		animator = "",
		shop_id = 270110,
		wear_anim = "diantou",
		unlock_text = "Unlocked by moving Sirius to the beach.",
		model_id = "tianlangxing_swim",
		switch_anim = "ganjin",
		id = 202202,
		head_Icon = "dorm3Dchar/tianlangxing",
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
		name = "Noshiro - Normal",
		picture = "regular",
		type = 1,
		remarks = "",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		model_id = "nengdai_noshoes",
		switch_anim = "",
		wear_anim = "",
		id = 302211,
		head_Icon = "dorm3Dchar/nengdai",
		tags = {},
		hidden_part = {}
	},
	[302212] = {
		ship_group = 30221,
		name = "Noshiro - Swimsuit",
		picture = "regular",
		type = 2,
		remarks = "",
		animator = "",
		shop_id = 270111,
		wear_anim = "shuohua_sikao",
		unlock_text = "Invite Noshiro to the beach to unlock.",
		model_id = "nengdai_swim",
		switch_anim = "shuohua_chuaishou",
		id = 302212,
		head_Icon = "dorm3Dchar/nengdai",
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
		name = "Anchorage – Normal",
		picture = "regular",
		type = 1,
		remarks = "",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		model_id = "ankeleiqi_noshoes",
		switch_anim = "",
		wear_anim = "",
		id = 199031,
		head_Icon = "dorm3Dchar/ankeleiqi",
		tags = {},
		hidden_part = {}
	},
	[199032] = {
		ship_group = 19903,
		name = "Anchorage – Swimsuit",
		picture = "regular",
		type = 2,
		remarks = "",
		animator = "",
		shop_id = 270112,
		wear_anim = "",
		unlock_text = "Invite Anchorage to the beach to unlock.",
		model_id = "ankeleiqi_swim",
		switch_anim = "",
		id = 199032,
		head_Icon = "dorm3Dchar/ankeleiqi",
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
		name = "Comfy Clothes",
		picture = "regular",
		type = 1,
		remarks = "",
		animator = "",
		shop_id = 0,
		unlock = "",
		unlock_text = "",
		model_id = "xinzexi_noshoes",
		switch_anim = "",
		wear_anim = "",
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
		name = "Bunny Girl",
		picture = "regular",
		type = 2,
		remarks = "",
		animator = "",
		shop_id = 270113,
		wear_anim = "",
		unlock_text = "Buy skin in Café.",
		model_id = "xinzexi_bunny",
		switch_anim = "",
		id = 105173,
		head_Icon = "dorm3Dchar/tianlangxing",
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
	}
}
