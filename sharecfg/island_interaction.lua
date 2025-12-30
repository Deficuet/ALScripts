pg = pg or {}
pg.island_interaction = setmetatable({
	__name = "island_interaction",
	get_id_list_by_groupId = {
		{
			101,
			102,
			103
		},
		{
			201
		},
		{
			301
		},
		{
			401
		},
		{
			501
		},
		[7] = {
			701
		},
		[8] = {
			801,
			803,
			804,
			805,
			806,
			807,
			808,
			809,
			814,
			815,
			816
		},
		[9] = {
			901
		},
		[10] = {
			1001
		},
		[11] = {
			1101,
			1102,
			1103,
			1104
		},
		[12] = {
			1201,
			1202,
			1203,
			1204,
			1205,
			1206,
			1207,
			1208,
			1209,
			1210,
			1211,
			1212,
			1213,
			1214,
			1215,
			1216,
			1217,
			1218,
			1219,
			1220,
			1221,
			1222,
			1223,
			1224,
			1225
		},
		[13] = {
			1301
		},
		[14] = {
			1401
		},
		[15] = {
			1501
		},
		[16] = {
			1601
		},
		[17] = {
			1701,
			1702,
			1703,
			1704,
			1705,
			1706,
			1707,
			1708,
			1709,
			1710,
			1711,
			1714,
			1715,
			1716,
			1717,
			1718
		},
		[18] = {
			1801
		},
		[19] = {
			1901,
			1902,
			1903,
			1904,
			1905,
			1906,
			1907,
			1908,
			1909,
			1910,
			1911,
			1912,
			1923,
			1913,
			1914,
			1915,
			1916,
			1917,
			1918,
			1919,
			1920,
			1921,
			1922
		},
		[20] = {
			2001
		},
		[21] = {
			2101,
			2103,
			2104,
			2105
		},
		[211] = {
			2102
		},
		[22] = {
			2201,
			2202
		},
		[23] = {
			2301,
			2302,
			2303,
			2304,
			2305,
			2306,
			2307,
			2308,
			2309,
			2310,
			2311,
			2312,
			2313
		},
		[24] = {
			2401,
			2402
		},
		[25] = {
			2501,
			2502,
			2503,
			2504
		},
		[26] = {
			2601,
			2602,
			2603
		},
		[27] = {
			2701,
			2702,
			2703,
			2704,
			2707,
			2708,
			2709,
			2710,
			2711,
			2712,
			2713,
			2714,
			2715
		},
		[9999] = {
			2705,
			2706
		},
		[28] = {
			2801,
			2802,
			2803,
			2804,
			2805,
			2806,
			2807
		},
		[29] = {
			2901,
			2902,
			2903,
			2904,
			2905,
			2906,
			2907,
			2908,
			2909,
			2910,
			2911,
			2912,
			2913,
			2914
		},
		[30] = {
			3001,
			3003,
			3004,
			3005,
			3006,
			3007,
			3008,
			3009,
			3010,
			3011,
			3012
		},
		[31] = {
			3101
		},
		[32] = {
			3201,
			3202,
			3203
		},
		[33] = {
			3301
		},
		[34] = {
			3401,
			3402
		},
		[35] = {
			3501
		},
		[36] = {
			3601,
			3602
		},
		[37] = {
			3701
		},
		[38] = {
			3801,
			3802,
			3803
		},
		[39] = {
			3902,
			3903,
			3904,
			3905
		},
		[40] = {
			4001,
			4002
		},
		[41] = {
			4101,
			4102
		},
		[42] = {
			4201
		},
		[43] = {
			4301,
			4302,
			4303
		},
		[44] = {
			4401
		},
		[45] = {
			4501,
			4502,
			4503,
			4504,
			4506,
			4507,
			4508,
			4509,
			4510,
			4511,
			4512,
			4513,
			4514,
			4515,
			4516,
			4517,
			4518,
			4519,
			4520
		},
		[46] = {
			4601,
			4602,
			4603,
			4604,
			4605
		},
		[47] = {
			4701,
			4702
		},
		[48] = {
			4801
		},
		[49] = {
			4901
		},
		[50] = {
			5001
		},
		[51] = {
			5101
		},
		[52] = {
			5201
		},
		[53] = {
			5300,
			5301,
			5302,
			5303,
			5304,
			5305,
			5306,
			5307,
			5308,
			5309,
			5310,
			5311,
			5312,
			5313,
			5314
		},
		[54] = {
			5401
		},
		[55] = {
			5501,
			5502
		},
		[56] = {
			5601
		},
		[57] = {
			5700,
			5701,
			5702,
			5703,
			5704,
			5705,
			5706,
			5707,
			5708,
			5709,
			5710,
			5711,
			5712,
			5713,
			5714,
			5715
		},
		[58] = {
			5800,
			5801,
			5802,
			5803,
			5804,
			5805,
			5806,
			5807,
			5808,
			5809,
			5810,
			5811,
			5812,
			5813,
			5814,
			5815,
			5816,
			5817,
			5818,
			5819,
			5820,
			5821,
			5822
		},
		[59] = {
			5901,
			5902
		},
		[60] = {
			6001,
			6002
		},
		[61] = {
			6101,
			6102,
			6103,
			6104,
			6105
		},
		[62] = {
			6201
		},
		[63] = {
			6301,
			6302,
			6303,
			6304,
			6305
		},
		[64] = {
			6401
		},
		[65] = {
			6501
		},
		[66] = {
			6601,
			6602,
			6603
		},
		[67] = {
			6701
		},
		[68] = {
			6801
		},
		[69] = {
			6901
		},
		[70] = {
			7001,
			7002,
			7003,
			7004,
			7005,
			7006,
			7007,
			7008,
			7009,
			7010,
			7011,
			7012,
			7013
		},
		[71] = {
			7101
		},
		[72] = {
			7201,
			7202
		},
		[73] = {
			7301
		},
		[74] = {
			7401
		},
		[75] = {
			7501
		},
		[76] = {
			7601
		},
		[77] = {
			7701,
			7702
		},
		[78] = {
			7801,
			7802,
			7803,
			7804
		},
		[79] = {
			7901,
			7902,
			7903,
			7904
		}
	},
	all = {
		101,
		102,
		103,
		201,
		301,
		401,
		501,
		701,
		801,
		803,
		804,
		805,
		806,
		807,
		808,
		809,
		814,
		815,
		816,
		901,
		1001,
		1101,
		1102,
		1103,
		1104,
		1201,
		1202,
		1203,
		1204,
		1205,
		1206,
		1207,
		1208,
		1209,
		1210,
		1211,
		1212,
		1213,
		1214,
		1215,
		1216,
		1217,
		1218,
		1219,
		1220,
		1221,
		1222,
		1223,
		1224,
		1225,
		1301,
		1401,
		1501,
		1601,
		1701,
		1702,
		1703,
		1704,
		1705,
		1706,
		1707,
		1708,
		1709,
		1710,
		1711,
		1714,
		1715,
		1716,
		1717,
		1718,
		1801,
		1901,
		1902,
		1903,
		1904,
		1905,
		1906,
		1907,
		1908,
		1909,
		1910,
		1911,
		1912,
		1923,
		1913,
		1914,
		1915,
		1916,
		1917,
		1918,
		1919,
		1920,
		1921,
		1922,
		2001,
		2101,
		2102,
		2103,
		2104,
		2105,
		2201,
		2202,
		2301,
		2302,
		2303,
		2304,
		2305,
		2306,
		2307,
		2308,
		2309,
		2310,
		2311,
		2312,
		2313,
		2401,
		2402,
		2501,
		2502,
		2503,
		2504,
		2601,
		2602,
		2603,
		2701,
		2702,
		2703,
		2704,
		2705,
		2706,
		2707,
		2708,
		2709,
		2710,
		2711,
		2712,
		2713,
		2714,
		2715,
		2801,
		2802,
		2803,
		2804,
		2805,
		2806,
		2807,
		2901,
		2902,
		2903,
		2904,
		2905,
		2906,
		2907,
		2908,
		2909,
		2910,
		2911,
		2912,
		2913,
		2914,
		3001,
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
		3101,
		3201,
		3202,
		3203,
		3301,
		3401,
		3402,
		3501,
		3601,
		3602,
		3701,
		3801,
		3802,
		3803,
		3902,
		3903,
		3904,
		3905,
		4001,
		4002,
		4101,
		4102,
		4201,
		4301,
		4302,
		4303,
		4401,
		4501,
		4502,
		4503,
		4504,
		4506,
		4507,
		4508,
		4509,
		4510,
		4511,
		4512,
		4513,
		4514,
		4515,
		4516,
		4517,
		4518,
		4519,
		4520,
		4601,
		4602,
		4603,
		4604,
		4605,
		4701,
		4702,
		4801,
		4901,
		5001,
		5101,
		5201,
		5300,
		5301,
		5302,
		5303,
		5304,
		5305,
		5306,
		5307,
		5308,
		5309,
		5310,
		5311,
		5312,
		5313,
		5314,
		5401,
		5501,
		5502,
		5601,
		5700,
		5701,
		5702,
		5703,
		5704,
		5705,
		5706,
		5707,
		5708,
		5709,
		5710,
		5711,
		5712,
		5713,
		5714,
		5715,
		5800,
		5801,
		5802,
		5803,
		5804,
		5805,
		5806,
		5807,
		5808,
		5809,
		5810,
		5811,
		5812,
		5813,
		5814,
		5815,
		5816,
		5817,
		5818,
		5819,
		5820,
		5821,
		5822,
		5901,
		5902,
		6001,
		6002,
		6101,
		6102,
		6103,
		6104,
		6105,
		6201,
		6301,
		6302,
		6303,
		6304,
		6305,
		6401,
		6501,
		6601,
		6602,
		6603,
		6701,
		6801,
		6901,
		7001,
		7002,
		7003,
		7004,
		7005,
		7006,
		7007,
		7008,
		7009,
		7010,
		7011,
		7012,
		7013,
		7101,
		7201,
		7202,
		7301,
		7401,
		7501,
		7601,
		7701,
		7702,
		7801,
		7802,
		7803,
		7804,
		7901,
		7902,
		7903,
		7904
	}
}, confHX)
pg.base = pg.base or {}
pg.base.island_interaction = {
	[101] = {
		text = "明石と話す",
		id = 101,
		only_self = 0,
		type = 1,
		groupId = 1,
		icon = 1,
		param = "island_1",
		show_condition = {}
	},
	[102] = {
		text = "離島の詳細を聞く",
		id = 102,
		only_self = 0,
		type = 2,
		groupId = 1,
		icon = 1,
		param = "island_3",
		show_condition = {}
	},
	[103] = {
		text = "明石スニーキング",
		id = 103,
		only_self = 0,
		type = 7,
		groupId = 1,
		icon = 1,
		param = "10090001",
		show_condition = {}
	},
	[201] = {
		text = "座る",
		id = 201,
		only_self = 0,
		type = 3,
		groupId = 2,
		icon = 1,
		param = "sit_1__s2",
		show_condition = {}
	},
	[301] = {
		text = "島風と話す",
		id = 301,
		only_self = 0,
		type = 0,
		groupId = 3,
		icon = 1,
		param = "island_2",
		show_condition = {}
	},
	[401] = {
		text = "家具とインタラクト",
		id = 401,
		only_self = 1,
		type = 4,
		groupId = 4,
		icon = 5,
		param = "",
		show_condition = {}
	},
	[501] = {
		text = "インタラクトを取り消す",
		id = 501,
		only_self = 1,
		type = 5,
		groupId = 5,
		icon = 5,
		param = "",
		show_condition = {}
	},
	[701] = {
		text = "繁茂農園に行く",
		id = 701,
		only_self = 0,
		type = 7,
		groupId = 7,
		icon = 5,
		param = "10050001",
		show_condition = {}
	},
	[801] = {
		text = "会話",
		id = 801,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 1,
		param = "ISLANDTALK10061",
		show_condition = {}
	},
	[803] = {
		text = "ジョン、これで十分か？",
		id = 803,
		only_self = 0,
		type = 12,
		groupId = 8,
		icon = 7,
		param = "10001030",
		show_condition = {
			{
				3,
				10001030
			}
		}
	},
	[804] = {
		text = "鉱山を管理する",
		id = 804,
		only_self = 0,
		type = 6,
		groupId = 8,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			401
		},
		show_condition = {
			{
				11,
				99011
			}
		}
	},
	[805] = {
		text = "ジョン？",
		id = 805,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 9,
		param = "ISLANDSIDE00106",
		show_condition = {
			{
				2,
				20001004
			}
		}
	},
	[806] = {
		text = "ジョン……",
		id = 806,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 9,
		param = "ISLANDSIDE00109",
		show_condition = {
			{
				2,
				20001007
			}
		}
	},
	[807] = {
		text = "ジョン——！",
		id = 807,
		only_self = 0,
		type = 12,
		groupId = 8,
		icon = 9,
		param = "20003002",
		show_condition = {
			{
				3,
				20003002
			}
		}
	},
	[808] = {
		text = "いたいた、ジョン！",
		id = 808,
		only_self = 0,
		type = 12,
		groupId = 8,
		icon = 9,
		param = "20003003",
		show_condition = {
			{
				3,
				20003003
			}
		}
	},
	[809] = {
		text = "ふう……",
		id = 809,
		only_self = 0,
		type = 12,
		groupId = 8,
		icon = 9,
		param = "20001008",
		show_condition = {
			{
				3,
				20001008
			}
		}
	},
	[814] = {
		text = "ジョン、必要なものは……",
		id = 814,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 10,
		param = "ISLANDDAILYTASK2",
		show_condition = {
			{
				12,
				30501012,
				305010122
			}
		}
	},
	[815] = {
		text = "ジョン、必要なものは……",
		id = 815,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 10,
		param = "ISLANDDAILYTASK2",
		show_condition = {
			{
				12,
				30501022,
				305010222
			}
		}
	},
	[816] = {
		text = "ジョン、必要なものは……",
		id = 816,
		only_self = 0,
		type = 1,
		groupId = 8,
		icon = 10,
		param = "ISLANDDAILYTASK2",
		show_condition = {
			{
				12,
				30000007,
				300000072
			}
		}
	},
	[901] = {
		text = "同伴要請",
		id = 901,
		only_self = 1,
		type = 23,
		groupId = 9,
		icon = 8,
		param = "",
		show_condition = {}
	},
	[1001] = {
		text = "ファストトラベル",
		id = 1001,
		only_self = 0,
		type = 7,
		groupId = 10,
		icon = 5,
		param = "10040001",
		show_condition = {}
	},
	[1101] = {
		text = "饅頭カフェに入る",
		id = 1101,
		only_self = 0,
		type = 7,
		groupId = 11,
		icon = 5,
		param = "10090001",
		show_condition = {
			{
				4,
				10001100
			}
		}
	},
	[1102] = {
		text = "饅頭カフェに入る",
		id = 1102,
		only_self = 0,
		type = 21,
		groupId = 11,
		icon = 5,
		param = "ISLANDPERFORMANCE6",
		show_condition = {
			{
				2,
				10001090
			}
		}
	},
	[1103] = {
		text = "饅頭カフェに入る",
		id = 1103,
		only_self = 0,
		type = 21,
		groupId = 11,
		icon = 5,
		param = "ISLANDPERFORMANCE6",
		show_condition = {
			{
				2,
				10001100
			}
		}
	},
	[1104] = {
		text = "基地に行く",
		id = 1104,
		only_self = 0,
		type = 7,
		groupId = 11,
		icon = 5,
		param = "10070001",
		show_condition = {
			{
				4,
				10001110
			}
		}
	},
	[1201] = {
		text = "会話",
		id = 1201,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 1,
		param = "ISLANDTALK10121",
		show_condition = {}
	},
	[1202] = {
		text = "おはよう、ブレーメン",
		id = 1202,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 7,
		param = "ISLAND1001030_1",
		show_condition = {
			{
				2,
				10002160
			}
		}
	},
	[1203] = {
		text = "ブレーメン！",
		id = 1203,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 7,
		param = "10002170",
		show_condition = {
			{
				3,
				10002170
			}
		}
	},
	[1204] = {
		text = "辛抱強く待つ",
		id = 1204,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 7,
		param = "10002200",
		show_condition = {
			{
				3,
				10002200
			}
		}
	},
	[1205] = {
		text = "商品を制作する",
		id = 1205,
		only_self = 0,
		type = 6,
		groupId = 12,
		icon = 16,
		param = {
			"IslandMallDelegationPage",
			901
		},
		show_condition = {
			{
				11,
				2016
			}
		}
	},
	[1206] = {
		text = "経営管理",
		id = 1206,
		only_self = 0,
		type = 6,
		groupId = 12,
		icon = 16,
		param = {
			"IslandRestaurantPage",
			901
		},
		show_condition = {
			{
				11,
				26
			}
		}
	},
	[1207] = {
		text = "ブレーメン！",
		id = 1207,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE00204",
		show_condition = {
			{
				2,
				20002003
			}
		}
	},
	[1208] = {
		text = "ブレーメン、大変だ",
		id = 1208,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE00302",
		show_condition = {
			{
				2,
				20003001
			}
		}
	},
	[1209] = {
		text = "ブレーメン、今いいかな？",
		id = 1209,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE00402",
		show_condition = {
			{
				2,
				20004001
			}
		}
	},
	[1210] = {
		text = "ふぅ……ブレーメン！",
		id = 1210,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20004002",
		show_condition = {
			{
				3,
				20004002
			}
		}
	},
	[1211] = {
		text = "ブレーメン……",
		id = 1211,
		only_self = 0,
		type = 11,
		groupId = 12,
		icon = 9,
		param = "20005001",
		show_condition = {
			{
				1,
				20005001
			}
		}
	},
	[1212] = {
		text = "ブレーメン、実は……",
		id = 1212,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE00708",
		show_condition = {
			{
				2,
				20007004
			}
		}
	},
	[1213] = {
		text = "ブレーメン、レシピを持ってきた——",
		id = 1213,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20007005",
		show_condition = {
			{
				3,
				20007005
			}
		}
	},
	[1214] = {
		text = "ブレーメン、戻ったよ！",
		id = 1214,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE00714",
		show_condition = {
			{
				2,
				20007009
			}
		}
	},
	[1215] = {
		text = "ブレーメン、これを見て？",
		id = 1215,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 10,
		param = "ISLANDDAILYTASK6",
		show_condition = {
			{
				12,
				30502012,
				305020123
			}
		}
	},
	[1216] = {
		text = "ブレーメン、これを見て？",
		id = 1216,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 10,
		param = "ISLANDDAILYTASK6",
		show_condition = {
			{
				12,
				30000007,
				300000073
			}
		}
	},
	[1217] = {
		text = "ブレーメン！",
		id = 1217,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE01005",
		show_condition = {
			{
				2,
				20010003
			}
		}
	},
	[1218] = {
		text = "戻ったよ",
		id = 1218,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE01007",
		show_condition = {
			{
				2,
				20010004
			}
		}
	},
	[1219] = {
		text = "ニンジンを見つけた！",
		id = 1219,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20010005",
		show_condition = {
			{
				3,
				20010005
			}
		}
	},
	[1220] = {
		text = "どうしよう……",
		id = 1220,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20010006",
		show_condition = {
			{
				3,
				20010006
			}
		}
	},
	[1221] = {
		text = "ブレーメン、聞きたいことがある",
		id = 1221,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 7,
		param = "ISLAND1001030_4",
		show_condition = {
			{
				2,
				10002190
			}
		}
	},
	[1222] = {
		text = "新鮮な卵を持ち帰った。",
		id = 1222,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20010007",
		show_condition = {
			{
				3,
				20010007
			}
		}
	},
	[1223] = {
		text = "成功した！",
		id = 1223,
		only_self = 0,
		type = 12,
		groupId = 12,
		icon = 9,
		param = "20010008",
		show_condition = {
			{
				3,
				20010008
			}
		}
	},
	[1224] = {
		text = "ブレーメン！",
		id = 1224,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE01102",
		show_condition = {
			{
				2,
				20011001
			}
		}
	},
	[1225] = {
		text = "ブレーメン、頼まれた柑橘だ！",
		id = 1225,
		only_self = 0,
		type = 1,
		groupId = 12,
		icon = 9,
		param = "ISLANDSIDE01208",
		show_condition = {
			{
				2,
				20012006
			}
		}
	},
	[1301] = {
		text = "休む",
		id = 1301,
		only_self = 1,
		type = 9,
		groupId = 13,
		icon = 1,
		param = "",
		show_condition = {}
	},
	[1401] = {
		text = "戻る",
		id = 1401,
		only_self = 1,
		type = 10,
		groupId = 14,
		icon = 1,
		param = "",
		show_condition = {}
	},
	[1501] = {
		text = "扉を開ける",
		id = 1501,
		only_self = 1,
		type = 9,
		groupId = 15,
		icon = 1,
		param = "1",
		show_condition = {}
	},
	[1601] = {
		text = "扉を閉める",
		id = 1601,
		only_self = 1,
		type = 9,
		groupId = 16,
		icon = 1,
		param = "2",
		show_condition = {}
	},
	[1701] = {
		text = "会話",
		id = 1701,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 1,
		param = "ISLANDTALK10071",
		show_condition = {}
	},
	[1702] = {
		text = "オブラインーー",
		id = 1702,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 7,
		param = "ISLAND1001003",
		show_condition = {
			{
				2,
				10001010
			}
		}
	},
	[1703] = {
		text = "オブライン……",
		id = 1703,
		only_self = 0,
		type = 12,
		groupId = 17,
		icon = 7,
		param = "10001040",
		show_condition = {
			{
				3,
				10001040
			}
		}
	},
	[1704] = {
		text = "木こりを管理する",
		id = 1704,
		only_self = 0,
		type = 6,
		groupId = 17,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			402
		},
		show_condition = {
			{
				11,
				99021
			}
		}
	},
	[1705] = {
		text = "オブライン？",
		id = 1705,
		only_self = 0,
		type = 11,
		groupId = 17,
		icon = 9,
		param = "20001001",
		show_condition = {
			{
				1,
				20001001
			}
		}
	},
	[1706] = {
		text = "オブライン……",
		id = 1706,
		only_self = 0,
		type = 12,
		groupId = 17,
		icon = 9,
		param = "20001001",
		show_condition = {
			{
				3,
				20001001
			}
		}
	},
	[1707] = {
		text = "オブライン、頼まれた木材だ！",
		id = 1707,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 9,
		param = "ISLANDSIDE00105",
		show_condition = {
			{
				2,
				20001003
			}
		}
	},
	[1708] = {
		text = "オブライン——",
		id = 1708,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 9,
		param = "ISLANDSIDE00107",
		show_condition = {
			{
				2,
				20001005
			}
		}
	},
	[1709] = {
		text = "オブライン……",
		id = 1709,
		only_self = 0,
		type = 12,
		groupId = 17,
		icon = 9,
		param = "20001006",
		show_condition = {
			{
				3,
				20001006
			}
		}
	},
	[1710] = {
		text = "オブライン！",
		id = 1710,
		only_self = 0,
		type = 12,
		groupId = 17,
		icon = 9,
		param = "20002005",
		show_condition = {
			{
				3,
				20002005
			}
		}
	},
	[1711] = {
		text = "オブライン、依頼のことだけど……",
		id = 1711,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 9,
		param = "ISLANDSIDE00903",
		show_condition = {
			{
				2,
				20009002
			}
		}
	},
	[1714] = {
		text = "はい、あなたの物資——",
		id = 1714,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 10,
		param = "ISLANDDAILYTASK1",
		show_condition = {
			{
				12,
				30501002,
				305010021
			}
		}
	},
	[1715] = {
		text = "商店街外売——",
		id = 1715,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 10,
		param = "ISLANDDAILYTASK1",
		show_condition = {
			{
				12,
				30502012,
				305020121
			}
		}
	},
	[1716] = {
		text = "商店街外売——",
		id = 1716,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 10,
		param = "ISLANDDAILYTASK1",
		show_condition = {
			{
				12,
				30502032,
				305020323
			}
		}
	},
	[1717] = {
		text = "商店街外売——",
		id = 1717,
		only_self = 0,
		type = 1,
		groupId = 17,
		icon = 10,
		param = "ISLANDDAILYTASK1",
		show_condition = {
			{
				12,
				30000007,
				300000071
			}
		}
	},
	[1718] = {
		text = "ルシタニアの剪定ばさみが壊れた",
		id = 1718,
		only_self = 0,
		type = 12,
		groupId = 17,
		icon = 9,
		param = "20012002",
		show_condition = {
			{
				3,
				20012002
			}
		}
	},
	[1801] = {
		text = "ここがバス停のようだ……",
		id = 1801,
		only_self = 0,
		type = 21,
		groupId = 18,
		icon = 7,
		param = "ISLANDPERFORMANCE3",
		show_condition = {
			{
				2,
				10001050
			}
		}
	},
	[1901] = {
		text = "会話",
		id = 1901,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 1,
		param = "ISLANDTALK10021",
		show_condition = {}
	},
	[1902] = {
		text = "忙しい埠頭だ……",
		id = 1902,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 7,
		param = "ISLAND1001011",
		show_condition = {
			{
				2,
				10001070
			}
		}
	},
	[1903] = {
		text = "パトリックはすごく忙しそうに見える",
		id = 1903,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 7,
		param = "ISLAND1001022",
		show_condition = {
			{
				2,
				10002010
			}
		}
	},
	[1904] = {
		text = "パトリック！",
		id = 1904,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 7,
		param = "ISLAND1001035",
		show_condition = {
			{
				2,
				10003010
			}
		}
	},
	[1905] = {
		text = "離島依頼",
		id = 1905,
		only_self = 0,
		type = 6,
		groupId = 19,
		icon = 15,
		param = {
			"IslandOrderPage"
		},
		show_condition = {
			{
				11,
				7
			}
		}
	},
	[1906] = {
		text = "パトリック……",
		id = 1906,
		only_self = 0,
		type = 11,
		groupId = 19,
		icon = 9,
		param = "20002001",
		show_condition = {
			{
				1,
				20002001
			}
		}
	},
	[1907] = {
		text = "パトリック……",
		id = 1907,
		only_self = 0,
		type = 12,
		groupId = 19,
		icon = 9,
		param = "20002003",
		show_condition = {
			{
				3,
				20002003
			}
		}
	},
	[1908] = {
		text = "完了！",
		id = 1908,
		only_self = 0,
		type = 12,
		groupId = 19,
		icon = 9,
		param = "20002004",
		show_condition = {
			{
				3,
				20002004
			}
		}
	},
	[1909] = {
		text = "パトリック……",
		id = 1909,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE00208",
		show_condition = {
			{
				2,
				20002006
			}
		}
	},
	[1910] = {
		text = "パトリック、何を記録してるの？",
		id = 1910,
		only_self = 0,
		type = 11,
		groupId = 19,
		icon = 9,
		param = "20008001",
		show_condition = {
			{
				1,
				20008001
			}
		}
	},
	[1911] = {
		text = "パトリック、依頼を完遂したよ！",
		id = 1911,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE00805",
		show_condition = {
			{
				2,
				20008004
			}
		}
	},
	[1912] = {
		text = "パトリックはとても忙しそうだ……",
		id = 1912,
		only_self = 0,
		type = 11,
		groupId = 19,
		icon = 9,
		param = "20010001",
		show_condition = {
			{
				1,
				20010001
			}
		}
	},
	[1923] = {
		text = "パトリック……",
		id = 1923,
		only_self = 0,
		type = 12,
		groupId = 19,
		icon = 9,
		param = "20010002",
		show_condition = {
			{
				3,
				20010002
			}
		}
	},
	[1913] = {
		text = "パトリック……",
		id = 1913,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE01013",
		show_condition = {
			{
				2,
				20010008
			}
		}
	},
	[1914] = {
		text = "パトリック——",
		id = 1914,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK15",
		show_condition = {
			{
				2,
				30501031
			}
		}
	},
	[1915] = {
		text = "パトリック——",
		id = 1915,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK15",
		show_condition = {
			{
				2,
				30501001
			}
		}
	},
	[1916] = {
		text = "パトリック——",
		id = 1916,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK15",
		show_condition = {
			{
				2,
				30501011
			}
		}
	},
	[1917] = {
		text = "パトリック——",
		id = 1917,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK15",
		show_condition = {
			{
				2,
				30501021
			}
		}
	},
	[1918] = {
		text = "商店街外売——",
		id = 1918,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK7",
		show_condition = {
			{
				2,
				30502002
			}
		}
	},
	[1919] = {
		text = "パトリック——",
		id = 1919,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 10,
		param = "ISLANDDAILYTASK15",
		show_condition = {
			{
				2,
				30000006
			}
		}
	},
	[1920] = {
		text = "注文を確認してくるよう言われた",
		id = 1920,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE01210",
		show_condition = {
			{
				2,
				20012008
			}
		}
	},
	[1921] = {
		text = "パトリック——",
		id = 1921,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE01304",
		show_condition = {
			{
				2,
				20013003
			}
		}
	},
	[1922] = {
		text = "包装して持ってきた",
		id = 1922,
		only_self = 0,
		type = 1,
		groupId = 19,
		icon = 9,
		param = "ISLANDSIDE01309",
		show_condition = {
			{
				2,
				20013008
			}
		}
	},
	[2001] = {
		text = "扉を開ける",
		id = 2001,
		only_self = 0,
		type = 0,
		groupId = 20,
		icon = 1,
		param = "",
		show_condition = {}
	},
	[2101] = {
		text = "捕まえた！",
		id = 2101,
		only_self = 0,
		type = 3,
		groupId = 21,
		icon = 7,
		param = {
			0,
			"worku_start"
		},
		show_condition = {
			{
				2,
				10001120
			}
		}
	},
	[2102] = {
		text = "手を置く",
		id = 2102,
		only_self = 0,
		type = 21,
		groupId = 211,
		icon = 7,
		param = "ISLANDPERFORMANCE_PATH_3",
		show_condition = {
			{
				2,
				10001130
			}
		}
	},
	[2103] = {
		text = "これがその……？",
		id = 2103,
		only_self = 0,
		type = 12,
		groupId = 21,
		icon = 7,
		param = "10001141",
		show_condition = {
			{
				3,
				10001141
			}
		}
	},
	[2104] = {
		text = "明石……",
		id = 2104,
		only_self = 0,
		type = 1,
		groupId = 21,
		icon = 7,
		param = "ISLAND1001044",
		show_condition = {
			{
				2,
				10004010
			}
		}
	},
	[2105] = {
		text = "明石",
		id = 2105,
		only_self = 0,
		type = 12,
		groupId = 21,
		icon = 7,
		param = "10004020",
		show_condition = {
			{
				3,
				10004020
			}
		}
	},
	[2201] = {
		text = "これで大丈夫？",
		id = 2201,
		only_self = 0,
		type = 21,
		groupId = 22,
		icon = 7,
		param = "ISLANDPERFORMANCE4",
		show_condition = {
			{
				2,
				10001060
			}
		}
	},
	[2202] = {
		text = "ここがバス停のようだ……",
		id = 2202,
		only_self = 0,
		type = 21,
		groupId = 22,
		icon = 7,
		param = "ISLANDPERFORMANCE3",
		show_condition = {
			{
				2,
				10001050
			}
		}
	},
	[2301] = {
		text = "会話",
		id = 2301,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 1,
		param = "ISLANDTALK10031",
		show_condition = {}
	},
	[2302] = {
		text = "ステファン！",
		id = 2302,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 7,
		param = "ISLAND1001023",
		show_condition = {
			{
				2,
				10002040
			}
		}
	},
	[2303] = {
		text = "ステファン、大丈夫か？",
		id = 2303,
		only_self = 0,
		type = 12,
		groupId = 23,
		icon = 7,
		param = "10002050",
		show_condition = {
			{
				3,
				10002050
			}
		}
	},
	[2304] = {
		text = "輸送委託",
		id = 2304,
		only_self = 0,
		type = 6,
		groupId = 23,
		icon = 15,
		param = {
			"IslandShipOrderPage"
		},
		show_condition = {
			{
				11,
				32
			}
		}
	},
	[2305] = {
		text = "ステファン——",
		id = 2305,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 9,
		param = "ISLANDSIDE00203",
		show_condition = {
			{
				2,
				20002002
			}
		}
	},
	[2306] = {
		text = "ステファン、聞いたところによると……",
		id = 2306,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 9,
		param = "ISLANDSIDE00802",
		show_condition = {
			{
				2,
				20008001
			}
		}
	},
	[2307] = {
		text = "ステファン、木材を持ってきた！",
		id = 2307,
		only_self = 0,
		type = 12,
		groupId = 23,
		icon = 9,
		param = "20008002",
		show_condition = {
			{
				3,
				20008002
			}
		}
	},
	[2308] = {
		text = "ステファン、石炭を持ってきた！",
		id = 2308,
		only_self = 0,
		type = 12,
		groupId = 23,
		icon = 9,
		param = "20008003",
		show_condition = {
			{
				3,
				20008003
			}
		}
	},
	[2309] = {
		text = "ステファン、探してたって？",
		id = 2309,
		only_self = 0,
		type = 11,
		groupId = 23,
		icon = 9,
		param = "20009001",
		show_condition = {
			{
				1,
				20009001
			}
		}
	},
	[2310] = {
		text = "ステファン、依頼が完了した",
		id = 2310,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 9,
		param = "ISLANDSIDE00905",
		show_condition = {
			{
				2,
				20009004
			}
		}
	},
	[2311] = {
		text = "ステファン……",
		id = 2311,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 9,
		param = "ISLANDSIDE01003",
		show_condition = {
			{
				2,
				20010002
			}
		}
	},
	[2312] = {
		text = "肥料について……",
		id = 2312,
		only_self = 0,
		type = 1,
		groupId = 23,
		icon = 9,
		param = "ISLANDSIDE01302",
		show_condition = {
			{
				2,
				20013001
			}
		}
	},
	[2313] = {
		text = "何を持ってきたと思う？",
		id = 2313,
		only_self = 0,
		type = 12,
		groupId = 23,
		icon = 7,
		param = "10002180",
		show_condition = {
			{
				3,
				10002180
			}
		}
	},
	[2401] = {
		text = "集会島に行く",
		id = 2401,
		only_self = 0,
		type = 7,
		groupId = 24,
		icon = 5,
		param = "10030001",
		show_condition = {
			{
				4,
				10002270
			}
		}
	},
	[2402] = {
		text = "集会島に行く",
		id = 2402,
		only_self = 0,
		type = 21,
		groupId = 24,
		icon = 5,
		param = "ISLANDPERFORMANCE11",
		show_condition = {
			{
				2,
				10002270
			}
		}
	},
	[2501] = {
		text = "会話",
		id = 2501,
		only_self = 0,
		type = 1,
		groupId = 25,
		icon = 1,
		param = "ISLANDTALK10131",
		show_condition = {
			{
				4,
				10002280
			}
		}
	},
	[2502] = {
		text = "メリー……なぜここに……",
		id = 2502,
		only_self = 0,
		type = 21,
		groupId = 25,
		icon = 7,
		param = "ISLANDPERFORMANCE10",
		show_condition = {
			{
				2,
				10002271
			}
		}
	},
	[2503] = {
		text = "これが宝なのか？",
		id = 2503,
		only_self = 0,
		type = 12,
		groupId = 25,
		icon = 7,
		param = "10002280",
		show_condition = {
			{
				3,
				10002280
			}
		}
	},
	[2504] = {
		text = "――メリー、手に入れたよ",
		id = 2504,
		only_self = 0,
		type = 12,
		groupId = 25,
		icon = 7,
		param = "10002290",
		show_condition = {
			{
				3,
				10002290
			}
		}
	},
	[2601] = {
		text = "港に行く",
		id = 2601,
		only_self = 0,
		type = 21,
		groupId = 26,
		icon = 5,
		param = "",
		show_condition = {
			{
				2,
				10010007
			}
		}
	},
	[2602] = {
		text = "港に行く",
		id = 2602,
		only_self = 0,
		type = 24,
		groupId = 26,
		icon = 5,
		param = "10020021",
		show_condition = {
			{
				11,
				5002
			}
		}
	},
	[2603] = {
		text = "飛行装置に乗る",
		id = 2603,
		only_self = 0,
		type = 1,
		groupId = 26,
		icon = 5,
		param = "ISLAND1001034_5",
		show_condition = {
			{
				2,
				10002360
			}
		}
	},
	[2701] = {
		text = "会話",
		id = 2701,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 1,
		param = "ISLANDTALK10101",
		show_condition = {}
	},
	[2702] = {
		text = "エリザベス——",
		id = 2702,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 7,
		param = "ISLAND1001033",
		show_condition = {
			{
				2,
				10002300
			}
		}
	},
	[2703] = {
		text = "エリザベス——",
		id = 2703,
		only_self = 0,
		type = 12,
		groupId = 27,
		icon = 7,
		param = "10002320",
		show_condition = {
			{
				3,
				10002320
			}
		}
	},
	[2704] = {
		text = "集会島の模様変え",
		id = 2704,
		only_self = 0,
		type = 18,
		groupId = 27,
		icon = 4,
		param = "",
		show_condition = {
			{
				4,
				10002300
			}
		}
	},
	[2705] = {
		text = "集会島の拡張",
		id = 2705,
		only_self = 0,
		type = 19,
		groupId = 9999,
		icon = 2,
		param = "",
		show_condition = {}
	},
	[2706] = {
		text = "離島テーマを変更",
		id = 2706,
		only_self = 0,
		type = 20,
		groupId = 9999,
		icon = 3,
		param = "",
		show_condition = {}
	},
	[2707] = {
		text = "はい、あなたの物資——",
		id = 2707,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30501002,
				305010023
			}
		}
	},
	[2708] = {
		text = "はい、あなたの物資——",
		id = 2708,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30501032,
				305010323
			}
		}
	},
	[2709] = {
		text = "商店街外売——",
		id = 2709,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30502002,
				305020023
			}
		}
	},
	[2710] = {
		text = "商店街外売——",
		id = 2710,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30502012,
				305020122
			}
		}
	},
	[2711] = {
		text = "商店街外売——",
		id = 2711,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30502022,
				305020222
			}
		}
	},
	[2712] = {
		text = "商店街外売——",
		id = 2712,
		only_self = 0,
		type = 1,
		groupId = 27,
		icon = 10,
		param = "ISLANDDAILYTASK9",
		show_condition = {
			{
				12,
				30502032,
				305020321
			}
		}
	},
	[2713] = {
		text = "――これで大丈夫なのか？",
		id = 2713,
		only_self = 0,
		type = 12,
		groupId = 27,
		icon = 7,
		param = "10002310",
		show_condition = {
			{
				3,
				10002310
			}
		}
	},
	[2714] = {
		text = "エリザベス！",
		id = 2714,
		only_self = 0,
		type = 12,
		groupId = 27,
		icon = 7,
		param = "10002330",
		show_condition = {
			{
				3,
				10002330
			}
		}
	},
	[2715] = {
		text = "エリザベス——",
		id = 2715,
		only_self = 0,
		type = 12,
		groupId = 27,
		icon = 7,
		param = "10002340",
		show_condition = {
			{
				3,
				10002340
			}
		}
	},
	[2801] = {
		text = "会話",
		id = 2801,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 1,
		param = "ISLANDTALK10011",
		show_condition = {}
	},
	[2802] = {
		text = "製粉所の様子を見る",
		id = 2802,
		only_self = 0,
		type = 6,
		groupId = 28,
		icon = 15,
		param = {
			"IslandShopPage",
			{
				1,
				2,
				3,
				4,
				5
			},
			{
				10019
			}
		},
		show_condition = {
			{
				4,
				10002110
			}
		}
	},
	[2803] = {
		text = "オリンピック、早く起きて！",
		id = 2803,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 7,
		param = "ISLAND1001028_1",
		show_condition = {
			{
				2,
				10002110
			}
		}
	},
	[2804] = {
		text = "オリンピック、起きて",
		id = 2804,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 10,
		param = "ISLANDDAILYTASK11",
		show_condition = {
			{
				12,
				30501012,
				305010123
			}
		}
	},
	[2805] = {
		text = "オリンピック……",
		id = 2805,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 9,
		param = "ISLANDSIDE01002",
		show_condition = {
			{
				2,
				20010001
			}
		}
	},
	[2806] = {
		text = "精神を集中させる必要がある人……",
		id = 2806,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 9,
		param = "ISLANDSIDE01010",
		show_condition = {
			{
				2,
				20010006
			}
		}
	},
	[2807] = {
		text = "オリンピック、早く起きて。",
		id = 2807,
		only_self = 0,
		type = 1,
		groupId = 28,
		icon = 9,
		param = "ISLANDSIDE00508",
		show_condition = {
			{
				2,
				20005006
			}
		}
	},
	[2901] = {
		text = "会話",
		id = 2901,
		only_self = 0,
		type = 1,
		groupId = 29,
		icon = 1,
		param = "ISLANDTALK10051",
		show_condition = {}
	},
	[2902] = {
		text = "アメリゴ？",
		id = 2902,
		only_self = 0,
		type = 1,
		groupId = 29,
		icon = 7,
		param = "ISLAND1001027",
		show_condition = {
			{
				2,
				10002090
			}
		}
	},
	[2903] = {
		text = "アメリゴ！",
		id = 2903,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 7,
		param = "10002100",
		show_condition = {
			{
				3,
				10002100
			}
		}
	},
	[2904] = {
		text = "アメリゴ、戻ったよ",
		id = 2904,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 7,
		param = "10002120",
		show_condition = {
			{
				3,
				10002120
			}
		}
	},
	[2905] = {
		text = "牧場を管理する",
		id = 2905,
		only_self = 0,
		type = 6,
		groupId = 29,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			102
		},
		show_condition = {
			{
				11,
				2002
			}
		}
	},
	[2906] = {
		text = "アメリゴ、あの……",
		id = 2906,
		only_self = 0,
		type = 1,
		groupId = 29,
		icon = 10,
		param = "ISLANDDAILYTASK5",
		show_condition = {
			{
				12,
				30501002,
				305010022
			}
		}
	},
	[2907] = {
		text = "アメリゴ……",
		id = 2907,
		only_self = 0,
		type = 1,
		groupId = 29,
		icon = 9,
		param = "ISLANDSIDE00505",
		show_condition = {
			{
				2,
				20005004
			}
		}
	},
	[2908] = {
		text = "アメリゴ、調査が終わった。",
		id = 2908,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 9,
		param = "20005005",
		show_condition = {
			{
				3,
				20005005
			}
		}
	},
	[2909] = {
		text = "アメリゴ、何が起きたの？",
		id = 2909,
		only_self = 0,
		type = 11,
		groupId = 29,
		icon = 9,
		param = "20006001",
		show_condition = {
			{
				1,
				20006001
			}
		}
	},
	[2910] = {
		text = "これは……卵？",
		id = 2910,
		only_self = 0,
		type = 21,
		groupId = 29,
		icon = 7,
		param = "ISLANDPERFORMANCE_PATH_7",
		show_condition = {
			{
				2,
				10002131
			}
		}
	},
	[2911] = {
		text = "アメリゴ——",
		id = 2911,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 9,
		param = "20006004",
		show_condition = {
			{
				3,
				20006004
			}
		}
	},
	[2912] = {
		text = "アメリゴ！",
		id = 2912,
		only_self = 0,
		type = 1,
		groupId = 29,
		icon = 9,
		param = "ISLANDSIDE00610",
		show_condition = {
			{
				2,
				20006008
			}
		}
	},
	[2913] = {
		text = "柵を修繕",
		id = 2913,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 9,
		param = "20006009",
		show_condition = {
			{
				3,
				20006009
			}
		}
	},
	[2914] = {
		text = "アメリゴ……",
		id = 2914,
		only_self = 0,
		type = 12,
		groupId = 29,
		icon = 9,
		param = "20010003",
		show_condition = {
			{
				3,
				20010003
			}
		}
	},
	[3001] = {
		text = "会話",
		id = 3001,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 1,
		param = "ISLANDTALK10041",
		show_condition = {}
	},
	[3003] = {
		text = "種を蒔いてきたよ",
		id = 3003,
		only_self = 0,
		type = 12,
		groupId = 30,
		icon = 7,
		param = "10002081",
		show_condition = {
			{
				3,
				10002081
			}
		}
	},
	[3004] = {
		text = "アメリゴ……走るのが速すぎるよ",
		id = 3004,
		only_self = 0,
		type = 21,
		groupId = 30,
		icon = 7,
		param = "ISLANDPERFORMANCE_PATH_8",
		show_condition = {
			{
				2,
				10002140
			}
		}
	},
	[3005] = {
		text = "畑管理",
		id = 3005,
		only_self = 0,
		type = 6,
		groupId = 30,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			101
		},
		show_condition = {
			{
				11,
				99001
			}
		}
	},
	[3006] = {
		text = "ホメリック――",
		id = 3006,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 10,
		param = "ISLANDDAILYTASK4",
		show_condition = {
			{
				12,
				30502022,
				305020221
			}
		}
	},
	[3007] = {
		text = "やあ、ホメリック！",
		id = 3007,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 9,
		param = "ISLANDSIDE00502",
		show_condition = {
			{
				2,
				20005001
			}
		}
	},
	[3008] = {
		text = "ホメリック、聞いて……",
		id = 3008,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 9,
		param = "ISLANDSIDE00504",
		show_condition = {
			{
				2,
				20005003
			}
		}
	},
	[3009] = {
		text = "ホメリック、ちょっと",
		id = 3009,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 9,
		param = "ISLANDSIDE00607",
		show_condition = {
			{
				2,
				20006005
			}
		}
	},
	[3010] = {
		text = "ニンジン……",
		id = 3010,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 9,
		param = "ISLANDSIDE01008",
		show_condition = {
			{
				2,
				20010005
			}
		}
	},
	[3011] = {
		text = "ホメリック！",
		id = 3011,
		only_self = 0,
		type = 1,
		groupId = 30,
		icon = 9,
		param = "ISLANDSIDE01202",
		show_condition = {
			{
				2,
				20012001
			}
		}
	},
	[3012] = {
		text = "種ショップを確認する",
		id = 3012,
		only_self = 0,
		type = 6,
		groupId = 30,
		icon = 15,
		param = {
			"IslandShopPage",
			{
				1,
				2,
				3,
				4,
				5
			},
			{
				10022
			}
		},
		show_condition = {
			{
				4,
				10002070
			}
		}
	},
	[3101] = {
		text = "繁茂農園に行く",
		id = 3101,
		only_self = 0,
		type = 7,
		groupId = 31,
		icon = 5,
		param = "10050001",
		show_condition = {
			{
				11,
				5005
			}
		}
	},
	[3201] = {
		text = "港に行く",
		id = 3201,
		only_self = 0,
		type = 24,
		groupId = 32,
		icon = 5,
		param = "10020001",
		show_condition = {
			{
				11,
				5002
			}
		}
	},
	[3202] = {
		text = "風の原野に行く",
		id = 3202,
		only_self = 0,
		type = 24,
		groupId = 32,
		icon = 5,
		param = "10040024",
		show_condition = {
			{
				11,
				5004
			}
		}
	},
	[3203] = {
		text = "繁茂農園に行く",
		id = 3203,
		only_self = 0,
		type = 24,
		groupId = 32,
		icon = 5,
		param = "10050001",
		show_condition = {
			{
				11,
				5005
			}
		}
	},
	[3301] = {
		text = "離島権限を認証する",
		id = 3301,
		only_self = 0,
		type = 6,
		groupId = 33,
		icon = 18,
		param = {
			"IslandInvitePage"
		},
		show_condition = {
			{
				4,
				10001150
			}
		}
	},
	[3401] = {
		text = "技術研究",
		id = 3401,
		only_self = 0,
		type = 6,
		groupId = 34,
		icon = 11,
		param = {
			"IslandTechnologyPage"
		},
		show_condition = {
			{
				4,
				10001140
			}
		}
	},
	[3402] = {
		text = "あれ、止まった？",
		id = 3402,
		only_self = 0,
		type = 11,
		groupId = 34,
		icon = 9,
		param = "20003001",
		show_condition = {
			{
				1,
				20003001
			}
		}
	},
	[3501] = {
		text = "饅頭カフェに行く",
		id = 3501,
		only_self = 0,
		type = 7,
		groupId = 35,
		icon = 5,
		param = "10090012",
		show_condition = {}
	},
	[3601] = {
		text = "観察",
		id = 3601,
		only_self = 0,
		type = 21,
		groupId = 36,
		icon = 7,
		param = "ISLANDPERFORMANCE8",
		show_condition = {
			{
				2,
				10001110
			}
		}
	},
	[3602] = {
		text = "基地に行く",
		id = 3602,
		only_self = 0,
		type = 7,
		groupId = 36,
		icon = 5,
		param = "10070001",
		show_condition = {
			{
				4,
				10001110
			}
		}
	},
	[3701] = {
		text = "港に行く",
		id = 3701,
		only_self = 0,
		type = 24,
		groupId = 37,
		icon = 5,
		param = "10020011",
		show_condition = {}
	},
	[3801] = {
		text = "港に行く",
		id = 3801,
		only_self = 0,
		type = 24,
		groupId = 38,
		icon = 5,
		param = "10020001",
		show_condition = {
			{
				4,
				10001060
			}
		}
	},
	[3802] = {
		text = "朝露農場へ向かう",
		id = 3802,
		only_self = 0,
		type = 24,
		groupId = 38,
		icon = 5,
		param = "10010064",
		show_condition = {
			{
				11,
				5001
			}
		}
	},
	[3803] = {
		text = "繁茂農園に行く",
		id = 3803,
		only_self = 0,
		type = 24,
		groupId = 38,
		icon = 5,
		param = "10050001",
		show_condition = {
			{
				11,
				5005
			}
		}
	},
	[3902] = {
		text = "明石、注文したオムレツだ",
		id = 3902,
		only_self = 0,
		type = 1,
		groupId = 39,
		icon = 7,
		param = "ISLAND1001031_1",
		show_condition = {
			{
				2,
				10002210
			}
		}
	},
	[3903] = {
		text = "明石、呼んだ？",
		id = 3903,
		only_self = 0,
		type = 1,
		groupId = 39,
		icon = 7,
		param = "ISLAND1001031_2",
		show_condition = {
			{
				2,
				10002220
			}
		}
	},
	[3904] = {
		text = "明石——",
		id = 3904,
		only_self = 0,
		type = 1,
		groupId = 39,
		icon = 7,
		param = "ISLAND1001031_6",
		show_condition = {
			{
				2,
				10002251
			}
		}
	},
	[3905] = {
		text = "明石!",
		id = 3905,
		only_self = 0,
		type = 12,
		groupId = 39,
		icon = 9,
		param = "10019999",
		show_condition = {
			{
				3,
				10019999
			}
		}
	},
	[4001] = {
		text = "定期補給",
		id = 4001,
		only_self = 0,
		type = 13,
		groupId = 40,
		icon = 6,
		param = "",
		show_condition = {
			{
				5,
				0
			},
			{
				4,
				10002280
			}
		}
	},
	[4002] = {
		text = "次の補給まで",
		id = 4002,
		only_self = 0,
		type = 15,
		groupId = 40,
		icon = 6,
		param = "",
		show_condition = {
			{
				8,
				0
			}
		}
	},
	[4101] = {
		text = "補給を受け取る",
		id = 4101,
		only_self = 1,
		type = 14,
		groupId = 41,
		icon = 6,
		param = "",
		show_condition = {
			{
				6,
				0
			}
		}
	},
	[4102] = {
		text = "余剰補給をシェア",
		id = 4102,
		only_self = 0,
		type = 6,
		groupId = 41,
		icon = 6,
		param = {
			"IslandSignInInvitationPage"
		},
		show_condition = {
			{
				7,
				0
			},
			{
				11,
				27
			}
		}
	},
	[4201] = {
		text = "捕まえた",
		id = 4201,
		only_self = 0,
		type = 1,
		groupId = 42,
		icon = 7,
		param = "ISLAND1001027_1",
		show_condition = {
			{
				2,
				10002100
			}
		}
	},
	[4301] = {
		text = "風の原野に行く",
		id = 4301,
		only_self = 0,
		type = 24,
		groupId = 43,
		icon = 5,
		param = "10040024",
		show_condition = {
			{
				11,
				5004
			}
		}
	},
	[4302] = {
		text = "朝露農場へ向かう",
		id = 4302,
		only_self = 0,
		type = 24,
		groupId = 43,
		icon = 5,
		param = "10010064",
		show_condition = {
			{
				11,
				5001
			}
		}
	},
	[4303] = {
		text = "港商店街へ向かう",
		id = 4303,
		only_self = 0,
		type = 24,
		groupId = 43,
		icon = 5,
		param = "10060001",
		show_condition = {
			{
				11,
				5006
			}
		}
	},
	[4401] = {
		text = "離島開発エリアへようこそ！",
		id = 4401,
		only_self = 0,
		type = 1,
		groupId = 44,
		icon = 7,
		param = "ISLAND1001021",
		show_condition = {
			{
				2,
				10001160
			}
		}
	},
	[4501] = {
		text = "会話",
		id = 4501,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 1,
		param = "ISLANDTALK10081",
		show_condition = {}
	},
	[4502] = {
		text = "アムマーマー……",
		id = 4502,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 7,
		param = "ISLAND1001036",
		show_condition = {
			{
				2,
				10003020
			}
		}
	},
	[4503] = {
		text = "アムマーマー——",
		id = 4503,
		only_self = 0,
		type = 12,
		groupId = 45,
		icon = 7,
		param = "10003030",
		show_condition = {
			{
				3,
				10003030
			}
		}
	},
	[4504] = {
		text = "アムマーマー、見て！",
		id = 4504,
		only_self = 0,
		type = 12,
		groupId = 45,
		icon = 7,
		param = "10003040",
		show_condition = {
			{
				3,
				10003040
			}
		}
	},
	[4506] = {
		text = "商店街管理",
		id = 4506,
		only_self = 0,
		type = 22,
		groupId = 45,
		icon = 16,
		param = "46",
		show_condition = {
			{
				11,
				2008
			}
		}
	},
	[4507] = {
		text = "経営管理",
		id = 4507,
		only_self = 0,
		type = 22,
		groupId = 45,
		icon = 16,
		param = "63",
		show_condition = {
			{
				11,
				17003
			}
		}
	},
	[4508] = {
		text = "アムマーマー、何か考えごと？",
		id = 4508,
		only_self = 0,
		type = 11,
		groupId = 45,
		icon = 9,
		param = "20004001",
		show_condition = {
			{
				1,
				20004001
			}
		}
	},
	[4509] = {
		text = "はい、あなたの物資——",
		id = 4509,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK10",
		show_condition = {
			{
				12,
				30501022,
				305010221
			}
		}
	},
	[4510] = {
		text = "はい、あなたの物資——",
		id = 4510,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK10",
		show_condition = {
			{
				12,
				30501032,
				305010321
			}
		}
	},
	[4511] = {
		text = "アムマーマー——",
		id = 4511,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK16",
		show_condition = {
			{
				2,
				30502001
			}
		}
	},
	[4512] = {
		text = "アムマーマー——",
		id = 4512,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK16",
		show_condition = {
			{
				2,
				30502011
			}
		}
	},
	[4513] = {
		text = "アムマーマー——",
		id = 4513,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK16",
		show_condition = {
			{
				2,
				30502021
			}
		}
	},
	[4514] = {
		text = "アムマーマー——",
		id = 4514,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 10,
		param = "ISLANDDAILYTASK16",
		show_condition = {
			{
				2,
				30502031
			}
		}
	},
	[4515] = {
		text = "アムマーマー……",
		id = 4515,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 9,
		param = "ISLANDSIDE00404",
		show_condition = {
			{
				2,
				20004003
			}
		}
	},
	[4516] = {
		text = "アムマーマー——",
		id = 4516,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 9,
		param = "ISLANDSIDE00712",
		show_condition = {
			{
				2,
				20007007
			}
		}
	},
	[4517] = {
		text = "アムマーマー、何か考えごと？",
		id = 4517,
		only_self = 0,
		type = 11,
		groupId = 45,
		icon = 9,
		param = "20011001",
		show_condition = {
			{
				1,
				20011001
			}
		}
	},
	[4518] = {
		text = "アムマーマー！",
		id = 4518,
		only_self = 0,
		type = 1,
		groupId = 45,
		icon = 9,
		param = "ISLANDSIDE01104",
		show_condition = {
			{
				2,
				20011003
			}
		}
	},
	[4519] = {
		text = "アムマーマー！",
		id = 4519,
		only_self = 0,
		type = 12,
		groupId = 45,
		icon = 9,
		param = "20011004",
		show_condition = {
			{
				3,
				20011004
			}
		}
	},
	[4520] = {
		text = "アムマーマー、見て！",
		id = 4520,
		only_self = 0,
		type = 12,
		groupId = 45,
		icon = 9,
		param = "20011005",
		show_condition = {
			{
				3,
				20011005
			}
		}
	},
	[4601] = {
		text = "有魚飯店",
		id = 4601,
		only_self = 0,
		type = 6,
		groupId = 46,
		icon = 16,
		param = {
			"IslandMallDelegationPage",
			601
		},
		show_condition = {
			{
				11,
				2008
			}
		}
	},
	[4602] = {
		text = "白クマ茶房",
		id = 4602,
		only_self = 0,
		type = 6,
		groupId = 46,
		icon = 16,
		param = {
			"IslandMallDelegationPage",
			602
		},
		show_condition = {
			{
				11,
				2009
			}
		}
	},
	[4603] = {
		text = "饅頭軽食",
		id = 4603,
		only_self = 0,
		type = 6,
		groupId = 46,
		icon = 16,
		param = {
			"IslandMallDelegationPage",
			603
		},
		show_condition = {
			{
				11,
				2010
			}
		}
	},
	[4604] = {
		text = "烏魚焼肉",
		id = 4604,
		only_self = 0,
		type = 6,
		groupId = 46,
		icon = 16,
		param = {
			"IslandMallDelegationPage",
			604
		},
		show_condition = {
			{
				11,
				2011
			}
		}
	},
	[4605] = {
		text = "戻る",
		id = 4605,
		only_self = 0,
		type = 22,
		groupId = 46,
		icon = 17,
		param = "45",
		show_condition = {}
	},
	[4701] = {
		text = "明石——",
		id = 4701,
		only_self = 0,
		type = 12,
		groupId = 47,
		icon = 7,
		param = "10001170",
		show_condition = {
			{
				3,
				10001170
			}
		}
	},
	[4702] = {
		text = "これは……飛行装置？",
		id = 4702,
		only_self = 0,
		type = 1,
		groupId = 47,
		icon = 7,
		param = "ISLAND1001031_7",
		show_condition = {
			{
				2,
				10002260
			}
		}
	},
	[4801] = {
		text = "木材の山を調べる",
		id = 4801,
		only_self = 0,
		type = 1,
		groupId = 48,
		icon = 9,
		param = "ISLANDSIDE00102",
		show_condition = {
			{
				2,
				20001001
			}
		}
	},
	[4901] = {
		text = "ジョンが注文した部品を探す",
		id = 4901,
		only_self = 0,
		type = 3,
		groupId = 49,
		icon = 9,
		param = {
			0,
			"worku_start"
		},
		show_condition = {
			{
				2,
				20003003
			}
		}
	},
	[5001] = {
		text = "サーバーを再起動",
		id = 5001,
		only_self = 0,
		type = 1,
		groupId = 50,
		icon = 9,
		param = "ISLANDSIDE00305",
		show_condition = {
			{
				2,
				20003004
			}
		}
	},
	[5101] = {
		text = "資金残高を確認",
		id = 5101,
		only_self = 0,
		type = 12,
		groupId = 51,
		icon = 9,
		param = "20014003",
		show_condition = {
			{
				3,
				20014003
			}
		}
	},
	[5201] = {
		text = "掘り始める",
		id = 5201,
		only_self = 0,
		type = 1,
		groupId = 52,
		icon = 9,
		param = "ISLANDSIDE01403",
		show_condition = {
			{
				2,
				20014003
			}
		}
	},
	[5300] = {
		text = "会話",
		id = 5300,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 1,
		param = "ISLANDTALK10111",
		show_condition = {}
	},
	[5301] = {
		text = "果樹園を管理",
		id = 5301,
		only_self = 0,
		type = 6,
		groupId = 53,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			501
		},
		show_condition = {
			{
				11,
				99101
			}
		}
	},
	[5302] = {
		text = "はい、あなたの物資——",
		id = 5302,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 10,
		param = "ISLANDDAILYTASK12",
		show_condition = {
			{
				12,
				30501022,
				305010223
			}
		}
	},
	[5303] = {
		text = "商店街外売——",
		id = 5303,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 10,
		param = "ISLANDDAILYTASK12",
		show_condition = {
			{
				12,
				30502022,
				305020223
			}
		}
	},
	[5304] = {
		text = "商店街外売——",
		id = 5304,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 10,
		param = "ISLANDDAILYTASK12",
		show_condition = {
			{
				12,
				30502032,
				305020322
			}
		}
	},
	[5305] = {
		text = "これでりんごが収穫できるね",
		id = 5305,
		only_self = 0,
		type = 12,
		groupId = 53,
		icon = 7,
		param = "10003080",
		show_condition = {
			{
				3,
				10003080
			}
		}
	},
	[5306] = {
		text = "ルシタニア、剪定ばさみを持ってきた",
		id = 5306,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 9,
		param = "ISLANDSIDE01203",
		show_condition = {
			{
				2,
				20012002
			}
		}
	},
	[5307] = {
		text = "長い間農具を交換していないと聞いたが",
		id = 5307,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 9,
		param = "ISLANDSIDE01205",
		show_condition = {
			{
				2,
				20012003
			}
		}
	},
	[5308] = {
		text = "ルシタニア、肥料をまき終わったよ",
		id = 5308,
		only_self = 0,
		type = 12,
		groupId = 53,
		icon = 9,
		param = "20012004",
		show_condition = {
			{
				3,
				20012004
			}
		}
	},
	[5309] = {
		text = "柑橘を摘んで帰ってきた",
		id = 5309,
		only_self = 0,
		type = 12,
		groupId = 53,
		icon = 9,
		param = "20012005",
		show_condition = {
			{
				3,
				20012005
			}
		}
	},
	[5310] = {
		text = "ブレーメンからのシトラスコーヒーだ",
		id = 5310,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 9,
		param = "ISLANDSIDE01209",
		show_condition = {
			{
				2,
				20012007
			}
		}
	},
	[5311] = {
		text = "防虫剤が届いた。ルシタニア",
		id = 5311,
		only_self = 0,
		type = 1,
		groupId = 53,
		icon = 9,
		param = "ISLANDSIDE01211",
		show_condition = {
			{
				2,
				20012009
			}
		}
	},
	[5312] = {
		text = "ルシタニア……",
		id = 5312,
		only_self = 0,
		type = 12,
		groupId = 53,
		icon = 9,
		param = "20012010",
		show_condition = {
			{
				3,
				20012010
			}
		}
	},
	[5313] = {
		text = "何が起きた？",
		id = 5313,
		only_self = 0,
		type = 11,
		groupId = 53,
		icon = 9,
		param = "20012001",
		show_condition = {
			{
				1,
				20012001
			}
		}
	},
	[5314] = {
		text = "種ショップを確認する",
		id = 5314,
		only_self = 0,
		type = 6,
		groupId = 53,
		icon = 15,
		param = {
			"IslandShopPage",
			{
				1,
				2,
				3,
				4,
				5
			},
			{
				10025
			}
		},
		show_condition = {
			{
				11,
				404
			}
		}
	},
	[5401] = {
		text = "ラッセル？",
		id = 5401,
		only_self = 0,
		type = 1,
		groupId = 54,
		icon = 7,
		param = "ISLAND1001034_4",
		show_condition = {
			{
				2,
				10002350
			}
		}
	},
	[5501] = {
		text = "オブラインーー",
		id = 5501,
		only_self = 0,
		type = 1,
		groupId = 55,
		icon = 7,
		param = "ISLAND1001003",
		show_condition = {
			{
				2,
				10001010
			}
		}
	},
	[5502] = {
		text = "オブライン……",
		id = 5502,
		only_self = 0,
		type = 12,
		groupId = 55,
		icon = 7,
		param = "10001040",
		show_condition = {
			{
				3,
				10001040
			}
		}
	},
	[5601] = {
		text = "ホメリック？",
		id = 5601,
		only_self = 0,
		type = 21,
		groupId = 56,
		icon = 7,
		param = "ISLANDPERFORMANCE_PATH_6",
		show_condition = {
			{
				2,
				10002070
			}
		}
	},
	[5700] = {
		text = "会話",
		id = 5700,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 1,
		param = "ISLANDTALK10141",
		show_condition = {}
	},
	[5701] = {
		text = "ルシタニア？",
		id = 5701,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 7,
		param = "ISLAND1001037",
		show_condition = {
			{
				2,
				10003051
			}
		}
	},
	[5702] = {
		text = "苗場を管理する",
		id = 5702,
		only_self = 0,
		type = 6,
		groupId = 57,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			502
		},
		show_condition = {
			{
				11,
				99111
			}
		}
	},
	[5703] = {
		text = "はい、あなたの物資——",
		id = 5703,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 10,
		param = "ISLANDDAILYTASK13",
		show_condition = {
			{
				12,
				30501012,
				305010121
			}
		}
	},
	[5704] = {
		text = "はい、あなたの物資——",
		id = 5704,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 10,
		param = "ISLANDDAILYTASK13",
		show_condition = {
			{
				12,
				30501032,
				305010322
			}
		}
	},
	[5705] = {
		text = "商店街外売——",
		id = 5705,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 10,
		param = "ISLANDDAILYTASK13",
		show_condition = {
			{
				12,
				30502002,
				305020021
			}
		}
	},
	[5706] = {
		text = "ラコニア？",
		id = 5706,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 7,
		param = "10003060",
		show_condition = {
			{
				3,
				10003060
			}
		}
	},
	[5707] = {
		text = "ラコニア――",
		id = 5707,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 7,
		param = "10003070",
		show_condition = {
			{
				3,
				10003070
			}
		}
	},
	[5708] = {
		text = "ラコニア",
		id = 5708,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 7,
		param = "10003091",
		show_condition = {
			{
				3,
				10003091
			}
		}
	},
	[5709] = {
		text = "ラコニア――",
		id = 5709,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 7,
		param = "10003100",
		show_condition = {
			{
				3,
				10003100
			}
		}
	},
	[5710] = {
		text = "何が起きた？",
		id = 5710,
		only_self = 0,
		type = 11,
		groupId = 57,
		icon = 9,
		param = "20013001",
		show_condition = {
			{
				1,
				20013001
			}
		}
	},
	[5711] = {
		text = "ラコニア……",
		id = 5711,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 9,
		param = "ISLANDSIDE01303",
		show_condition = {
			{
				2,
				20013002
			}
		}
	},
	[5712] = {
		text = "肥料を見つけた",
		id = 5712,
		only_self = 0,
		type = 1,
		groupId = 57,
		icon = 9,
		param = "ISLANDSIDE01306",
		show_condition = {
			{
				2,
				20013005
			}
		}
	},
	[5713] = {
		text = "全部植え終わった",
		id = 5713,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 9,
		param = "20013006",
		show_condition = {
			{
				3,
				20013006
			}
		}
	},
	[5714] = {
		text = "ラベンダーの収穫が完了した",
		id = 5714,
		only_self = 0,
		type = 12,
		groupId = 57,
		icon = 9,
		param = "20013007",
		show_condition = {
			{
				3,
				20013007
			}
		}
	},
	[5715] = {
		text = "種ショップを確認する",
		id = 5715,
		only_self = 0,
		type = 6,
		groupId = 57,
		icon = 15,
		param = {
			"IslandShopPage",
			{
				1,
				2,
				3,
				4,
				5
			},
			{
				10028
			}
		},
		show_condition = {
			{
				4,
				10003070
			}
		}
	},
	[5800] = {
		text = "会話",
		id = 5800,
		only_self = 0,
		type = 1,
		groupId = 58,
		icon = 1,
		param = "ISLANDTALK10161",
		show_condition = {}
	},
	[5801] = {
		text = "シーズン",
		id = 5801,
		only_self = 0,
		type = 6,
		groupId = 58,
		icon = 5,
		param = {
			"IslandSeasonPage"
		},
		show_condition = {
			{
				11,
				31
			}
		}
	},
	[5802] = {
		text = "ピアリ……",
		id = 5802,
		only_self = 0,
		type = 11,
		groupId = 58,
		icon = 9,
		param = "20015001",
		show_condition = {
			{
				1,
				20015001
			}
		}
	},
	[5803] = {
		text = "ピアリ！",
		id = 5803,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 9,
		param = "20015002",
		show_condition = {
			{
				3,
				20015002
			}
		}
	},
	[5804] = {
		text = "秋の土産採集（1/7）",
		id = 5804,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001001",
		show_condition = {
			{
				3,
				50001001
			}
		}
	},
	[5805] = {
		text = "秋の土産採集（2/7）",
		id = 5805,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001002",
		show_condition = {
			{
				3,
				50001002
			},
			{
				4,
				50001001
			}
		}
	},
	[5806] = {
		text = "秋の土産採集（3/7）",
		id = 5806,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001003",
		show_condition = {
			{
				3,
				50001003
			},
			{
				4,
				50001002
			}
		}
	},
	[5807] = {
		text = "秋の土産採集（4/7）",
		id = 5807,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001004",
		show_condition = {
			{
				3,
				50001004
			},
			{
				4,
				50001003
			}
		}
	},
	[5808] = {
		text = "秋の土産採集（5/7）",
		id = 5808,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001005",
		show_condition = {
			{
				3,
				50001005
			},
			{
				4,
				50001004
			}
		}
	},
	[5809] = {
		text = "秋の土産採集（6/7）",
		id = 5809,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001006",
		show_condition = {
			{
				3,
				50001006
			},
			{
				4,
				50001005
			}
		}
	},
	[5810] = {
		text = "秋の土産採集（7/7）",
		id = 5810,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50001007",
		show_condition = {
			{
				3,
				50001007
			},
			{
				4,
				50001006
			}
		}
	},
	[5811] = {
		text = "秋の特産品制作（1/7）",
		id = 5811,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002001",
		show_condition = {
			{
				3,
				50002001
			}
		}
	},
	[5812] = {
		text = "秋の特産品制作（2/7）",
		id = 5812,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002002",
		show_condition = {
			{
				3,
				50002002
			},
			{
				4,
				50002001
			}
		}
	},
	[5813] = {
		text = "秋の特産品制作（3/7）",
		id = 5813,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002003",
		show_condition = {
			{
				3,
				50002003
			},
			{
				4,
				50002002
			}
		}
	},
	[5814] = {
		text = "秋の特産品制作（4/7）",
		id = 5814,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002004",
		show_condition = {
			{
				3,
				50002004
			},
			{
				4,
				50002003
			}
		}
	},
	[5815] = {
		text = "秋の特産品制作（5/7）",
		id = 5815,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002005",
		show_condition = {
			{
				3,
				50002005
			},
			{
				4,
				50002004
			}
		}
	},
	[5816] = {
		text = "秋の特産品制作（6/7）",
		id = 5816,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002006",
		show_condition = {
			{
				3,
				50002006
			},
			{
				4,
				50002005
			}
		}
	},
	[5817] = {
		text = "秋の特産品制作（7/7）",
		id = 5817,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50002007",
		show_condition = {
			{
				3,
				50002007
			},
			{
				4,
				50002006
			}
		}
	},
	[5818] = {
		text = "秋の特産依頼（1/4）",
		id = 5818,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50003001",
		show_condition = {
			{
				3,
				50003001
			}
		}
	},
	[5819] = {
		text = "秋の特産依頼（2/4）",
		id = 5819,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50003002",
		show_condition = {
			{
				3,
				50003002
			},
			{
				4,
				50003001
			}
		}
	},
	[5820] = {
		text = "秋の特産依頼（3/4）",
		id = 5820,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50003003",
		show_condition = {
			{
				3,
				50003003
			},
			{
				4,
				50003002
			}
		}
	},
	[5821] = {
		text = "秋の特産依頼（4/4）",
		id = 5821,
		only_self = 0,
		type = 12,
		groupId = 58,
		icon = 12,
		param = "50003004",
		show_condition = {
			{
				3,
				50003004
			},
			{
				4,
				50003003
			}
		}
	},
	[5822] = {
		text = "――料理？ピアリ？……あなたが？！",
		id = 5822,
		only_self = 0,
		type = 1,
		groupId = 58,
		icon = 9,
		param = "ISLANDSIDE01603",
		show_condition = {
			{
				2,
				50000001
			}
		}
	},
	[5901] = {
		text = "またどんな悪だくみを？",
		id = 5901,
		only_self = 0,
		type = 1,
		groupId = 59,
		icon = 7,
		param = "ISLAND1001044",
		show_condition = {
			{
				2,
				10004010
			}
		}
	},
	[5902] = {
		text = "これで十分？",
		id = 5902,
		only_self = 0,
		type = 7,
		groupId = 59,
		icon = 7,
		param = "10004020",
		show_condition = {
			{
				3,
				10004020
			}
		}
	},
	[6001] = {
		text = "会話",
		id = 6001,
		only_self = 0,
		type = 1,
		groupId = 60,
		icon = 1,
		param = "ISLANDTALK10091",
		show_condition = {}
	},
	[6002] = {
		text = "工場を管理する",
		id = 6002,
		only_self = 0,
		type = 22,
		groupId = 60,
		icon = 1,
		param = "61",
		show_condition = {
			{
				11,
				2012
			}
		}
	},
	[6101] = {
		text = "木材加工を管理",
		id = 6101,
		only_self = 0,
		type = 6,
		groupId = 61,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			703
		},
		show_condition = {
			{
				11,
				2012
			}
		}
	},
	[6102] = {
		text = "工作機械を管理",
		id = 6102,
		only_self = 0,
		type = 6,
		groupId = 61,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			704
		},
		show_condition = {
			{
				11,
				2013
			}
		}
	},
	[6103] = {
		text = "電子部品加工を管理",
		id = 6103,
		only_self = 0,
		type = 6,
		groupId = 61,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			705
		},
		show_condition = {
			{
				11,
				2014
			}
		}
	},
	[6104] = {
		text = "手工作業台を管理",
		id = 6104,
		only_self = 0,
		type = 6,
		groupId = 61,
		icon = 15,
		param = {
			"IslandRoleDelegationPage",
			706
		},
		show_condition = {
			{
				11,
				2015
			}
		}
	},
	[6105] = {
		text = "戻る",
		id = 6105,
		only_self = 0,
		type = 22,
		groupId = 61,
		icon = 17,
		param = "60",
		show_condition = {
			{
				11,
				2012
			}
		}
	},
	[6201] = {
		text = "撫でる",
		id = 6201,
		only_self = 0,
		type = 3,
		groupId = 62,
		icon = 1,
		param = {
			0,
			"workd_start"
		},
		show_condition = {}
	},
	[6301] = {
		text = "有魚飯店",
		id = 6301,
		only_self = 0,
		type = 6,
		groupId = 63,
		icon = 16,
		param = {
			"IslandRestaurantPage",
			601
		},
		show_condition = {
			{
				11,
				17003
			}
		}
	},
	[6302] = {
		text = "白クマ茶房",
		id = 6302,
		only_self = 0,
		type = 6,
		groupId = 63,
		icon = 16,
		param = {
			"IslandRestaurantPage",
			602
		},
		show_condition = {
			{
				11,
				17004
			}
		}
	},
	[6303] = {
		text = "饅頭軽食",
		id = 6303,
		only_self = 0,
		type = 6,
		groupId = 63,
		icon = 16,
		param = {
			"IslandRestaurantPage",
			603
		},
		show_condition = {
			{
				11,
				17005
			}
		}
	},
	[6304] = {
		text = "烏魚焼肉",
		id = 6304,
		only_self = 0,
		type = 6,
		groupId = 63,
		icon = 16,
		param = {
			"IslandRestaurantPage",
			604
		},
		show_condition = {
			{
				11,
				17006
			}
		}
	},
	[6305] = {
		text = "戻る",
		id = 6305,
		only_self = 0,
		type = 22,
		groupId = 63,
		icon = 17,
		param = "45",
		show_condition = {}
	},
	[6401] = {
		text = "蜂巣を集める",
		id = 6401,
		only_self = 0,
		type = 1,
		groupId = 64,
		icon = 7,
		param = "ISLAND1001037_1",
		show_condition = {
			{
				2,
				10003060
			}
		}
	},
	[6501] = {
		text = "あの音は……",
		id = 6501,
		only_self = 0,
		type = 1,
		groupId = 65,
		icon = 9,
		param = "ISLANDSIDE00510",
		show_condition = {
			{
				2,
				20005009
			}
		}
	},
	[6601] = {
		text = "ここか？",
		id = 6601,
		only_self = 0,
		type = 1,
		groupId = 66,
		icon = 9,
		param = "ISLANDSIDE00602",
		show_condition = {
			{
				2,
				20006001
			}
		}
	},
	[6602] = {
		text = "痕跡を観察",
		id = 6602,
		only_self = 0,
		type = 1,
		groupId = 66,
		icon = 9,
		param = "ISLANDSIDE00603",
		show_condition = {
			{
				2,
				20006002
			}
		}
	},
	[6603] = {
		text = "メェメーヒツジを捕まえる",
		id = 6603,
		only_self = 0,
		type = 1,
		groupId = 66,
		icon = 9,
		param = "ISLANDSIDE00605",
		show_condition = {
			{
				2,
				20006004
			}
		}
	},
	[6701] = {
		text = "引っ張ってみる",
		id = 6701,
		only_self = 0,
		type = 3,
		groupId = 67,
		icon = 9,
		param = {
			0,
			"worku_start"
		},
		show_condition = {
			{
				2,
				20006007
			}
		}
	},
	[6801] = {
		text = "引っ張ってみる",
		id = 6801,
		only_self = 0,
		type = 3,
		groupId = 68,
		icon = 9,
		param = {
			0,
			"worku_start"
		},
		show_condition = {
			{
				2,
				20006007
			}
		}
	},
	[6901] = {
		text = "引っ張ってみる",
		id = 6901,
		only_self = 0,
		type = 3,
		groupId = 69,
		icon = 9,
		param = {
			0,
			"worku_start"
		},
		show_condition = {
			{
				2,
				20006007
			}
		}
	},
	[7001] = {
		text = "蜂の巣を撤去",
		id = 7001,
		only_self = 0,
		type = 3,
		groupId = 70,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20007001
			}
		}
	},
	[7002] = {
		text = "蜂の巣を撤去",
		id = 7002,
		only_self = 0,
		type = 3,
		groupId = 70,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20007002
			}
		}
	},
	[7003] = {
		text = "蜂の巣を撤去",
		id = 7003,
		only_self = 0,
		type = 3,
		groupId = 70,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20007003
			}
		}
	},
	[7004] = {
		text = "この中から音がするような？",
		id = 7004,
		only_self = 0,
		type = 11,
		groupId = 70,
		icon = 9,
		param = "20007001",
		show_condition = {
			{
				1,
				20007001
			}
		}
	},
	[7005] = {
		text = "もしもし？",
		id = 7005,
		only_self = 0,
		type = 11,
		groupId = 70,
		icon = 9,
		param = "20007002",
		show_condition = {
			{
				1,
				20007002
			}
		}
	},
	[7006] = {
		text = "どこかまだ音がする？",
		id = 7006,
		only_self = 0,
		type = 11,
		groupId = 70,
		icon = 9,
		param = "20007003",
		show_condition = {
			{
				1,
				20007003
			}
		}
	},
	[7007] = {
		text = "自分を探してた？",
		id = 7007,
		only_self = 0,
		type = 11,
		groupId = 70,
		icon = 9,
		param = "20007004",
		show_condition = {
			{
				1,
				20007004
			}
		}
	},
	[7008] = {
		text = "今はどう？",
		id = 7008,
		only_self = 0,
		type = 12,
		groupId = 70,
		icon = 9,
		param = "20007001",
		show_condition = {
			{
				3,
				20007001
			}
		}
	},
	[7009] = {
		text = "これで音がしなくなったかな？",
		id = 7009,
		only_self = 0,
		type = 12,
		groupId = 70,
		icon = 9,
		param = "20007002",
		show_condition = {
			{
				3,
				20007002
			}
		}
	},
	[7010] = {
		text = "これで蜂の巣は全部なくなった……",
		id = 7010,
		only_self = 0,
		type = 12,
		groupId = 70,
		icon = 9,
		param = "20007003",
		show_condition = {
			{
				3,
				20007003
			}
		}
	},
	[7011] = {
		text = "はちみつ水レシピを探す",
		id = 7011,
		only_self = 0,
		type = 1,
		groupId = 70,
		icon = 9,
		param = "ISLANDSIDE00709",
		show_condition = {
			{
				2,
				20007005
			}
		}
	},
	[7012] = {
		text = "ローズマリーを探せ",
		id = 7012,
		only_self = 0,
		type = 3,
		groupId = 70,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20007008
			}
		}
	},
	[7013] = {
		text = "はちみつ水を持ってきた！",
		id = 7013,
		only_self = 0,
		type = 1,
		groupId = 70,
		icon = 9,
		param = "ISLANDSIDE00715",
		show_condition = {
			{
				2,
				20007010
			}
		}
	},
	[7101] = {
		text = "明石、頼まれたものを持ってきた",
		id = 7101,
		only_self = 0,
		type = 1,
		groupId = 71,
		icon = 9,
		param = "ISLANDSIDE00904",
		show_condition = {
			{
				2,
				20009003
			}
		}
	},
	[7201] = {
		text = "施肥する",
		id = 7201,
		only_self = 0,
		type = 3,
		groupId = 72,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20012004
			}
		}
	},
	[7202] = {
		text = "土壌に防虫剤を撒く",
		id = 7202,
		only_self = 0,
		type = 3,
		groupId = 72,
		icon = 9,
		param = {
			0,
			"workd_start"
		},
		show_condition = {
			{
				2,
				20012010
			}
		}
	},
	[7301] = {
		text = "肥料を探す",
		id = 7301,
		only_self = 0,
		type = 1,
		groupId = 73,
		icon = 9,
		param = "ISLANDSIDE01305",
		show_condition = {
			{
				2,
				20013004
			}
		}
	},
	[7401] = {
		text = "ここは……",
		id = 7401,
		only_self = 0,
		type = 1,
		groupId = 74,
		icon = 9,
		param = "ISLANDSIDE00202",
		show_condition = {
			{
				2,
				20002001
			}
		}
	},
	[7501] = {
		text = "木材を調査",
		id = 7501,
		only_self = 0,
		type = 1,
		groupId = 75,
		icon = 9,
		param = "ISLANDSIDE00506",
		show_condition = {
			{
				2,
				20005005
			}
		}
	},
	[7601] = {
		text = "港に行く",
		id = 7601,
		only_self = 0,
		type = 24,
		groupId = 76,
		icon = 5,
		param = "10020001",
		show_condition = {}
	},
	[7701] = {
		text = "風の原野に行く",
		id = 7701,
		only_self = 0,
		type = 24,
		groupId = 77,
		icon = 5,
		param = "10040024",
		show_condition = {
			{
				11,
				5004
			}
		}
	},
	[7702] = {
		text = "朝露農場へ向かう",
		id = 7702,
		only_self = 0,
		type = 24,
		groupId = 77,
		icon = 5,
		param = "10010064",
		show_condition = {
			{
				11,
				5001
			}
		}
	},
	[7801] = {
		text = "会話",
		id = 7801,
		only_self = 0,
		type = 1,
		groupId = 78,
		icon = 1,
		param = "ISLANDTALK10131_1",
		show_condition = {
			{
				4,
				10002280
			}
		}
	},
	[7802] = {
		text = "メリー……どうしてここに……",
		id = 7802,
		only_self = 0,
		type = 21,
		groupId = 78,
		icon = 7,
		param = "ISLANDPERFORMANCE10",
		show_condition = {
			{
				2,
				10002271
			}
		}
	},
	[7803] = {
		text = "これがお宝？",
		id = 7803,
		only_self = 0,
		type = 12,
		groupId = 78,
		icon = 7,
		param = "10002280",
		show_condition = {
			{
				3,
				10002280
			}
		}
	},
	[7804] = {
		text = "メリー、手に入れたよ",
		id = 7804,
		only_self = 0,
		type = 12,
		groupId = 78,
		icon = 7,
		param = "10002290",
		show_condition = {
			{
				3,
				10002290
			}
		}
	},
	[7901] = {
		text = "会話",
		id = 7901,
		only_self = 0,
		type = 1,
		groupId = 79,
		icon = 1,
		param = "ISLANDTALK10131_2",
		show_condition = {
			{
				4,
				10002280
			}
		}
	},
	[7902] = {
		text = "メリー……どうしてここに……",
		id = 7902,
		only_self = 0,
		type = 21,
		groupId = 79,
		icon = 7,
		param = "ISLANDPERFORMANCE10",
		show_condition = {
			{
				2,
				10002271
			}
		}
	},
	[7903] = {
		text = "これがお宝？",
		id = 7903,
		only_self = 0,
		type = 12,
		groupId = 79,
		icon = 7,
		param = "10002280",
		show_condition = {
			{
				3,
				10002280
			}
		}
	},
	[7904] = {
		text = "メリー、手に入れたよ",
		id = 7904,
		only_self = 0,
		type = 12,
		groupId = 79,
		icon = 7,
		param = "10002290",
		show_condition = {
			{
				3,
				10002290
			}
		}
	}
}
