pg = pg or {}
pg.island_buff_template = rawget(pg, "island_buff_template") or setmetatable({
	__name = "island_buff_template"
}, confNEO)
pg.island_buff_template.all = {
	1,
	2,
	3,
	4,
	5,
	10000,
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	10008,
	10009,
	10010,
	10011,
	10012,
	10013,
	10014,
	10015,
	10016,
	10017,
	10018,
	10019,
	10020,
	10021,
	10022,
	10023,
	10024,
	10025,
	10026,
	10027,
	10028,
	10029,
	10030,
	10031,
	10032,
	10033,
	10034,
	10035,
	10036,
	10037,
	10038,
	10039,
	10040,
	10041,
	10042,
	10043,
	10044,
	10045,
	10046,
	10047,
	10048,
	10049,
	10050,
	10051,
	10052,
	10053,
	10054,
	10055,
	10056,
	10057,
	10058,
	10059,
	10060,
	10061,
	10062,
	10063,
	10064,
	10065,
	10066,
	10067,
	10068,
	10069,
	10070,
	10071,
	10072,
	10073,
	10074,
	10075,
	10076,
	10077,
	10078,
	10079,
	10080,
	10081,
	10082,
	10083,
	10084,
	10085,
	10086,
	10087,
	10088,
	10089,
	10090,
	10091,
	10092,
	10093,
	10094,
	10095,
	10096,
	10097,
	10098,
	10099,
	10100,
	10101,
	10102,
	10103,
	10104,
	10105,
	10106,
	10107,
	10108,
	10109,
	10110,
	10111,
	10112,
	10113,
	10114,
	10115,
	10116,
	10117,
	10118,
	10119,
	10120,
	10121,
	10122,
	10123,
	10124,
	10125,
	10126,
	10127,
	10128,
	10129,
	10130,
	10131,
	10132,
	10133,
	10134,
	10135,
	10136,
	10137,
	10138,
	10139,
	10140,
	10141,
	10142,
	10143,
	10144,
	10145,
	10146,
	10147,
	10148,
	10149,
	10150,
	10151,
	10152,
	10153,
	10154,
	10155,
	10156,
	10157,
	10158,
	10159,
	10160,
	10161,
	10162,
	10163,
	10164,
	10165,
	10166,
	10167,
	10168,
	10169,
	10170,
	10171,
	10172,
	10173,
	10174,
	10175,
	10176,
	10177,
	10178,
	10179,
	10180,
	10181,
	10182,
	10183,
	10184,
	10185,
	10186,
	10187,
	10188,
	10189,
	10190,
	10191,
	10192,
	10193,
	10194,
	10195,
	10196,
	10197,
	10198,
	10199,
	10200,
	10201,
	10202,
	10203,
	10204,
	10205,
	10206,
	10207,
	10208,
	10209,
	10210,
	10211,
	10212,
	10213,
	10214,
	10215,
	10216,
	10217,
	10218,
	10219,
	10220,
	10221,
	10222,
	10223,
	10224,
	10225,
	10226,
	10227,
	10228,
	10229,
	10230,
	10231,
	10232,
	10233,
	10234,
	10235,
	10236,
	10237,
	10238,
	10239,
	10240,
	10241,
	10242,
	10243,
	10244,
	10245,
	10246,
	10247,
	10248,
	10249,
	10250,
	10251,
	10252,
	10253,
	10254,
	10255,
	10256,
	10257,
	10258,
	10259,
	10260,
	10261,
	10262,
	10263,
	10264,
	10265,
	10266,
	10267,
	10268,
	10269,
	10270,
	10271,
	10272,
	10273,
	10274,
	10275,
	10276,
	10277,
	10278,
	10279,
	100001,
	100002,
	100003,
	100004,
	100010,
	100011,
	100012,
	100013,
	100014,
	100015,
	100016,
	100017,
	100018,
	100019,
	999990
}
pg.base = pg.base or {}
pg.base.island_buff_template = {}

;(function()
	pg.base.island_buff_template[1] = {
		buff_desc = "角色全能力提高3%，持续8小时",
		name = "全能力提升",
		buff_type = 1,
		buff_level = 1,
		buff_color = 2,
		buff_time = 28800,
		id = 1,
		buff_group = 1,
		type_use = {
			{
				1,
				3
			},
			{
				2,
				3
			},
			{
				3,
				3
			},
			{
				4,
				3
			},
			{
				5,
				3
			},
			{
				6,
				3
			}
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[2] = {
		buff_desc = "角色生产基础资材时，工作速度提高5%，持续8小时",
		name = "生产效率提升",
		buff_type = 102,
		buff_level = 1,
		buff_color = 2,
		buff_time = 28800,
		id = 2,
		buff_group = 1,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502
			},
			5
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[3] = {
		buff_desc = "角色在基地工厂制作产品时，工作速度提高5%，持续8小时",
		name = "制造效率提升",
		buff_type = 102,
		buff_level = 1,
		buff_color = 2,
		buff_time = 28800,
		id = 3,
		buff_group = 1,
		type_use = {
			{
				703,
				704,
				705,
				706
			},
			5
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[4] = {
		buff_desc = "角色制作店铺餐品时，工作速度提高5%，持续8小时",
		name = "烹饪效率提升",
		buff_type = 102,
		buff_level = 1,
		buff_color = 2,
		buff_time = 28800,
		id = 4,
		buff_group = 1,
		type_use = {
			{
				601,
				602,
				603,
				604,
				901
			},
			5
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[5] = {
		buff_desc = "角色经营店铺时，销售额提高5%，持续8小时",
		name = "销售额提升",
		buff_type = 601,
		buff_level = 1,
		buff_color = 2,
		buff_time = 28800,
		id = 5,
		buff_group = 1,
		type_use = {
			{
				601,
				602,
				603,
				604,
				901
			},
			5
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[10000] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10000,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			6
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10001] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10001,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			6.5
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10002] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10002,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			7
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10003] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10003,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			7.5
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10004] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10004,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			8
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10005] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10005,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			8.5
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10006] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10006,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			9
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10007] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10007,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			10
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10008] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10008,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			11
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10009] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "制造技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10009,
		buff_group = 1000,
		type_use = {
			{
				706
			},
			12
		},
		type_duel = {
			1000
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10010] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10010,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			4
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10011] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10011,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			4.5
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10012] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10012,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			5
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10013] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10013,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			5.5
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10014] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10014,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			6
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10015] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10015,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			6.5
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10016] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10016,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			7
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10017] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10017,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			8
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10018] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10018,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			9
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10019] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐品销售",
		buff_type = 601,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10019,
		buff_group = 1001,
		type_use = {
			{
				604,
				603
			},
			10
		},
		type_duel = {
			1001
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10020] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10020,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			2
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10021] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10021,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			2.2
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10022] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10022,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			2.5
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10023] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10023,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			2.7
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10024] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10024,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			3
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10025] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10025,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			3.2
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10026] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10026,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			3.5
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10027] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10027,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			4
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10028] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10028,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			4.5
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10029] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 601,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10029,
		buff_group = 1002,
		type_use = {
			{
				901,
				602
			},
			5
		},
		type_duel = {
			1002
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10030] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10030,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			6
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10031] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10031,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			6.5
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10032] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10032,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			7
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10033] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10033,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			7.5
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10034] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10034,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			8
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10035] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10035,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			8.5
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10036] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10036,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			9
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10037] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10037,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			10
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10038] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10038,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			11
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10039] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "育果技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10039,
		buff_group = 1003,
		type_use = {
			{
				501
			},
			12
		},
		type_duel = {
			1003
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10040] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10040,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			6
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10041] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10041,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			6.5
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10042] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10042,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			7
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10043] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10043,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			7.5
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10044] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10044,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			8
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10045] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10045,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			8.5
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10046] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10046,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			9
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10047] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10047,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			10
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10048] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10048,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			11
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10049] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "伐木技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10049,
		buff_group = 1004,
		type_use = {
			{
				402
			},
			12
		},
		type_duel = {
			1004
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10050] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10050,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			6
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10051] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10051,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			6.5
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10052] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10052,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			7
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10053] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10053,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			7.5
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10054] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10054,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			8
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10055] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10055,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			8.5
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10056] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10056,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			9
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10057] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10057,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			10
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10058] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10058,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			11
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10059] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "畜牧技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10059,
		buff_group = 1005,
		type_use = {
			{
				102
			},
			12
		},
		type_duel = {
			1005
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10060] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10060,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			6
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10061] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10061,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			6.5
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10062] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10062,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			7
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10063] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10063,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			7.5
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10064] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10064,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			8
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10065] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10065,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			8.5
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10066] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10066,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			9
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10067] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10067,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			10
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10068] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10068,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			11
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10069] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烹饪技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10069,
		buff_group = 1006,
		type_use = {
			{
				601
			},
			12
		},
		type_duel = {
			1006
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10070] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10070,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			4
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10071] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10071,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			4.5
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10072] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10072,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			5
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10073] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10073,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			5.5
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10074] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10074,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			6
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10075] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10075,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			6.5
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10076] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10076,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			7
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10077] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10077,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			8
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10078] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10078,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			9
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10079] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "研发技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10079,
		buff_group = 1007,
		type_use = {
			{
				702
			},
			10
		},
		type_duel = {
			1007
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10080] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10080,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			6
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10081] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10081,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			6.5
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10082] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10082,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			7
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10083] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10083,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			7.5
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10084] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10084,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			8
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10085] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10085,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			8.5
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10086] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10086,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			9
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10087] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10087,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			10
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10088] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10088,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			11
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10089] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采矿技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10089,
		buff_group = 1008,
		type_use = {
			{
				401
			},
			12
		},
		type_duel = {
			1008
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10090] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10090,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			6
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10091] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10091,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			6.5
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10092] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10092,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			7
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10093] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10093,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			7.5
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10094] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10094,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			8
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
end)()
;(function()
	pg.base.island_buff_template[10095] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10095,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			8.5
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10096] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10096,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			9
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10097] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10097,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			10
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10098] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10098,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			11
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10099] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "耕作技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10099,
		buff_group = 1009,
		type_use = {
			{
				101
			},
			12
		},
		type_duel = {
			1009
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10100] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10100,
		buff_group = 1010,
		type_use = {
			3
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10101] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10101,
		buff_group = 1010,
		type_use = {
			3.2
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10102] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10102,
		buff_group = 1010,
		type_use = {
			3.5
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10103] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10103,
		buff_group = 1010,
		type_use = {
			3.7
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10104] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10104,
		buff_group = 1010,
		type_use = {
			4
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10105] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10105,
		buff_group = 1010,
		type_use = {
			4.2
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10106] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10106,
		buff_group = 1010,
		type_use = {
			4.5
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10107] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10107,
		buff_group = 1010,
		type_use = {
			5
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10108] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10108,
		buff_group = 1010,
		type_use = {
			5.5
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10109] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效回复",
		buff_type = 2,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10109,
		buff_group = 1010,
		type_use = {
			6
		},
		type_duel = {
			1010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10110] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10110,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			6
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10111] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10111,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			6.5
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10112] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10112,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			7
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10113] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10113,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			7.5
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10114] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10114,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			8
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10115] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10115,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			8.5
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10116] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10116,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			9
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10117] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10117,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			10
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10118] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10118,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			11
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10119] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "培育技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10119,
		buff_group = 1011,
		type_use = {
			{
				502
			},
			12
		},
		type_duel = {
			1011
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10120] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10120,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			4
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10121] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10121,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			4.5
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10122] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10122,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			5
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10123] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10123,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			5.5
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10124] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10124,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			6
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10125] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10125,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			6.5
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10126] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10126,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			7
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10127] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10127,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			8
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10128] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10128,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			9
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10129] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 601,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10129,
		buff_group = 1012,
		type_use = {
			{
				601
			},
			10
		},
		type_duel = {
			1012
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10130] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10130,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			6
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10131] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10131,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			6.5
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10132] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10132,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			7
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10133] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10133,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			7.5
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10134] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10134,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			8
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10135] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10135,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			8.5
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10136] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10136,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			9
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10137] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10137,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			10
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10138] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10138,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			11
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10139] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10139,
		buff_group = 1013,
		type_use = {
			{
				501
			},
			1,
			12
		},
		type_duel = {
			1013
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10140] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10140,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			4
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10141] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10141,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			4.5
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10142] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10142,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			5
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10143] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10143,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			5.5
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10144] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10144,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			6
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10145] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10145,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			6.5
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10146] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10146,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			7
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10147] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10147,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			8
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10148] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10148,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			9
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10149] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "高效研发",
		buff_type = 103,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10149,
		buff_group = 1014,
		type_use = {
			{
				702
			},
			10
		},
		type_duel = {
			1014
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10150] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10150,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			6
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10151] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10151,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			6.5
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10152] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10152,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			7
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10153] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10153,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			7.5
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10154] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10154,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			8
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10155] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10155,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			8.5
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10156] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10156,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			9
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10157] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10157,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			10
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10158] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10158,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			11
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10159] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "威廉D波特",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10159,
		buff_group = 1015,
		type_use = {
			{
				704
			},
			1,
			12
		},
		type_duel = {
			1015
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10160] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10160,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			6
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10161] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10161,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			6.5
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10162] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10162,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			7
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10163] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10163,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			7.5
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10164] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10164,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			8
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10165] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10165,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			8.5
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10166] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10166,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			9
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10167] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10167,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			10
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10168] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10168,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			11
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10169] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "镇海",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10169,
		buff_group = 1016,
		type_use = {
			{
				101
			},
			1,
			12
		},
		type_duel = {
			1016
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10170] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10170,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			3
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10171] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10171,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			3.5
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10172] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10172,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			4
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10173] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10173,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			4.5
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10174] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10174,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			5
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10175] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10175,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			5.5
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10176] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10176,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			6
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10177] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10177,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			6.5
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10178] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10178,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			7
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10179] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爱宕",
		buff_type = 103,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10179,
		buff_group = 1017,
		type_use = {
			{
				102
			},
			8
		},
		type_duel = {
			1017
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10180] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10180,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			4
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10181] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10181,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			4.5
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10182] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10182,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			5
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10183] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10183,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			5.5
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10184] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10184,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			6
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10185] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10185,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			6.5
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10186] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10186,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			7
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10187] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10187,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			8
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10188] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10188,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			9
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10189] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜",
		buff_type = 601,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10189,
		buff_group = 1018,
		type_use = {
			{
				603
			},
			10
		},
		type_duel = {
			1018
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10190] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10190,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			3
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10191] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10191,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			3.5
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10192] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10192,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			4
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10193] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10193,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			4.5
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10194] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10194,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			5
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
end)()
;(function()
	pg.base.island_buff_template[10195] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10195,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			5.5
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10196] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10196,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			6
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10197] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10197,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			6.5
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10198] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10198,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			7
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10199] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "修枝技艺",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10199,
		buff_group = 1019,
		type_use = {
			{
				901
			},
			1,
			8
		},
		type_duel = {
			1019
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10200] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10200,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			3
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10201] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10201,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			3.5
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10202] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10202,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			4
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10203] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10203,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			4.5
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10204] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10204,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			5
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10205] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10205,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			5.5
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10206] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10206,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			6
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10207] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10207,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			6.5
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10208] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10208,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			7
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10209] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采集技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10209,
		buff_group = 1020,
		type_use = {
			{
				401,
				402
			},
			8
		},
		type_duel = {
			1020
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10210] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10210,
		buff_group = 1021,
		type_use = {
			2
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10211] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10211,
		buff_group = 1021,
		type_use = {
			2.2
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10212] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10212,
		buff_group = 1021,
		type_use = {
			2.5
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10213] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10213,
		buff_group = 1021,
		type_use = {
			2.7
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10214] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10214,
		buff_group = 1021,
		type_use = {
			3
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10215] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10215,
		buff_group = 1021,
		type_use = {
			3.2
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10216] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10216,
		buff_group = 1021,
		type_use = {
			3.5
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10217] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10217,
		buff_group = 1021,
		type_use = {
			4
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10218] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10218,
		buff_group = 1021,
		type_use = {
			4.5
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10219] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "加速回复",
		buff_type = 2,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10219,
		buff_group = 1021,
		type_use = {
			5
		},
		type_duel = {
			1021
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10220] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10220,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			3
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10221] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10221,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			3.2
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10222] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10222,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			3.5
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10223] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10223,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			3.7
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10224] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10224,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			4
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10225] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10225,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			4.2
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10226] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10226,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			4.5
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10227] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10227,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			5
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10228] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10228,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			5.5
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10229] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "农作技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10229,
		buff_group = 1022,
		type_use = {
			{
				101,
				501,
				502
			},
			6
		},
		type_duel = {
			1022
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10230] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10230,
		buff_group = 1023,
		type_use = {
			-10
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10231] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10231,
		buff_group = 1023,
		type_use = {
			-9.5
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10232] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10232,
		buff_group = 1023,
		type_use = {
			-9
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10233] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10233,
		buff_group = 1023,
		type_use = {
			-8.5
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10234] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10234,
		buff_group = 1023,
		type_use = {
			-8
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10235] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10235,
		buff_group = 1023,
		type_use = {
			-7.5
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10236] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10236,
		buff_group = 1023,
		type_use = {
			-7
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10237] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10237,
		buff_group = 1023,
		type_use = {
			-6.5
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10238] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10238,
		buff_group = 1023,
		type_use = {
			-6
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10239] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "全力专注",
		buff_type = 2,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10239,
		buff_group = 1023,
		type_use = {
			-5
		},
		type_duel = {
			1023
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10240] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10240,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			6
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10241] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10241,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			6.5
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10242] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10242,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			7
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10243] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10243,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			7.5
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10244] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10244,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			8
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10245] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10245,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			8.5
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10246] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10246,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			9
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10247] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10247,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			10
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10248] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10248,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			11
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10249] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "采收技艺",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10249,
		buff_group = 1024,
		type_use = {
			{
				502
			},
			1,
			12
		},
		type_duel = {
			1024
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10250] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10250,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			6
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10251] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10251,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			6.5
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10252] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10252,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			7
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10253] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10253,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			7.5
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10254] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10254,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			8
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10255] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10255,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			8.5
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10256] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10256,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			9
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10257] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10257,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			10
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10258] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10258,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			11
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10259] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "爆破技艺",
		buff_type = 101,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10259,
		buff_group = 1025,
		type_use = {
			{
				401
			},
			1,
			12
		},
		type_duel = {
			1025
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10260] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10260,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			4
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10261] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10261,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			4.5
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10262] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10262,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			5
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10263] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10263,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			5.5
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10264] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10264,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			6
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10265] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10265,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			6.5
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10266] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10266,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			7
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10267] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10267,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			8
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10268] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10268,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			9
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10269] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 601,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10269,
		buff_group = 1026,
		type_use = {
			{
				604
			},
			10
		},
		type_duel = {
			1026
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10270] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 10270,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			6
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10271] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 2,
		buff_color = 0,
		buff_time = 0,
		id = 10271,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			6.5
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10272] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 3,
		buff_color = 0,
		buff_time = 0,
		id = 10272,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			7
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10273] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 4,
		buff_color = 0,
		buff_time = 0,
		id = 10273,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			7.5
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10274] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 5,
		buff_color = 0,
		buff_time = 0,
		id = 10274,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			8
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10275] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 6,
		buff_color = 0,
		buff_time = 0,
		id = 10275,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			8.5
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10276] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 7,
		buff_color = 0,
		buff_time = 0,
		id = 10276,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			9
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10277] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 8,
		buff_color = 0,
		buff_time = 0,
		id = 10277,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			10
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10278] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 9,
		buff_color = 0,
		buff_time = 0,
		id = 10278,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			11
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[10279] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "木工技艺",
		buff_type = 102,
		buff_level = 10,
		buff_color = 0,
		buff_time = 0,
		id = 10279,
		buff_group = 1027,
		type_use = {
			{
				703
			},
			12
		},
		type_duel = {
			1027
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100001] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "饮品销售",
		buff_type = 602,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100001,
		buff_group = 100001,
		type_use = {
			{
				901,
				602
			},
			1
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[100002] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "餐馆专销",
		buff_type = 602,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100002,
		buff_group = 100002,
		type_use = {
			{
				601
			},
			1
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[100003] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "海伦娜技能",
		buff_type = 602,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100003,
		buff_group = 100003,
		type_use = {
			{
				603
			},
			1
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[100004] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "烧烤精通",
		buff_type = 602,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100004,
		buff_group = 100004,
		type_use = {
			{
				604
			},
			1
		},
		type_duel = {},
		buff_duel = {}
	}
	pg.base.island_buff_template[100010] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率1",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100010,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			5
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100011] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率2",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100011,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			5.5
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100012] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率3",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100012,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			6
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100013] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率4",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100013,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			6.5
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100014] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率5",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100014,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			7
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100015] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率6",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100015,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			7.5
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100016] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率7",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100016,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			8
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100017] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率8",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100017,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			8.5
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100018] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率9",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100018,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			9
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[100019] = {
		buff_desc = "无需本地化，角色技能读skill表",
		name = "拉菲技能效率10",
		buff_type = 102,
		buff_level = 1,
		buff_color = 0,
		buff_time = 0,
		id = 100019,
		buff_group = 100010,
		type_use = {
			{
				101,
				102,
				201,
				401,
				402,
				501,
				502,
				601,
				602,
				603,
				604,
				702,
				703,
				704,
				705,
				706,
				901
			},
			10
		},
		type_duel = {
			100010
		},
		buff_duel = {}
	}
	pg.base.island_buff_template[999990] = {
		type_use = "0",
		name = "无限体力",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 99999,
		buff_time = 0,
		buff_level = 1,
		id = 999990,
		type_duel = {},
		buff_duel = {}
	}
end)()
