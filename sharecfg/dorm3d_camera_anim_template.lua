pg = pg or {}
pg.dorm3d_camera_anim_template = rawget(pg, "dorm3d_camera_anim_template") or setmetatable({
	__name = "dorm3d_camera_anim_template"
}, confNEO)
pg.dorm3d_camera_anim_template.all = {
	1001,
	1002,
	1003,
	1004,
	1005,
	1006,
	1007,
	1008,
	1009,
	1010,
	1011,
	1012,
	1101,
	1102,
	1103,
	1104,
	1201,
	1202,
	1203,
	1301,
	1302,
	1303,
	1304,
	1305,
	1306,
	1307,
	1308,
	1309,
	1310,
	1311,
	1312,
	1313,
	1314,
	1317,
	1318,
	1319,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006,
	2007,
	2008,
	2009,
	2010,
	2011,
	2012,
	2013,
	2101,
	2102,
	2103,
	2104,
	2201,
	2202,
	2203,
	2204,
	2301,
	2302,
	2303,
	2304,
	2401,
	2402,
	2403,
	2404,
	2405,
	2501,
	2502,
	2503,
	2504,
	2505,
	2601,
	2602,
	2603,
	2604,
	2605,
	2606,
	2607,
	3001,
	3002,
	3003,
	3005,
	3006,
	3007,
	3008,
	3010,
	3011,
	3012,
	3013,
	3014,
	3015,
	3016,
	3017,
	3018,
	3101,
	3102,
	3103,
	3104,
	3201,
	3202,
	3203,
	3204,
	3301,
	3302,
	3303,
	3304,
	3401,
	3402,
	3403,
	3404,
	3405,
	3501,
	3502,
	3503,
	3504,
	3505,
	3601,
	3602,
	3603,
	3604,
	3605,
	3701,
	3702,
	3703,
	3704,
	3705,
	3706,
	3707,
	3708,
	3709,
	4001,
	4002,
	4003,
	4004,
	4005,
	4201,
	4202,
	4203,
	4204,
	4205,
	4301,
	4302,
	4303,
	4304,
	4401,
	4402,
	4403,
	4404,
	4405,
	11001,
	11002,
	11003,
	11004,
	11005,
	11006,
	11007,
	11008,
	11009,
	11010,
	11011,
	11012,
	11013,
	11014,
	11101,
	11102,
	11103,
	11104,
	11201,
	11202,
	11203,
	11204,
	11301,
	11302,
	11303,
	11304,
	11401,
	11402,
	11403,
	11404,
	11405,
	11406,
	11407,
	11408,
	11501,
	11502,
	11503,
	11504,
	11505,
	11506,
	11507,
	11508,
	11509,
	11510,
	11701,
	11702,
	11703,
	11704,
	11705,
	11706,
	11707,
	12001,
	12002,
	12003,
	12004,
	12005,
	12006,
	12007,
	12008,
	12009,
	12010,
	12011,
	12012,
	12013,
	12014,
	12015,
	12016,
	12017,
	12018,
	12019,
	12101,
	12102,
	12103,
	12104,
	12201,
	12202,
	12203,
	12204,
	12301,
	12302,
	12303,
	12304,
	12401,
	12402,
	12403,
	12404,
	12405,
	12406,
	12407,
	11601,
	11602,
	11603,
	11604,
	11605,
	11606,
	11607,
	11608,
	12501,
	12502,
	12503,
	12504,
	12505,
	12506,
	12507,
	12508,
	12509,
	12601,
	12602,
	12603,
	12604,
	12605,
	12606,
	12607,
	14001,
	14002,
	14003,
	14004,
	14005,
	14006,
	14007,
	14008,
	14009,
	14010,
	14011,
	14012,
	14013,
	14014,
	14015,
	14101,
	14102,
	14103,
	14104,
	14201,
	14202,
	14203,
	14204,
	14301,
	14302,
	14303,
	14304,
	14401,
	14402,
	14403,
	14404,
	14405,
	14406,
	14501,
	14502,
	14503,
	14504,
	14505,
	14506,
	14507,
	16001,
	16002,
	16003,
	16004,
	16005,
	16006,
	16007,
	16008,
	16009,
	16010,
	16011,
	16012,
	16013,
	16014,
	16015,
	16016,
	16017,
	16018,
	16019,
	16020,
	21001,
	21002,
	21003,
	21004,
	21005,
	21006,
	21007,
	21008,
	21009,
	21010,
	21011,
	21012,
	21013,
	21014,
	21015,
	21101,
	21102,
	21103,
	21104,
	21201,
	21202,
	21203,
	21204,
	21301,
	21302,
	21303,
	21304,
	21401,
	21402,
	21403,
	21404,
	21405,
	26001,
	26002,
	26003,
	26004,
	26005
}
pg.dorm3d_camera_anim_template.get_id_list_by_furniture_id = {
	[0] = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
		1010,
		1011,
		1012,
		2001,
		2002,
		2003,
		2004,
		2005,
		2006,
		2007,
		2008,
		2009,
		2010,
		2011,
		2012,
		2013,
		3001,
		3002,
		3003,
		3005,
		3006,
		3007,
		3008,
		3010,
		3011,
		3012,
		3013,
		3014,
		3015,
		3016,
		3017,
		3018,
		4001,
		4002,
		4003,
		4004,
		4005,
		4201,
		4202,
		4203,
		4204,
		4205,
		4401,
		4402,
		4403,
		4404,
		4405,
		11001,
		11002,
		11003,
		11004,
		11005,
		11006,
		11007,
		11008,
		11009,
		11010,
		11011,
		11012,
		11013,
		11014,
		12001,
		12002,
		12003,
		12004,
		12005,
		12006,
		12007,
		12008,
		12009,
		12010,
		12011,
		12012,
		12013,
		12014,
		12015,
		12016,
		12017,
		12018,
		12019,
		14001,
		14002,
		14003,
		14004,
		14005,
		14006,
		14007,
		14008,
		14009,
		14010,
		14011,
		14012,
		14013,
		14014,
		14015,
		16001,
		16002,
		16003,
		16004,
		16005,
		16006,
		16007,
		16008,
		16009,
		16010,
		16011,
		16012,
		16013,
		16014,
		16015,
		16016,
		16017,
		16018,
		16019,
		16020,
		21001,
		21002,
		21003,
		21004,
		21005,
		21006,
		21007,
		21008,
		21009,
		21010,
		21011,
		21012,
		21013,
		21014,
		21015,
		26001,
		26002,
		26003,
		26004,
		26005
	},
	{
		1201,
		1202,
		1203
	},
	[3] = {
		1101,
		1102,
		1103,
		1104
	},
	[4] = {
		1301,
		1302,
		1303
	},
	[121] = {
		1304,
		1305,
		1306,
		1307
	},
	[122] = {
		1308,
		1309,
		1310,
		1311
	},
	[151] = {
		1312,
		1313,
		1314,
		1317,
		1318,
		1319
	},
	[201] = {
		2201,
		2202,
		2203,
		2204
	},
	[202] = {
		2301,
		2302,
		2303,
		2304
	},
	[203] = {
		2101,
		2102,
		2103,
		2104
	},
	[221] = {
		2401,
		2402,
		2403,
		2404,
		2405
	},
	[222] = {
		4301,
		4302,
		4303,
		4304
	},
	[223] = {
		2601,
		2602,
		2603,
		2604,
		2605,
		2606,
		2607
	},
	[251] = {
		2501,
		2502,
		2503,
		2504,
		2505
	},
	[301] = {
		3101,
		3102,
		3103,
		3104
	},
	[302] = {
		3301,
		3302,
		3303,
		3304
	},
	[303] = {
		3201,
		3202,
		3203,
		3204
	},
	[321] = {
		3401,
		3402,
		3403,
		3404,
		3405
	},
	[322] = {
		3501,
		3502,
		3503,
		3504,
		3505
	},
	[323] = {
		3601,
		3602,
		3603,
		3604,
		3605
	},
	[324] = {
		3701,
		3702,
		3703,
		3704,
		3705,
		3706,
		3707,
		3708,
		3709
	},
	[1101] = {
		11301,
		11302,
		11303,
		11304
	},
	[1102] = {
		11101,
		11102,
		11103,
		11104
	},
	[1103] = {
		11201,
		11202,
		11203,
		11204
	},
	[1151] = {
		11401,
		11402,
		11403,
		11404,
		11405,
		11406,
		11407,
		11408
	},
	[1152] = {
		11501,
		11502,
		11503,
		11504,
		11505,
		11506,
		11507,
		11508,
		11509,
		11510
	},
	[1153] = {
		11601,
		11602,
		11603,
		11604,
		11605,
		11606,
		11607,
		11608
	},
	[1154] = {
		11701,
		11702,
		11703,
		11704,
		11705,
		11706,
		11707
	},
	[1201] = {
		12101,
		12102,
		12103,
		12104
	},
	[1202] = {
		12201,
		12202,
		12203,
		12204
	},
	[1203] = {
		12301,
		12302,
		12303,
		12304
	},
	[1221] = {
		12401,
		12402,
		12403,
		12404,
		12405,
		12406,
		12407
	},
	[1222] = {
		12501,
		12502,
		12503,
		12504,
		12505,
		12506,
		12507,
		12508,
		12509
	},
	[1223] = {
		12601,
		12602,
		12603,
		12604,
		12605,
		12606,
		12607
	},
	[1401] = {
		14101,
		14102,
		14103,
		14104
	},
	[1402] = {
		14201,
		14202,
		14203,
		14204
	},
	[1403] = {
		14301,
		14302,
		14303,
		14304
	},
	[1461] = {
		14401,
		14402,
		14403,
		14404,
		14405,
		14406
	},
	[1462] = {
		14501,
		14502,
		14503,
		14504,
		14505,
		14506,
		14507
	},
	[2101] = {
		21301,
		21302,
		21303,
		21304
	},
	[2102] = {
		21101,
		21102,
		21103,
		21104
	},
	[2103] = {
		21201,
		21202,
		21203,
		21204
	},
	[2161] = {
		21401,
		21402,
		21403,
		21404,
		21405
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_camera_anim_template = {}

;(function()
	pg.base.dorm3d_camera_anim_template[1001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "Idle",
		desc = "站立",
		staypoint = "",
		id = 1001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1002] = {
		anim_time = 3.333,
		unlock = "",
		ship_group = 20220,
		state = "Bow",
		desc = "鞠躬",
		staypoint = "",
		id = 1002,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action2",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1003] = {
		anim_time = 9,
		unlock = "",
		ship_group = 20220,
		state = "sikao1",
		desc = "思考 ",
		staypoint = "",
		id = 1003,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action3",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1004] = {
		anim_time = 9.833,
		unlock = "",
		ship_group = 20220,
		state = "sikao2",
		desc = "疑惑",
		staypoint = "",
		id = 1004,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action4",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1005] = {
		anim_time = 5.7,
		unlock = "",
		ship_group = 20220,
		state = "shy",
		desc = "害羞 ",
		staypoint = "",
		id = 1005,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action5",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1006] = {
		anim_time = 7.533,
		unlock = "",
		ship_group = 20220,
		state = "surprise2",
		desc = "惊讶 ",
		staypoint = "",
		id = 1006,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action6",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1007] = {
		anim_time = 8.333,
		unlock = "",
		ship_group = 20220,
		state = "beishang",
		desc = "悲伤 ",
		staypoint = "",
		id = 1007,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action7",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1008] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 20220,
		state = "biaoda",
		desc = "自信",
		staypoint = "",
		id = 1008,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action8",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1009] = {
		anim_time = 7.333,
		unlock = "",
		ship_group = 20220,
		state = "jieshao",
		desc = "介绍 ",
		staypoint = "",
		id = 1009,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action9",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1010] = {
		anim_time = 6.33,
		unlock = "",
		ship_group = 20220,
		state = "rentong",
		desc = "认同 ",
		staypoint = "",
		id = 1010,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action10",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1011] = {
		anim_time = 9.5,
		unlock = "",
		ship_group = 20220,
		state = "dianshouzhi",
		desc = "对手指",
		staypoint = "",
		id = 1011,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action11",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1012] = {
		anim_time = 6.333,
		unlock = "",
		ship_group = 20220,
		state = "ganjin",
		desc = "充满干劲 ",
		staypoint = "",
		id = 1012,
		pre_anim = 1001,
		zone = "",
		icon = "camera_action12",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 1001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "Sit",
		desc = "坐下",
		staypoint = "Pos100310",
		id = 1101,
		pre_anim = 0,
		zone = "1003",
		icon = "camera_action13",
		room = 1,
		enter_extra_item = "",
		furniture_id = 3,
		finish_anim = 1101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1102] = {
		anim_time = 6,
		unlock = "",
		ship_group = 20220,
		state = "zuo_sikao",
		desc = "思考 ",
		staypoint = "Pos100310",
		id = 1102,
		pre_anim = 1101,
		zone = "1003",
		icon = "camera_action15",
		room = 1,
		enter_extra_item = "",
		furniture_id = 3,
		finish_anim = 1101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1103] = {
		anim_time = 9.167,
		unlock = "",
		ship_group = 20220,
		state = "zuo_hudong_jiao",
		desc = "轻抚",
		staypoint = "Pos100310",
		id = 1103,
		pre_anim = 1101,
		zone = "1003",
		icon = "camera_action18",
		room = 1,
		enter_extra_item = "",
		furniture_id = 3,
		finish_anim = 1101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1104] = {
		anim_time = 7.5,
		unlock = "",
		ship_group = 20220,
		state = "zuo_hudong_tou",
		desc = "蹭动",
		staypoint = "Pos100310",
		id = 1104,
		pre_anim = 1101,
		zone = "1003",
		icon = "camera_action19",
		room = 1,
		enter_extra_item = "",
		furniture_id = 3,
		finish_anim = 1101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "SitH",
		desc = "坐下 ",
		staypoint = "Pos100110",
		id = 1201,
		pre_anim = 0,
		zone = "1002",
		icon = "camera_action20",
		room = 1,
		enter_extra_item = "",
		furniture_id = 1,
		finish_anim = 1201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1202] = {
		anim_time = 8,
		unlock = "",
		ship_group = 20220,
		state = "G_zuo_hudong_tou",
		desc = "俏皮",
		staypoint = "Pos100110",
		id = 1202,
		pre_anim = 1201,
		zone = "1002",
		icon = "camera_action21",
		room = 1,
		enter_extra_item = "",
		furniture_id = 1,
		finish_anim = 1201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1203] = {
		anim_time = 6,
		unlock = "",
		ship_group = 20220,
		state = "G_zuo_hudong_jiao",
		desc = "晃动",
		staypoint = "Pos100110",
		id = 1203,
		pre_anim = 1201,
		zone = "1002",
		icon = "camera_action24",
		room = 1,
		enter_extra_item = "",
		furniture_id = 1,
		finish_anim = 1201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "GoToBedL",
		desc = "躺下",
		staypoint = "Pos100410",
		id = 1301,
		pre_anim = 0,
		zone = "1001",
		icon = "camera_action25",
		room = 1,
		enter_extra_item = "",
		furniture_id = 4,
		finish_anim = 1301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1302] = {
		anim_time = 9.667,
		unlock = "",
		ship_group = 20220,
		state = "shui_hudong_datui",
		desc = "查看",
		staypoint = "Pos100410",
		id = 1302,
		pre_anim = 1301,
		zone = "1001",
		icon = "camera_action27",
		room = 1,
		enter_extra_item = "",
		furniture_id = 4,
		finish_anim = 1301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1303] = {
		anim_time = 7.133,
		unlock = "",
		ship_group = 20220,
		state = "shui_hudong_jiao",
		desc = "摸头",
		staypoint = "Pos100410",
		id = 1303,
		pre_anim = 1301,
		zone = "1001",
		icon = "camera_action29",
		room = 1,
		enter_extra_item = "",
		furniture_id = 4,
		finish_anim = 1301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1304] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "PayGoToBed",
		desc = "趴下",
		staypoint = "Pos100710",
		id = 1304,
		pre_anim = 0,
		zone = "1001",
		icon = "camera_action32",
		room = 1,
		enter_extra_item = "",
		furniture_id = 121,
		finish_anim = 1304,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1305] = {
		anim_time = 11.833,
		unlock = "",
		ship_group = 20220,
		state = "chuang_FF_2_beibu_1",
		desc = "伸懒腰",
		staypoint = "Pos100710",
		id = 1305,
		pre_anim = 1304,
		zone = "1001",
		icon = "camera_action33",
		room = 1,
		enter_extra_item = "",
		furniture_id = 121,
		finish_anim = 1304,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1306] = {
		anim_time = 10.333,
		unlock = "",
		ship_group = 20220,
		state = "chuang_FF_2_pigu_2",
		desc = "猫式伸展",
		staypoint = "Pos100710",
		id = 1306,
		pre_anim = 1304,
		zone = "1001",
		icon = "camera_action34",
		room = 1,
		enter_extra_item = "",
		furniture_id = 121,
		finish_anim = 1304,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1307] = {
		anim_time = 7.633,
		unlock = "",
		ship_group = 20220,
		state = "chuang_FF_2_jiao_1",
		desc = "意外",
		staypoint = "Pos100710",
		id = 1307,
		pre_anim = 1304,
		zone = "1001",
		icon = "camera_action36",
		room = 1,
		enter_extra_item = "",
		furniture_id = 121,
		finish_anim = 1304,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1308] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "PayGoToSofaLoop",
		desc = "侧躺",
		staypoint = "Pos100210",
		id = 1308,
		pre_anim = 0,
		zone = "1003",
		icon = "camera_action32",
		room = 1,
		enter_extra_item = "",
		furniture_id = 122,
		finish_anim = 1308,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1309] = {
		anim_time = 11,
		unlock = "",
		ship_group = 20220,
		state = "zuo_FF_2_hudong_datui_1",
		desc = "晃动",
		staypoint = "Pos100210",
		id = 1309,
		pre_anim = 1308,
		zone = "1003",
		icon = "camera_action34",
		room = 1,
		enter_extra_item = "",
		furniture_id = 122,
		finish_anim = 1308,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1310] = {
		anim_time = 9.667,
		unlock = "",
		ship_group = 20220,
		state = "zuo_FF_2_hudong_jiao_1",
		desc = "轻抚",
		staypoint = "Pos100210",
		id = 1310,
		pre_anim = 1308,
		zone = "1003",
		icon = "camera_action36",
		room = 1,
		enter_extra_item = "",
		furniture_id = 122,
		finish_anim = 1308,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1311] = {
		anim_time = 10,
		unlock = "",
		ship_group = 20220,
		state = "zuo_FF_2_hudong_jianbang_1",
		desc = "伸懒腰",
		staypoint = "Pos100210",
		id = 1311,
		pre_anim = 1308,
		zone = "1003",
		icon = "camera_action33",
		room = 1,
		enter_extra_item = "",
		furniture_id = 122,
		finish_anim = 1308,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1312] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_idle_01",
		desc = "坐下",
		staypoint = "Pos100250",
		id = 1312,
		pre_anim = 0,
		zone = "1003",
		icon = "camera_action13",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1312,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1313] = {
		anim_time = 4.75,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_jiao_01",
		desc = "蹭动",
		staypoint = "Pos100250",
		id = 1313,
		pre_anim = 1312,
		zone = "1003",
		icon = "camera_action18",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1312,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1314] = {
		anim_time = 12.1666666666667,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_Rtui",
		desc = "晃动",
		staypoint = "Pos100250",
		id = 1314,
		pre_anim = 1312,
		zone = "1003",
		icon = "camera_action18",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1312,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1317] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_idle_03",
		desc = "站立",
		staypoint = "Pos100280",
		id = 1317,
		pre_anim = 0,
		zone = "1003",
		icon = "camera_action1",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1317,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1318] = {
		anim_time = 5.83333333333333,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_shou",
		desc = "蹭动",
		staypoint = "Pos100280",
		id = 1318,
		pre_anim = 1317,
		zone = "1003",
		icon = "camera_action3",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1317,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[1319] = {
		anim_time = 5.5,
		unlock = "",
		ship_group = 20220,
		state = "TLX_TD_shafa_lindang",
		desc = "拍打",
		staypoint = "Pos100280",
		id = 1319,
		pre_anim = 1317,
		zone = "1003",
		icon = "camera_action4",
		room = 1,
		enter_extra_item = "",
		furniture_id = 151,
		finish_anim = 1317,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 2001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2002] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_buhaoyisi",
		desc = "抱歉",
		staypoint = "",
		id = 2002,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action2",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2003] = {
		anim_time = 5.33333333333333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_deyi",
		desc = "小得意",
		staypoint = "",
		id = 2003,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action3",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2004] = {
		anim_time = 5.83333333333333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_gandong",
		desc = "感动",
		staypoint = "",
		id = 2004,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action6",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2005] = {
		anim_time = 7.33333333333333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_haixiu",
		desc = "害羞",
		staypoint = "",
		id = 2005,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action5",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2006] = {
		anim_time = 5.16666666666667,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_chuaishou",
		desc = "期待",
		staypoint = "",
		id = 2006,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action6",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2007] = {
		anim_time = 5.16666666666667,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_sikao",
		desc = "考虑",
		staypoint = "",
		id = 2007,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action1",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2008] = {
		anim_time = 6.66666666666667,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_chayao",
		desc = "叉腰",
		staypoint = "",
		id = 2008,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action3",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2009] = {
		anim_time = 5,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_qidai",
		desc = "请求",
		staypoint = "",
		id = 2009,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action2",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2010] = {
		anim_time = 6.33333333333333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_sikao2",
		desc = "询问",
		staypoint = "",
		id = 2010,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action5",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2011] = {
		anim_time = 2,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_wenhou",
		desc = "问候",
		staypoint = "",
		id = 2011,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action12",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2012] = {
		anim_time = 4.33333333333333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_yaotou",
		desc = "摇头",
		staypoint = "",
		id = 2012,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action8",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2013] = {
		anim_time = 8,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_zixin",
		desc = "自信",
		staypoint = "",
		id = 2013,
		pre_anim = 2001,
		zone = "",
		icon = "camera_action12",
		room = 2,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 2001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "sofa_sit_idle",
		desc = "坐下",
		staypoint = "Pos200110",
		id = 2101,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action13",
		room = 2,
		enter_extra_item = "",
		furniture_id = 203,
		finish_anim = 2101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2102] = {
		anim_time = 10,
		unlock = "",
		ship_group = 30221,
		state = "sofa_sit_jiao_start",
		desc = "示意",
		staypoint = "Pos200110",
		id = 2102,
		pre_anim = 2101,
		zone = "2003",
		icon = "camera_action24",
		room = 2,
		enter_extra_item = "",
		furniture_id = 203,
		finish_anim = 2101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2103] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 30221,
		state = "sofa_sit_tou_start",
		desc = "摸头",
		staypoint = "Pos200110",
		id = 2103,
		pre_anim = 2101,
		zone = "2003",
		icon = "camera_action21",
		room = 2,
		enter_extra_item = "",
		furniture_id = 203,
		finish_anim = 2101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2104] = {
		anim_time = 6.83333333333333,
		unlock = "",
		ship_group = 30221,
		state = "sofa_sit_xiong_start",
		desc = "吓一跳",
		staypoint = "Pos200110",
		id = 2104,
		pre_anim = 2101,
		zone = "2003",
		icon = "camera_action23",
		room = 2,
		enter_extra_item = "",
		furniture_id = 203,
		finish_anim = 2101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "bed_lay_idle",
		desc = "静候",
		staypoint = "Pos200210",
		id = 2201,
		pre_anim = 0,
		zone = "2001",
		icon = "camera_action25",
		room = 2,
		enter_extra_item = "",
		furniture_id = 201,
		finish_anim = 2201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2202] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 30221,
		state = "bed_lay_shou",
		desc = "困意",
		staypoint = "Pos200210",
		id = 2202,
		pre_anim = 2201,
		zone = "2001",
		icon = "camera_action28",
		room = 2,
		enter_extra_item = "",
		furniture_id = 201,
		finish_anim = 2201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2203] = {
		anim_time = 7.5,
		unlock = "",
		ship_group = 30221,
		state = "bed_lay_tui",
		desc = "轻抚",
		staypoint = "Pos200210",
		id = 2203,
		pre_anim = 2201,
		zone = "2001",
		icon = "camera_action27",
		room = 2,
		enter_extra_item = "",
		furniture_id = 201,
		finish_anim = 2201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2204] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 30221,
		state = "bed_lay_xiong_start",
		desc = "惊讶",
		staypoint = "Pos200210",
		id = 2204,
		pre_anim = 2201,
		zone = "2001",
		icon = "camera_action26",
		room = 2,
		enter_extra_item = "",
		furniture_id = 201,
		finish_anim = 2201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "table_sit_idle",
		desc = "入座",
		staypoint = "Pos200310",
		id = 2301,
		pre_anim = 0,
		zone = "2002",
		icon = "camera_action20",
		room = 2,
		enter_extra_item = "",
		furniture_id = 202,
		finish_anim = 2301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2302] = {
		anim_time = 7.66666666666667,
		unlock = "",
		ship_group = 30221,
		state = "table_sit_jiao",
		desc = "查看",
		staypoint = "Pos200310",
		id = 2302,
		pre_anim = 2301,
		zone = "2002",
		icon = "camera_action19",
		room = 2,
		enter_extra_item = "",
		furniture_id = 202,
		finish_anim = 2301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2303] = {
		anim_time = 8.33333333333333,
		unlock = "",
		ship_group = 30221,
		state = "table_sit_shou_start",
		desc = "投喂",
		staypoint = "Pos200310",
		id = 2303,
		pre_anim = 2301,
		zone = "2002",
		icon = "camera_action22",
		room = 2,
		enter_extra_item = "",
		furniture_id = 202,
		finish_anim = 2301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2304] = {
		anim_time = 9.5,
		unlock = "",
		ship_group = 30221,
		state = "table_sit_tou",
		desc = "品尝",
		staypoint = "Pos200310",
		id = 2304,
		pre_anim = 2301,
		zone = "2002",
		icon = "camera_action17",
		room = 2,
		enter_extra_item = "",
		furniture_id = 202,
		finish_anim = 2301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_IK_FF_chuang_idle_01",
		desc = "惬意",
		staypoint = "Pos200410",
		id = 2401,
		pre_anim = 0,
		zone = "2001",
		icon = "camera_action25",
		room = 2,
		enter_extra_item = "",
		furniture_id = 221,
		finish_anim = 2401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2402] = {
		anim_time = 5.76666666666667,
		unlock = "",
		ship_group = 30221,
		state = "ND_IK_FF_chuang_tui_01",
		desc = "害羞",
		staypoint = "Pos200410",
		id = 2402,
		pre_anim = 2401,
		zone = "2001",
		icon = "camera_action26",
		room = 2,
		enter_extra_item = "",
		furniture_id = 221,
		finish_anim = 2401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2403] = {
		anim_time = 12.4666666666667,
		unlock = "",
		ship_group = 30221,
		state = "ND_IK_FF_chuang_xiong_01",
		desc = "仰卧起坐",
		staypoint = "Pos200410",
		id = 2403,
		pre_anim = 2401,
		zone = "2001",
		icon = "camera_action27",
		room = 2,
		enter_extra_item = "",
		furniture_id = 221,
		finish_anim = 2401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2404] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_IK_FF_chuang_ZJD_idle_01",
		desc = "倚入怀中",
		staypoint = "Pos200411",
		id = 2404,
		pre_anim = 0,
		zone = "2001",
		icon = "camera_action28",
		room = 2,
		enter_extra_item = "",
		furniture_id = 221,
		finish_anim = 2404,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2405] = {
		anim_time = 14,
		unlock = "",
		ship_group = 30221,
		state = "ND_IK_FF_chuang_ZJD_tui_01",
		desc = "抬腿",
		staypoint = "Pos200411",
		id = 2405,
		pre_anim = 2401,
		zone = "2001",
		icon = "camera_action29",
		room = 2,
		enter_extra_item = "",
		furniture_id = 221,
		finish_anim = 2404,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2501] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_TD_beilu_idle_01",
		desc = "坐下",
		staypoint = "Pos200510",
		id = 2501,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action20",
		room = 2,
		enter_extra_item = "",
		furniture_id = 251,
		finish_anim = 2501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2502] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_TD_beilu_ZJD_xiong_01",
		desc = "趴下",
		staypoint = "Pos200510",
		id = 2502,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action25",
		room = 2,
		enter_extra_item = "",
		furniture_id = 251,
		finish_anim = 2502,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2503] = {
		anim_time = 8.1667,
		unlock = "",
		ship_group = 30221,
		state = "ND_TD_beilu_ZJD_tou_01",
		desc = "起身",
		staypoint = "Pos200510",
		id = 2503,
		pre_anim = 2502,
		zone = "2003",
		icon = "camera_action26",
		room = 2,
		enter_extra_item = "",
		furniture_id = 251,
		finish_anim = 2502,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2504] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_TD_beilu_idle_03",
		desc = "侧身",
		staypoint = "Pos200540",
		id = 2504,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action27",
		room = 2,
		enter_extra_item = "",
		furniture_id = 251,
		finish_anim = 2504,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2505] = {
		anim_time = 13.667,
		unlock = "",
		ship_group = 30221,
		state = "ND_TD_beilu_tui_01",
		desc = "轻抚",
		staypoint = "Pos200540",
		id = 2505,
		pre_anim = 2504,
		zone = "2003",
		icon = "camera_action26",
		room = 2,
		enter_extra_item = "",
		furniture_id = 251,
		finish_anim = 2504,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2601] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle01",
		desc = "坐下",
		staypoint = "Pos200710",
		id = 2601,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action20",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2602] = {
		anim_time = 7.8666,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle01_fb01",
		desc = "晃动",
		staypoint = "Pos200710",
		id = 2602,
		pre_anim = 2601,
		zone = "2003",
		icon = "camera_action15",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2603] = {
		anim_time = 11.5333,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle01_fb02",
		desc = "开心",
		staypoint = "Pos200710",
		id = 2603,
		pre_anim = 2601,
		zone = "2003",
		icon = "camera_action14",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2604] = {
		anim_time = 15.7333,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle01_fb03",
		desc = "惊讶",
		staypoint = "Pos200710",
		id = 2604,
		pre_anim = 2601,
		zone = "2003",
		icon = "camera_action16",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2605] = {
		anim_time = 4.8333,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle01_ZJD",
		desc = "躺下",
		staypoint = "Pos200710",
		id = 2605,
		pre_anim = 2601,
		zone = "2003",
		icon = "camera_action25",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2606,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2606] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle02",
		desc = "等待",
		staypoint = "Pos200710",
		id = 2606,
		pre_anim = 0,
		zone = "2003",
		icon = "camera_action27",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2606,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[2607] = {
		anim_time = 10.3333,
		unlock = "",
		ship_group = 30221,
		state = "FF_IK_shafa_idle02_fb01",
		desc = "开心",
		staypoint = "Pos200710",
		id = 2607,
		pre_anim = 2606,
		zone = "2003",
		icon = "camera_action29",
		room = 2,
		enter_extra_item = "",
		furniture_id = 223,
		finish_anim = 2606,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "Idle",
		desc = "站立",
		staypoint = "",
		id = 3001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3002] = {
		anim_time = 10.1666666666667,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_beishang_01",
		desc = "悲伤 ",
		staypoint = "",
		id = 3002,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action7",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3003] = {
		anim_time = 6.83333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_chongbai_01",
		desc = "崇拜",
		staypoint = "",
		id = 3003,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action12",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3005] = {
		anim_time = 6.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_deyi_01",
		desc = "得意",
		staypoint = "",
		id = 3005,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action10",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3006] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_gandong_01",
		desc = "感动",
		staypoint = "",
		id = 3006,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action11",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3007] = {
		anim_time = 7.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_haixiu_01",
		desc = "害羞",
		staypoint = "",
		id = 3007,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action6",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3008] = {
		anim_time = 5.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_idle_01",
		desc = "疑惑",
		staypoint = "",
		id = 3008,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action3",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3010] = {
		anim_time = 4.93333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_jidong_01",
		desc = "激动",
		staypoint = "",
		id = 3010,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action8",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3011] = {
		anim_time = 6.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_jingya_01",
		desc = "惊讶",
		staypoint = "",
		id = 3011,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action5",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3012] = {
		anim_time = 5.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_jinzhang_01",
		desc = "紧张",
		staypoint = "",
		id = 3012,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action11",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3013] = {
		anim_time = 5.16666666666667,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_jujue_01",
		desc = "拒绝",
		staypoint = "",
		id = 3013,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action5",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3014] = {
		anim_time = 5.16666666666667,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_kaixing_01",
		desc = "开心",
		staypoint = "",
		id = 3014,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action10",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3015] = {
		anim_time = 6.33333333333333,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_qiaoqiaohua_01",
		desc = "悄悄话",
		staypoint = "",
		id = 3015,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action9",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3016] = {
		anim_time = 4.3,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_taibangle_01",
		desc = "太棒了",
		staypoint = "",
		id = 3016,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action4",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3017] = {
		anim_time = 4.16666666666667,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_lianxudiantou_01",
		desc = "点头",
		staypoint = "",
		id = 3017,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action2",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3018] = {
		anim_time = 8,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_buhaoyisi_01",
		desc = "不好意思",
		staypoint = "",
		id = 3018,
		pre_anim = 3001,
		zone = "",
		icon = "camera_action6",
		room = 3,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 3001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_chuang_idle_01",
		desc = "躺下",
		staypoint = "Pos300110",
		id = 3101,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action25",
		room = 3,
		enter_extra_item = "",
		furniture_id = 301,
		finish_anim = 3101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3102] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_chuang_xiong_01",
		desc = "揉眼睛",
		staypoint = "Pos300110",
		id = 3102,
		pre_anim = 3101,
		zone = "3001",
		icon = "camera_action26",
		room = 3,
		enter_extra_item = "",
		furniture_id = 301,
		finish_anim = 3101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3103] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_chuang_jiao_01",
		desc = "手舞足蹈",
		staypoint = "Pos300110",
		id = 3103,
		pre_anim = 3101,
		zone = "3001",
		icon = "camera_action27",
		room = 3,
		enter_extra_item = "",
		furniture_id = 301,
		finish_anim = 3101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3104] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_chuang_shou_01",
		desc = "触碰",
		staypoint = "Pos300110",
		id = 3104,
		pre_anim = 3101,
		zone = "3001",
		icon = "camera_action28",
		room = 3,
		enter_extra_item = "",
		furniture_id = 301,
		finish_anim = 3101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3201] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shafa_idle_01",
		desc = "抱膝",
		staypoint = "Pos300210",
		id = 3201,
		pre_anim = 0,
		zone = "3003",
		icon = "camera_action32",
		room = 3,
		enter_extra_item = "",
		furniture_id = 303,
		finish_anim = 3201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3202] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shafa_xiong_01",
		desc = "撒娇",
		staypoint = "Pos300210",
		id = 3202,
		pre_anim = 3201,
		zone = "3003",
		icon = "camera_action33",
		room = 3,
		enter_extra_item = "",
		furniture_id = 303,
		finish_anim = 3201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
end)()
;(function()
	pg.base.dorm3d_camera_anim_template[3203] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shafa_shou_01",
		desc = "倚靠",
		staypoint = "Pos300210",
		id = 3203,
		pre_anim = 3201,
		zone = "3003",
		icon = "camera_action34",
		room = 3,
		enter_extra_item = "",
		furniture_id = 303,
		finish_anim = 3201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3204] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shafa_tou_01",
		desc = "摇头晃脑",
		staypoint = "Pos300210",
		id = 3204,
		pre_anim = 3201,
		zone = "3003",
		icon = "camera_action33",
		room = 3,
		enter_extra_item = "",
		furniture_id = 303,
		finish_anim = 3201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_ditan_idle_01",
		desc = "跪坐",
		staypoint = "Pos300310",
		id = 3301,
		pre_anim = 0,
		zone = "3002",
		icon = "camera_action13",
		room = 3,
		enter_extra_item = "",
		furniture_id = 302,
		finish_anim = 3301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3302] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_ditan_jiao_01",
		desc = "靠近",
		staypoint = "Pos300310",
		id = 3302,
		pre_anim = 3301,
		zone = "3002",
		icon = "camera_action16",
		room = 3,
		enter_extra_item = "",
		furniture_id = 302,
		finish_anim = 3301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3303] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_ditan_shou_01",
		desc = "写写画画",
		staypoint = "Pos300310",
		id = 3303,
		pre_anim = 3301,
		zone = "3002",
		icon = "camera_action18",
		room = 3,
		enter_extra_item = "",
		furniture_id = 302,
		finish_anim = 3301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3304] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_ditan_tou_01",
		desc = "亲昵",
		staypoint = "Pos300310",
		id = 3304,
		pre_anim = 3301,
		zone = "3002",
		icon = "camera_action19",
		room = 3,
		enter_extra_item = "",
		furniture_id = 302,
		finish_anim = 3301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_ditan_1_idle_1",
		desc = "思索",
		staypoint = "Pos300410",
		id = 3401,
		pre_anim = 0,
		zone = "3002",
		icon = "camera_action13",
		room = 3,
		enter_extra_item = "",
		furniture_id = 321,
		finish_anim = 3401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3402] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_ditan_1_jiao_01",
		desc = "惊讶",
		staypoint = "Pos300410",
		id = 3402,
		pre_anim = 3401,
		zone = "3002",
		icon = "camera_action16",
		room = 3,
		enter_extra_item = "",
		furniture_id = 321,
		finish_anim = 3401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3403] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_ditan_2_idle_1",
		desc = "依靠",
		staypoint = "Pos300412",
		id = 3403,
		pre_anim = 0,
		zone = "3002",
		icon = "camera_action18",
		room = 3,
		enter_extra_item = "",
		furniture_id = 321,
		finish_anim = 3403,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3404] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_ditan_2_beizi_01",
		desc = "开心",
		staypoint = "Pos300412",
		id = 3404,
		pre_anim = 3403,
		zone = "3002",
		icon = "camera_action19",
		room = 3,
		enter_extra_item = "",
		furniture_id = 321,
		finish_anim = 3403,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3405] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_ditan_2_jiao_01",
		desc = "疑惑",
		staypoint = "Pos300412",
		id = 3405,
		pre_anim = 3403,
		zone = "3002",
		icon = "camera_action15",
		room = 3,
		enter_extra_item = "",
		furniture_id = 321,
		finish_anim = 3403,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3501] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_chuang_1_idle_01",
		desc = "跪坐",
		staypoint = "Pos300510",
		id = 3501,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action25",
		room = 4,
		enter_extra_item = "",
		furniture_id = 322,
		finish_anim = 3501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3502] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_chuang_1_pigu_01",
		desc = "挥手",
		staypoint = "Pos300510",
		id = 3502,
		pre_anim = 3501,
		zone = "3001",
		icon = "camera_action26",
		room = 4,
		enter_extra_item = "",
		furniture_id = 322,
		finish_anim = 3501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3503] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_chuang_1_jiao_01",
		desc = "激动",
		staypoint = "Pos300510",
		id = 3503,
		pre_anim = 3501,
		zone = "3001",
		icon = "camera_action27",
		room = 4,
		enter_extra_item = "",
		furniture_id = 322,
		finish_anim = 3501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3504] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_chuang_2_idle_01",
		desc = "侧身",
		staypoint = "Pos300512",
		id = 3504,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action28",
		room = 4,
		enter_extra_item = "",
		furniture_id = 322,
		finish_anim = 3504,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3505] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_chuang_2_tui_01",
		desc = "轻抚",
		staypoint = "Pos300512",
		id = 3505,
		pre_anim = 3504,
		zone = "3001",
		icon = "camera_action29",
		room = 4,
		enter_extra_item = "",
		furniture_id = 322,
		finish_anim = 3504,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[3601] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_shafa_idle01",
		desc = "晃动",
		staypoint = "Pos300610",
		id = 3601,
		pre_anim = 0,
		zone = "3003",
		icon = "camera_action24",
		room = 3,
		hide_scene_item = "",
		furniture_id = 323,
		finish_anim = 3601,
		enter_scene_anim = {
			{
				2012,
				"ab_FF_shafa_idle01_SF"
			}
		},
		enter_extra_item = {
			{
				"furniture/Item/Aklq_Drink01/pre_db_aklq_drink01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"ab_FF_shafa_idle01_M"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[3602] = {
		anim_time = 15,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_shafa_idle01_fb03",
		desc = "品尝",
		staypoint = "Pos300610",
		id = 3602,
		pre_anim = 3601,
		zone = "3003",
		icon = "camera_action17",
		room = 3,
		hide_scene_item = "",
		furniture_id = 323,
		finish_anim = 3601,
		enter_scene_anim = {
			{
				2012,
				"ab_FF_shafa_idle01_fb03_SF"
			}
		},
		enter_extra_item = {
			{
				"furniture/Item/Aklq_Drink01/pre_db_aklq_drink01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"ab_FF_shafa_idle01_fb03_M"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[3603] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_shafa_idle02",
		desc = "撒娇",
		staypoint = "Pos300610",
		id = 3603,
		pre_anim = 0,
		zone = "3003",
		icon = "camera_action33",
		room = 3,
		enter_extra_item = "",
		furniture_id = 323,
		finish_anim = 3603,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2012,
				"ab_FF_shafa_idle02_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[3604] = {
		anim_time = 8.666,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_shafa_idle02_fb01",
		desc = "手舞足蹈",
		staypoint = "Pos300610",
		id = 3604,
		pre_anim = 3603,
		zone = "3003",
		icon = "camera_action27",
		room = 3,
		enter_extra_item = "",
		furniture_id = 323,
		finish_anim = 3603,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2012,
				"ab_FF_shafa_idle02_fb01_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[3605] = {
		anim_time = 12.5,
		unlock = "",
		ship_group = 19903,
		state = "ab_FF_shafa_idle02_fb03",
		desc = "倚靠",
		staypoint = "Pos300610",
		id = 3605,
		pre_anim = 3603,
		zone = "3003",
		icon = "camera_action34",
		room = 3,
		enter_extra_item = "",
		furniture_id = 323,
		finish_anim = 3603,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2012,
				"ab_FF_shafa_idle02_fb03_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[3701] = {
		anim_time = 2,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle01",
		desc = "躺下",
		staypoint = "Pos300710",
		id = 3701,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action25",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3701,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle01_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle01_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle01_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3702] = {
		anim_time = 13.967,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle01_fb01",
		desc = "激动",
		staypoint = "Pos300710",
		id = 3702,
		pre_anim = 3701,
		zone = "3001",
		icon = "camera_action27",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3701,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle01_fb01_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle01_fb01_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle01_fb01_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3703] = {
		anim_time = 22.5,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle01_fb02",
		desc = "触碰",
		staypoint = "Pos300710",
		id = 3703,
		pre_anim = 3701,
		zone = "3001",
		icon = "camera_action28",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3701,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle01_fb02_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle01_fb02_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle01_fb02_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3704] = {
		anim_time = 2,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle02",
		desc = "坐下",
		staypoint = "Pos300720",
		id = 3704,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action13",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3704,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle02_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle02_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle02_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3705] = {
		anim_time = 18.933,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle02_fb02",
		desc = "开心",
		staypoint = "Pos300720",
		id = 3705,
		pre_anim = 3704,
		zone = "3001",
		icon = "camera_action19",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3704,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle02_fb02_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle02_fb02_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle02_fb02_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3706] = {
		anim_time = 20,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle02_fb03",
		desc = "猫式伸展",
		staypoint = "Pos300720",
		id = 3706,
		pre_anim = 3704,
		zone = "3001",
		icon = "camera_action34",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3704,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle02_fb03_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle02_fb03_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle02_fb03_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3707] = {
		anim_time = 2,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle03",
		desc = "抱膝",
		staypoint = "Pos300740",
		id = 3707,
		pre_anim = 0,
		zone = "3001",
		icon = "camera_action32",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3707,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle03_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle03_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle03_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3708] = {
		anim_time = 18.667,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle03_fb01",
		desc = "跪坐",
		staypoint = "Pos300740",
		id = 3708,
		pre_anim = 3707,
		zone = "3001",
		icon = "camera_action25",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3707,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle03_fb01_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle03_fb01_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle03_fb01_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[3709] = {
		anim_time = 19.167,
		unlock = "",
		ship_group = 19903,
		state = "ab_TD_bed_idle03_fb02",
		desc = "撒娇",
		staypoint = "Pos300740",
		id = 3709,
		pre_anim = 3707,
		zone = "3001",
		icon = "camera_action33",
		room = 3,
		enter_extra_item = "",
		furniture_id = 324,
		finish_anim = 3707,
		enter_scene_anim = {
			{
				2020,
				"ab_TD_bed_idle03_fb02_1chuang"
			},
			{
				2021,
				"ab_TD_bed_idle03_fb02_2xiong"
			},
			{
				2022,
				"ab_TD_bed_idle03_fb02_3caiqiu"
			}
		},
		hide_scene_item = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_camera_anim_template[4001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "Idle",
		desc = "站立",
		staypoint = "",
		id = 4001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4002] = {
		anim_time = 9,
		unlock = "",
		ship_group = 20220,
		state = "sikao1",
		desc = "思考 ",
		staypoint = "",
		id = 4002,
		pre_anim = 4001,
		zone = "",
		icon = "camera_action3",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4003] = {
		anim_time = 5.7,
		unlock = "",
		ship_group = 20220,
		state = "shy",
		desc = "害羞 ",
		staypoint = "",
		id = 4003,
		pre_anim = 4001,
		zone = "",
		icon = "camera_action5",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4004] = {
		anim_time = 6.5,
		unlock = "",
		ship_group = 20220,
		state = "biaoda",
		desc = "表达 ",
		staypoint = "",
		id = 4004,
		pre_anim = 4001,
		zone = "",
		icon = "camera_action8",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4005] = {
		anim_time = 6.333,
		unlock = "",
		ship_group = 20220,
		state = "ganjin",
		desc = "干劲 ",
		staypoint = "",
		id = 4005,
		pre_anim = 4001,
		zone = "",
		icon = "camera_action12",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "idle",
		desc = "站立",
		staypoint = "",
		id = 4201,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4202] = {
		anim_time = 5.333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_deyi",
		desc = "得意",
		staypoint = "",
		id = 4202,
		pre_anim = 4201,
		zone = "",
		icon = "camera_action3",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4203] = {
		anim_time = 7.333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_haixiu",
		desc = "害羞",
		staypoint = "",
		id = 4203,
		pre_anim = 4201,
		zone = "",
		icon = "camera_action5",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4204] = {
		anim_time = 2,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_wenhou",
		desc = "点头",
		staypoint = "",
		id = 4204,
		pre_anim = 4201,
		zone = "",
		icon = "camera_action8",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4205] = {
		anim_time = 4.333,
		unlock = "",
		ship_group = 30221,
		state = "shuohua_yaotou",
		desc = "摇头",
		staypoint = "",
		id = 4205,
		pre_anim = 4201,
		zone = "",
		icon = "camera_action12",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_FF_IK_zhuozi_idle_01",
		desc = "坐下",
		staypoint = "Pos200610",
		id = 4301,
		pre_anim = 0,
		zone = "2002",
		icon = "camera_action3",
		room = 2,
		enter_extra_item = "",
		furniture_id = 222,
		finish_anim = 4301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4302] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_FF_IK_zhuozi_idle_02",
		desc = "抬腿",
		staypoint = "Pos200611",
		id = 4302,
		pre_anim = 0,
		zone = "2002",
		icon = "camera_action5",
		room = 2,
		enter_extra_item = "",
		furniture_id = 222,
		finish_anim = 4302,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4303] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_FF_IK_zhuozi_ZJD_loop",
		desc = "躺下",
		staypoint = "Pos200620",
		id = 4303,
		pre_anim = 0,
		zone = "2002",
		icon = "camera_action8",
		room = 2,
		enter_extra_item = "",
		furniture_id = 222,
		finish_anim = 4303,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4304] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30221,
		state = "ND_FF_IK_zhuozi_ZJD_xiong_01-loop",
		desc = "侧身",
		staypoint = "Pos200621",
		id = 4304,
		pre_anim = 0,
		zone = "2002",
		icon = "camera_action12",
		room = 2,
		enter_extra_item = "",
		furniture_id = 222,
		finish_anim = 4304,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 19903,
		state = "Idle",
		desc = "站立",
		staypoint = "",
		id = 4401,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4402] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_idle_01",
		desc = "疑惑",
		staypoint = "",
		id = 4402,
		pre_anim = 4401,
		zone = "",
		icon = "camera_action8",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4403] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_idle_02",
		desc = "惊讶",
		staypoint = "",
		id = 4403,
		pre_anim = 4401,
		zone = "",
		icon = "camera_action5",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4404] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_jinzhang_01",
		desc = "紧张",
		staypoint = "",
		id = 4404,
		pre_anim = 4401,
		zone = "",
		icon = "camera_action11",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[4405] = {
		anim_time = 7,
		unlock = "",
		ship_group = 19903,
		state = "ab_shuohua_kaixing_01",
		desc = "开心",
		staypoint = "",
		id = 4405,
		pre_anim = 4401,
		zone = "",
		icon = "camera_action10",
		room = 4,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 4401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 11001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11002] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 11002,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action7",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11003] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 11003,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action12",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11004] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 11004,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action10",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11005] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "sad_01-start",
		desc = "沮丧",
		staypoint = "",
		id = 11005,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action11",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11006] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "happy_01-start",
		desc = "开心",
		staypoint = "",
		id = 11006,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action6",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11007] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "amazed_01-start",
		desc = "惊讶",
		staypoint = "",
		id = 11007,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action3",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11008] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "excited_01-start",
		desc = "激动",
		staypoint = "",
		id = 11008,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action8",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11009] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "talk_01-start",
		desc = "交谈",
		staypoint = "",
		id = 11009,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action5",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11010] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "talk_02-start",
		desc = "解释",
		staypoint = "",
		id = 11010,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action11",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11011] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "hello_01-start",
		desc = "问好",
		staypoint = "",
		id = 11011,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action5",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11012] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "shy_01-start",
		desc = "害羞",
		staypoint = "",
		id = 11012,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action10",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11013] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "invite_01-start",
		desc = "邀请",
		staypoint = "",
		id = 11013,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action9",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11014] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "encourage_01-start",
		desc = "鼓励",
		staypoint = "",
		id = 11014,
		pre_anim = 11001,
		zone = "",
		icon = "camera_action4",
		room = 11,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 11001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11101] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "xzx_bingxiang_idle_01",
		desc = "准备",
		staypoint = "Pos400110",
		id = 11101,
		pre_anim = 0,
		zone = "11002",
		icon = "camera_action13",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1102,
		finish_anim = 11101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11102] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "xzx_bingxiang_shou_01",
		desc = "阻拦",
		staypoint = "Pos400110",
		id = 11102,
		pre_anim = 11101,
		zone = "11002",
		icon = "camera_action14",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1102,
		finish_anim = 11101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11103] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "xzx_bingxiang_jianbang_01",
		desc = "探索",
		staypoint = "Pos400110",
		id = 11103,
		pre_anim = 11101,
		zone = "11002",
		icon = "camera_action15",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1102,
		finish_anim = 11101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11104] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "xzx_bingxiang_shou_02",
		desc = "纳凉",
		staypoint = "Pos400110",
		id = 11104,
		pre_anim = 11101,
		zone = "11002",
		icon = "camera_action16",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1102,
		finish_anim = 11101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11201] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living01_idle01",
		desc = "放松",
		staypoint = "Pos400210",
		id = 11201,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action32",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1103,
		finish_anim = 11201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11202] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living01_idle01_fb01",
		desc = "伸懒腰",
		staypoint = "Pos400210",
		id = 11202,
		pre_anim = 11201,
		zone = "11003",
		icon = "camera_action33",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1103,
		finish_anim = 11201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11203] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living01_idle01_fb02",
		desc = "踢腿",
		staypoint = "Pos400210",
		id = 11203,
		pre_anim = 11201,
		zone = "11003",
		icon = "camera_action34",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1103,
		finish_anim = 11201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11204] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living01_idle01_fb03",
		desc = "松弛感",
		staypoint = "Pos400210",
		id = 11204,
		pre_anim = 11201,
		zone = "11003",
		icon = "camera_action36",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1103,
		finish_anim = 11201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11301] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed01_idle01",
		desc = "轻躺",
		staypoint = "Pos400310",
		id = 11301,
		pre_anim = 0,
		zone = "11001",
		icon = "camera_action25",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1101,
		finish_anim = 11301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11302] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed01_idle01_fb01",
		desc = "伸腿",
		staypoint = "Pos400310",
		id = 11302,
		pre_anim = 11301,
		zone = "11001",
		icon = "camera_action26",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1101,
		finish_anim = 11301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11303] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed01_idle01_fb02",
		desc = "起身遮挡",
		staypoint = "Pos400310",
		id = 11303,
		pre_anim = 11301,
		zone = "11001",
		icon = "camera_action27",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1101,
		finish_anim = 11301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11304] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed01_idle01_fb03",
		desc = "翻身",
		staypoint = "Pos400310",
		id = 11304,
		pre_anim = 11301,
		zone = "11001",
		icon = "camera_action28",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1101,
		finish_anim = 11301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11401] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle01",
		desc = "趴着",
		staypoint = "Pos400410",
		id = 11401,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action32",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11402] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle01_fb01",
		desc = "摇头晃脑",
		staypoint = "Pos400410",
		id = 11402,
		pre_anim = 11401,
		zone = "11003",
		icon = "camera_action33",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11403] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle01_fb02",
		desc = "舒展",
		staypoint = "Pos400410",
		id = 11403,
		pre_anim = 11401,
		zone = "11003",
		icon = "camera_action34",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11404] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle01_fb03",
		desc = "口渴",
		staypoint = "Pos400410",
		id = 11404,
		pre_anim = 11401,
		zone = "11003",
		icon = "camera_action36",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11405] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle02",
		desc = "等待",
		staypoint = "Pos400412",
		id = 11405,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action32",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11406] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle02_fb01",
		desc = "好奇",
		staypoint = "Pos400412",
		id = 11406,
		pre_anim = 11405,
		zone = "11003",
		icon = "camera_action33",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11407] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle02_fb02",
		desc = "拥抱",
		staypoint = "Pos400412",
		id = 11407,
		pre_anim = 11405,
		zone = "11003",
		icon = "camera_action34",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11408] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "IK_living02_idle02_fb03",
		desc = "戳戳",
		staypoint = "Pos400412",
		id = 11408,
		pre_anim = 11405,
		zone = "11003",
		icon = "camera_action36",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1151,
		finish_anim = 11405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11501] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle01",
		desc = "骑车",
		staypoint = "Pos400720",
		id = 11501,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action17",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11502] = {
		anim_time = 8.0333,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle01_fb01",
		desc = "猛蹬",
		staypoint = "Pos400720",
		id = 11502,
		pre_anim = 11501,
		zone = "11003",
		icon = "camera_action20",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11503] = {
		anim_time = 4.5,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle01_fb02",
		desc = "挥手",
		staypoint = "Pos400720",
		id = 11503,
		pre_anim = 11501,
		zone = "11003",
		icon = "camera_action23",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11504] = {
		anim_time = 9.3,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle01_fb03",
		desc = "滑行",
		staypoint = "Pos400720",
		id = 11504,
		pre_anim = 11501,
		zone = "11003",
		icon = "camera_action22",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11505] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle02",
		desc = "伸展",
		staypoint = "Pos400720",
		id = 11505,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action10",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11505,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11506] = {
		anim_time = 14.0666,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle02_fb01",
		desc = "甩手",
		staypoint = "Pos400720",
		id = 11506,
		pre_anim = 11505,
		zone = "11003",
		icon = "camera_action11",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11505,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11507] = {
		anim_time = 16,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle02_fb02",
		desc = "拉腿",
		staypoint = "Pos400720",
		id = 11507,
		pre_anim = 11505,
		zone = "11003",
		icon = "camera_action12",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11505,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11508] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle03",
		desc = "拉伸",
		staypoint = "Pos400710",
		id = 11508,
		pre_anim = 0,
		zone = "11003",
		icon = "camera_action4",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11508,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11509] = {
		anim_time = 12,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle03_fb01",
		desc = "蹦跳",
		staypoint = "Pos400710",
		id = 11509,
		pre_anim = 11508,
		zone = "11003",
		icon = "camera_action6",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11508,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11510] = {
		anim_time = 17.1666,
		unlock = "",
		ship_group = 10517,
		state = "IK_sp01_idle03_fb02",
		desc = "放松",
		staypoint = "Pos400710",
		id = 11510,
		pre_anim = 11508,
		zone = "11003",
		icon = "camera_action8",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1152,
		finish_anim = 11508,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11701] = {
		anim_time = 2,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle01",
		desc = "准备",
		staypoint = "Pos400810",
		id = 11701,
		pre_anim = 0,
		zone = "11002",
		icon = "camera_action13",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11701,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle01_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11702] = {
		anim_time = 16.767,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle01_fb01",
		desc = "跪坐",
		staypoint = "Pos400810",
		id = 11702,
		pre_anim = 11701,
		zone = "11002",
		icon = "camera_action25",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11701,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle01_fb01_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11703] = {
		anim_time = 15.667,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle01_fb03",
		desc = "翻身",
		staypoint = "Pos400810",
		id = 11703,
		pre_anim = 11701,
		zone = "11002",
		icon = "camera_action28",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11701,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle01_fb03_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11704] = {
		anim_time = 2,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle02",
		desc = "等待",
		staypoint = "Pos400840",
		id = 11704,
		pre_anim = 0,
		zone = "11002",
		icon = "camera_action32",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11704,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle02_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11705] = {
		anim_time = 15.333,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle02_fb01",
		desc = "口渴",
		staypoint = "Pos400840",
		id = 11705,
		pre_anim = 11704,
		zone = "11002",
		icon = "camera_action36",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11704,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle02_fb01_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11706] = {
		anim_time = 14.333,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle02_fb02",
		desc = "品尝",
		staypoint = "Pos400840",
		id = 11706,
		pre_anim = 11704,
		zone = "11002",
		icon = "camera_action17",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11704,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle02_fb02_BX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[11707] = {
		anim_time = 14.667,
		unlock = "",
		ship_group = 10517,
		state = "IK_dining02_idle02_fb03",
		desc = "舒展",
		staypoint = "Pos400840",
		id = 11707,
		pre_anim = 11704,
		zone = "11002",
		icon = "camera_action34",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1154,
		finish_anim = 11704,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2018,
				"IK_dining02_idle02_fb03_BX"
			}
		}
	}
end)()
;(function()
	pg.base.dorm3d_camera_anim_template[12001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 12001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12002] = {
		anim_time = 2.3,
		unlock = "",
		ship_group = 30707,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 12002,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action7",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12003] = {
		anim_time = 2.4,
		unlock = "",
		ship_group = 30707,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 12003,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action12",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12004] = {
		anim_time = 6.1,
		unlock = "",
		ship_group = 30707,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 12004,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action10",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12005] = {
		anim_time = 7.334,
		unlock = "",
		ship_group = 30707,
		state = "sad_01-start",
		desc = "悲伤 ",
		staypoint = "",
		id = 12005,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action11",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12006] = {
		anim_time = 26.6,
		unlock = "",
		ship_group = 30707,
		state = "happy_01-start",
		desc = "开心",
		staypoint = "",
		id = 12006,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action6",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12007] = {
		anim_time = 5.6,
		unlock = "",
		ship_group = 30707,
		state = "amazed_01-start",
		desc = "惊讶",
		staypoint = "",
		id = 12007,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action3",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12008] = {
		anim_time = 9.1666,
		unlock = "",
		ship_group = 30707,
		state = "excited_01-start",
		desc = "激动",
		staypoint = "",
		id = 12008,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action8",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12009] = {
		anim_time = 7.567,
		unlock = "",
		ship_group = 30707,
		state = "talk_01-start",
		desc = "交谈",
		staypoint = "",
		id = 12009,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action5",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12010] = {
		anim_time = 7.667,
		unlock = "",
		ship_group = 30707,
		state = "talk_02-start",
		desc = "解释",
		staypoint = "",
		id = 12010,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action11",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12011] = {
		anim_time = 5.0666,
		unlock = "",
		ship_group = 30707,
		state = "hello_01-start",
		desc = "问好",
		staypoint = "",
		id = 12011,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action5",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12012] = {
		anim_time = 7.933,
		unlock = "",
		ship_group = 30707,
		state = "shy_01-start",
		desc = "害羞",
		staypoint = "",
		id = 12012,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action10",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12013] = {
		anim_time = 5.266,
		unlock = "",
		ship_group = 30707,
		state = "invite_01-start",
		desc = "邀请",
		staypoint = "",
		id = 12013,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action9",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12014] = {
		anim_time = 5.2,
		unlock = "",
		ship_group = 30707,
		state = "encourage_01-start",
		desc = "鼓励",
		staypoint = "",
		id = 12014,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action4",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12015] = {
		anim_time = 4.1667,
		unlock = "",
		ship_group = 30707,
		state = "refuse_01-start",
		desc = "拒绝",
		staypoint = "",
		id = 12015,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action13",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12016] = {
		anim_time = 5.667,
		unlock = "",
		ship_group = 30707,
		state = "satisfied_01-start",
		desc = "得意",
		staypoint = "",
		id = 12016,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action9",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12017] = {
		anim_time = 5.167,
		unlock = "",
		ship_group = 30707,
		state = "yandere_01-start",
		desc = "病娇",
		staypoint = "",
		id = 12017,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action8",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12018] = {
		anim_time = 5.767,
		unlock = "",
		ship_group = 30707,
		state = "enquire_01-start",
		desc = "询问",
		staypoint = "",
		id = 12018,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action11",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12019] = {
		anim_time = 5,
		unlock = "",
		ship_group = 30707,
		state = "emotion_01-start",
		desc = "感动",
		staypoint = "",
		id = 12019,
		pre_anim = 12001,
		zone = "",
		icon = "camera_action7",
		room = 12,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 12001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed01_idle01",
		desc = "静待",
		staypoint = "Pos500110",
		id = 12101,
		pre_anim = 0,
		zone = "12001",
		icon = "camera_action2",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1201,
		finish_anim = 12101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12102] = {
		anim_time = 8.933,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed01_idle01_fb01",
		desc = "撒娇",
		staypoint = "Pos500110",
		id = 12102,
		pre_anim = 12101,
		zone = "12001",
		icon = "camera_action33",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1201,
		finish_anim = 12101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12103] = {
		anim_time = 8.533,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed01_idle01_fb02",
		desc = "害羞",
		staypoint = "Pos500110",
		id = 12103,
		pre_anim = 12101,
		zone = "12001",
		icon = "camera_action10",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1201,
		finish_anim = 12101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12104] = {
		anim_time = 13.067,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed01_idle01_fb03",
		desc = "开心",
		staypoint = "Pos500110",
		id = 12104,
		pre_anim = 12101,
		zone = "12001",
		icon = "camera_action6",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1201,
		finish_anim = 12101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_dining01_idle01",
		desc = "静待",
		staypoint = "Pos500210",
		id = 12201,
		pre_anim = 0,
		zone = "12002",
		icon = "camera_action2",
		room = 12,
		hide_scene_item = "",
		furniture_id = 1202,
		finish_anim = 12201,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Item/Df_Kitchenware_01/pre_db_df_kitchenware_01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_dining01_idle01_dao"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12202] = {
		anim_time = 13.333,
		unlock = "",
		ship_group = 30707,
		state = "IK_dining01_idle01_fb01",
		desc = "得意",
		staypoint = "Pos500210",
		id = 12202,
		pre_anim = 12201,
		zone = "12002",
		icon = "camera_action3",
		room = 12,
		hide_scene_item = "",
		furniture_id = 1202,
		finish_anim = 12201,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Item/Df_Kitchenware_01/pre_db_df_kitchenware_01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_dining01_idle01_fb01_dao"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12203] = {
		anim_time = 12.633,
		unlock = "",
		ship_group = 30707,
		state = "IK_dining01_idle01_fb02",
		desc = "交谈",
		staypoint = "Pos500210",
		id = 12203,
		pre_anim = 12201,
		zone = "12002",
		icon = "camera_action5",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1202,
		finish_anim = 12201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12204] = {
		anim_time = 9,
		unlock = "",
		ship_group = 30707,
		state = "IK_dining01_idle01_fb03",
		desc = "鼓励",
		staypoint = "Pos500210",
		id = 12204,
		pre_anim = 12201,
		zone = "12002",
		icon = "camera_action4",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1202,
		finish_anim = 12201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_living01_idle01",
		desc = "静待",
		staypoint = "Pos500310",
		id = 12301,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action2",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1203,
		finish_anim = 12301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2013,
				"IK_living01_idle01_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12302] = {
		anim_time = 19.567,
		unlock = "",
		ship_group = 30707,
		state = "IK_living01_idle01_fb01",
		desc = "伸腿",
		staypoint = "Pos500310",
		id = 12302,
		pre_anim = 12301,
		zone = "12003",
		icon = "camera_action26",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1203,
		finish_anim = 12301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2013,
				"IK_living01_idle01_fb01_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12303] = {
		anim_time = 14.7,
		unlock = "",
		ship_group = 30707,
		state = "IK_living01_idle01_fb02",
		desc = "伸懒腰",
		staypoint = "Pos500310",
		id = 12303,
		pre_anim = 12301,
		zone = "12003",
		icon = "camera_action33",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1203,
		finish_anim = 12301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2013,
				"IK_living01_idle01_fb02_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12304] = {
		anim_time = 12.5,
		unlock = "",
		ship_group = 30707,
		state = "IK_living01_idle01_fb03",
		desc = "坐下",
		staypoint = "Pos500310",
		id = 12304,
		pre_anim = 12301,
		zone = "12003",
		icon = "camera_action13",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1203,
		finish_anim = 12301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2013,
				"IK_living01_idle01_fb03_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle01",
		desc = "静待",
		staypoint = "Pos500410",
		id = 12401,
		pre_anim = 0,
		zone = "12001",
		icon = "camera_action2",
		room = 12,
		hide_scene_item = "",
		furniture_id = 1221,
		finish_anim = 12401,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Item/Df_Handcuffs_01/pre_db_df_handcuffs_01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_bed02_idle01_SK"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12402] = {
		anim_time = 11.267,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle01_fb01",
		desc = "激动",
		staypoint = "Pos500410",
		id = 12402,
		pre_anim = 12401,
		zone = "12001",
		icon = "camera_action8",
		room = 12,
		hide_scene_item = "",
		furniture_id = 1221,
		finish_anim = 12401,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Item/Df_Handcuffs_01/pre_db_df_handcuffs_01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_bed02_idle01_fb01_SK"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12403] = {
		anim_time = 16.667,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle01_fb02",
		desc = "侧身",
		staypoint = "Pos500410",
		id = 12403,
		pre_anim = 12401,
		zone = "12001",
		icon = "camera_action28",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1221,
		finish_anim = 12401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12404] = {
		anim_time = 11.433,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle01_fb03",
		desc = "躺下",
		staypoint = "Pos500410",
		id = 12404,
		pre_anim = 12401,
		zone = "12001",
		icon = "camera_action25",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1221,
		finish_anim = 12401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12405] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle02",
		desc = "静待",
		staypoint = "Pos500410",
		id = 12405,
		pre_anim = 0,
		zone = "12001",
		icon = "camera_action2",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1221,
		finish_anim = 12405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12406] = {
		anim_time = 10,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle02_fb01",
		desc = "放松",
		staypoint = "Pos500410",
		id = 12406,
		pre_anim = 12405,
		zone = "12001",
		icon = "camera_action32",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1221,
		finish_anim = 12405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12407] = {
		anim_time = 15.633,
		unlock = "",
		ship_group = 30707,
		state = "IK_bed02_idle02_fb02",
		desc = "邀请",
		staypoint = "Pos500410",
		id = 12407,
		pre_anim = 12405,
		zone = "12001",
		icon = "camera_action9",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1221,
		finish_anim = 12405,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11601] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle01",
		desc = "轻躺",
		staypoint = "Pos400510",
		id = 11601,
		pre_anim = 0,
		zone = "11001",
		icon = "camera_action25",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11501,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11602] = {
		anim_time = 16.3,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle01_fb01",
		desc = "开心",
		staypoint = "Pos400520",
		id = 11602,
		pre_anim = 11601,
		zone = "11001",
		icon = "camera_action26",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11603] = {
		anim_time = 13.2,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle01_fb02",
		desc = "放松",
		staypoint = "Pos400520",
		id = 11603,
		pre_anim = 11601,
		zone = "11001",
		icon = "camera_action27",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11604] = {
		anim_time = 9,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle01_fb03",
		desc = "拉伸",
		staypoint = "Pos400520",
		id = 11604,
		pre_anim = 11601,
		zone = "11001",
		icon = "camera_action28",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11601,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11605] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle02",
		desc = "静待",
		staypoint = "Pos400530",
		id = 11605,
		pre_anim = 0,
		zone = "11001",
		icon = "camera_action32",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11605,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11606] = {
		anim_time = 17.367,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle02_fb01",
		desc = "邀请",
		staypoint = "Pos400530",
		id = 11606,
		pre_anim = 11605,
		zone = "11001",
		icon = "camera_action33",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11605,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11607] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle03",
		desc = "躺下",
		staypoint = "Pos400540",
		id = 11607,
		pre_anim = 0,
		zone = "11001",
		icon = "camera_action25",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11607,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[11608] = {
		anim_time = 14.7,
		unlock = "",
		ship_group = 10517,
		state = "IK_bed02_idle03_fb01",
		desc = "侧身",
		staypoint = "Pos400540",
		id = 11608,
		pre_anim = 11607,
		zone = "11001",
		icon = "camera_action27",
		room = 11,
		enter_extra_item = "",
		furniture_id = 1153,
		finish_anim = 11607,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[12501] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle01",
		desc = "静待",
		staypoint = "Pos500510",
		id = 12501,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action13",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12501,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle01_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12502] = {
		anim_time = 23.667,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle01_fb01",
		desc = "伸腿",
		staypoint = "Pos500510",
		id = 12502,
		pre_anim = 12501,
		zone = "12003",
		icon = "camera_action14",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12501,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle01_fb01_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12503] = {
		anim_time = 17.7,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle01_fb02",
		desc = "伸展",
		staypoint = "Pos500510",
		id = 12503,
		pre_anim = 12501,
		zone = "12003",
		icon = "camera_action15",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12501,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle01_fb02_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12504] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle02",
		desc = "静待",
		staypoint = "Pos500520",
		id = 12504,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action32",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12504,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle02_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12505] = {
		anim_time = 12.7,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle02_fb01",
		desc = "准备",
		staypoint = "Pos500520",
		id = 12505,
		pre_anim = 12504,
		zone = "12003",
		icon = "camera_action33",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12504,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle02_fb01_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12506] = {
		anim_time = 12.9,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle02_fb02",
		desc = "伸懒腰",
		staypoint = "Pos500520",
		id = 12506,
		pre_anim = 12504,
		zone = "12003",
		icon = "camera_action34",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12504,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle02_fb02_PP"
			}
		},
		hide_scene_item = {
			"no_bake_pay_prop/livingroom/pre_db_df_livingroom01_0"
		}
	}
	pg.base.dorm3d_camera_anim_template[12507] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle03",
		desc = "静待",
		staypoint = "Pos500530",
		id = 12507,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action1",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12507,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle03_PP"
			}
		},
		hide_scene_item = {
			"FurnitureSlots/1120304/pre_db_df_tedian01(Clone)/pre_db_df_chair01/fbx_db_df_chair01"
		}
	}
	pg.base.dorm3d_camera_anim_template[12508] = {
		anim_time = 9.133,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle03_fb01",
		desc = "拉伸",
		staypoint = "Pos500530",
		id = 12508,
		pre_anim = 12507,
		zone = "12003",
		icon = "camera_action2",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12507,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle03_fb01_PP"
			}
		},
		hide_scene_item = {
			"FurnitureSlots/1120304/pre_db_df_tedian01(Clone)/pre_db_df_chair01/fbx_db_df_chair01"
		}
	}
	pg.base.dorm3d_camera_anim_template[12509] = {
		anim_time = 11.1,
		unlock = "",
		ship_group = 30707,
		state = "IK_sp01_idle03_fb02",
		desc = "开心",
		staypoint = "Pos500530",
		id = 12509,
		pre_anim = 12507,
		zone = "12003",
		icon = "camera_action4",
		room = 12,
		furniture_id = 1222,
		finish_anim = 12507,
		enter_scene_anim = "",
		enter_extra_item = {
			{
				"furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_sp01_idle03_fb02_PP"
			}
		},
		hide_scene_item = {
			"FurnitureSlots/1120304/pre_db_df_tedian01(Clone)/pre_db_df_chair01/fbx_db_df_chair01"
		}
	}
	pg.base.dorm3d_camera_anim_template[12601] = {
		anim_time = 2,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle01",
		desc = "静待",
		staypoint = "Pos500610",
		id = 12601,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action13",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12601,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle01_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12602] = {
		anim_time = 14.8,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle01_fb01",
		desc = "伸腿",
		staypoint = "Pos500610",
		id = 12602,
		pre_anim = 12601,
		zone = "12003",
		icon = "camera_action32",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12601,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle01_fb01_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12603] = {
		anim_time = 14.133,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle01_fb02",
		desc = "品尝",
		staypoint = "Pos500610",
		id = 12603,
		pre_anim = 12601,
		zone = "12003",
		icon = "camera_action15",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12601,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle01_fb02_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12604] = {
		anim_time = 13.5,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle01_fb03",
		desc = "撒娇",
		staypoint = "Pos500610",
		id = 12604,
		pre_anim = 12601,
		zone = "12003",
		icon = "camera_action32",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12601,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle01_fb03_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12605] = {
		anim_time = 2,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle02",
		desc = "静待",
		staypoint = "Pos500630",
		id = 12605,
		pre_anim = 0,
		zone = "12003",
		icon = "camera_action18",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12605,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle02_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12606] = {
		anim_time = 11.867,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle02_fb01",
		desc = "伸懒腰",
		staypoint = "Pos500630",
		id = 12606,
		pre_anim = 12605,
		zone = "12003",
		icon = "camera_action34",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12605,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle02_fb01_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[12607] = {
		anim_time = 10.033,
		unlock = "",
		ship_group = 30707,
		state = "IK_living02_idle02_fb02",
		desc = "邀请",
		staypoint = "Pos500630",
		id = 12607,
		pre_anim = 12605,
		zone = "12003",
		icon = "camera_action14",
		room = 12,
		enter_extra_item = "",
		furniture_id = 1223,
		finish_anim = 12605,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2019,
				"IK_living02_idle02_fb02_CJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 14001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14002] = {
		anim_time = 4,
		unlock = "",
		ship_group = 49905,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 14002,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action2",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14003] = {
		anim_time = 6,
		unlock = "",
		ship_group = 49905,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 14003,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action3",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14004] = {
		anim_time = 12.133,
		unlock = "",
		ship_group = 49905,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 14004,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action4",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14005] = {
		anim_time = 10,
		unlock = "",
		ship_group = 49905,
		state = "sad_01-start",
		desc = "悲伤 ",
		staypoint = "",
		id = 14005,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action5",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14006] = {
		anim_time = 6.733,
		unlock = "",
		ship_group = 49905,
		state = "happy_01-start",
		desc = "开心",
		staypoint = "",
		id = 14006,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action6",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14007] = {
		anim_time = 5.833,
		unlock = "",
		ship_group = 49905,
		state = "excited_01-start",
		desc = "激动",
		staypoint = "",
		id = 14007,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action7",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14008] = {
		anim_time = 8.4,
		unlock = "",
		ship_group = 49905,
		state = "talk_01-start",
		desc = "交谈",
		staypoint = "",
		id = 14008,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action8",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14009] = {
		anim_time = 8.667,
		unlock = "",
		ship_group = 49905,
		state = "satisfied_01-start",
		desc = "得意",
		staypoint = "",
		id = 14009,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action9",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14010] = {
		anim_time = 8.833,
		unlock = "",
		ship_group = 49905,
		state = "emotion_01-start",
		desc = "感动",
		staypoint = "",
		id = 14010,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action10",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14011] = {
		anim_time = 6.833,
		unlock = "",
		ship_group = 49905,
		state = "secret_01-start",
		desc = "悄悄话",
		staypoint = "",
		id = 14011,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action11",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14012] = {
		anim_time = 10.033,
		unlock = "",
		ship_group = 49905,
		state = "stare_01-start",
		desc = "注视 ",
		staypoint = "",
		id = 14012,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action12",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14013] = {
		anim_time = 8.767,
		unlock = "",
		ship_group = 49905,
		state = "anger_01-start",
		desc = "叉腰 ",
		staypoint = "",
		id = 14013,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action13",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14014] = {
		anim_time = 6.23,
		unlock = "",
		ship_group = 49905,
		state = "scared_01-start",
		desc = "惊吓",
		staypoint = "",
		id = 14014,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action14",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14015] = {
		anim_time = 8.333,
		unlock = "",
		ship_group = 49905,
		state = "shy_01-start",
		desc = "害羞",
		staypoint = "",
		id = 14015,
		pre_anim = 14001,
		zone = "",
		icon = "camera_action15",
		room = 14,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 14001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed01_idle01",
		desc = "静待",
		staypoint = "Pos600110",
		id = 14101,
		pre_anim = 0,
		zone = "14001",
		icon = "camera_action1",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1401,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14102] = {
		anim_time = 16,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed01_idle01_fb01",
		desc = "伸懒腰",
		staypoint = "Pos600110",
		id = 14102,
		pre_anim = 14101,
		zone = "14001",
		icon = "camera_action2",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1401,
		finish_anim = 14101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14103] = {
		anim_time = 16.33,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed01_idle01_fb02",
		desc = "邀请",
		staypoint = "Pos600110",
		id = 14103,
		pre_anim = 14101,
		zone = "14001",
		icon = "camera_action34",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1401,
		finish_anim = 14101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14104] = {
		anim_time = 16,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed01_idle01_fb03",
		desc = "躺下",
		staypoint = "Pos600110",
		id = 14104,
		pre_anim = 14101,
		zone = "14001",
		icon = "camera_action36",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1401,
		finish_anim = 14101,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk01_idle01",
		desc = "静待",
		staypoint = "Pos600210",
		id = 14201,
		pre_anim = 0,
		zone = "14002",
		icon = "camera_action13",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1402,
		finish_anim = 0,
		enter_scene_anim = "",
		hide_scene_item = {
			"no_bake_pay_prop/study/pre_db_aijier_study01_0/pre_db_drink13"
		}
	}
	pg.base.dorm3d_camera_anim_template[14202] = {
		anim_time = 12.8,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk01_idle01_fb01-start",
		desc = "侧身",
		staypoint = "Pos600210",
		id = 14202,
		pre_anim = 14201,
		zone = "14002",
		icon = "camera_action14",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1402,
		finish_anim = 14201,
		enter_scene_anim = "",
		hide_scene_item = {
			"no_bake_pay_prop/study/pre_db_aijier_study01_0/pre_db_drink13"
		}
	}
	pg.base.dorm3d_camera_anim_template[14203] = {
		anim_time = 14.767,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk01_idle01_fb02",
		desc = "邀请",
		staypoint = "Pos600210",
		id = 14203,
		pre_anim = 14201,
		zone = "14002",
		icon = "camera_action15",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1402,
		finish_anim = 14201,
		enter_scene_anim = "",
		hide_scene_item = {
			"no_bake_pay_prop/study/pre_db_aijier_study01_0/pre_db_drink13"
		}
	}
	pg.base.dorm3d_camera_anim_template[14204] = {
		anim_time = 14.367,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk01_idle01_fb03",
		desc = "伸腿",
		staypoint = "Pos600210",
		id = 14204,
		pre_anim = 14201,
		zone = "14002",
		icon = "camera_action16",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1402,
		finish_anim = 14201,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_living01_idle01",
		desc = "静待",
		staypoint = "Pos600310",
		id = 14301,
		pre_anim = 0,
		zone = "14003",
		icon = "camera_action17",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1403,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14302] = {
		anim_time = 10.8,
		unlock = "",
		ship_group = 49905,
		state = "IK_living01_idle01_fb01",
		desc = "放松",
		staypoint = "Pos600310",
		id = 14302,
		pre_anim = 14301,
		zone = "14003",
		icon = "camera_action18",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1403,
		finish_anim = 14301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14303] = {
		anim_time = 10,
		unlock = "",
		ship_group = 49905,
		state = "IK_living01_idle01_fb02",
		desc = "开心",
		staypoint = "Pos600310",
		id = 14303,
		pre_anim = 14301,
		zone = "14003",
		icon = "camera_action19",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1403,
		finish_anim = 14301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14304] = {
		anim_time = 12.333,
		unlock = "",
		ship_group = 49905,
		state = "IK_living01_idle01_fb03",
		desc = "伸展",
		staypoint = "Pos600310",
		id = 14304,
		pre_anim = 14301,
		zone = "14003",
		icon = "camera_action20",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1403,
		finish_anim = 14301,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle01",
		desc = "静待",
		staypoint = "Pos600410",
		id = 14401,
		pre_anim = 0,
		zone = "14001",
		icon = "camera_action6",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14402] = {
		anim_time = 16.8,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle01_fb01",
		desc = "伸懒腰",
		staypoint = "Pos600410",
		id = 14402,
		pre_anim = 14401,
		zone = "14001",
		icon = "camera_action32",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 14401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14403] = {
		anim_time = 19.667,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle01_fb02",
		desc = "邀请",
		staypoint = "Pos600410",
		id = 14403,
		pre_anim = 14401,
		zone = "14001",
		icon = "camera_action33",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 14401,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14404] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle02",
		desc = "静待",
		staypoint = "Pos600410",
		id = 14404,
		pre_anim = 0,
		zone = "14001",
		icon = "camera_action25",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14405] = {
		anim_time = 13.5,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle02_fb01",
		desc = "拉腿",
		staypoint = "Pos600410",
		id = 14405,
		pre_anim = 14404,
		zone = "14001",
		icon = "camera_action26",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 14404,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14406] = {
		anim_time = 18,
		unlock = "",
		ship_group = 49905,
		state = "IK_bed02_idle02_fb02",
		desc = "等待",
		staypoint = "Pos600410",
		id = 14406,
		pre_anim = 14404,
		zone = "14001",
		icon = "camera_action27",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1461,
		finish_anim = 14404,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[14501] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle01",
		desc = "静待",
		staypoint = "Pos600510",
		id = 14501,
		pre_anim = 0,
		zone = "14002",
		icon = "camera_action24",
		room = 14,
		hide_scene_item = "",
		furniture_id = 1462,
		finish_anim = 0,
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle01_ZZ"
			}
		},
		enter_extra_item = {
			{
				"furniture/Item/Book_01/pre_db_book_01_IK600510",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_desk02_idle01_book"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14502] = {
		anim_time = 23.9,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle01_fb02",
		desc = "伸懒腰",
		staypoint = "Pos600510",
		id = 14502,
		pre_anim = 14501,
		zone = "14002",
		icon = "camera_action25",
		room = 14,
		hide_scene_item = "",
		furniture_id = 1462,
		finish_anim = 14501,
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle01_fb02_ZZ"
			}
		},
		enter_extra_item = {
			{
				"furniture/Item/Book_01/pre_db_book_01_IK600510",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_desk02_idle01_fb02_book"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14503] = {
		anim_time = 15.567,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle01_fb01",
		desc = "侧身",
		staypoint = "Pos600510",
		id = 14503,
		pre_anim = 14501,
		zone = "14002",
		icon = "camera_action14",
		room = 14,
		hide_scene_item = "",
		furniture_id = 1462,
		finish_anim = 14501,
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle01_fb01_ZZ"
			}
		},
		enter_extra_item = {
			{
				"furniture/Item/Book_01/pre_db_book_01_IK600510",
				"",
				{
					0,
					0,
					0
				},
				{
					0,
					0,
					0
				},
				"IK_desk02_idle01_fb01_book"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14504] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle02",
		desc = "静待",
		staypoint = "Pos600520",
		id = 14504,
		pre_anim = 0,
		zone = "14002",
		icon = "camera_action20",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1462,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle02_ZZ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14505] = {
		anim_time = 11.333,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle02_fb01",
		desc = "伸懒腰",
		staypoint = "Pos600520",
		id = 14505,
		pre_anim = 14504,
		zone = "14002",
		icon = "camera_action13",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1462,
		finish_anim = 14504,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle02_fb01_ZZ"
			}
		}
	}
end)()
;(function()
	pg.base.dorm3d_camera_anim_template[14506] = {
		anim_time = 24.533,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle02_fb02",
		desc = "开心",
		staypoint = "Pos600520",
		id = 14506,
		pre_anim = 14504,
		zone = "14002",
		icon = "camera_action14",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1462,
		finish_anim = 14504,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle02_fb02_ZZ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[14507] = {
		anim_time = 23.667,
		unlock = "",
		ship_group = 49905,
		state = "IK_desk02_idle02_fb03",
		desc = "得意",
		staypoint = "Pos600520",
		id = 14507,
		pre_anim = 14504,
		zone = "14002",
		icon = "camera_action15",
		room = 14,
		enter_extra_item = "",
		furniture_id = 1462,
		finish_anim = 14504,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				2023,
				"IK_desk02_idle02_fb03_ZZ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[16001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 10517,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 16001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16002] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 16002,
		pre_anim = 16001,
		zone = "",
		icon = "camera_action7",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16003] = {
		anim_time = 5,
		unlock = "",
		ship_group = 10517,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 16003,
		pre_anim = 16001,
		zone = "",
		icon = "camera_action12",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16004] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 16004,
		pre_anim = 16001,
		zone = "",
		icon = "camera_action10",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16005] = {
		anim_time = 7,
		unlock = "",
		ship_group = 10517,
		state = "sad_01-start",
		desc = "沮丧",
		staypoint = "",
		id = 16005,
		pre_anim = 16001,
		zone = "",
		icon = "camera_action11",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16006] = {
		anim_time = 0,
		unlock = "",
		ship_group = 30707,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 16006,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16006,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16007] = {
		anim_time = 2.3,
		unlock = "",
		ship_group = 30707,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 16007,
		pre_anim = 16006,
		zone = "",
		icon = "camera_action7",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16006,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16008] = {
		anim_time = 2.4,
		unlock = "",
		ship_group = 30707,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 16008,
		pre_anim = 16006,
		zone = "",
		icon = "camera_action12",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16006,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16009] = {
		anim_time = 6.1,
		unlock = "",
		ship_group = 30707,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 16009,
		pre_anim = 16006,
		zone = "",
		icon = "camera_action10",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16006,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16010] = {
		anim_time = 7.334,
		unlock = "",
		ship_group = 30707,
		state = "sad_01-start",
		desc = "悲伤 ",
		staypoint = "",
		id = 16010,
		pre_anim = 16006,
		zone = "",
		icon = "camera_action11",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16006,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16011] = {
		anim_time = 0,
		unlock = "",
		ship_group = 49905,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 16011,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 0,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16012] = {
		anim_time = 4,
		unlock = "",
		ship_group = 49905,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 16012,
		pre_anim = 16011,
		zone = "",
		icon = "camera_action2",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16011,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16013] = {
		anim_time = 6,
		unlock = "",
		ship_group = 49905,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 16013,
		pre_anim = 16011,
		zone = "",
		icon = "camera_action8",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16011,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16014] = {
		anim_time = 12.133,
		unlock = "",
		ship_group = 49905,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 16014,
		pre_anim = 16011,
		zone = "",
		icon = "camera_action10",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16011,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16015] = {
		anim_time = 10,
		unlock = "",
		ship_group = 49905,
		state = "sad_01-start",
		desc = "悲伤 ",
		staypoint = "",
		id = 16015,
		pre_anim = 16011,
		zone = "",
		icon = "camera_action11",
		room = 16,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16011,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16016] = {
		anim_time = 0,
		unlock = "",
		ship_group = 20220,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 16016,
		pre_anim = 0,
		zone = "",
		icon = "camera_action1",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16016,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16017] = {
		anim_time = 1.533,
		unlock = "",
		ship_group = 20220,
		state = "diantou",
		desc = "点头",
		staypoint = "",
		id = 16017,
		pre_anim = 16016,
		zone = "",
		icon = "camera_action2",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16016,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16018] = {
		anim_time = 5.267,
		unlock = "",
		ship_group = 20220,
		state = "yaotou",
		desc = "摇头",
		staypoint = "",
		id = 16018,
		pre_anim = 16016,
		zone = "",
		icon = "camera_action8",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16016,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16019] = {
		anim_time = 9,
		unlock = "",
		ship_group = 20220,
		state = "sikao1",
		desc = "疑惑",
		staypoint = "",
		id = 16019,
		pre_anim = 16016,
		zone = "",
		icon = "camera_action10",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16016,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[16020] = {
		anim_time = 5.7,
		unlock = "",
		ship_group = 20220,
		state = "shy",
		desc = "害羞 ",
		staypoint = "",
		id = 16020,
		pre_anim = 16016,
		zone = "",
		icon = "camera_action11",
		room = 1,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 16016,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 21001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21002] = {
		anim_time = 5.667,
		unlock = "",
		ship_group = 79902,
		state = "nod_01",
		desc = "点头",
		staypoint = "",
		id = 21002,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action7",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21003] = {
		anim_time = 4.667,
		unlock = "",
		ship_group = 79902,
		state = "shake_01",
		desc = "摇头",
		staypoint = "",
		id = 21003,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action12",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21004] = {
		anim_time = 5.833,
		unlock = "",
		ship_group = 79902,
		state = "doubt_01-start",
		desc = "疑惑",
		staypoint = "",
		id = 21004,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action10",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21005] = {
		anim_time = 5.833,
		unlock = "",
		ship_group = 79902,
		state = "sad_01-start",
		desc = "沮丧",
		staypoint = "",
		id = 21005,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21006] = {
		anim_time = 5.667,
		unlock = "",
		ship_group = 79902,
		state = "happy_01-start",
		desc = "开心",
		staypoint = "",
		id = 21006,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action6",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21007] = {
		anim_time = 5,
		unlock = "",
		ship_group = 79902,
		state = "excited_01-start",
		desc = "激动",
		staypoint = "",
		id = 21007,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action7",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21008] = {
		anim_time = 4.833,
		unlock = "",
		ship_group = 79902,
		state = "talk_01-start",
		desc = "交谈",
		staypoint = "",
		id = 21008,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action8",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21009] = {
		anim_time = 6.433,
		unlock = "",
		ship_group = 79902,
		state = "satisfied_01-start",
		desc = "得意",
		staypoint = "",
		id = 21009,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action9",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21010] = {
		anim_time = 10.3333,
		unlock = "",
		ship_group = 79902,
		state = "scared_01-start",
		desc = "惊吓",
		staypoint = "",
		id = 21010,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action14",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21011] = {
		anim_time = 6.766,
		unlock = "",
		ship_group = 79902,
		state = "anger_01-start",
		desc = "惊讶",
		staypoint = "",
		id = 21011,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action5",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21012] = {
		anim_time = 7.333,
		unlock = "",
		ship_group = 79902,
		state = "talk_02-start",
		desc = "解释",
		staypoint = "",
		id = 21012,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21013] = {
		anim_time = 6.33,
		unlock = "",
		ship_group = 79902,
		state = "think_01-start",
		desc = "思考 ",
		staypoint = "",
		id = 21013,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action3",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21014] = {
		anim_time = 9.133,
		unlock = "",
		ship_group = 79902,
		state = "shy_01",
		desc = "害羞 ",
		staypoint = "",
		id = 21014,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21015] = {
		anim_time = 5.833,
		unlock = "",
		ship_group = 79902,
		state = "sad_01-start",
		desc = "悲伤 ",
		staypoint = "",
		id = 21015,
		pre_anim = 21001,
		zone = "",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 21001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[21101] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk01_idle01",
		desc = "静待",
		staypoint = "Pos700210",
		id = 21101,
		pre_anim = 0,
		zone = "21002",
		icon = "camera_action1",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2102,
		finish_anim = 21101,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3002,
				"IK_desk01_idle01_ZWJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21102] = {
		anim_time = 9.533,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk01_idle01_fb01",
		desc = "疑惑",
		staypoint = "Pos700210",
		id = 21102,
		pre_anim = 21101,
		zone = "21002",
		icon = "camera_action3",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2102,
		finish_anim = 21101,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3002,
				"IK_desk01_idle01_fb01_ZWJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21103] = {
		anim_time = 24.033,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk01_idle01_fb02",
		desc = "开心",
		staypoint = "Pos700210",
		id = 21103,
		pre_anim = 21101,
		zone = "21002",
		icon = "camera_action10",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2102,
		finish_anim = 21101,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3002,
				"IK_desk01_idle01_fb02_ZWJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21104] = {
		anim_time = 10.833,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk01_idle01_fb03",
		desc = "得意",
		staypoint = "Pos700210",
		id = 21104,
		pre_anim = 21101,
		zone = "21002",
		icon = "camera_action6",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2102,
		finish_anim = 21101,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3002,
				"IK_desk01_idle01_fb03_ZWJ"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21201] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "IK_living01_idle01",
		desc = "静待",
		staypoint = "Pos700310",
		id = 21201,
		pre_anim = 0,
		zone = "21003",
		icon = "camera_action13",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2103,
		finish_anim = 21201,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3003,
				"IK_living01_idle01_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21202] = {
		anim_time = 17.6,
		unlock = "",
		ship_group = 79902,
		state = "IK_living01_idle01_fb01",
		desc = "害羞",
		staypoint = "Pos700310",
		id = 21202,
		pre_anim = 21201,
		zone = "21003",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2103,
		finish_anim = 21201,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3003,
				"IK_living01_idle01_fb01_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21203] = {
		anim_time = 16.33,
		unlock = "",
		ship_group = 79902,
		state = "IK_living01_idle01_fb02",
		desc = "惊讶",
		staypoint = "Pos700310",
		id = 21203,
		pre_anim = 21201,
		zone = "21003",
		icon = "camera_action5",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2103,
		finish_anim = 21201,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3003,
				"IK_living01_idle01_fb02_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21204] = {
		anim_time = 21.267,
		unlock = "",
		ship_group = 79902,
		state = "IK_living01_idle01_fb03",
		desc = "放松",
		staypoint = "Pos700310",
		id = 21204,
		pre_anim = 21201,
		zone = "21003",
		icon = "camera_action18",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2103,
		finish_anim = 21201,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3003,
				"IK_living01_idle01_fb03_SF"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21301] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "IK_bed01_idle01",
		desc = "静待",
		staypoint = "Pos700110",
		id = 21301,
		pre_anim = 0,
		zone = "21001",
		icon = "camera_action32",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2101,
		finish_anim = 21301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3001,
				"IK_bed01_idle01_ZX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21302] = {
		anim_time = 16.333,
		unlock = "",
		ship_group = 79902,
		state = "IK_bed01_idle01_fb01",
		desc = "放松",
		staypoint = "Pos700110",
		id = 21302,
		pre_anim = 21301,
		zone = "21001",
		icon = "camera_action25",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2101,
		finish_anim = 21301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3001,
				"IK_bed01_idle01_fb01_ZX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21303] = {
		anim_time = 10,
		unlock = "",
		ship_group = 79902,
		state = "IK_bed01_idle01_fb02",
		desc = "邀请",
		staypoint = "Pos700110",
		id = 21303,
		pre_anim = 21301,
		zone = "21001",
		icon = "camera_action26",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2101,
		finish_anim = 21301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3001,
				"IK_bed01_idle01_fb02_ZX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21304] = {
		anim_time = 22.1,
		unlock = "",
		ship_group = 79902,
		state = "IK_bed01_idle01_fb03",
		desc = "伸展",
		staypoint = "Pos700110",
		id = 21304,
		pre_anim = 21301,
		zone = "21001",
		icon = "camera_action27",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2101,
		finish_anim = 21301,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3001,
				"IK_bed01_idle01_fb03_ZX"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21401] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk02_idle01",
		desc = "静待",
		staypoint = "Pos700410",
		id = 21401,
		pre_anim = 0,
		zone = "21001",
		icon = "camera_action1",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2161,
		finish_anim = 21401,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3004,
				"IK_desk02_idle01_MFJC"
			},
			{
				3005,
				"vfx_desk02_idle01"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21402] = {
		anim_time = 24.1,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk02_idle01_fb02",
		desc = "思考 ",
		staypoint = "Pos700410",
		id = 21402,
		pre_anim = 21401,
		zone = "21001",
		icon = "camera_action3",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2161,
		finish_anim = 21401,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3004,
				"IK_desk02_idle01_fb02_MFJC"
			},
			{
				3005,
				"vfx_desk02_idle01_fb02"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21403] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk02_idle02",
		desc = "静待",
		staypoint = "Pos700410",
		id = 21403,
		pre_anim = 0,
		zone = "21001",
		icon = "camera_action1",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2161,
		finish_anim = 21403,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3004,
				"IK_desk02_idle02_MFJC"
			},
			{
				3005,
				"vfx_desk02_idle02"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21404] = {
		anim_time = 13.033,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk02_idle02_fb02",
		desc = "惊吓",
		staypoint = "Pos700410",
		id = 21404,
		pre_anim = 21403,
		zone = "21001",
		icon = "camera_action14",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2161,
		finish_anim = 21403,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3004,
				"IK_desk02_idle02_fb02_MFJC"
			},
			{
				3005,
				"vfx_desk02_idle02_fb02"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[21405] = {
		anim_time = 16.267,
		unlock = "",
		ship_group = 79902,
		state = "IK_desk02_idle02_fb03",
		desc = "开心",
		staypoint = "Pos700410",
		id = 21405,
		pre_anim = 21403,
		zone = "21001",
		icon = "camera_action6",
		room = 21,
		enter_extra_item = "",
		furniture_id = 2161,
		finish_anim = 21403,
		hide_scene_item = "",
		enter_scene_anim = {
			{
				3004,
				"IK_desk02_idle02_fb03_MFJC"
			},
			{
				3005,
				"vfx_desk02_idle02_fb03"
			}
		}
	}
	pg.base.dorm3d_camera_anim_template[26001] = {
		anim_time = 0,
		unlock = "",
		ship_group = 79902,
		state = "Idle",
		desc = "静待",
		staypoint = "",
		id = 26001,
		pre_anim = 0,
		zone = "",
		icon = "camera_action2",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 26001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[26002] = {
		anim_time = 6.6,
		unlock = "",
		ship_group = 79902,
		state = "GGX_enjoy_01-start",
		desc = "开心",
		staypoint = "",
		id = 26002,
		pre_anim = 26001,
		zone = "",
		icon = "camera_action6",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 26001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[26003] = {
		anim_time = 8.167,
		unlock = "",
		ship_group = 79902,
		state = "GGX_invite_01-start",
		desc = "邀请",
		staypoint = "",
		id = 26003,
		pre_anim = 26001,
		zone = "",
		icon = "camera_action9",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 26001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[26004] = {
		anim_time = 6.9,
		unlock = "",
		ship_group = 79902,
		state = "GGX_hello_01-start",
		desc = "问好",
		staypoint = "",
		id = 26004,
		pre_anim = 26001,
		zone = "",
		icon = "camera_action5",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 26001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
	pg.base.dorm3d_camera_anim_template[26005] = {
		anim_time = 9.133,
		unlock = "",
		ship_group = 79902,
		state = "shy",
		desc = "害羞 ",
		staypoint = "",
		id = 26005,
		pre_anim = 26001,
		zone = "",
		icon = "camera_action11",
		room = 21,
		enter_extra_item = "",
		furniture_id = 0,
		finish_anim = 26001,
		hide_scene_item = "",
		enter_scene_anim = ""
	}
end)()
