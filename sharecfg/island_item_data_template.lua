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
			200015,
			300001,
			300002,
			300003,
			300004,
			300005,
			300006
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
			200015,
			300001,
			300002,
			300003,
			300004,
			300005,
			300006
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
		200015,
		300001,
		300002,
		300003,
		300004,
		300005,
		300006
	}
}, confHX)
pg.base = pg.base or {}
pg.base.island_item_data_template = {
	{
		pt_num = 0,
		name = "開発資金",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島開発エリアで流通する貨幣。持続的な発展の基本である",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 1,
		icon = "Islandprops/1",
		price = 0,
		icon_normal = "props/item_island_1",
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
				"離島依頼",
				{}
			},
			{
				"店舗経営",
				{}
			}
		}
	},
	{
		pt_num = 0,
		name = "開発EXP",
		group_max = 0,
		type = 4,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島開発の経験値。開発経験値が貯まると開発レベルが上昇する",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "Islandprops/2",
		price = 0,
		icon_normal = "",
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
				"離島依頼",
				{}
			},
			{
				"計画",
				{}
			}
		}
	},
	{
		pt_num = 0,
		name = "着せ替えカラー",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "様々なペイント素材があるカラーパレット。きせかえの色を変更でき、オリジナル着せ替えにすることが可能！",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "Islandprops/3",
		price = 0,
		icon_normal = "",
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
				"ショップ購入",
				{}
			},
			{
				"累計PT",
				{}
			}
		}
	},
	{
		pt_num = 0,
		name = "建築手形",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "集会島の建築許可。これがあれば集会島で自分の専属地を模様替えできる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/4",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "地図の破片-1",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "奇妙な紙切れ。歪んだ筆跡になにやら秘密が隠されているようだ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "地図の破片-2",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "奇妙な紙切れ。歪んだ筆跡になにやら秘密が隠されているようだ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "地図の破片-3",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "奇妙な紙切れ。歪んだ筆跡になにやら秘密が隠されているようだ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "地図の破片-4",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "奇妙な紙切れ。歪んだ筆跡になにやら秘密が隠されているようだ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "地図の破片-5",
		group_max = 0,
		type = 3,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "奇妙な紙切れ。歪んだ筆跡になにやら秘密が隠されているようだ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "islandprops/Item_5",
		price = 0,
		icon_normal = "",
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
		pt_num = 1,
		name = "小麦の種",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の小麦の種。上質な小麦が収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1000",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1001] = {
		pt_num = 1,
		name = "とうもろこしの種",
		group_max = 0,
		type = 1,
		tech_id = 500212,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のとうもろこしの種。豊作の力が込められている。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1001",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1002] = {
		pt_num = 1,
		name = "陸稲の種",
		group_max = 0,
		type = 1,
		tech_id = 310202,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の陸稲の種。一緒に収穫の時を待とう",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1002",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1003] = {
		pt_num = 1,
		name = "白菜の種",
		group_max = 0,
		type = 1,
		tech_id = 500215,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の白菜の種。水々しい大きな白菜を収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1003",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1004] = {
		pt_num = 1,
		name = "ニンジンの種",
		group_max = 0,
		type = 1,
		tech_id = 320204,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のニンジンの種。甘いニンジンを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1004",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1005] = {
		pt_num = 1,
		name = "じゃがいもの種",
		group_max = 0,
		type = 1,
		tech_id = 500214,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のじゃがいもの種。収穫の多いじゃがいもを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1005",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1006] = {
		pt_num = 1,
		name = "大豆の種",
		group_max = 0,
		type = 1,
		tech_id = 500213,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の大豆の種。上質な大豆を収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1006",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1007] = {
		pt_num = 1,
		name = "玉ねぎの種",
		group_max = 0,
		type = 1,
		tech_id = 320206,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の玉ねぎの種。魅力的な玉ねぎを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1007",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1008] = {
		pt_num = 1,
		name = "牧草の種",
		group_max = 0,
		type = 1,
		tech_id = 310201,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の牧草の種。豊かな牧草を収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1008",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1009] = {
		pt_num = 1,
		name = "コーヒーの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500211,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のコーヒーの木の種。風味豊かなコーヒー豆を収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1009",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1010] = {
		pt_num = 1,
		name = "亜麻の種",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の亜麻の種。成長が早く、長くて丈夫な繊維を入手できる。紡績の良き素材。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1010",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1011] = {
		pt_num = 1,
		name = "いちごの種",
		group_max = 0,
		type = 1,
		tech_id = 320201,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のいちごの種。真っ赤ないちごを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1011",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1012] = {
		pt_num = 1,
		name = "綿の種",
		group_max = 0,
		type = 1,
		tech_id = 320202,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の綿の種。柔らかい綿が実る。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1012",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1014] = {
		pt_num = 1,
		name = "茶の木の種",
		group_max = 0,
		type = 1,
		tech_id = 320203,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選の茶の木の種。上質な茶葉を入手可能。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1014",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1015] = {
		pt_num = 1,
		name = "ラベンダーの種",
		group_max = 0,
		type = 1,
		tech_id = 320205,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のラベンダーの種。紫色の花畑が育つ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1015",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1016] = {
		pt_num = 1,
		name = "りんごの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500231,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良なりんごの木の種。みずみずしくておいしいりんごを収穫可能。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1016",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1017] = {
		pt_num = 1,
		name = "柑橘類の木の種",
		group_max = 0,
		type = 1,
		tech_id = 500232,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良な柑橘類の木の種。甘くてジューシーな柑橘類を収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1017",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1018] = {
		pt_num = 1,
		name = "バナナの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500233,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良なバナナの木の種。ふっくらとしたバナナを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1018",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1019] = {
		pt_num = 1,
		name = "マンゴーの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500234,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良なマンゴーの木の種。甘いマンゴーを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1019",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1020] = {
		pt_num = 1,
		name = "レモンの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500235,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良なレモンの木の種。さわやかなレモンを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1020",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1021] = {
		pt_num = 1,
		name = "アボカドの木の種",
		group_max = 0,
		type = 1,
		tech_id = 500236,
		convert = 1,
		manage_influence = 0,
		desc = "母港で育てられた優良なアボカドの木の種。栄養豊富なアボカドを収穫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1021",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[1022] = {
		pt_num = 1,
		name = "ゴムの木の種",
		group_max = 0,
		type = 1,
		tech_id = 330201,
		convert = 1,
		manage_influence = 0,
		desc = "母港厳選のゴムの木の種。上質なゴムを入手できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_1022",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[2000] = {
		pt_num = 1,
		name = "小麦",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 8,
		icon = "IslandProps/item_2000",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2001] = {
		pt_num = 1,
		name = "とうもろこし",
		group_max = 0,
		type = 1,
		tech_id = 500212,
		convert = 1,
		manage_influence = 0,
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 8,
		icon = "IslandProps/item_2001",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2002] = {
		pt_num = 1,
		name = "米",
		group_max = 0,
		type = 1,
		tech_id = 310202,
		convert = 1,
		manage_influence = 0,
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 17,
		icon = "IslandProps/item_2002",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2003] = {
		pt_num = 1,
		name = "白菜",
		group_max = 0,
		type = 1,
		tech_id = 500215,
		convert = 1,
		manage_influence = 0,
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 14,
		icon = "IslandProps/item_2003",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2004] = {
		pt_num = 1,
		name = "ニンジン",
		group_max = 0,
		type = 1,
		tech_id = 320204,
		convert = 1,
		manage_influence = 0,
		desc = "家庭でよく使われる野菜。栄養豊富で甘い味わい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 34,
		icon = "IslandProps/item_2004",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2005] = {
		pt_num = 1,
		name = "じゃがいも",
		group_max = 0,
		type = 1,
		tech_id = 500214,
		convert = 1,
		manage_influence = 0,
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 33,
		icon = "IslandProps/item_2005",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2006] = {
		pt_num = 1,
		name = "大豆",
		group_max = 0,
		type = 1,
		tech_id = 500213,
		convert = 1,
		manage_influence = 0,
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 14,
		icon = "IslandProps/item_2006",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2007] = {
		pt_num = 24,
		name = "玉ねぎ",
		group_max = 0,
		type = 1,
		tech_id = 320206,
		convert = 1,
		manage_influence = 0,
		desc = "紫色の皮を剥くと…泣かされないように注意！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 244,
		icon = "IslandProps/item_2007",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2008] = {
		pt_num = 1,
		name = "牧草",
		group_max = 0,
		type = 1,
		tech_id = 310201,
		convert = 1,
		manage_influence = 0,
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 11,
		icon = "IslandProps/item_2008",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2009] = {
		pt_num = 6,
		name = "コーヒー豆",
		group_max = 0,
		type = 1,
		tech_id = 500211,
		convert = 1,
		manage_influence = 0,
		desc = "香り豊かで、気分もすっきり。一杯いかが？",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 68,
		icon = "IslandProps/item_2009",
		price = 1,
		icon_normal = "",
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
				"豊穣の畑",
				{}
			}
		}
	},
	[2010] = {
		pt_num = 6,
		name = "亜麻",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "長繊維の亜麻。糸作りや織物に最適。工房での作業にぴったり！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 72,
		icon = "IslandProps/item_2010",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2011] = {
		pt_num = 5,
		name = "いちご",
		group_max = 0,
		type = 1,
		tech_id = 320201,
		convert = 1,
		manage_influence = 0,
		desc = "真っ赤な実は甘酸っぱくてジューシー。スイーツと相性抜群。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 54,
		icon = "IslandProps/item_2011",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2012] = {
		pt_num = 6,
		name = "綿",
		group_max = 0,
		type = 1,
		tech_id = 320202,
		convert = 1,
		manage_influence = 0,
		desc = "柔らかい白い綿。紡績の重要な材料。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 92,
		icon = "IslandProps/item_2012",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2014] = {
		pt_num = 14,
		name = "茶葉",
		group_max = 0,
		type = 1,
		tech_id = 320203,
		convert = 1,
		manage_influence = 0,
		desc = "苦味がありながらも清らかな香りもあり。大自然の味を楽しもう。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 118,
		icon = "IslandProps/item_2014",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2015] = {
		pt_num = 35,
		name = "ラベンダー",
		group_max = 0,
		type = 1,
		tech_id = 320205,
		convert = 1,
		manage_influence = 0,
		desc = "香り豊かで庭を彩るだけでなく、精油の抽出にも使える。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 294,
		icon = "IslandProps/item_2015",
		price = 1,
		icon_normal = "",
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
				"青々苗場",
				{}
			}
		}
	},
	[2016] = {
		pt_num = 1,
		name = "りんご",
		group_max = 0,
		type = 1,
		tech_id = 500231,
		convert = 1,
		manage_influence = 0,
		desc = "甘酸っぱくてジューシー。各種ビタミンが含まれ、そのまま食べてもジュースにしてもおいしい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 50,
		icon = "IslandProps/item_2016",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2017] = {
		pt_num = 1,
		name = "柑橘フルーツ",
		group_max = 0,
		type = 1,
		tech_id = 500232,
		convert = 1,
		manage_influence = 0,
		desc = "安価で保存しやすく、さわやかな香りも楽しめる果物。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 65,
		icon = "IslandProps/item_2017",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2018] = {
		pt_num = 1,
		name = "バナナ",
		group_max = 0,
		type = 1,
		tech_id = 500233,
		convert = 1,
		manage_influence = 0,
		desc = "トロピカルな風情のフルーツ。甘くて柔らかく、食物繊維が豊富。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 80,
		icon = "IslandProps/item_2018",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2019] = {
		pt_num = 18,
		name = "マンゴー",
		group_max = 0,
		type = 1,
		tech_id = 500234,
		convert = 1,
		manage_influence = 0,
		desc = "果肉がなめらかな夏の果物。とても甘く、ジュースにしてもおいしい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 180,
		icon = "IslandProps/item_2019",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2020] = {
		pt_num = 3,
		name = "レモン",
		group_max = 0,
		type = 1,
		tech_id = 500235,
		convert = 1,
		manage_influence = 0,
		desc = "皮は清々しい香りで、身はちょうどいい甘酸っぱさ。料理の味を整えるのにも使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 32,
		icon = "IslandProps/item_2020",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2021] = {
		pt_num = 45,
		name = "アボカド",
		group_max = 0,
		type = 1,
		tech_id = 500236,
		convert = 1,
		manage_influence = 0,
		desc = "なめらかでクリーミーな食感。低カロリーでおいしくヘルシー。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 375,
		icon = "IslandProps/item_2021",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2022] = {
		pt_num = 30,
		name = "ゴム",
		group_max = 0,
		type = 1,
		tech_id = 330201,
		convert = 1,
		manage_influence = 0,
		desc = "高い弾性を持つ一般的な工業加工素材。使い道が多い！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 250,
		icon = "IslandProps/item_2022",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[2600] = {
		pt_num = 2,
		name = "新鮮な肉",
		group_max = 0,
		type = 1,
		tech_id = 420301,
		convert = 1,
		manage_influence = 0,
		desc = "動物から取れる新鮮な肉。最高品質のたんぱく質源。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 200,
		icon = "IslandProps/item_2600",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2601] = {
		pt_num = 1,
		name = "卵",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "茶色の卵。料理によく使われる食材。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 55,
		icon = "IslandProps/item_2601",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2602] = {
		pt_num = 1,
		name = "鶏肉",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "低脂肪高たんぱくの肉類。様々な料理に適している。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 20,
		icon = "IslandProps/item_2602",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2603] = {
		pt_num = 1,
		name = "牛乳",
		group_max = 0,
		type = 1,
		tech_id = 430301,
		convert = 1,
		manage_influence = 0,
		desc = "天然の飲み物。加工してヨーグルトやチーズも作れる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 136,
		icon = "IslandProps/item_2603",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2604] = {
		pt_num = 10,
		name = "皮素材",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "簡単に加工された動物の皮。なめして革にできる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 95,
		icon = "IslandProps/item_2604",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2605] = {
		pt_num = 72,
		name = "羊毛",
		group_max = 0,
		type = 1,
		tech_id = 440301,
		convert = 1,
		manage_influence = 0,
		desc = "動物の毛繊維。織物工業の重要な原料。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 600,
		icon = "IslandProps/item_2605",
		price = 1,
		icon_normal = "",
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
				"悠々牧場",
				{}
			}
		}
	},
	[2606] = {
		pt_num = 2,
		name = "新鮮なはちみつ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "採れたてのはちみつ。自然の甘い香りがたっぷり。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 200,
		icon = "IslandProps/item_2606",
		price = 1,
		icon_normal = "",
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
				"マップで採集",
				{}
			}
		}
	},
	[2700] = {
		pt_num = 1,
		name = "石炭",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "基本的な燃料。燃焼効率が高く、暖房や工業生産によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 12,
		icon = "IslandProps/item_2700",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2701] = {
		pt_num = 1,
		name = "銅鉱石",
		group_max = 0,
		type = 1,
		tech_id = 220101,
		convert = 1,
		manage_influence = 0,
		desc = "銅を豊富に含む鉱石。精錬した銅は電子製品の製造によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 100,
		icon = "IslandProps/item_2701",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2702] = {
		pt_num = 30,
		name = "アルミ鉱石",
		group_max = 0,
		type = 1,
		tech_id = 220201,
		convert = 1,
		manage_influence = 0,
		desc = "アルミニウムを豊富に含む鉱石。精錬したアルミは航空機や船舶の製造によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 300,
		icon = "IslandProps/item_2702",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2703] = {
		pt_num = 18,
		name = "鉄鉱石",
		group_max = 0,
		type = 1,
		tech_id = 220202,
		convert = 1,
		manage_influence = 0,
		desc = "鉄を豊富に含む鉱石。精錬した鉄は様々な施設の建設によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 180,
		icon = "IslandProps/item_2703",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2704] = {
		pt_num = 80,
		name = "硫黄鉱石",
		group_max = 0,
		type = 1,
		tech_id = 220203,
		convert = 1,
		manage_influence = 0,
		desc = "硫黄を豊富に含む鉱石。精錬した硫黄は肥料や殺虫剤の製造によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 700,
		icon = "IslandProps/item_2704",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2705] = {
		pt_num = 240,
		name = "銀鉱石",
		group_max = 0,
		type = 1,
		tech_id = 220204,
		convert = 1,
		manage_influence = 0,
		desc = "銀を豊富に含む鉱石。精錬した銀は合金や化学機材の製造によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1600,
		icon = "IslandProps/item_2705",
		price = 1,
		icon_normal = "",
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
				"積岩鉱山",
				{}
			}
		}
	},
	[2800] = {
		pt_num = 1,
		name = "大自然の原木",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "基本的な木材。製紙から建築まで、幅広い用途を持つ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 12,
		icon = "IslandProps/item_2800",
		price = 1,
		icon_normal = "",
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
				"翠緑の森",
				{}
			}
		}
	},
	[2801] = {
		pt_num = 1,
		name = "実用の木材",
		group_max = 0,
		type = 1,
		tech_id = 210201,
		convert = 1,
		manage_influence = 0,
		desc = "美しい木目で、家具やフローリングの製作に適している。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 125,
		icon = "IslandProps/item_2801",
		price = 1,
		icon_normal = "",
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
				"翠緑の森",
				{}
			}
		}
	},
	[2802] = {
		pt_num = 36,
		name = "プレミアム木材",
		group_max = 0,
		type = 1,
		tech_id = 210202,
		convert = 1,
		manage_influence = 0,
		desc = "頑丈で耐久性があり、伝統的な造船や高級家具の製造に使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 360,
		icon = "IslandProps/item_2802",
		price = 1,
		icon_normal = "",
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
				"翠緑の森",
				{}
			}
		}
	},
	[2803] = {
		pt_num = 180,
		name = "エレガント木材",
		group_max = 0,
		type = 1,
		tech_id = 210203,
		convert = 1,
		manage_influence = 0,
		desc = "美しくて硬い。高級装飾や家具に適している。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1200,
		icon = "IslandProps/item_2803",
		price = 1,
		icon_normal = "",
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
				"翠緑の森",
				{}
			}
		}
	},
	[3000] = {
		pt_num = 1,
		name = "コッコートリの餌",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "コッコートリ専用の高たんぱく飼料。十分なエネルギーを与える。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 25,
		icon = "IslandProps/item_3000",
		price = 1,
		icon_normal = "",
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
		pt_num = 1,
		name = "ブーブーブタの餌",
		group_max = 0,
		type = 1,
		tech_id = 420301,
		convert = 1,
		manage_influence = 0,
		desc = "ブーブーブタ専用の増量用飼料。食べ盛りの動物に適している。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 25,
		icon = "IslandProps/item_3001",
		price = 1,
		icon_normal = "",
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
		pt_num = 4,
		name = "モーモーウシの餌",
		group_max = 0,
		type = 1,
		tech_id = 430301,
		convert = 1,
		manage_influence = 0,
		desc = "モーモーウシ専用の栄養飼料。香りが良くて濃厚な牛乳の産出を助ける。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 40,
		icon = "IslandProps/item_3002",
		price = 1,
		icon_normal = "",
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
		pt_num = 4,
		name = "メェメーヒツジの餌",
		group_max = 0,
		type = 1,
		tech_id = 440301,
		convert = 1,
		manage_influence = 0,
		desc = "メェメーヒツジ専用のトウモロコシ粉の飼料。より柔らかい羊毛を育てるのに役立つ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 40,
		icon = "IslandProps/item_3003",
		price = 1,
		icon_normal = "",
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
		pt_num = 1,
		name = "小麦粉",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "小麦を挽いた白い粉。パン、ケーキ、ピザ作りなどに欠かせない。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 50,
		icon = "IslandProps/item_3004",
		price = 1,
		icon_normal = "",
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
		pt_num = 1,
		name = "アイスコーヒー",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 190,
		desc = "さわやかな味わいで、気分をリフレッシュ！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 95,
		icon = "IslandProps/item_3005",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3006] = {
		pt_num = 55,
		name = "チーズ",
		group_max = 0,
		type = 1,
		tech_id = 550201,
		convert = 1,
		manage_influence = 150,
		desc = "ミルクを原料に作られ、豊富なたんぱく質と脂質を含む。パンと合わせられることが多い。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 550,
		icon = "IslandProps/item_3006",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3007] = {
		pt_num = 25,
		name = "ラテ",
		group_max = 0,
		type = 1,
		tech_id = 550202,
		convert = 1,
		manage_influence = 180,
		desc = "エスプレッソとミルクの組み合わせ。香りが高く舌触りがなめらかで、コーヒー愛好家に愛されている。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 250,
		icon = "IslandProps/item_3007",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3008] = {
		pt_num = 20,
		name = "シトラスコーヒー",
		group_max = 0,
		type = 1,
		tech_id = 550203,
		convert = 1,
		manage_influence = 180,
		desc = "柑橘果汁を加えたコーヒー飲料。さわやかな酸味と果物の香りが特徴。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 190,
		icon = "IslandProps/item_3008",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3009] = {
		pt_num = 35,
		name = "アップルパイ",
		group_max = 0,
		type = 1,
		tech_id = 550204,
		convert = 1,
		manage_influence = 190,
		desc = "りんごの砂糖煮をパイ生地で包んだ甘いお菓子。お定番のスイーツ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 385,
		icon = "IslandProps/item_3009",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3010] = {
		pt_num = 25,
		name = "いちごミルクシェイク",
		group_max = 0,
		type = 1,
		tech_id = 550205,
		convert = 1,
		manage_influence = 240,
		desc = "口当たりなめらかなクリーム。さわやかでふんわりとした、豊かな味わい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 260,
		icon = "IslandProps/item_3010",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3011] = {
		pt_num = 35,
		name = "豆腐",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 170,
		desc = "白くて柔らかい。大豆から作られ、豊富な植物性たんぱく質を含む。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 340,
		icon = "IslandProps/item_3011",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[3012] = {
		pt_num = 155,
		name = "肉そぼろ豆腐",
		group_max = 0,
		type = 1,
		tech_id = 510201,
		convert = 1,
		manage_influence = 180,
		desc = "東煌の伝統家庭料理。なめらかな食感でスープが濃厚。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1300,
		icon = "IslandProps/item_3012",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[3013] = {
		pt_num = 35,
		name = "オムライス",
		group_max = 0,
		type = 1,
		tech_id = 510202,
		convert = 1,
		manage_influence = 240,
		desc = "黄金色の薄焼き卵が柔らかいご飯を包んでいる。一口ごとにサプライズが待っている！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 355,
		icon = "IslandProps/item_3013",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[3014] = {
		pt_num = 40,
		name = "白菜と豆腐のスープ",
		group_max = 0,
		type = 1,
		tech_id = 510203,
		convert = 1,
		manage_influence = 180,
		desc = "白菜の甘みと豆腐の旨味。あっさりしていて健康的。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 425,
		icon = "IslandProps/item_3014",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[3015] = {
		pt_num = 10,
		name = "野菜サラダ",
		group_max = 0,
		type = 1,
		tech_id = 510204,
		convert = 1,
		manage_influence = 160,
		desc = "新鮮な野菜とドレッシングの組み合わせ。さっぱりとしておいしい！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 105,
		icon = "IslandProps/item_3015",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[3017] = {
		pt_num = 10,
		name = "りんごジュース",
		group_max = 0,
		type = 1,
		tech_id = 500235,
		convert = 1,
		manage_influence = 200,
		desc = "搾りたてのジュースはフルーツの香りがいっぱい。人気のヘルシードリンク！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 105,
		icon = "IslandProps/item_3017",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3018] = {
		pt_num = 20,
		name = "バナナマンゴージュース",
		group_max = 0,
		type = 1,
		tech_id = 520201,
		convert = 1,
		manage_influence = 190,
		desc = "バナナとマンゴーの完璧な組み合わせ。トロピカルフレーバーが凝縮されている！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 215,
		icon = "IslandProps/item_3018",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3019] = {
		pt_num = 15,
		name = "はちみつレモン水",
		group_max = 0,
		type = 1,
		tech_id = 520202,
		convert = 1,
		manage_influence = 240,
		desc = "甘いはちみつとさわやかなレモンの絶妙な組み合わせ。ビタミンCも補給できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 140,
		icon = "IslandProps/item_3019",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3020] = {
		pt_num = 25,
		name = "いちごレモンドリンク",
		group_max = 0,
		type = 1,
		tech_id = 520205,
		convert = 1,
		manage_influence = 180,
		desc = "いちごとレモンの絶妙な組み合わせで、さっぱりとして飽きのこない果物風味の特製ドリンク。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 270,
		icon = "IslandProps/item_3020",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3021] = {
		pt_num = 240,
		name = "ラベンダーティー",
		group_max = 0,
		type = 1,
		tech_id = 520204,
		convert = 1,
		manage_influence = 160,
		desc = "心を落ち着かせ、ストレスを解消し、心身ともに整えてくれる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1590,
		icon = "IslandProps/item_3021",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3022] = {
		pt_num = 95,
		name = "いちごのハニーフラッペ",
		group_max = 0,
		type = 1,
		tech_id = 520203,
		convert = 1,
		manage_influence = 220,
		desc = "いちごの甘酸っぱさとはちみつの芳醇さが完璧に融合した、甘美なフラッペワールド。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 790,
		icon = "IslandProps/item_3022",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[3023] = {
		pt_num = 4,
		name = "コーンカップ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 180,
		desc = "軽く蒸した黄金色のとうもろこしの粒をカップに入れたもの。よく見かける美味しいスナック。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 45,
		icon = "IslandProps/item_3023",
		price = 1,
		icon_normal = "",
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
				"饅頭軽食",
				{}
			}
		}
	},
	[3024] = {
		pt_num = 35,
		name = "オレンジパイ",
		group_max = 0,
		type = 1,
		tech_id = 530206,
		convert = 1,
		manage_influence = 185,
		desc = "クラシックなお菓子。午後のティータイムに食べるとより美味しい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 375,
		icon = "IslandProps/item_3024",
		price = 1,
		icon_normal = "",
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
				"饅頭軽食",
				{}
			}
		}
	},
	[3025] = {
		pt_num = 60,
		name = "マンゴーともち米の蒸し飯",
		group_max = 0,
		type = 1,
		tech_id = 530202,
		convert = 1,
		manage_influence = 160,
		desc = "トロピカル風情あふれる家庭料理。食欲がない時に合う一品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 510,
		icon = "IslandProps/item_3025",
		price = 1,
		icon_normal = "",
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
				"饅頭軽食",
				{}
			}
		}
	},
	[3026] = {
		pt_num = 30,
		name = "バナナクレープ",
		group_max = 0,
		type = 1,
		tech_id = 530203,
		convert = 1,
		manage_influence = 170,
		desc = "クラシックな朝食。サクサクした食感で、老若男女問わず愛されている。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 230,
		icon = "IslandProps/item_3026",
		price = 1,
		icon_normal = "",
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
				"饅頭軽食",
				{}
			}
		}
	},
	[3028] = {
		pt_num = 200,
		name = "いちごシャルロット",
		group_max = 0,
		type = 1,
		tech_id = 530204,
		convert = 1,
		manage_influence = 190,
		desc = "サクサクのメレンゲ生地に甘いいちごのムースを組み合わせた、スイーツ愛好家たちの大好物。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1350,
		icon = "IslandProps/item_3028",
		price = 1,
		icon_normal = "",
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
				"饅頭軽食",
				{}
			}
		}
	},
	[3029] = {
		pt_num = 40,
		name = "炭火串焼き",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "外はパリッと中はじゅわっと、すごくいい香り。バーベキューパーティーの定番！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 390,
		icon = "IslandProps/item_3029",
		price = 1,
		icon_normal = "",
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
				"烏魚焼肉",
				{}
			}
		}
	},
	[3030] = {
		pt_num = 36,
		name = "鶏肉とポテトの盛り合わせ",
		group_max = 0,
		type = 1,
		tech_id = 540201,
		convert = 1,
		manage_influence = 230,
		desc = "シンプルで美味しい。家庭の食卓での定番！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 370,
		icon = "IslandProps/item_3030",
		price = 1,
		icon_normal = "",
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
				"烏魚焼肉",
				{}
			}
		}
	},
	[3032] = {
		pt_num = 70,
		name = "鶏肉炒め",
		group_max = 0,
		type = 1,
		tech_id = 540202,
		convert = 1,
		manage_influence = 220,
		desc = "鶏肉を調味料と一緒に炒めて仕上げた一品。香りが食欲をそそる！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 580,
		icon = "IslandProps/item_3032",
		price = 1,
		icon_normal = "",
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
				"烏魚焼肉",
				{}
			}
		}
	},
	[3033] = {
		pt_num = 16,
		name = "ニンジン厚焼き玉子",
		group_max = 0,
		type = 1,
		tech_id = 540204,
		convert = 1,
		manage_influence = 180,
		desc = "薄い卵焼きに甘いニンジンを包んだ深みのある食感。朝食や午後のおやつにぜひ一品を！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 170,
		icon = "IslandProps/item_3033",
		price = 1,
		icon_normal = "",
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
				"烏魚焼肉",
				{}
			}
		}
	},
	[3034] = {
		pt_num = 100,
		name = "ハンバーグ丼",
		group_max = 0,
		type = 1,
		tech_id = 540205,
		convert = 1,
		manage_influence = 150,
		desc = "調理が早く、お腹もいっぱいになれる。タイパがいいグルメ！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 845,
		icon = "IslandProps/item_3034",
		price = 1,
		icon_normal = "",
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
				"烏魚焼肉",
				{}
			}
		}
	},
	[3035] = {
		pt_num = 34,
		name = "布生地",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "繊維を含む材料で作られた生地素材。多くの日用品や工業製品の原料。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 340,
		icon = "IslandProps/item_3035",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3036] = {
		pt_num = 60,
		name = "革",
		group_max = 0,
		type = 1,
		tech_id = 660201,
		convert = 1,
		manage_influence = 0,
		desc = "動物の毛皮を加工したもの。衣類や家具の製作によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 600,
		icon = "IslandProps/item_3036",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3037] = {
		pt_num = 72,
		name = "ロープ",
		group_max = 0,
		type = 1,
		tech_id = 660202,
		convert = 1,
		manage_influence = 0,
		desc = "しっかりと丈夫。荷物を縛るのはもちろん、足場を固定する時にも役に立つ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 600,
		icon = "IslandProps/item_3037",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3038] = {
		pt_num = 105,
		name = "手袋",
		group_max = 0,
		type = 1,
		tech_id = 660203,
		convert = 1,
		manage_influence = 0,
		desc = "どの家庭にも必須の防寒用品。寒い日の外出には欠かせない。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 890,
		icon = "IslandProps/item_3038",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3039] = {
		pt_num = 130,
		name = "香り袋",
		group_max = 0,
		type = 1,
		tech_id = 660204,
		convert = 1,
		manage_influence = 0,
		desc = "ハーブやスパイスを詰めた袋。持ち運べるリフレッシュアクセサリー。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1100,
		icon = "IslandProps/item_3039",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3040] = {
		pt_num = 350,
		name = "靴",
		group_max = 0,
		type = 1,
		tech_id = 660205,
		convert = 1,
		manage_influence = 0,
		desc = "革製品。足を保護するために使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2380,
		icon = "IslandProps/item_3040",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3041] = {
		pt_num = 350,
		name = "包帯",
		group_max = 0,
		type = 1,
		tech_id = 660206,
		convert = 1,
		manage_influence = 0,
		desc = "必需の救急用品。切り傷でもすり傷でも、すぐに手当てできる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2380,
		icon = "IslandProps/item_3041",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[3042] = {
		pt_num = 30,
		name = "木炭筆",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "デッサンやスケッチによく使われる美術道具。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 300,
		icon = "IslandProps/item_3042",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3043] = {
		pt_num = 92,
		name = "ケーブル",
		group_max = 0,
		type = 1,
		tech_id = 640202,
		convert = 1,
		manage_influence = 0,
		desc = "多くの設備に電力を供給しているモダンの象徴。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 770,
		icon = "IslandProps/item_3043",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3044] = {
		pt_num = 66,
		name = "鉄釘",
		group_max = 0,
		type = 1,
		tech_id = 640201,
		convert = 1,
		manage_influence = 0,
		desc = "よく見る建築資材。板の固定や家具の製造によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 660,
		icon = "IslandProps/item_3044",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3045] = {
		pt_num = 84,
		name = "化学品",
		group_max = 0,
		type = 1,
		tech_id = 640203,
		convert = 1,
		manage_influence = 0,
		desc = "強い腐食性を持つ化学品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 840,
		icon = "IslandProps/item_3045",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3046] = {
		pt_num = 150,
		name = "火薬",
		group_max = 0,
		type = 1,
		tech_id = 640204,
		convert = 1,
		manage_influence = 0,
		desc = "モダンの武器の必需品。適切に管理すべき危険物。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1200,
		icon = "IslandProps/item_3046",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3047] = {
		pt_num = 380,
		name = "食器",
		group_max = 0,
		type = 1,
		tech_id = 640206,
		convert = 1,
		manage_influence = 0,
		desc = "どの家庭にとっても必需品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2560,
		icon = "IslandProps/item_3047",
		price = 1,
		icon_normal = "",
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
				"工作機械",
				{}
			}
		}
	},
	[3048] = {
		pt_num = 1,
		name = "紙",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "安価な植物繊維で作られることが多い。保存しやすく、書きやすい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 175,
		icon = "IslandProps/item_3048",
		price = 1,
		icon_normal = "",
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
				"木材加工",
				{}
			}
		}
	},
	[3049] = {
		pt_num = 120,
		name = "メモ帳",
		group_max = 0,
		type = 1,
		tech_id = 630201,
		convert = 1,
		manage_influence = 0,
		desc = "日常の用事がびっしり書かれたノート。日記帳としても使える。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1230,
		icon = "IslandProps/item_3049",
		price = 1,
		icon_normal = "",
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
				"木材加工",
				{}
			}
		}
	},
	[3050] = {
		pt_num = 80,
		name = "机と椅子",
		group_max = 0,
		type = 1,
		tech_id = 630202,
		convert = 1,
		manage_influence = 0,
		desc = "最も一般的な家具。休憩場所を提供してくれる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 810,
		icon = "IslandProps/item_3050",
		price = 1,
		icon_normal = "",
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
				"木材加工",
				{}
			}
		}
	},
	[3051] = {
		pt_num = 190,
		name = "セレクション樽",
		group_max = 0,
		type = 1,
		tech_id = 630203,
		convert = 1,
		manage_influence = 0,
		desc = "ワインやはちみつの貯蔵に使われる多機能な樽。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1610,
		icon = "IslandProps/item_3051",
		price = 1,
		icon_normal = "",
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
				"木材加工",
				{}
			}
		}
	},
	[3052] = {
		pt_num = 430,
		name = "ファイルキャビネット",
		group_max = 0,
		type = 1,
		tech_id = 630204,
		convert = 1,
		manage_influence = 0,
		desc = "オフィスの必需品。各種書類の保管・管理に便利。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2880,
		icon = "IslandProps/item_3052",
		price = 1,
		icon_normal = "",
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
				"木材加工",
				{}
			}
		}
	},
	[3053] = {
		pt_num = 55,
		name = "インクカートリッジ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "印刷用インクを保存するもの。プリンターの中核部品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 570,
		icon = "IslandProps/item_3053",
		price = 1,
		icon_normal = "",
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
				"電子部品加工",
				{}
			}
		}
	},
	[3054] = {
		pt_num = 310,
		name = "時計",
		group_max = 0,
		type = 1,
		tech_id = 650201,
		convert = 1,
		manage_influence = 0,
		desc = "時間を示す精密機器。通常は部屋の壁に固定される。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2590,
		icon = "IslandProps/item_3054",
		price = 1,
		icon_normal = "",
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
				"電子部品加工",
				{}
			}
		}
	},
	[3055] = {
		pt_num = 210,
		name = "蓄電池",
		group_max = 0,
		type = 1,
		tech_id = 650202,
		convert = 1,
		manage_influence = 0,
		desc = "繰り返し使用でき、モーター、照明設備などへ安定した電源となる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1750,
		icon = "IslandProps/item_3055",
		price = 1,
		icon_normal = "",
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
				"電子部品加工",
				{}
			}
		}
	},
	[3056] = {
		pt_num = 360,
		name = "浄水フィルター",
		group_max = 0,
		type = 1,
		tech_id = 650203,
		convert = 1,
		manage_influence = 0,
		desc = "水中の不純物を除去して、きれいな水を提供してくれる！",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 2400,
		icon = "IslandProps/item_3056",
		price = 1,
		icon_normal = "",
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
				"電子部品加工",
				{}
			}
		}
	},
	[3059] = {
		pt_num = 1,
		name = "オムレツ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "ふわふわの卵で柔らかい具材を包んだ黄金色の誘惑的な一品。シンプルながら満足感のある美味しさ。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 50,
		icon = "IslandProps/item_3059",
		price = 1,
		icon_normal = "",
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
				"饅頭カフェ",
				{}
			}
		}
	},
	[3101] = {
		pt_num = 200,
		name = "定番豆腐セット",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "肉そぼろ豆腐と白菜豆腐スープの組み合わせ。シンプルで美味しい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1735,
		icon = "IslandProps/item_3101",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3102] = {
		pt_num = 100,
		name = "ふんわり定食",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 220,
		desc = "ふわふわオムライスと温かく滑らかな豆腐の組み合わせ。シンプルながら満足感のある味わい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 695,
		icon = "IslandProps/item_3102",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3103] = {
		pt_num = 200,
		name = "香りも楽しめるフルーツセット",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "ラベンダーの癒やしの香りとりんごの爽やかな甘さが絶妙に融合し、二重の楽しみを感じさせる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1700,
		icon = "IslandProps/item_3103",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3104] = {
		pt_num = 120,
		name = "カラフル果物パラダイス",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 215,
		desc = "バナナマンゴージュースといちごハニー味のかき氷のセット。フルーツの味わいで爽やかな体験をお届け。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1000,
		icon = "IslandProps/item_3104",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3105] = {
		pt_num = 60,
		name = "太陽のハニー",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 260,
		desc = "いちごハニーの甘さとはちみつレモン水の組み合わせ。元気溢れる太陽の味わい。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 410,
		icon = "IslandProps/item_3105",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3106] = {
		pt_num = 65,
		name = "スイートテイスト",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 250,
		desc = "トロピカルマンゴーの香り豊かな食感に、コーンカップの食べ応えで、一度に二つの幸せを味わえる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 560,
		icon = "IslandProps/item_3106",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3107] = {
		pt_num = 70,
		name = "果樹園二重奏",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 240,
		desc = "バナナクレープのやわらかさと黄金のアップルパイのサクサク感が組み合わさり、一度に二つの果物の甘い味わいを楽しめる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 615,
		icon = "IslandProps/item_3107",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3108] = {
		pt_num = 260,
		name = "ベリーオレンジスイーツ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "いちごのロマンチックな出会いとオレンジの太陽のような香りが融合し、うっとりするようなスイーツタイムを演出。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1730,
		icon = "IslandProps/item_3108",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3109] = {
		pt_num = 90,
		name = "肉カーニバル",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 230,
		desc = "香ばしい串焼きと柔らかい鶏肉に、カリカリのフライドポテト。思う存分お腹いっぱい食べられる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 760,
		icon = "IslandProps/item_3109",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3110] = {
		pt_num = 210,
		name = "エナジーダブルコンボ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 210,
		desc = "ハンバーグ丼にスパイスの効いた鶏肉炒め、これでもかというタンパク質がダイナミックに一日のエネルギーを補給してくれる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1430,
		icon = "IslandProps/item_3110",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3111] = {
		pt_num = 36,
		name = "朝光活力コンビ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 250,
		desc = "ふわふわオムレツとゴージャスなラテで完璧な朝食タイムを。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 300,
		icon = "IslandProps/item_3111",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3112] = {
		pt_num = 80,
		name = "お目覚めブレックファスト",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 240,
		desc = "アイスコーヒーと濃厚チーズ、苦味と甘味のバランスが取れた定番の目覚めブレックファスト。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 650,
		icon = "IslandProps/item_3112",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[3113] = {
		pt_num = 65,
		name = "フルーツツインズ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 260,
		desc = "柑橘コーヒーといちごミルクシェイク。二つの特製ドリンクを一度に満喫できる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 450,
		icon = "IslandProps/item_3113",
		price = 1,
		icon_normal = "",
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
				"セット図鑑",
				{}
			}
		}
	},
	[4001] = {
		pt_num = 40,
		name = "アキギク",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "風に揺れる黄金色のアキギク。観賞用にもお茶としても楽しめる逸品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 400,
		icon = "IslandProps/item_4001",
		price = 1,
		icon_normal = "",
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
				"マップで採集",
				{}
			}
		}
	},
	[4002] = {
		pt_num = 2,
		name = "葦の花",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "水辺に生育する軽やかで純白の葦の花。ドライフラワーの装飾によく使われる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 200,
		icon = "IslandProps/item_4002",
		price = 1,
		icon_normal = "",
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
				"マップで採集",
				{}
			}
		}
	},
	[4003] = {
		pt_num = 1,
		name = "落花生",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "香ばしくて美味しい落花生は、タンパク質と健康的な脂質が豊富。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 150,
		icon = "IslandProps/item_4003",
		price = 1,
		icon_normal = "",
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
				"マップで採集",
				{}
			}
		}
	},
	[4004] = {
		pt_num = 95,
		name = "松茸",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "新鮮で山の珍味。独特の香りを持ち、スープの出汁取りにも使われる最高級食材。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 800,
		icon = "IslandProps/item_4004",
		price = 1,
		icon_normal = "",
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
				"マップで採集",
				{}
			}
		}
	},
	[4005] = {
		pt_num = 5,
		name = "宵月梨",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "甘くてみずみずしい梨。舌触りがきめ細かく、のどを潤す秋の味覚。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 70,
		icon = "IslandProps/item_4005",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[4006] = {
		pt_num = 1,
		name = "宵月梨の種",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "甘い未来が秘められている宵月梨の木の種。良質な梨の木を育てることができる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_4006",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[4007] = {
		pt_num = 24,
		name = "柿",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "鮮やかに赤く実った柿。やわらかくて甘く、ビタミンが豊富な秋の旬の果物。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 200,
		icon = "IslandProps/item_4007",
		price = 1,
		icon_normal = "",
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
				"薫る果樹園",
				{}
			}
		}
	},
	[4008] = {
		pt_num = 1,
		name = "柿の種",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 0,
		desc = "種を植え、医者が青くなるほど健康な生活を祈って",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 0,
		icon = "IslandProps/item_4008",
		price = 1,
		icon_normal = "",
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
				"ショップ購入",
				{
					"IslandShopScene",
					"page = 1"
				}
			}
		}
	},
	[4009] = {
		pt_num = 25,
		name = "干し柿",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "甘くてもちもちした干し柿。新鮮な柿から作られる。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 210,
		icon = "IslandProps/item_4009",
		price = 1,
		icon_normal = "",
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
		pt_num = 135,
		name = "松茸と鶏のスープ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "香り高く濃厚な松茸と鶏のスープ。松茸と鶏肉をじっくり煮込んだ温かく滋養のある一品。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 900,
		icon = "IslandProps/item_4010",
		price = 1,
		icon_normal = "",
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
				"有魚飯店",
				{}
			}
		}
	},
	[4011] = {
		pt_num = 70,
		name = "秋のブーケ",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "温かみのあるオレンジの色合いのブーケ。菊や葦など旬の花材を厳選し、秋の風情を演出する。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 705,
		icon = "IslandProps/item_4011",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[4012] = {
		pt_num = 100,
		name = "落花生油",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "まろやかな落花生油。良質な落花生を搾った健康的な調理用油。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 1005,
		icon = "IslandProps/item_4012",
		price = 1,
		icon_normal = "",
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
				"手工作業台",
				{}
			}
		}
	},
	[4013] = {
		pt_num = 20,
		name = "ニンジンと梨のジュース",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "ニンジンと梨を使った新鮮で甘いジュース。人参の栄養と梨のさっぱりした味わいが融合した、さわやかな飲み物。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 200,
		icon = "IslandProps/item_4013",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[4014] = {
		pt_num = 100,
		name = "菊花の茶",
		group_max = 0,
		type = 1,
		tech_id = 0,
		convert = 1,
		manage_influence = 280,
		desc = "上品で清らかな香りを持つ菊の茶。菊の花びらを淹れたもので、のぼせを取ってくれるまろやかな後味。",
		usage = "usage_undefined",
		resource_type = 1,
		order_price = 840,
		icon = "IslandProps/item_4014",
		price = 1,
		icon_normal = "",
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
				"白クマ茶房",
				{}
			}
		}
	},
	[100001] = {
		pt_num = 0,
		name = "離島EXP教科書 T1",
		group_max = 0,
		type = 5,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100001",
		price = 0,
		icon_normal = "props/item_100001",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100002] = {
		pt_num = 0,
		name = "離島EXP教科書 T2",
		group_max = 0,
		type = 5,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100002",
		price = 0,
		icon_normal = "props/item_100002",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100003] = {
		pt_num = 0,
		name = "離島EXP教科書 T3",
		group_max = 0,
		type = 5,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100003",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100011] = {
		pt_num = 0,
		name = "経営教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "経営テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの経営ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100011",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100012] = {
		pt_num = 0,
		name = "経営教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "経営テクニックを詳しく解説した指南教科書。使用すると、キャラクターの経営ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100012",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100013] = {
		pt_num = 0,
		name = "経営教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "経営テクニックを豊富に収録した指南教科書。使用すると、キャラクターの経営ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100013",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "5",
		id = 100013,
		have_max = 0,
		filter = {
			10211
		},
		sub_attribute = {},
		jump_page = {}
	},
	[100021] = {
		pt_num = 0,
		name = "農業教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "農業テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの農業ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100021",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100022] = {
		pt_num = 0,
		name = "農業教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "農業テクニックを詳しく解説した指南教科書。使用すると、キャラクターの農業ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100022",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100023] = {
		pt_num = 0,
		name = "農業教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "農業テクニックを豊富に収録した指南教科書。使用すると、キャラクターの農業ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100023",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "制作教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "制作テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの制作ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100031",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100032] = {
		pt_num = 0,
		name = "制作教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "制作テクニックを詳しく解説した指南教科書。使用すると、キャラクターの制作ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100032",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100033] = {
		pt_num = 0,
		name = "制作教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "制作テクニックを豊富に収録した指南教科書。使用すると、キャラクターの制作ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100033",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "採集教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "採集テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの採集ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100041",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100042] = {
		pt_num = 0,
		name = "採集教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "採集テクニックを詳しく解説した指南教科書。使用すると、キャラクターの採集ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100042",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100043] = {
		pt_num = 0,
		name = "採集教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "採集テクニックを豊富に収録した指南教科書。使用すると、キャラクターの採集ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100043",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "飼養教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "飼養テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの飼養ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100051",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100052] = {
		pt_num = 0,
		name = "飼養教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "飼養テクニックを詳しく解説した指南教科書。使用すると、キャラクターの飼養ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100052",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100053] = {
		pt_num = 0,
		name = "飼養教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "飼養テクニックを豊富に収録した指南教科書。使用すると、キャラクターの飼養ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100053",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "料理教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "料理テクニックの基礎をまとめた指南教科書。使用すると、キャラクターの料理ステータスが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100061",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100062] = {
		pt_num = 0,
		name = "料理教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "料理テクニックを詳しく解説した指南教科書。使用すると、キャラクターの料理ステータスがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100062",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			}
		}
	},
	[100063] = {
		pt_num = 0,
		name = "料理教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "料理テクニックを豊富に収録した指南教科書。使用すると、キャラクターの料理ステータスが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100063",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "生産スキル教科書 T1",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100101",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100102] = {
		pt_num = 0,
		name = "生産スキル教科書 T2",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100102",
		price = 0,
		icon_normal = "props/item_100102",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100103] = {
		pt_num = 0,
		name = "生産スキル教科書 T3",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100103",
		price = 0,
		icon_normal = "",
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
				"累計PT",
				{}
			},
			{
				"ショップ",
				{}
			},
			{
				"開発計画",
				{}
			}
		}
	},
	[100201] = {
		pt_num = 0,
		name = "離島開発結晶",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_100201",
		price = 0,
		icon_normal = "props/item_island_100201",
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
				"ショップ",
				{}
			}
		}
	},
	[110001] = {
		pt_num = 0,
		name = "海塩ドリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力50回復する。好物のキャラが追加でバフ効果を得る。まるで潮風が舌先を吹き抜けるような、塩っぱくて甘い独特な味覚",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110001",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110001,
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
				"定期補給",
				{}
			},
			{
				"デイリー",
				{}
			}
		}
	},
	[110002] = {
		pt_num = 0,
		name = "新緑ドリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力50回復する。まるで潮風が舌先を吹き抜けるような、塩っぱくて甘い独特な味覚",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110002",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110002,
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
				"定期補給",
				{}
			}
		}
	},
	[110003] = {
		pt_num = 0,
		name = "いちごドリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力が50回復し、8時間、基本資源生産時に生産に必要な時間を5％短縮する。いちごの甘い香りで今日も元気いっぱい",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110003",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110003,
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
				"定期補給",
				{}
			}
		}
	},
	[110004] = {
		pt_num = 0,
		name = "キンカンドリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力が50回復し、8時間、基地工場でアイテム制作時に制作に必要な時間を5％短縮する。キンカンの渋みもあるけど、後味が甘く気分も爽やかに",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110004",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110004,
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
				"定期補給",
				{}
			}
		}
	},
	[110005] = {
		pt_num = 0,
		name = "ベリードリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力が50回復し、8時間、店舗で料理アイテム制作時に制作に必要な時間を5％短縮する。酸っぱくて甘い、フルーティーなベリーの嬉しい味覚",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110005",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110005,
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
				"定期補給",
				{}
			}
		}
	},
	[110006] = {
		pt_num = 0,
		name = "ぶどうドリンク",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "体力が50回復し、8時間、店舗で店員スタッフを担当する時、店舗の売上が5％アップ。まろやか甘々な風味がたまらない",
		usage = "usage_island_gift",
		order_price = 0,
		icon = "IslandProps/item_110006",
		price = 0,
		icon_normal = "",
		rarity = 2,
		drop_after_use = 0,
		resource_type = 0,
		id = 110006,
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
				"定期補給",
				{}
			}
		}
	},
	[200001] = {
		pt_num = 0,
		name = "チェシャー-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "チェシャーの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200001",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200001,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"星彩赏",
				{}
			}
		}
	},
	[200002] = {
		pt_num = 0,
		name = "サラトガ-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "サラトガの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200002",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "明石-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "明石離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200003",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200003,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"計画",
				{}
			}
		}
	},
	[200004] = {
		pt_num = 0,
		name = "大鳳-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "大鳳の離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200004",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "ニュージャージー-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "ニュージャージーの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200005",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200005,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"技術",
				{}
			}
		}
	},
	[200006] = {
		pt_num = 0,
		name = "島風-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "島風の離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200006",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200006,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[200007] = {
		pt_num = 0,
		name = "応瑞-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "応瑞の離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200007",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200007,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"技術",
				{}
			}
		}
	},
	[200008] = {
		pt_num = 0,
		name = "ル・マラン-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "ル・マランの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200008",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200008,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"実績",
				{}
			}
		}
	},
	[200009] = {
		pt_num = 0,
		name = "ユニコーン-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "ユニコーンの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200009",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200009,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"星彩赏",
				{}
			}
		}
	},
	[200010] = {
		pt_num = 0,
		name = "タシュケント-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "タシュケントの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200010",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200010,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"技術",
				{}
			}
		}
	},
	[200011] = {
		pt_num = 0,
		name = "フッド-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "フッドの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200011",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200011,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"技術",
				{}
			}
		}
	},
	[200012] = {
		pt_num = 0,
		name = "天城ちゃん-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "天城ちゃんの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200012",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200012,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"星彩赏",
				{}
			}
		}
	},
	[200013] = {
		pt_num = 0,
		name = "プリンツ・オイゲン-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "プリンツ・オイゲンの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200013",
		price = 0,
		icon_normal = "",
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
		pt_num = 0,
		name = "肇和-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "肇和の離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200014",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200014,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"技術",
				{}
			}
		}
	},
	[200015] = {
		pt_num = 0,
		name = "レオナルド・ダ・ヴィンチ-離島権限認証",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "レオナルド・ダ・ヴィンチの離島権限認証。離島権限認証装置を使用すると、キャラに離島開発エリアの出入り権限を付与できる",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/item_200015",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 200015,
		have_max = 0,
		filter = {
			10213
		},
		sub_attribute = {},
		jump_page = {
			{
				"実績",
				{}
			}
		}
	},
	[300001] = {
		pt_num = 0,
		name = "豊穣の畑配置作業効率が4%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、豊穣の畑配置作業効率が4%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300001,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[300002] = {
		pt_num = 0,
		name = "薫る果樹園配置作業効率が4%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、薫る果樹園配置作業効率が4%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300002,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[300003] = {
		pt_num = 0,
		name = "青々苗場配置作業効率が4%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、青々苗場配置作業効率が4%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300003,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[300004] = {
		pt_num = 0,
		name = "豊穣の畑配置作業効率が8%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、豊穣の畑配置作業効率が8%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300004,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[300005] = {
		pt_num = 0,
		name = "薫る果樹園配置作業効率が8%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、薫る果樹園配置作業効率が8%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300005,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[300006] = {
		pt_num = 0,
		name = "青々苗場配置作業効率が8%アップ",
		group_max = 0,
		type = 2,
		tech_id = 0,
		convert = 0,
		manage_influence = 0,
		desc = "入手後、青々苗場配置作業効率が8%アップ",
		usage = "usage_undefined",
		resource_type = 0,
		order_price = 0,
		icon = "IslandProps/buff",
		price = 0,
		icon_normal = "",
		rarity = 4,
		drop_after_use = 0,
		usage_arg = "[]",
		id = 300006,
		have_max = 0,
		filter = {},
		sub_attribute = {},
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	}
}
