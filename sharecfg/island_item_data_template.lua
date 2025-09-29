pg = pg or {}
pg.island_item_data_template = setmetatable({
	__name = "island_item_data_template",
	get_id_list_by_usage = {
		usage_undefined = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			1000,
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
			1014,
			1015,
			1016,
			1017,
			1018,
			1019,
			1020,
			1021,
			1022,
			2000,
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
			2014,
			2015,
			2016,
			2017,
			2018,
			2019,
			2020,
			2021,
			2022,
			2600,
			2601,
			2602,
			2603,
			2604,
			2605,
			2606,
			2700,
			2701,
			2702,
			2703,
			2704,
			2705,
			2800,
			2801,
			2802,
			2803,
			3000,
			3001,
			3002,
			3003,
			3004,
			3005,
			3006,
			3007,
			3008,
			3009,
			3010,
			3011,
			3012,
			3013,
			3014,
			3015,
			3017,
			3018,
			3019,
			3020,
			3021,
			3022,
			3023,
			3024,
			3025,
			3026,
			3028,
			3029,
			3030,
			3032,
			3033,
			3034,
			3035,
			3036,
			3037,
			3038,
			3039,
			3040,
			3041,
			3042,
			3043,
			3044,
			3045,
			3046,
			3047,
			3048,
			3049,
			3050,
			3051,
			3052,
			3053,
			3054,
			3055,
			3056,
			3059,
			3101,
			3102,
			3103,
			3104,
			3105,
			3106,
			3107,
			3108,
			3109,
			3110,
			3111,
			3112,
			3113,
			4001,
			4002,
			4003,
			4004,
			4005,
			4006,
			4007,
			4008,
			4009,
			4010,
			4011,
			4012,
			4013,
			4014,
			100001,
			100002,
			100003,
			100011,
			100012,
			100013,
			100021,
			100022,
			100023,
			100031,
			100032,
			100033,
			100041,
			100042,
			100043,
			100051,
			100052,
			100053,
			100061,
			100062,
			100063,
			100101,
			100102,
			100103,
			100201,
			200001,
			200002,
			200003,
			200004,
			200005,
			200006,
			200007,
			200008,
			200009,
			200010,
			200011,
			200012,
			200013,
			200014,
			200015
		},
		usage_island_gift = {
			110001,
			110002,
			110003,
			110004,
			110005,
			110006
		}
	},
	get_id_list_by_type = {
		[3] = {
			1,
			5,
			6,
			7,
			8,
			9
		},
		[4] = {
			2
		},
		[2] = {
			3,
			4,
			100011,
			100012,
			100013,
			100021,
			100022,
			100023,
			100031,
			100032,
			100033,
			100041,
			100042,
			100043,
			100051,
			100052,
			100053,
			100061,
			100062,
			100063,
			100101,
			100102,
			100103,
			100201,
			110001,
			110002,
			110003,
			110004,
			110005,
			110006,
			200001,
			200002,
			200003,
			200004,
			200005,
			200006,
			200007,
			200008,
			200009,
			200010,
			200011,
			200012,
			200013,
			200014,
			200015
		},
		{
			1000,
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
			1014,
			1015,
			1016,
			1017,
			1018,
			1019,
			1020,
			1021,
			1022,
			2000,
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
			2014,
			2015,
			2016,
			2017,
			2018,
			2019,
			2020,
			2021,
			2022,
			2600,
			2601,
			2602,
			2603,
			2604,
			2605,
			2606,
			2700,
			2701,
			2702,
			2703,
			2704,
			2705,
			2800,
			2801,
			2802,
			2803,
			3000,
			3001,
			3002,
			3003,
			3004,
			3005,
			3006,
			3007,
			3008,
			3009,
			3010,
			3011,
			3012,
			3013,
			3014,
			3015,
			3017,
			3018,
			3019,
			3020,
			3021,
			3022,
			3023,
			3024,
			3025,
			3026,
			3028,
			3029,
			3030,
			3032,
			3033,
			3034,
			3035,
			3036,
			3037,
			3038,
			3039,
			3040,
			3041,
			3042,
			3043,
			3044,
			3045,
			3046,
			3047,
			3048,
			3049,
			3050,
			3051,
			3052,
			3053,
			3054,
			3055,
			3056,
			3059,
			3101,
			3102,
			3103,
			3104,
			3105,
			3106,
			3107,
			3108,
			3109,
			3110,
			3111,
			3112,
			3113,
			4001,
			4002,
			4003,
			4004,
			4005,
			4006,
			4007,
			4008,
			4009,
			4010,
			4011,
			4012,
			4013,
			4014
		},
		[5] = {
			100001,
			100002,
			100003
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		1000,
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
		1014,
		1015,
		1016,
		1017,
		1018,
		1019,
		1020,
		1021,
		1022,
		2000,
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
		2014,
		2015,
		2016,
		2017,
		2018,
		2019,
		2020,
		2021,
		2022,
		2600,
		2601,
		2602,
		2603,
		2604,
		2605,
		2606,
		2700,
		2701,
		2702,
		2703,
		2704,
		2705,
		2800,
		2801,
		2802,
		2803,
		3000,
		3001,
		3002,
		3003,
		3004,
		3005,
		3006,
		3007,
		3008,
		3009,
		3010,
		3011,
		3012,
		3013,
		3014,
		3015,
		3017,
		3018,
		3019,
		3020,
		3021,
		3022,
		3023,
		3024,
		3025,
		3026,
		3028,
		3029,
		3030,
		3032,
		3033,
		3034,
		3035,
		3036,
		3037,
		3038,
		3039,
		3040,
		3041,
		3042,
		3043,
		3044,
		3045,
		3046,
		3047,
		3048,
		3049,
		3050,
		3051,
		3052,
		3053,
		3054,
		3055,
		3056,
		3059,
		3101,
		3102,
		3103,
		3104,
		3105,
		3106,
		3107,
		3108,
		3109,
		3110,
		3111,
		3112,
		3113,
		4001,
		4002,
		4003,
		4004,
		4005,
		4006,
		4007,
		4008,
		4009,
		4010,
		4011,
		4012,
		4013,
		4014,
		100001,
		100002,
		100003,
		100011,
		100012,
		100013,
		100021,
		100022,
		100023,
		100031,
		100032,
		100033,
		100041,
		100042,
		100043,
		100051,
		100052,
		100053,
		100061,
		100062,
		100063,
		100101,
		100102,
		100103,
		100201,
		110001,
		110002,
		110003,
		110004,
		110005,
		110006,
		200001,
		200002,
		200003,
		200004,
		200005,
		200006,
		200007,
		200008,
		200009,
		200010,
		200011,
		200012,
		200013,
		200014,
		200015
	}
}, confHX)
pg.base = pg.base or {}
pg.base.island_item_data_template = {
	{
		group_max = 0,
		name = "开发资金",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "在岛屿开发区内流通的货币，是开发区持续发展的基础。",
		usage = "usage_undefined",
		order_price = 1,
		icon = "Islandprops/1",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1,
		have_max = 0,
		filter = {
			10312
		},
		sub_attribute = {},
		jump_page = {
			{
				"岛屿订单",
				{}
			},
			{
				"店铺经营",
				{}
			}
		}
	},
	{
		group_max = 0,
		name = "开发经验",
		manage_influence = 0,
		type = 4,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿的开发经验，累积足够的开发经验可以提升岛屿的开发等级",
		usage = "usage_undefined",
		order_price = 0,
		icon = "Islandprops/2",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2,
		have_max = 0,
		filter = {
			10312
		},
		sub_attribute = {},
		jump_page = {
			{
				"岛屿订单",
				{}
			},
			{
				"计划",
				{}
			}
		}
	},
	{
		group_max = 0,
		name = "装扮染色盘",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "盘中包含多种染料，能随心所欲地改变装扮的颜色，打造真正独一无二的装扮。 ",
		usage = "usage_undefined",
		order_price = 0,
		icon = "Islandprops/3",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3,
		have_max = 0,
		filter = {
			10312
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{}
			}
		}
	},
	{
		group_max = 0,
		name = "搭建凭证",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "集会岛搭建凭证，使用凭证，在集会岛上搭建属于自己的乐园。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/4",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4,
		have_max = 0,
		filter = {
			10312
		},
		sub_attribute = {},
		jump_page = {}
	},
	{
		group_max = 0,
		name = "地图残片-1",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿上的神秘纸片，歪歪扭扭的线条里不知藏着什么秘密~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 5,
		have_max = 5,
		filter = {
			10311
		},
		sub_attribute = {},
		jump_page = {}
	},
	{
		group_max = 0,
		name = "地图残片-2",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿上的神秘纸片，歪歪扭扭的线条里不知藏着什么秘密~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 6,
		have_max = 0,
		filter = {
			10311
		},
		sub_attribute = {},
		jump_page = {}
	},
	{
		group_max = 0,
		name = "地图残片-3",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿上的神秘纸片，歪歪扭扭的线条里不知藏着什么秘密~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 7,
		have_max = 0,
		filter = {
			10311
		},
		sub_attribute = {},
		jump_page = {}
	},
	{
		group_max = 0,
		name = "地图残片-4",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿上的神秘纸片，歪歪扭扭的线条里不知藏着什么秘密~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 8,
		have_max = 0,
		filter = {
			10311
		},
		sub_attribute = {},
		jump_page = {}
	},
	{
		group_max = 0,
		name = "地图残片-5",
		manage_influence = 0,
		type = 3,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿上的神秘纸片，歪歪扭扭的线条里不知藏着什么秘密~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 9,
		have_max = 0,
		filter = {
			10311
		},
		sub_attribute = {},
		jump_page = {}
	},
	[1000] = {
		group_max = 0,
		name = "小麦种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的小麦种子，可以产出优质的小麦。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1000",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1000,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1001] = {
		group_max = 0,
		name = "玉米种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的玉米种子，蕴含丰收的力量。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1001",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1001,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1002] = {
		group_max = 0,
		name = "旱稻种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的旱稻种子，一起等待丰收时刻吧~",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1002",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1002,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1003] = {
		group_max = 0,
		name = "白菜种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的白菜种子，可以种出水灵灵的大白菜！",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1003",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1003,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1004] = {
		group_max = 0,
		name = "胡萝卜种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的胡萝卜种子，可以种出香甜的胡萝卜。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1004",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1004,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1005] = {
		group_max = 0,
		name = "土豆种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的土豆的种子，可以轻松种出高产的土豆。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1005",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1005,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1006] = {
		group_max = 0,
		name = "大豆种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的大豆的种子，可以轻松种出优质的大豆。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1006",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1006,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1007] = {
		group_max = 0,
		name = "洋葱种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的洋葱种子，能轻松培育出迷人的洋葱。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1007",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1007,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1008] = {
		group_max = 0,
		name = "牧草种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的选牧草种子，能种出丰饶的牧草。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1008",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1008,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1009] = {
		group_max = 0,
		name = "咖啡树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的咖啡树种，可以结出风味独特的咖啡豆。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1009",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1009,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1010] = {
		group_max = 0,
		name = "亚麻种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的亚麻种子，生长迅速，纤维长且坚韧，是纺织的好帮手。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1010",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1010,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1011] = {
		group_max = 0,
		name = "草莓种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的草莓种子，可以种出鲜红的草莓。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1011",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1011,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1012] = {
		group_max = 0,
		name = "棉花种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的棉花种子，可以结出柔软的棉花。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1012",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1012,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1014] = {
		group_max = 0,
		name = "茶树种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的茶树种子，可以种出品质上乘的茶叶。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1014",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1014,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1015] = {
		group_max = 0,
		name = "薰衣草种子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区精选的薰衣草种子，可以种出一片紫色的花海。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1015",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1015,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1016] = {
		group_max = 0,
		name = "苹果树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质柑橘树种，可以结出清脆可口的苹果。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1016",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1016,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1017] = {
		group_max = 0,
		name = "柑橘树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质柑橘树种，可以结出鲜甜多汁的柑橘。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1017",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1017,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1018] = {
		group_max = 0,
		name = "香蕉树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质香蕉树种，可以结出饱满的香蕉。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1018",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1018,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1019] = {
		group_max = 0,
		name = "芒果树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质芒果树种，可以结出香甜的芒果。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1019",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1019,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1020] = {
		group_max = 0,
		name = "柠檬树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质柠檬树种，可以结出清新的柠檬。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1020",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1020,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1021] = {
		group_max = 0,
		name = "牛油果树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "港区培育的优质牛油果树种，可以结出营养丰富的牛油果。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1021",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1021,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1022] = {
		group_max = 0,
		name = "橡胶树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "随熟随采随播，没有休眠期！",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_1022",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 1022,
		have_max = 0,
		filter = {
			10114,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[2000] = {
		group_max = 0,
		name = "小麦",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		usage = "usage_undefined",
		order_price = 8,
		icon = "IslandProps/item_2000",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2000,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2001] = {
		group_max = 0,
		name = "玉米",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		usage = "usage_undefined",
		order_price = 8,
		icon = "IslandProps/item_2001",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2001,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2002] = {
		group_max = 0,
		name = "大米",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		usage = "usage_undefined",
		order_price = 17,
		icon = "IslandProps/item_2002",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2002,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2003] = {
		group_max = 0,
		name = "白菜",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "清脆可口的白菜，新鲜直采！",
		usage = "usage_undefined",
		order_price = 14,
		icon = "IslandProps/item_2003",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2003,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2004] = {
		group_max = 0,
		name = "胡萝卜",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "家中常备蔬菜，营养丰富，口感清甜。",
		usage = "usage_undefined",
		order_price = 34,
		icon = "IslandProps/item_2004",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2004,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2005] = {
		group_max = 0,
		name = "土豆",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		usage = "usage_undefined",
		order_price = 33,
		icon = "IslandProps/item_2005",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2005,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2006] = {
		group_max = 0,
		name = "大豆",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		usage = "usage_undefined",
		order_price = 14,
		icon = "IslandProps/item_2006",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2006,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2007] = {
		group_max = 0,
		name = "洋葱",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 24,
		desc = "紫色的外衣剥开……小心别被弄掉眼泪！",
		usage = "usage_undefined",
		order_price = 244,
		icon = "IslandProps/item_2007",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2007,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2008] = {
		group_max = 0,
		name = "牧草",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "高品质牧草，让牧场充满生机！",
		usage = "usage_undefined",
		order_price = 11,
		icon = "IslandProps/item_2008",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2008,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2009] = {
		group_max = 0,
		name = "咖啡豆",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 6,
		desc = "香气浓郁，提神醒脑，不来一杯吗？",
		usage = "usage_undefined",
		order_price = 68,
		icon = "IslandProps/item_2009",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2009,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"丰壤农田",
				{}
			}
		}
	},
	[2010] = {
		group_max = 0,
		name = "亚麻",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 6,
		desc = "长纤维亚麻，适合纺线织布，你的工坊佳选！",
		usage = "usage_undefined",
		order_price = 72,
		icon = "IslandProps/item_2010",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2010,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2011] = {
		group_max = 0,
		name = "草莓",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 5,
		desc = "红彤彤的果实酸甜多汁，很适合搭配甜点食用。",
		usage = "usage_undefined",
		order_price = 54,
		icon = "IslandProps/item_2011",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2011,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2012] = {
		group_max = 0,
		name = "棉花",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 6,
		desc = "柔软的白色棉花，纺织业的重要材料。",
		usage = "usage_undefined",
		order_price = 92,
		icon = "IslandProps/item_2012",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2012,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2014] = {
		group_max = 0,
		name = "茶叶",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 14,
		desc = "苦涩清香，享受大自然的味道~",
		usage = "usage_undefined",
		order_price = 118,
		icon = "IslandProps/item_2014",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2014,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2015] = {
		group_max = 0,
		name = "薰衣草",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 35,
		desc = "芬芳四溢，除点缀花园外，还能用来萃取精油。",
		usage = "usage_undefined",
		order_price = 294,
		icon = "IslandProps/item_2015",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2015,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"青芽苗圃",
				{}
			}
		}
	},
	[2016] = {
		group_max = 0,
		name = "苹果",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "清脆多汁，富含多种维生素，可直接食用也可加工为果汁。",
		usage = "usage_undefined",
		order_price = 50,
		icon = "IslandProps/item_2016",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2016,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2017] = {
		group_max = 0,
		name = "柑橘",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "便宜、易保存、还带有美好香气的水果。",
		usage = "usage_undefined",
		order_price = 65,
		icon = "IslandProps/item_2017",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2017,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2018] = {
		group_max = 0,
		name = "香蕉",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "热带风情的象征，柔软香甜，富含丰富的膳食纤维。",
		usage = "usage_undefined",
		order_price = 80,
		icon = "IslandProps/item_2018",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2018,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2019] = {
		group_max = 0,
		name = "芒果",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 18,
		desc = "果肉细腻的夏日水果，拥有超高的甜度，可以榨汁食用。",
		usage = "usage_undefined",
		order_price = 180,
		icon = "IslandProps/item_2019",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2019,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2020] = {
		group_max = 0,
		name = "柠檬",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 3,
		desc = "果皮清香，酸甜适中，时常用来调味。",
		usage = "usage_undefined",
		order_price = 32,
		icon = "IslandProps/item_2020",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2020,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2021] = {
		group_max = 0,
		name = "牛油果",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 45,
		desc = "口感细腻软糯，美味无糖更健康。",
		usage = "usage_undefined",
		order_price = 375,
		icon = "IslandProps/item_2021",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2021,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2022] = {
		group_max = 0,
		name = "橡胶",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 30,
		desc = "高弹性，工业加工的常见材料，用途广泛！",
		usage = "usage_undefined",
		order_price = 250,
		icon = "IslandProps/item_2022",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2022,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[2600] = {
		group_max = 0,
		name = "鲜肉",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 2,
		desc = "动物产出的鲜肉，最为优质的蛋白质来源。",
		usage = "usage_undefined",
		order_price = 200,
		icon = "IslandProps/item_2600",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2600,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2601] = {
		group_max = 0,
		name = "鸡蛋",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "土褐色的鸡蛋，是烹饪的常见原料。",
		usage = "usage_undefined",
		order_price = 55,
		icon = "IslandProps/item_2601",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2601,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2602] = {
		group_max = 0,
		name = "禽肉",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "低脂肪高蛋白肉类，适合多种菜肴。",
		usage = "usage_undefined",
		order_price = 20,
		icon = "IslandProps/item_2602",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2602,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2603] = {
		group_max = 0,
		name = "牛奶",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "不仅是天然的饮品，还能用来制作酸奶和奶酪等美味。",
		usage = "usage_undefined",
		order_price = 136,
		icon = "IslandProps/item_2603",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2603,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2604] = {
		group_max = 0,
		name = "皮料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 10,
		desc = "经过简单处理的动物皮，可进一步加工为皮革。",
		usage = "usage_undefined",
		order_price = 95,
		icon = "IslandProps/item_2604",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2604,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2605] = {
		group_max = 0,
		name = "羊毛",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 72,
		desc = "动物身上的毛纤维，是纺织工业的重要原料。",
		usage = "usage_undefined",
		order_price = 600,
		icon = "IslandProps/item_2605",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2605,
		have_max = 0,
		filter = {
			10111,
			10122
		},
		sub_attribute = {},
		jump_page = {
			{
				"悠然牧场",
				{}
			}
		}
	},
	[2606] = {
		group_max = 0,
		name = "新鲜蜂蜜",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 2,
		desc = "新鲜采集的蜂蜜，充满了自然的香甜。",
		usage = "usage_undefined",
		order_price = 200,
		icon = "IslandProps/item_2606",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2606,
		have_max = 0,
		filter = {
			10111,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"地图采集",
				{}
			}
		}
	},
	[2700] = {
		group_max = 0,
		name = "煤炭",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "基础的燃料，燃烧效率高，常用于加热或工业生产。",
		usage = "usage_undefined",
		order_price = 12,
		icon = "IslandProps/item_2700",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2700,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2701] = {
		group_max = 0,
		name = "铜矿",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "富含铜元素的矿石，冶炼出的铜常用于生产电子产品。",
		usage = "usage_undefined",
		order_price = 100,
		icon = "IslandProps/item_2701",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2701,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2702] = {
		group_max = 0,
		name = "铝矿",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 30,
		desc = "富含铝元素的矿石，冶炼出的铝常用于制造飞行器和船舶。",
		usage = "usage_undefined",
		order_price = 300,
		icon = "IslandProps/item_2702",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2702,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2703] = {
		group_max = 0,
		name = "铁矿",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 18,
		desc = "富含铁元素的矿石，冶炼出的铁常用于建造各种建筑。",
		usage = "usage_undefined",
		order_price = 180,
		icon = "IslandProps/item_2703",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2703,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2704] = {
		group_max = 0,
		name = "硫矿",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 80,
		desc = "富含硫元素的矿石，冶炼出的硫常用于制作肥料和杀虫剂。",
		usage = "usage_undefined",
		order_price = 700,
		icon = "IslandProps/item_2704",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2704,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2705] = {
		group_max = 0,
		name = "银矿",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 240,
		desc = "富含银元素的矿石，冶炼出的银常用于制作合金和化学仪器。",
		usage = "usage_undefined",
		order_price = 1600,
		icon = "IslandProps/item_2705",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2705,
		have_max = 0,
		filter = {
			10111,
			10123
		},
		sub_attribute = {},
		jump_page = {
			{
				"沉石矿山",
				{}
			}
		}
	},
	[2800] = {
		group_max = 0,
		name = "自然之木",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "木材中的基础款，从造纸到建筑，用途广泛。",
		usage = "usage_undefined",
		order_price = 12,
		icon = "IslandProps/item_2800",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2800,
		have_max = 0,
		filter = {
			10111,
			10124
		},
		sub_attribute = {},
		jump_page = {
			{
				"翠土林场",
				{}
			}
		}
	},
	[2801] = {
		group_max = 0,
		name = "实用之木",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "纹理美观，适合制作家具和地板。",
		usage = "usage_undefined",
		order_price = 125,
		icon = "IslandProps/item_2801",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2801,
		have_max = 0,
		filter = {
			10111,
			10124
		},
		sub_attribute = {},
		jump_page = {
			{
				"翠土林场",
				{}
			}
		}
	},
	[2802] = {
		group_max = 0,
		name = "精选之木",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 36,
		desc = "坚固耐用，传统造船和高端家具料。",
		usage = "usage_undefined",
		order_price = 360,
		icon = "IslandProps/item_2802",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2802,
		have_max = 0,
		filter = {
			10111,
			10124
		},
		sub_attribute = {},
		jump_page = {
			{
				"翠土林场",
				{}
			}
		}
	},
	[2803] = {
		group_max = 0,
		name = "典雅之木",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 180,
		desc = "美观且坚硬，适合高档装饰和家具。",
		usage = "usage_undefined",
		order_price = 1200,
		icon = "IslandProps/item_2803",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 2803,
		have_max = 0,
		filter = {
			10111,
			10124
		},
		sub_attribute = {},
		jump_page = {
			{
				"翠土林场",
				{}
			}
		}
	},
	[3000] = {
		group_max = 0,
		name = "咯咯鸡饲料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "专为咯咯鸡打造的高蛋白饲料，能为其提供充足的能量。",
		usage = "usage_undefined",
		order_price = 25,
		icon = "IslandProps/item_3000",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3000,
		have_max = 0,
		filter = {
			10112,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"磨坊",
				{}
			}
		}
	},
	[3001] = {
		group_max = 0,
		name = "哼哼猪饲料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "专为哼哼猪打造的增重用饲料，适合食量大的动物食用。",
		usage = "usage_undefined",
		order_price = 25,
		icon = "IslandProps/item_3001",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3001,
		have_max = 0,
		filter = {
			10112,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"磨坊",
				{}
			}
		}
	},
	[3002] = {
		group_max = 0,
		name = "哞哞牛饲料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 4,
		desc = "专为哞哞牛打造的营养饲料，能帮助哞哞牛产出香甜浓郁的牛奶。",
		usage = "usage_undefined",
		order_price = 40,
		icon = "IslandProps/item_3002",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3002,
		have_max = 0,
		filter = {
			10112,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"磨坊",
				{}
			}
		}
	},
	[3003] = {
		group_max = 0,
		name = "咩咩羊饲料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 4,
		desc = "专为咩咩羊打造的玉米粉制饲料，能帮助咩咩羊长出更加柔顺的羊毛 。",
		usage = "usage_undefined",
		order_price = 40,
		icon = "IslandProps/item_3003",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3003,
		have_max = 0,
		filter = {
			10112,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"磨坊",
				{}
			}
		}
	},
	[3004] = {
		group_max = 0,
		name = "面粉",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "由小麦磨成的白面粉，制作面包、蛋糕和披萨的必需品。",
		usage = "usage_undefined",
		order_price = 50,
		icon = "IslandProps/item_3004",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3004,
		have_max = 0,
		filter = {
			10112,
			10127
		},
		sub_attribute = {},
		jump_page = {
			{
				"磨坊",
				{}
			}
		}
	},
	[3005] = {
		group_max = 0,
		name = "冰咖啡",
		manage_influence = 190,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "口感清爽，适合夏日消暑和提神。",
		usage = "usage_undefined",
		order_price = 95,
		icon = "IslandProps/item_3005",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3005,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3006] = {
		group_max = 0,
		name = "芝士",
		manage_influence = 150,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 55,
		desc = "以奶类为原料制成，含有丰富的蛋白质和脂质，常用来搭配面包使用。",
		usage = "usage_undefined",
		order_price = 550,
		icon = "IslandProps/item_3006",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3006,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3007] = {
		group_max = 0,
		name = "拿铁",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 25,
		desc = "浓缩咖啡与蒸奶混合，口感香滑，深受咖啡爱好者喜爱 。",
		usage = "usage_undefined",
		order_price = 250,
		icon = "IslandProps/item_3007",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3007,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3008] = {
		group_max = 0,
		name = "柑橘咖啡",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 20,
		desc = "加入了柑橘汁的咖啡饮品，以清新的酸度和自然的果香为特色。",
		usage = "usage_undefined",
		order_price = 190,
		icon = "IslandProps/item_3008",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3008,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3009] = {
		group_max = 0,
		name = "苹果派",
		manage_influence = 190,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 35,
		desc = "将苹果馅料裹在酥皮之中，口感香甜，是经典甜点代表之一。",
		usage = "usage_undefined",
		order_price = 385,
		icon = "IslandProps/item_3009",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3009,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3010] = {
		group_max = 0,
		name = "草莓奶绿",
		manage_influence = 240,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 25,
		desc = "入口细腻的奶沫，清新丝滑，口感丰富。",
		usage = "usage_undefined",
		order_price = 260,
		icon = "IslandProps/item_3010",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3010,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3011] = {
		group_max = 0,
		name = "豆腐",
		manage_influence = 170,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 35,
		desc = "白净柔嫩，由大豆制成，富含丰富的植物蛋白。",
		usage = "usage_undefined",
		order_price = 340,
		icon = "IslandProps/item_3011",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3011,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[3012] = {
		group_max = 0,
		name = "肉末烧豆腐",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 155,
		desc = "经典家常菜，口感滑嫩、汤汁浓郁。",
		usage = "usage_undefined",
		order_price = 1300,
		icon = "IslandProps/item_3012",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3012,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[3013] = {
		group_max = 0,
		name = "蛋包饭",
		manage_influence = 240,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 35,
		desc = "金黄的煎蛋包裹着松软的米饭，每一口都充满了惊喜！",
		usage = "usage_undefined",
		order_price = 355,
		icon = "IslandProps/item_3013",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3013,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[3014] = {
		group_max = 0,
		name = "白菜豆腐汤",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 40,
		desc = "白菜的鲜甜与豆腐的嫩滑交织，是非常清淡健康的菜式。",
		usage = "usage_undefined",
		order_price = 425,
		icon = "IslandProps/item_3014",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3014,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[3015] = {
		group_max = 0,
		name = "蔬菜沙拉",
		manage_influence = 160,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 10,
		desc = "新鲜的蔬菜搭配香浓的酱汁，清爽可口！",
		usage = "usage_undefined",
		order_price = 105,
		icon = "IslandProps/item_3015",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3015,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[3017] = {
		group_max = 0,
		name = "苹果汁",
		manage_influence = 200,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 10,
		desc = "鲜榨水果汁果香浓郁，是很受欢迎的健康饮品！",
		usage = "usage_undefined",
		order_price = 105,
		icon = "IslandProps/item_3017",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3017,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3018] = {
		group_max = 0,
		name = "香蕉芒果汁",
		manage_influence = 190,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 20,
		desc = "香蕉与芒果的完美融合，是热带风味的浓缩！",
		usage = "usage_undefined",
		order_price = 215,
		icon = "IslandProps/item_3018",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3018,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3019] = {
		group_max = 0,
		name = "蜂蜜柠檬水",
		manage_influence = 240,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 15,
		desc = "甘甜蜂蜜与清爽柠檬的美妙融合，还能补充维c。",
		usage = "usage_undefined",
		order_price = 140,
		icon = "IslandProps/item_3019",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3019,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3020] = {
		group_max = 0,
		name = "草莓蜜沁",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 25,
		desc = "草莓与柠檬的奇妙组合，清爽不腻的果味特饮。",
		usage = "usage_undefined",
		order_price = 270,
		icon = "IslandProps/item_3020",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3020,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3021] = {
		group_max = 0,
		name = "薰衣草茶",
		manage_influence = 160,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 240,
		desc = "具有净化心绪，舒解压力的作用，很适合调养身心。",
		usage = "usage_undefined",
		order_price = 1590,
		icon = "IslandProps/item_3021",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3021,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3022] = {
		group_max = 0,
		name = "草莓蜂蜜冰沙",
		manage_influence = 220,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 95,
		desc = "草莓的酸甜与蜂蜜的香浓完美融合，构成甜蜜的冰沙世界。",
		usage = "usage_undefined",
		order_price = 790,
		icon = "IslandProps/item_3022",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3022,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[3023] = {
		group_max = 0,
		name = "玉米杯",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 4,
		desc = "金黄的玉米粒经过简单蒸煮变得香甜可口，是常见的美味小吃。",
		usage = "usage_undefined",
		order_price = 45,
		icon = "IslandProps/item_3023",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3023,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"啾啾简餐",
				{}
			}
		}
	},
	[3024] = {
		group_max = 0,
		name = "香橙派",
		manage_influence = 185,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 35,
		desc = "经典甜点，下午茶时间食用更佳。",
		usage = "usage_undefined",
		order_price = 375,
		icon = "IslandProps/item_3024",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3024,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"啾啾简餐",
				{}
			}
		}
	},
	[3025] = {
		group_max = 0,
		name = "芒果糯米饭",
		manage_influence = 160,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 60,
		desc = "热带风情特色家常菜，适合没食欲的时候食用。",
		usage = "usage_undefined",
		order_price = 510,
		icon = "IslandProps/item_3025",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3025,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"啾啾简餐",
				{}
			}
		}
	},
	[3026] = {
		group_max = 0,
		name = "香蕉可丽饼",
		manage_influence = 170,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 30,
		desc = "经典早餐，口感酥脆，老少皆宜。",
		usage = "usage_undefined",
		order_price = 230,
		icon = "IslandProps/item_3026",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3026,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"啾啾简餐",
				{}
			}
		}
	},
	[3028] = {
		group_max = 0,
		name = "草莓夏洛特",
		manage_influence = 190,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 200,
		desc = "口感酥脆的蛋白霜底搭配香甜的草莓馅料，深受甜品爱好者的喜爱。",
		usage = "usage_undefined",
		order_price = 1350,
		icon = "IslandProps/item_3028",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3028,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"啾啾简餐",
				{}
			}
		}
	},
	[3029] = {
		group_max = 0,
		name = "炭烤肉串",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 40,
		desc = "外焦里嫩，香气扑鼻，烧烤派对的必备美食！",
		usage = "usage_undefined",
		order_price = 390,
		icon = "IslandProps/item_3029",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3029,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"乌鱼烤肉",
				{}
			}
		}
	},
	[3030] = {
		group_max = 0,
		name = "禽肉土豆拼盘",
		manage_influence = 230,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 36,
		desc = "简单而美味，是家庭餐桌上的经典搭配！",
		usage = "usage_undefined",
		order_price = 370,
		icon = "IslandProps/item_3030",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3030,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"乌鱼烤肉",
				{}
			}
		}
	},
	[3032] = {
		group_max = 0,
		name = "爆炒禽肉",
		manage_influence = 220,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 70,
		desc = "禽肉搭配调料爆炒出锅，香气四溢！",
		usage = "usage_undefined",
		order_price = 580,
		icon = "IslandProps/item_3032",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3032,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"乌鱼烤肉",
				{}
			}
		}
	},
	[3033] = {
		group_max = 0,
		name = "胡萝卜厚蛋烧",
		manage_influence = 180,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 16,
		desc = "薄薄的蛋皮裹着香甜的胡萝卜，口感层次丰富，是早餐或下午茶的绝佳选择！",
		usage = "usage_undefined",
		order_price = 170,
		icon = "IslandProps/item_3033",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3033,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"乌鱼烤肉",
				{}
			}
		}
	},
	[3034] = {
		group_max = 0,
		name = "汉堡肉饭",
		manage_influence = 150,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 100,
		desc = "既有快餐的便捷，又能享受主食的饱腹感，当之无愧的多功能美食！",
		usage = "usage_undefined",
		order_price = 845,
		icon = "IslandProps/item_3034",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3034,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"乌鱼烤肉",
				{}
			}
		}
	},
	[3035] = {
		group_max = 0,
		name = "布料",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 34,
		desc = "由带有纤维的材料制成的织品，是很多日用品和工业产品的原料。",
		usage = "usage_undefined",
		order_price = 340,
		icon = "IslandProps/item_3035",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3035,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3036] = {
		group_max = 0,
		name = "皮革",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 60,
		desc = "由动物的皮毛加工而来，常用于服装和家具的制作。",
		usage = "usage_undefined",
		order_price = 600,
		icon = "IslandProps/item_3036",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3036,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3037] = {
		group_max = 0,
		name = "绳索",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 72,
		desc = "紧实坚韧，无论是绑货物还是搭架子，都能派上用场。",
		usage = "usage_undefined",
		order_price = 600,
		icon = "IslandProps/item_3037",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3037,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3038] = {
		group_max = 0,
		name = "手套",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 105,
		desc = "家家必备的保暖用品，寒冷天气出行少不了它。",
		usage = "usage_undefined",
		order_price = 890,
		icon = "IslandProps/item_3038",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3038,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3039] = {
		group_max = 0,
		name = "香囊",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 130,
		desc = "装满草药或香料，随身携带提神醒脑。",
		usage = "usage_undefined",
		order_price = 1100,
		icon = "IslandProps/item_3039",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3039,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3040] = {
		group_max = 0,
		name = "鞋靴",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 350,
		desc = "皮革制品，通常用于保护足部。",
		usage = "usage_undefined",
		order_price = 2380,
		icon = "IslandProps/item_3040",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3040,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3041] = {
		group_max = 0,
		name = "绷带",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 350,
		desc = "急救必备品，无论割伤还是擦伤，都能及时处理。",
		usage = "usage_undefined",
		order_price = 2380,
		icon = "IslandProps/item_3041",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3041,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[3042] = {
		group_max = 0,
		name = "炭笔",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 30,
		desc = "通常用于绘画和速写，美术常用工具的一种。",
		usage = "usage_undefined",
		order_price = 300,
		icon = "IslandProps/item_3042",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3042,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3043] = {
		group_max = 0,
		name = "电缆",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 92,
		desc = "现代化的象征，为众多设施提供了电力支持。",
		usage = "usage_undefined",
		order_price = 770,
		icon = "IslandProps/item_3043",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3043,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3044] = {
		group_max = 0,
		name = "铁钉",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 66,
		desc = "常见建造用品，经常用于固定木板和制作家具。",
		usage = "usage_undefined",
		order_price = 660,
		icon = "IslandProps/item_3044",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3044,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3045] = {
		group_max = 0,
		name = "硫酸",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 84,
		desc = "拥有很强腐蚀性的化学品。",
		usage = "usage_undefined",
		order_price = 840,
		icon = "IslandProps/item_3045",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3045,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3046] = {
		group_max = 0,
		name = "火药",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 150,
		desc = "现代武器的必需品，需要妥善保管的危险品。",
		usage = "usage_undefined",
		order_price = 1200,
		icon = "IslandProps/item_3046",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3046,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3047] = {
		group_max = 0,
		name = "刀叉餐具",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 380,
		desc = "家家户户，餐桌必备。",
		usage = "usage_undefined",
		order_price = 2560,
		icon = "IslandProps/item_3047",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3047,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"工业生产设备",
				{}
			}
		}
	},
	[3048] = {
		group_max = 0,
		name = "纸张",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "常以廉价的植物纤维制成，保存容易，书写方便。",
		usage = "usage_undefined",
		order_price = 175,
		icon = "IslandProps/item_3048",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3048,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"木料加工设备",
				{}
			}
		}
	},
	[3049] = {
		group_max = 0,
		name = "记事本",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 120,
		desc = "记满了日常事务的本子，也可当作日记本使用。",
		usage = "usage_undefined",
		order_price = 1230,
		icon = "IslandProps/item_3049",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3049,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"木料加工设备",
				{}
			}
		}
	},
	[3050] = {
		group_max = 0,
		name = "桌椅",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 80,
		desc = "最常见的家具，能够提供一个休息的地方。",
		usage = "usage_undefined",
		order_price = 810,
		icon = "IslandProps/item_3050",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3050,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"木料加工设备",
				{}
			}
		}
	},
	[3051] = {
		group_max = 0,
		name = "精选木桶",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 190,
		desc = "多功能工具，通常用来储存红酒或蜂蜜。",
		usage = "usage_undefined",
		order_price = 1610,
		icon = "IslandProps/item_3051",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3051,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"木料加工设备",
				{}
			}
		}
	},
	[3052] = {
		group_max = 0,
		name = "文件柜",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 430,
		desc = "办公室必备，可以方便存放、管理各类文件。",
		usage = "usage_undefined",
		order_price = 2880,
		icon = "IslandProps/item_3052",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3052,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"木料加工设备",
				{}
			}
		}
	},
	[3053] = {
		group_max = 0,
		name = "墨盒",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 55,
		desc = "用来存储打印墨水，是打印机的核心组件。",
		usage = "usage_undefined",
		order_price = 570,
		icon = "IslandProps/item_3053",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3053,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"电子加工设备",
				{}
			}
		}
	},
	[3054] = {
		group_max = 0,
		name = "钟表",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 310,
		desc = "指示时间的精密仪器，常被固定在房间墙上。",
		usage = "usage_undefined",
		order_price = 2590,
		icon = "IslandProps/item_3054",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3054,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"电子加工设备",
				{}
			}
		}
	},
	[3055] = {
		group_max = 0,
		name = "蓄电池",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 210,
		desc = "可重复使用，为电机、照明设备等提供稳定的能源。",
		usage = "usage_undefined",
		order_price = 1750,
		icon = "IslandProps/item_3055",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3055,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"电子加工设备",
				{}
			}
		}
	},
	[3056] = {
		group_max = 0,
		name = "净水滤芯",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 360,
		desc = "过滤掉水中的杂质，为大家提供纯净的水源！",
		usage = "usage_undefined",
		order_price = 2400,
		icon = "IslandProps/item_3056",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3056,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"电子加工设备",
				{}
			}
		}
	},
	[3059] = {
		group_max = 0,
		name = "欧姆蛋",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "蓬松蛋皮包裹柔嫩内馅，金黄诱人，简单而满足的美味",
		usage = "usage_undefined",
		order_price = 50,
		icon = "IslandProps/item_3059",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3059,
		have_max = 0,
		filter = {
			10113,
			10126
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"啾咖啡",
				{}
			}
		}
	},
	[3101] = {
		group_max = 0,
		name = "经典豆腐套餐",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 200,
		desc = "肉末烧豆腐搭配白菜豆腐汤，简单美味的一餐。",
		usage = "usage_undefined",
		order_price = 1735,
		icon = "IslandProps/item_3101",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3101,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3102] = {
		group_max = 0,
		name = "绵玉定食",
		manage_influence = 220,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 100,
		desc = "蓬松蛋包饭搭配温润嫩豆腐，简单却令人满足的滋味。",
		usage = "usage_undefined",
		order_price = 695,
		icon = "IslandProps/item_3102",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3102,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3103] = {
		group_max = 0,
		name = "花香果韵",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 200,
		desc = "薰衣草的舒缓芬芳与苹果的清新甘甜巧妙融合，带来双重味觉享受。",
		usage = "usage_undefined",
		order_price = 170,
		icon = "IslandProps/item_3103",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3103,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3104] = {
		group_max = 0,
		name = "缤纷果乐园",
		manage_influence = 215,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 120,
		desc = "香甜香蕉芒果汁碰撞草莓蜂蜜冰沙，双重果味为你带去清爽的体验。",
		usage = "usage_undefined",
		order_price = 1000,
		icon = "IslandProps/item_3104",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3104,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3105] = {
		group_max = 0,
		name = "阳光蜜水",
		manage_influence = 260,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 60,
		desc = "草莓蜜沁的甜美与蜂蜜柠檬水的清新，碰撞出活力十足的阳光味道。",
		usage = "usage_undefined",
		order_price = 410,
		icon = "IslandProps/item_3105",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3105,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3106] = {
		group_max = 0,
		name = "香甜组合",
		manage_influence = 250,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 65,
		desc = "热带芒果香糯，遇上甜脆玉米杯，一次尝遍两种幸福甜味。",
		usage = "usage_undefined",
		order_price = 560,
		icon = "IslandProps/item_3106",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3106,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3107] = {
		group_max = 0,
		name = "果园二重奏",
		manage_influence = 240,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 70,
		desc = "香蕉可丽饼的柔软搭配金黄苹果派的酥香，一次享受双重果味甜蜜。",
		usage = "usage_undefined",
		order_price = 615,
		icon = "IslandProps/item_3107",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3107,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3108] = {
		group_max = 0,
		name = "莓果香橙甜点组",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 260,
		desc = "草莓的浪漫邂逅香橙的阳光气息，碰撞出令人陶醉的甜点时光。",
		usage = "usage_undefined",
		order_price = 1730,
		icon = "IslandProps/item_3108",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3108,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3109] = {
		group_max = 0,
		name = "烤肉狂欢",
		manage_influence = 230,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 90,
		desc = "香烤肉串配酥嫩禽肉土豆，让你一次吃个过瘾。",
		usage = "usage_undefined",
		order_price = 760,
		icon = "IslandProps/item_3109",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3109,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3110] = {
		group_max = 0,
		name = "能量双拼套餐",
		manage_influence = 210,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 210,
		desc = "经典汉堡肉饭搭配香辣爆炒禽肉，双重蛋白质满足你一天的能量。",
		usage = "usage_undefined",
		order_price = 1430,
		icon = "IslandProps/item_3110",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3110,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3111] = {
		group_max = 0,
		name = "晨光活力组合",
		manage_influence = 250,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 36,
		desc = "蓬松欧姆蛋邂逅香浓拿铁，给你一个完美的早餐时刻。",
		usage = "usage_undefined",
		order_price = 300,
		icon = "IslandProps/item_3111",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3111,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3112] = {
		group_max = 0,
		name = "醒神套餐",
		manage_influence = 240,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 80,
		desc = "冰咖啡搭配浓郁芝士，苦甜平衡的经典醒神套餐。",
		usage = "usage_undefined",
		order_price = 650,
		icon = "IslandProps/item_3112",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3112,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[3113] = {
		group_max = 0,
		name = "果香双杯乐",
		manage_influence = 260,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 65,
		desc = "柑橘咖啡的微酸邂逅草莓奶绿的香甜，两份特调一次满足。",
		usage = "usage_undefined",
		order_price = 450,
		icon = "IslandProps/item_3113",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 3113,
		have_max = 0,
		filter = {
			10113,
			10125
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"套餐菜单",
				{}
			}
		}
	},
	[4001] = {
		group_max = 0,
		name = "秋菊",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 40,
		desc = "金黄色的秋菊，随风摇曳，是秋季观赏与泡茶的佳品。",
		usage = "usage_undefined",
		order_price = 400,
		icon = "IslandProps/item_4001",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4001,
		have_max = 0,
		filter = {
			10111
		},
		sub_attribute = {},
		jump_page = {
			{
				"地图采集",
				{}
			}
		}
	},
	[4002] = {
		group_max = 0,
		name = "芦苇花",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 2,
		desc = "轻盈洁白的芦苇花，生于水岸，常用于制作干花装饰。",
		usage = "usage_undefined",
		order_price = 200,
		icon = "IslandProps/item_4002",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4002,
		have_max = 0,
		filter = {
			10111
		},
		sub_attribute = {},
		jump_page = {
			{
				"地图采集",
				{}
			}
		}
	},
	[4003] = {
		group_max = 0,
		name = "花生",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "香脆可口的花生，富含蛋白质和健康脂肪。",
		usage = "usage_undefined",
		order_price = 150,
		icon = "IslandProps/item_4003",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4003,
		have_max = 0,
		filter = {
			10111
		},
		sub_attribute = {},
		jump_page = {
			{
				"地图采集",
				{}
			}
		}
	},
	[4004] = {
		group_max = 0,
		name = "松茸",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 95,
		desc = "鲜嫩的山林珍品松茸，香气独特，是煲汤提鲜的顶级食材。",
		usage = "usage_undefined",
		order_price = 800,
		icon = "IslandProps/item_4004",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4004,
		have_max = 0,
		filter = {
			10111
		},
		sub_attribute = {},
		jump_page = {
			{
				"地图采集",
				{}
			}
		}
	},
	[4005] = {
		group_max = 0,
		name = "秋月梨",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 5,
		desc = "清甜多汁的秋月梨，果肉细腻，是生津润燥的秋季佳果。",
		usage = "usage_undefined",
		order_price = 70,
		icon = "IslandProps/item_4005",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4005,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[4006] = {
		group_max = 0,
		name = "秋月梨树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "秋月梨树种，蕴藏清甜的未来，可培育优质梨树。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_4006",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4006,
		have_max = 0,
		filter = {
			10114
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[4007] = {
		group_max = 0,
		name = "柿子",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 24,
		desc = "红艳饱满的柿子，软糯甘甜，富含维生素，是秋日时令鲜果。",
		usage = "usage_undefined",
		order_price = 200,
		icon = "IslandProps/item_4007",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4007,
		have_max = 0,
		filter = {
			10111,
			10121
		},
		sub_attribute = {},
		jump_page = {
			{
				"坠香果园",
				{}
			}
		}
	},
	[4008] = {
		group_max = 0,
		name = "柿子树种",
		manage_influence = 0,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 1,
		desc = "种下种子，收获“柿柿”如意的美好。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_4008",
		price = 1,
		rarity = 1,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4008,
		have_max = 0,
		filter = {
			10114
		},
		sub_attribute = {},
		jump_page = {
			{
				"商店购买",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[4009] = {
		group_max = 0,
		name = "柿子饼",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 25,
		desc = "香甜软糯的柿子饼，由鲜柿制作而成，是传统风味茶点。",
		usage = "usage_undefined",
		order_price = 210,
		icon = "IslandProps/item_4009",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4009,
		have_max = 0,
		filter = {
			10113,
			10129
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[4010] = {
		group_max = 0,
		name = "松茸鸡汤",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 135,
		desc = "鲜香浓郁的松茸鸡汤，使用禽肉与松茸慢炖，温补滋养。",
		usage = "usage_undefined",
		order_price = 900,
		icon = "IslandProps/item_4010",
		price = 1,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4010,
		have_max = 0,
		filter = {
			10113,
			10129
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"有鱼餐馆",
				{}
			}
		}
	},
	[4011] = {
		group_max = 0,
		name = "秋季花束",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 70,
		desc = "温暖橘黄的秋季花束，精选菊花、芦苇等时令花材，装点秋意。",
		usage = "usage_undefined",
		order_price = 705,
		icon = "IslandProps/item_4011",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4011,
		have_max = 0,
		filter = {
			10113,
			10131
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[4012] = {
		group_max = 0,
		name = "花生油",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 100,
		desc = "醇香浓郁的花生油，由优质花生压榨，是健康烹饪用油。",
		usage = "usage_undefined",
		order_price = 1005,
		icon = "IslandProps/item_4012",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4012,
		have_max = 0,
		filter = {
			10113,
			10131
		},
		sub_attribute = {
			5,
			35
		},
		jump_page = {
			{
				"手工制作设备",
				{}
			}
		}
	},
	[4013] = {
		group_max = 0,
		name = "胡萝卜秋梨汁",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 20,
		desc = "鲜榨甘甜的胡萝卜秋梨汁，融合秋梨的清润与胡萝卜的营养，清爽解渴。",
		usage = "usage_undefined",
		order_price = 200,
		icon = "IslandProps/item_4013",
		price = 1,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4013,
		have_max = 0,
		filter = {
			10113,
			10128
		},
		sub_attribute = {
			4,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[4014] = {
		group_max = 0,
		name = "菊花茶",
		manage_influence = 280,
		type = 1,
		convert = 1,
		resource_type = 1,
		pt_num = 100,
		desc = "淡雅清香的菊花茶，冲泡秋菊花瓣，清热降火，回味甘醇。",
		usage = "usage_undefined",
		order_price = 840,
		icon = "IslandProps/item_4014",
		price = 1,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 4014,
		have_max = 0,
		filter = {
			10113,
			10128
		},
		sub_attribute = {
			3,
			35
		},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[100001] = {
		group_max = 0,
		name = "生活经验指南T1",
		manage_influence = 0,
		type = 5,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100001",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "100",
		id = 100001,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"白熊饮品",
				{}
			}
		}
	},
	[100002] = {
		group_max = 0,
		name = "生活经验指南T2",
		manage_influence = 0,
		type = 5,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100002",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2000",
		id = 100002,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			},
			{
				"计划",
				{}
			}
		}
	},
	[100003] = {
		group_max = 0,
		name = "生活经验指南T3",
		manage_influence = 0,
		type = 5,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100003",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "8000",
		id = 100003,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			},
			{
				"计划",
				{}
			}
		}
	},
	[100011] = {
		group_max = 0,
		name = "经营指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的经营技巧指南。使用后，角色的经营能力将少量提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100011",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100011,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			},
			{
				"计划",
				{}
			}
		}
	},
	[100012] = {
		group_max = 0,
		name = "经营指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的经营技巧指南。使用后，角色的经营能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100012",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100012,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100013] = {
		group_max = 0,
		name = "经营指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的经营技巧指南。使用后，角色的经营能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100013",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100013,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100021] = {
		group_max = 0,
		name = "种植指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的种植技巧指南。使用后，角色的种植能力将少量提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100021",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100021,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100022] = {
		group_max = 0,
		name = "种植指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的种植技巧指南。使用后，角色的种植能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100022",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100022,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100023] = {
		group_max = 0,
		name = "种植指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的种植技巧指南。使用后，角色的种植能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100023",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100023,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100031] = {
		group_max = 0,
		name = "制造指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的制造技巧指南。使用后，角色的制造能力将少量提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100031",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100031,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100032] = {
		group_max = 0,
		name = "制造指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的制造技巧指南。使用后，角色的制造能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100032",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100032,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100033] = {
		group_max = 0,
		name = "制造指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的制造技巧指南。使用后，角色的制造能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100033",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100033,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100041] = {
		group_max = 0,
		name = "采集指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的采集技巧指南。使用后，角色的采集能力将少量提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100041",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100041,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100042] = {
		group_max = 0,
		name = "采集指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的采集技巧指南。使用后，角色的采集能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100042",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100042,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100043] = {
		group_max = 0,
		name = "采集指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的采集技巧指南。使用后，角色的采集能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100043",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100043,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100051] = {
		group_max = 0,
		name = "养护指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的养护技巧指南。使用后，能少量提升角色的养护能力。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100051",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100051,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100052] = {
		group_max = 0,
		name = "养护指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的养护技巧指南。使用后，角色的养护能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100052",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100052,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100053] = {
		group_max = 0,
		name = "养护指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的养护技巧指南。使用后，角色的养护能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100053",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100053,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100061] = {
		group_max = 0,
		name = "烹调指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的烹调技巧指南。使用后，角色的烹调能力将少量提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100061",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "1",
		id = 100061,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			},
			{
				"开发计划",
				{}
			}
		}
	},
	[100062] = {
		group_max = 0,
		name = "烹调指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的烹调技巧指南。使用后，角色的烹调能力将中幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100062",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "2",
		id = 100062,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"累计PT",
				{}
			}
		}
	},
	[100063] = {
		group_max = 0,
		name = "烹调指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的烹调技巧指南。使用后，角色的烹调能力将大幅提升。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100063",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100063,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100101] = {
		group_max = 0,
		name = "生产技能指南T1",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100101",
		price = 0,
		rarity = 2,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 100101,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			}
		}
	},
	[100102] = {
		group_max = 0,
		name = "生产技能指南T2",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100102",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 100102,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			}
		}
	},
	[100103] = {
		group_max = 0,
		name = "生产技能指南T3",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100103",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 100103,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			}
		}
	},
	[100201] = {
		group_max = 0,
		name = "岛屿开发结晶",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_100201",
		price = 0,
		rarity = 3,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 100201,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {
			{
				"开发商店",
				{}
			}
		}
	},
	[110001] = {
		group_max = 0,
		name = "海盐特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力。基础款能量特饮，咸甜交织的独特口感，像海风拂过舌尖。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110001,
		icon = "IslandProps/item_110001",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			},
			{
				"每日计划",
				{}
			}
		}
	},
	[110002] = {
		group_max = 0,
		name = "新叶特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力，全能力提高3%，持续8小时。散发着嫩芽的清香，清新提神。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110002,
		icon = "IslandProps/item_110002",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{
					1
				}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			}
		}
	},
	[110003] = {
		group_max = 0,
		name = "草莓特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力，生产基础资材时，产出所需时间缩短5%，持续8小时。饱含草莓的甜香，酸甜之中活力满满。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110003,
		icon = "IslandProps/item_110003",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{
					2
				}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			}
		}
	},
	[110004] = {
		group_max = 0,
		name = "金桔特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力，在基地工厂制作产品时，产出所需时间缩短5%，持续8小时。带着金桔微涩的口感，清爽解乏一口回甘。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110004,
		icon = "IslandProps/item_110004",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{
					3
				}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			}
		}
	},
	[110005] = {
		group_max = 0,
		name = "蓝莓特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力，制作店铺餐品时，烹饪所需时间缩短5%，持续8小时。融汇蓝莓酸甜，馥郁果香令人愉悦。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110005,
		icon = "IslandProps/item_110005",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{
					4
				}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			}
		}
	},
	[110006] = {
		group_max = 0,
		name = "葡萄特饮",
		manage_influence = 0,
		type = 2,
		drop_after_use = 0,
		rarity = 2,
		pt_num = 0,
		desc = "使用后恢复角色50体力，角色经营店铺时，销售额提高5%，持续8小时。每一口都是圆润饱满的甜蜜风味。",
		usage = "usage_island_gift",
		convert = 0,
		resource_type = 0,
		order_price = 0,
		id = 110006,
		icon = "IslandProps/item_110006",
		price = 0,
		have_max = 0,
		filter = {
			10212
		},
		sub_attribute = {},
		usage_arg = {
			{
				50,
				{}
			},
			{
				50,
				{}
			}
		},
		jump_page = {
			{
				"日常补给",
				{}
			}
		}
	},
	[200001] = {
		group_max = 0,
		name = "柴郡岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "柴郡的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200001",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200001,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200002] = {
		group_max = 0,
		name = "萨拉托加岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "萨拉托加的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200002",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200002,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200003] = {
		group_max = 0,
		name = "{namecode:98:明石}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:98:明石}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200003",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200003,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200004] = {
		group_max = 0,
		name = "{namecode:97:大凤}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:97:大凤}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200004",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200004,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200005] = {
		group_max = 0,
		name = "{namecode:199:新泽西}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:199:新泽西}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200005",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200005,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200006] = {
		group_max = 0,
		name = "{namecode:18:岛风}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:18:岛风}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200006",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200006,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200007] = {
		group_max = 0,
		name = "应瑞岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "应瑞的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200007",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200007,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200008] = {
		group_max = 0,
		name = "恶毒岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "恶毒的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200008",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200008,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200009] = {
		group_max = 0,
		name = "独角兽岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "独角兽的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200009",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200009,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200010] = {
		group_max = 0,
		name = "塔什干岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "塔什干的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200010",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200010,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200011] = {
		group_max = 0,
		name = "胡德岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "胡德的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200011",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200011,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200012] = {
		group_max = 0,
		name = "{namecode:193:小天城}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:193:小天城}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200012",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200012,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200013] = {
		group_max = 0,
		name = "{namecode:427:欧根亲王}岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "{namecode:427:欧根亲王}的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200013",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200013,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200014] = {
		group_max = 0,
		name = "肇和岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "肇和的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200014",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200014,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	},
	[200015] = {
		group_max = 0,
		name = "莱昂纳多·达·芬奇岛屿权限认证函",
		manage_influence = 0,
		type = 2,
		convert = 0,
		resource_type = 0,
		pt_num = 0,
		desc = "莱昂纳多·达·芬奇的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		usage = "usage_undefined",
		order_price = 0,
		icon = "IslandProps/item_200015",
		price = 0,
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200015,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {}
	}
}
