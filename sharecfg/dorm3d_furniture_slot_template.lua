pg = pg or {}
pg.dorm3d_furniture_slot_template = rawget(pg, "dorm3d_furniture_slot_template") or setmetatable({
	__name = "dorm3d_furniture_slot_template"
}, confNEO)
pg.dorm3d_furniture_slot_template.all = {
	100101,
	100102,
	100201,
	100202,
	100301,
	100402,
	120101,
	120102,
	120103,
	120201,
	120202,
	120203,
	120301,
	120302,
	120303,
	130101,
	130102,
	130103,
	130201,
	130202,
	130301,
	130302,
	140101,
	1110101,
	1110102,
	1110201,
	1110202,
	1110203,
	1110204,
	1110301,
	1110302,
	1110303,
	1120101,
	1120102,
	1120103,
	1120104,
	1120203,
	1120301,
	1120302,
	1120303,
	1120304,
	1140101,
	1140102,
	1140103,
	1140201,
	1140202,
	1140301,
	1140302,
	1140303
}
pg.dorm3d_furniture_slot_template.get_id_list_by_room_id = {
	{
		100101,
		100102,
		100201,
		100202,
		100301,
		100402
	},
	{
		120101,
		120102,
		120103,
		120201,
		120202,
		120203,
		120301,
		120302,
		120303
	},
	{
		130101,
		130102,
		130103,
		130201,
		130202,
		130301,
		130302
	},
	{
		140101
	},
	[11] = {
		1110101,
		1110102,
		1110201,
		1110202,
		1110203,
		1110204,
		1110301,
		1110302,
		1110303
	},
	[12] = {
		1120101,
		1120102,
		1120103,
		1120104,
		1120203,
		1120301,
		1120302,
		1120303,
		1120304
	},
	[14] = {
		1140101,
		1140102,
		1140103,
		1140201,
		1140202,
		1140301,
		1140302,
		1140303
	}
}
pg.dorm3d_furniture_slot_template.get_id_list_by_zone_id = {
	[1001] = {
		100101,
		100102
	},
	[1002] = {
		100201,
		100202
	},
	[1003] = {
		100301
	},
	[1004] = {
		100402
	},
	[2001] = {
		120101,
		120102,
		120103
	},
	[2002] = {
		120201,
		120202,
		120203
	},
	[2003] = {
		120301,
		120302,
		120303
	},
	[3001] = {
		130101,
		130102,
		130103
	},
	[3002] = {
		130201,
		130202
	},
	[3003] = {
		130301,
		130302
	},
	[4005] = {
		140101
	},
	[11001] = {
		1110101,
		1110102
	},
	[11002] = {
		1110201,
		1110202,
		1110203,
		1110204
	},
	[11003] = {
		1110301,
		1110302,
		1110303
	},
	[12001] = {
		1120101,
		1120102,
		1120103,
		1120104
	},
	[12002] = {
		1120203
	},
	[12003] = {
		1120301,
		1120302,
		1120303,
		1120304
	},
	[14001] = {
		1140101,
		1140102,
		1140103
	},
	[14002] = {
		1140201,
		1140202
	},
	[14003] = {
		1140301,
		1140302,
		1140303
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_furniture_slot_template = {}

;(function()
	pg.base.dorm3d_furniture_slot_template[100101] = {
		id = 100101,
		name = "卧室桌子",
		type = 3,
		default_furniture = 0,
		room_id = 1,
		furniture_name = "pre_db_chandelier07",
		zone_id = 1001
	}
	pg.base.dorm3d_furniture_slot_template[100102] = {
		id = 100102,
		name = "卧室床",
		type = 4,
		default_furniture = 4,
		room_id = 1,
		furniture_name = "pre_db_bed01",
		zone_id = 1001
	}
	pg.base.dorm3d_furniture_slot_template[100201] = {
		id = 100201,
		name = "餐厅桌子",
		type = 3,
		default_furniture = 0,
		room_id = 1,
		furniture_name = "pre_db_electrical03",
		zone_id = 1002
	}
	pg.base.dorm3d_furniture_slot_template[100202] = {
		id = 100202,
		name = "餐厅椅子",
		type = 6,
		default_furniture = 1,
		room_id = 1,
		furniture_name = "pre_db_chair05_01",
		zone_id = 1002
	}
	pg.base.dorm3d_furniture_slot_template[100301] = {
		id = 100301,
		name = "客厅沙发",
		type = 5,
		default_furniture = 3,
		room_id = 1,
		furniture_name = "pre_db_chair01",
		zone_id = 1003
	}
	pg.base.dorm3d_furniture_slot_template[100402] = {
		id = 100402,
		name = "换衣间置物架",
		type = 3,
		default_furniture = 0,
		room_id = 1,
		furniture_name = "pre_db_decoration03 (1)",
		zone_id = 1004
	}
	pg.base.dorm3d_furniture_slot_template[120101] = {
		id = 120101,
		name = "卧室床边摆件",
		type = 3,
		default_furniture = 0,
		room_id = 2,
		furniture_name = "pre_db_nh_vase01",
		zone_id = 2001
	}
	pg.base.dorm3d_furniture_slot_template[120102] = {
		id = 120102,
		name = "卧室床头摆件",
		type = 3,
		default_furniture = 0,
		room_id = 2,
		furniture_name = "pre_db_nh_toy02",
		zone_id = 2001
	}
	pg.base.dorm3d_furniture_slot_template[120103] = {
		id = 120103,
		name = "卧室床",
		type = 4,
		default_furniture = 201,
		room_id = 2,
		furniture_name = "pre_db_bed02",
		zone_id = 2001
	}
	pg.base.dorm3d_furniture_slot_template[120201] = {
		id = 120201,
		name = "餐厅桌子摆件",
		type = 3,
		default_furniture = 0,
		room_id = 2,
		furniture_name = "pre_db_nh_tableware02",
		zone_id = 2002
	}
	pg.base.dorm3d_furniture_slot_template[120202] = {
		id = 120202,
		name = "餐厅墙上装饰",
		type = 3,
		default_furniture = 207,
		room_id = 2,
		furniture_name = "pre_db_nh_decoration03",
		zone_id = 2002
	}
	pg.base.dorm3d_furniture_slot_template[120203] = {
		id = 120203,
		name = "餐厅椅子",
		type = 6,
		default_furniture = 202,
		room_id = 2,
		furniture_name = "pre_db_table05a",
		zone_id = 2002
	}
	pg.base.dorm3d_furniture_slot_template[120301] = {
		id = 120301,
		name = "客厅窗边盆栽",
		type = 3,
		default_furniture = 208,
		room_id = 2,
		furniture_name = "pre_db_nh_flowerpot02",
		zone_id = 2003
	}
	pg.base.dorm3d_furniture_slot_template[120302] = {
		id = 120302,
		name = "客厅柜子摆件",
		type = 3,
		default_furniture = 0,
		room_id = 2,
		furniture_name = "pre_db_nh_vase02",
		zone_id = 2003
	}
	pg.base.dorm3d_furniture_slot_template[120303] = {
		id = 120303,
		name = "客厅沙发",
		type = 5,
		default_furniture = 203,
		room_id = 2,
		furniture_name = "pre_db_chair07",
		zone_id = 2003
	}
	pg.base.dorm3d_furniture_slot_template[130101] = {
		id = 130101,
		name = "卧室帐篷玩偶",
		type = 3,
		default_furniture = 0,
		room_id = 3,
		furniture_name = "pre_db_ah_toy05",
		zone_id = 3001
	}
	pg.base.dorm3d_furniture_slot_template[130102] = {
		id = 130102,
		name = "卧室床边摆件",
		type = 3,
		default_furniture = 0,
		room_id = 3,
		furniture_name = "pre_db_ah_pottedplant01",
		zone_id = 3001
	}
	pg.base.dorm3d_furniture_slot_template[130103] = {
		id = 130103,
		name = "卧室床",
		type = 4,
		default_furniture = 301,
		room_id = 3,
		furniture_name = "pre_db_bed03",
		zone_id = 3001
	}
	pg.base.dorm3d_furniture_slot_template[130201] = {
		id = 130201,
		name = "娱乐区画框",
		type = 3,
		default_furniture = 0,
		room_id = 3,
		furniture_name = "pre_db_ah_billboard01_group01",
		zone_id = 3002
	}
	pg.base.dorm3d_furniture_slot_template[130202] = {
		id = 130202,
		name = "娱乐区",
		type = 6,
		default_furniture = 302,
		room_id = 3,
		furniture_name = "pre_db_carpet20",
		zone_id = 3002
	}
	pg.base.dorm3d_furniture_slot_template[130301] = {
		id = 130301,
		name = "客厅窗户玩偶",
		type = 3,
		default_furniture = 0,
		room_id = 3,
		furniture_name = "pre_db_ah_decoration02",
		zone_id = 3003
	}
	pg.base.dorm3d_furniture_slot_template[130302] = {
		id = 130302,
		name = "客厅沙发",
		type = 5,
		default_furniture = 303,
		room_id = 3,
		furniture_name = "pre_db_chair15",
		zone_id = 3003
	}
	pg.base.dorm3d_furniture_slot_template[140101] = {
		id = 140101,
		name = "沙滩滑梯",
		type = 3,
		default_furniture = 0,
		room_id = 4,
		furniture_name = "Slide",
		zone_id = 4005
	}
	pg.base.dorm3d_furniture_slot_template[1110101] = {
		id = 1110101,
		name = "卧室书架",
		type = 3,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "no_bake_prop_substitute",
		zone_id = 11001
	}
	pg.base.dorm3d_furniture_slot_template[1110102] = {
		id = 1110102,
		name = "卧室床",
		type = 4,
		default_furniture = 1101,
		room_id = 11,
		furniture_name = "pre_db_bed04",
		zone_id = 11001
	}
	pg.base.dorm3d_furniture_slot_template[1110201] = {
		id = 1110201,
		name = "餐厅微波炉",
		type = 3,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "pre_db_njh_electrical03",
		zone_id = 11002
	}
	pg.base.dorm3d_furniture_slot_template[1110202] = {
		id = 1110202,
		name = "餐厅绿植",
		type = 3,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "pre_db_njh_pottedplant01",
		zone_id = 11002
	}
	pg.base.dorm3d_furniture_slot_template[1110203] = {
		id = 1110203,
		name = "冰箱",
		type = 6,
		default_furniture = 1102,
		room_id = 11,
		furniture_name = "pre_db_appliances04",
		zone_id = 11002
	}
	pg.base.dorm3d_furniture_slot_template[1110204] = {
		id = 1110204,
		name = "冰箱",
		type = 6,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "pre_db_njh_kitchen01",
		zone_id = 11002
	}
	pg.base.dorm3d_furniture_slot_template[1110301] = {
		id = 1110301,
		name = "客厅画框",
		type = 3,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "pre_db_njh_billboard01",
		zone_id = 11003
	}
	pg.base.dorm3d_furniture_slot_template[1110302] = {
		id = 1110302,
		name = "客厅水缸",
		type = 3,
		default_furniture = 0,
		room_id = 11,
		furniture_name = "pre_db_njh_fishtank01",
		zone_id = 11003
	}
	pg.base.dorm3d_furniture_slot_template[1110303] = {
		id = 1110303,
		name = "客厅沙发",
		type = 5,
		default_furniture = 1103,
		room_id = 11,
		furniture_name = "pre_db_chair19_group",
		zone_id = 11003
	}
	pg.base.dorm3d_furniture_slot_template[1120101] = {
		id = 1120101,
		name = "卧室比基尼",
		type = 3,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_cloth01",
		zone_id = 12001
	}
	pg.base.dorm3d_furniture_slot_template[1120102] = {
		id = 1120102,
		name = "卧室屏风",
		type = 3,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_frame01",
		zone_id = 12001
	}
	pg.base.dorm3d_furniture_slot_template[1120103] = {
		id = 1120103,
		name = "卧室床",
		type = 4,
		default_furniture = 1201,
		room_id = 12,
		furniture_name = "pre_db_df_bedroom01_0",
		zone_id = 12001
	}
	pg.base.dorm3d_furniture_slot_template[1120104] = {
		id = 1120104,
		name = "卧室小灯",
		type = 3,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_desklamp01",
		zone_id = 12001
	}
	pg.base.dorm3d_furniture_slot_template[1120203] = {
		id = 1120203,
		name = "餐厅餐桌",
		type = 6,
		default_furniture = 1202,
		room_id = 12,
		furniture_name = "pre_db_df_kitchen01_0",
		zone_id = 12002
	}
	pg.base.dorm3d_furniture_slot_template[1120301] = {
		id = 1120301,
		name = "客厅挂画",
		type = 3,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_wallscrolls01",
		zone_id = 12003
	}
	pg.base.dorm3d_furniture_slot_template[1120302] = {
		id = 1120302,
		name = "客厅落地灯",
		type = 3,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_floorlamp01",
		zone_id = 12003
	}
	pg.base.dorm3d_furniture_slot_template[1120303] = {
		id = 1120303,
		name = "客厅沙发",
		type = 5,
		default_furniture = 1203,
		room_id = 12,
		furniture_name = "pre_db_df_livingroom01_0",
		zone_id = 12003
	}
	pg.base.dorm3d_furniture_slot_template[1120304] = {
		id = 1120304,
		name = "客厅特典",
		type = 99,
		default_furniture = 0,
		room_id = 12,
		furniture_name = "pre_db_df_tedian01",
		zone_id = 12003
	}
	pg.base.dorm3d_furniture_slot_template[1140101] = {
		id = 1140101,
		name = "卧室床",
		type = 4,
		default_furniture = 1401,
		room_id = 14,
		furniture_name = "pre_db_aijier_bed01_0",
		zone_id = 14001
	}
	pg.base.dorm3d_furniture_slot_template[1140102] = {
		id = 1140102,
		name = "卧室相机",
		type = 3,
		default_furniture = 0,
		room_id = 14,
		furniture_name = "pre_db_aje_camera01",
		zone_id = 14001
	}
	pg.base.dorm3d_furniture_slot_template[1140103] = {
		id = 1140103,
		name = "卧室台灯",
		type = 3,
		default_furniture = 0,
		room_id = 14,
		furniture_name = "pre_db_aje_desklamp01",
		zone_id = 14001
	}
	pg.base.dorm3d_furniture_slot_template[1140201] = {
		id = 1140201,
		name = "书房书桌",
		type = 6,
		default_furniture = 1402,
		room_id = 14,
		furniture_name = "pre_db_aijier_study01_0",
		zone_id = 14002
	}
	pg.base.dorm3d_furniture_slot_template[1140202] = {
		id = 1140202,
		name = "书房盆栽",
		type = 3,
		default_furniture = 0,
		room_id = 14,
		furniture_name = "pre_db_aje_bonsai01",
		zone_id = 14002
	}
	pg.base.dorm3d_furniture_slot_template[1140301] = {
		id = 1140301,
		name = "客厅沙发",
		type = 5,
		default_furniture = 1403,
		room_id = 14,
		furniture_name = "pre_db_aijier_living01_0",
		zone_id = 14003
	}
	pg.base.dorm3d_furniture_slot_template[1140302] = {
		id = 1140302,
		name = "客厅相框",
		type = 3,
		default_furniture = 0,
		room_id = 14,
		furniture_name = "pre_db_aje_billboard01",
		zone_id = 14003
	}
	pg.base.dorm3d_furniture_slot_template[1140303] = {
		id = 1140303,
		name = "客厅蜡烛",
		type = 3,
		default_furniture = 0,
		room_id = 14,
		furniture_name = "pre_db_aje_decoration01",
		zone_id = 14003
	}
end)()
