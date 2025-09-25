pg = pg or {}
pg.island_buff_template = {
	{
		buff_desc = "角色全能力提高3%，持续8小时。",
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
	},
	{
		buff_desc = "角色生产基础资材时，产出所需时间缩短5%，持续8小时。",
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
				401,
				402,
				501,
				502
			},
			5
		},
		type_duel = {},
		buff_duel = {}
	},
	{
		buff_desc = "角色在基地工厂制作产品时，产出所需时间缩短5%，持续8小时。",
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
	},
	{
		buff_desc = "角色制作店铺餐品时，烹饪所需时间缩短5%，持续8小时。",
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
	},
	[10000] = {
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
	},
	[10001] = {
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
	},
	[10002] = {
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
	},
	[10003] = {
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
	},
	[10004] = {
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
	},
	[10005] = {
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
	},
	[10006] = {
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
	},
	[10007] = {
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
	},
	[10008] = {
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
	},
	[10009] = {
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
	},
	[10010] = {
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
	},
	[10011] = {
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
	},
	[10012] = {
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
	},
	[10013] = {
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
	},
	[10014] = {
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
	},
	[10015] = {
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
	},
	[10016] = {
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
	},
	[10017] = {
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
	},
	[10018] = {
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
	},
	[10019] = {
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
	},
	[10020] = {
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
	},
	[10021] = {
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
	},
	[10022] = {
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
	},
	[10023] = {
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
	},
	[10024] = {
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
	},
	[10025] = {
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
	},
	[10026] = {
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
	},
	[10027] = {
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
	},
	[10028] = {
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
	},
	[10029] = {
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
	},
	[10030] = {
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
	},
	[10031] = {
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
	},
	[10032] = {
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
	},
	[10033] = {
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
	},
	[10034] = {
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
	},
	[10035] = {
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
	},
	[10036] = {
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
	},
	[10037] = {
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
	},
	[10038] = {
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
	},
	[10039] = {
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
	},
	[10040] = {
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
	},
	[10041] = {
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
	},
	[10042] = {
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
	},
	[10043] = {
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
	},
	[10044] = {
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
	},
	[10045] = {
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
	},
	[10046] = {
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
	},
	[10047] = {
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
	},
	[10048] = {
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
	},
	[10049] = {
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
	},
	[10050] = {
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
	},
	[10051] = {
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
	},
	[10052] = {
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
	},
	[10053] = {
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
	},
	[10054] = {
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
	},
	[10055] = {
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
	},
	[10056] = {
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
	},
	[10057] = {
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
	},
	[10058] = {
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
	},
	[10059] = {
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
	},
	[10060] = {
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
	},
	[10061] = {
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
	},
	[10062] = {
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
	},
	[10063] = {
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
	},
	[10064] = {
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
	},
	[10065] = {
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
	},
	[10066] = {
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
	},
	[10067] = {
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
	},
	[10068] = {
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
	},
	[10069] = {
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
	},
	[10070] = {
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
	},
	[10071] = {
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
	},
	[10072] = {
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
	},
	[10073] = {
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
	},
	[10074] = {
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
	},
	[10075] = {
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
	},
	[10076] = {
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
	},
	[10077] = {
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
	},
	[10078] = {
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
	},
	[10079] = {
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
	},
	[10080] = {
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
	},
	[10081] = {
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
	},
	[10082] = {
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
	},
	[10083] = {
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
	},
	[10084] = {
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
	},
	[10085] = {
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
	},
	[10086] = {
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
	},
	[10087] = {
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
	},
	[10088] = {
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
	},
	[10089] = {
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
	},
	[10090] = {
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
	},
	[10091] = {
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
	},
	[10092] = {
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
	},
	[10093] = {
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
	},
	[10094] = {
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
	},
	[10095] = {
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
	},
	[10096] = {
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
	},
	[10097] = {
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
	},
	[10098] = {
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
	},
	[10099] = {
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
	},
	[10100] = {
		type_use = "3",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 1,
		id = 10100,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10101] = {
		type_use = "3.2",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 2,
		id = 10101,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10102] = {
		type_use = "3.5",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 3,
		id = 10102,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10103] = {
		type_use = "3.7",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 4,
		id = 10103,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10104] = {
		type_use = "4",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 5,
		id = 10104,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10105] = {
		type_use = "4.2",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 6,
		id = 10105,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10106] = {
		type_use = "4.5",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 7,
		id = 10106,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10107] = {
		type_use = "5",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 8,
		id = 10107,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10108] = {
		type_use = "5.5",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 9,
		id = 10108,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10109] = {
		type_use = "6",
		name = "高效回复",
		buff_desc = "无需本地化，角色技能读skill表",
		buff_type = 2,
		buff_color = 0,
		buff_group = 1010,
		buff_time = 0,
		buff_level = 10,
		id = 10109,
		type_duel = {
			1010
		},
		buff_duel = {}
	},
	[10110] = {
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
	},
	[10111] = {
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
	},
	[10112] = {
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
	},
	[10113] = {
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
	},
	[10114] = {
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
	},
	[10115] = {
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
	},
	[10116] = {
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
	},
	[10117] = {
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
	},
	[10118] = {
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
	},
	[10119] = {
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
	},
	[10120] = {
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
	},
	[10121] = {
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
	},
	[10122] = {
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
	},
	[10123] = {
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
	},
	[10124] = {
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
	},
	[10125] = {
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
	},
	[10126] = {
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
	},
	[10127] = {
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
	},
	[10128] = {
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
	},
	[10129] = {
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
	},
	[10130] = {
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
	},
	[10131] = {
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
	},
	[10132] = {
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
	},
	[10133] = {
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
	},
	[10134] = {
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
	},
	[10135] = {
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
	},
	[10136] = {
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
	},
	[10137] = {
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
	},
	[10138] = {
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
	},
	[10139] = {
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
	},
	[10140] = {
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
	},
	[10141] = {
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
	},
	[10142] = {
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
	},
	[10143] = {
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
	},
	[10144] = {
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
	},
	[10145] = {
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
	},
	[10146] = {
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
	},
	[10147] = {
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
	},
	[10148] = {
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
	},
	[10149] = {
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
	},
	[100001] = {
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
	},
	[100002] = {
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
	},
	[999990] = {
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
	},
	all = {
		1,
		2,
		3,
		4,
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
		100001,
		100002,
		999990
	}
}
