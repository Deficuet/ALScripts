pg = pg or {}
pg.dorm3d_zone_template = rawget(pg, "dorm3d_zone_template") or setmetatable({
	__name = "dorm3d_zone_template"
}, confNEO)
pg.dorm3d_zone_template.all = {
	1000,
	1001,
	1002,
	1003,
	2001,
	2002,
	2003,
	3001,
	3002,
	3003,
	4001,
	4002,
	4003,
	4004,
	4005,
	11001,
	11002,
	11003,
	12001,
	12002,
	12003,
	14001,
	14002,
	14003,
	16001,
	16002,
	16003,
	16004
}
pg.dorm3d_zone_template.get_id_list_by_room_id = {
	{
		1000,
		1001,
		1002,
		1003
	},
	{
		2001,
		2002,
		2003
	},
	{
		3001,
		3002,
		3003
	},
	{
		4001,
		4002,
		4003,
		4004,
		4005
	},
	[11] = {
		11001,
		11002,
		11003
	},
	[12] = {
		12001,
		12002,
		12003
	},
	[14] = {
		14001,
		14002,
		14003
	},
	[16] = {
		16001,
		16002,
		16003,
		16004
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_zone_template = {}

;(function()
	pg.base.dorm3d_zone_template[1000] = {
		is_global = 1,
		name = "全局区域",
		type_prioritys = "",
		room_id = 1,
		id = 1000,
		touch_id = "",
		watch_camera = "",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[1001] = {
		is_global = 0,
		name = "卧室",
		room_id = 1,
		id = 1001,
		touch_id = "",
		watch_camera = "Bed",
		type_prioritys = {
			4,
			3,
			2,
			1
		},
		special_action = {
			{
				20220,
				{
					"jinzhang",
					"dianshouzhi"
				}
			}
		}
	}
	pg.base.dorm3d_zone_template[1002] = {
		is_global = 0,
		name = "餐厅",
		type_prioritys = "",
		room_id = 1,
		id = 1002,
		touch_id = "",
		watch_camera = "Table",
		special_action = {
			{
				20220,
				{
					"jinzhang",
					"dianshouzhi"
				}
			}
		}
	}
	pg.base.dorm3d_zone_template[1003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 1,
		id = 1003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = {
			{
				20220,
				{
					"jinzhang",
					"dianshouzhi"
				}
			}
		}
	}
	pg.base.dorm3d_zone_template[2001] = {
		is_global = 0,
		name = "卧室",
		type_prioritys = "",
		room_id = 2,
		id = 2001,
		touch_id = "",
		watch_camera = "Bed",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[2002] = {
		is_global = 0,
		name = "餐厅",
		type_prioritys = "",
		room_id = 2,
		id = 2002,
		touch_id = "",
		watch_camera = "Table",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[2003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 2,
		id = 2003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[3001] = {
		is_global = 0,
		name = "卧室",
		type_prioritys = "",
		room_id = 3,
		id = 3001,
		touch_id = "",
		watch_camera = "Bed",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[3002] = {
		is_global = 0,
		name = "娱乐区",
		type_prioritys = "",
		room_id = 3,
		id = 3002,
		touch_id = "",
		watch_camera = "Table",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[3003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 3,
		id = 3003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[4001] = {
		is_global = 0,
		name = "入口",
		type_prioritys = "",
		id = 4001,
		room_id = 4,
		watch_camera = "Default",
		touch_id = {
			{
				20220,
				201
			}
		},
		special_action = {
			{
				20220,
				{
					"jinzhang",
					"dianshouzhi"
				}
			}
		}
	}
	pg.base.dorm3d_zone_template[4002] = {
		is_global = 0,
		name = "沙滩椅",
		type_prioritys = "",
		id = 4002,
		room_id = 4,
		watch_camera = "Tianlangxing",
		touch_id = {
			{
				20220,
				201
			}
		},
		special_action = {
			{
				20220,
				{
					"jinzhang",
					"dianshouzhi"
				}
			}
		}
	}
	pg.base.dorm3d_zone_template[4003] = {
		is_global = 0,
		name = "遮阳伞",
		type_prioritys = "",
		id = 4003,
		room_id = 4,
		watch_camera = "Nengdai",
		touch_id = {
			{
				30221,
				2210110
			}
		},
		special_action = {}
	}
	pg.base.dorm3d_zone_template[4004] = {
		is_global = 0,
		name = "海滩",
		type_prioritys = "",
		id = 4004,
		room_id = 4,
		watch_camera = "Ankeleiqi",
		touch_id = {
			{
				19903,
				1990390
			}
		},
		special_action = {}
	}
	pg.base.dorm3d_zone_template[4005] = {
		is_global = 0,
		name = "滑梯",
		type_prioritys = "",
		id = 4005,
		room_id = 4,
		watch_camera = "Slide",
		touch_id = {
			{
				19903,
				1990390
			}
		},
		special_action = {}
	}
	pg.base.dorm3d_zone_template[11001] = {
		is_global = 0,
		name = "卧室",
		type_prioritys = "",
		room_id = 11,
		id = 11001,
		touch_id = "",
		watch_camera = "Bed",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[11002] = {
		is_global = 0,
		name = "餐厅",
		type_prioritys = "",
		room_id = 11,
		id = 11002,
		touch_id = "",
		watch_camera = "Table",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[11003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 11,
		id = 11003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[12001] = {
		is_global = 0,
		name = "卧室",
		type_prioritys = "",
		room_id = 12,
		id = 12001,
		touch_id = "",
		watch_camera = "Bed",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[12002] = {
		is_global = 0,
		name = "餐厅",
		type_prioritys = "",
		room_id = 12,
		id = 12002,
		touch_id = "",
		watch_camera = "Table",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[12003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 12,
		id = 12003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[14001] = {
		is_global = 0,
		name = "卧室",
		type_prioritys = "",
		room_id = 14,
		id = 14001,
		touch_id = "",
		watch_camera = "Bed",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[14002] = {
		is_global = 0,
		name = "书房",
		type_prioritys = "",
		room_id = 14,
		id = 14002,
		touch_id = "",
		watch_camera = "Table",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[14003] = {
		is_global = 0,
		name = "客厅",
		type_prioritys = "",
		room_id = 14,
		id = 14003,
		touch_id = "",
		watch_camera = "Chair",
		special_action = ""
	}
	pg.base.dorm3d_zone_template[16001] = {
		is_global = 0,
		name = "舞池",
		type_prioritys = "",
		special_action = "",
		id = 16001,
		room_id = 16,
		watch_camera = "xinzexi",
		touch_id = {
			{
				10517,
				1051790
			}
		}
	}
	pg.base.dorm3d_zone_template[16002] = {
		is_global = 0,
		name = "吧台",
		type_prioritys = "",
		special_action = "",
		id = 16002,
		room_id = 16,
		watch_camera = "dafeng",
		touch_id = {
			{
				30707,
				3070790
			}
		}
	}
	pg.base.dorm3d_zone_template[16003] = {
		is_global = 0,
		name = "卡座",
		type_prioritys = "",
		special_action = "",
		id = 16003,
		room_id = 16,
		watch_camera = "aijier",
		touch_id = {
			{
				49905,
				4990590
			}
		}
	}
	pg.base.dorm3d_zone_template[16004] = {
		is_global = 0,
		name = "休息区",
		type_prioritys = "",
		special_action = "",
		id = 16004,
		room_id = 16,
		watch_camera = "tianlangxing",
		touch_id = {
			{
				20220,
				10100401
			}
		}
	}
end)()
