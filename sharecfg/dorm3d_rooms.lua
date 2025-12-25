pg = pg or {}
pg.dorm3d_rooms = {
	{
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Tianlangxing_DB",
		assets_prefix = "Tianlangxing",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_siriushostel_01|Tianlangxing_DB/SiriusHostel",
		in_map = "floor_1",
		room = "天狼星",
		invite_mark = "",
		id = 1,
		room_bgm = "story-room-sirius",
		room_des = "",
		character = {
			20220
		},
		character_pay = {},
		character_welcome = {
			{
				20220,
				2000
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				20220,
				"Chair"
			}
		},
		furniture_zones = {
			1001,
			1002,
			1003
		},
		recall_list = {
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8
		},
		ar_anim = {
			{
				20220,
				{
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
					1303
				}
			}
		}
	},
	{
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Nengdai_DB",
		assets_prefix = "Nengdai",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_noshirohostel_01|Nengdai_DB/Noshirohostel",
		in_map = "floor_1",
		room = "能代",
		invite_mark = "",
		id = 2,
		room_bgm = "story-room-noshiro",
		room_des = "",
		character = {
			30221
		},
		character_pay = {},
		character_welcome = {
			{
				30221,
				0
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				30221,
				"Chair"
			}
		},
		furniture_zones = {
			2001,
			2002,
			2003
		},
		recall_list = {
			21,
			22,
			23,
			31,
			32
		},
		ar_anim = {
			{
				30221,
				{
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
					2304
				}
			}
		}
	},
	{
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Ankeleiqi_DB",
		assets_prefix = "Ankeleiqi",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_anchoragehostel_01|Ankeleiqi_DB/Anchoragehostel",
		in_map = "floor_1",
		room = "安克雷奇",
		invite_mark = "",
		id = 3,
		room_bgm = "story-room-anchorage",
		room_des = "",
		character = {
			19903
		},
		character_pay = {},
		character_welcome = {
			{
				19903,
				0
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				19903,
				"Chair"
			}
		},
		furniture_zones = {
			3001,
			3002,
			3003
		},
		recall_list = {
			41,
			42,
			43,
			51,
			52
		},
		ar_anim = {
			{
				19903,
				{
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
					3018
				}
			}
		}
	},
	{
		type = 1,
		room_des = "沙滩、泳装、排球……尽情在海风中玩耍吧~",
		tag = "beach",
		resource_name = "Beach",
		assets_prefix = "Beach",
		scene_info = "map_beach_01|Beach",
		is_common = 0,
		in_map = "floor_1",
		room = "沙滩",
		id = 4,
		room_bgm = "story-room-sirius",
		character = {},
		character_pay = {
			20220,
			30221,
			19903
		},
		character_welcome = {
			{
				20220,
				1000
			},
			{
				30221,
				0
			},
			{
				19903,
				0
			}
		},
		character_range = {
			0,
			3
		},
		unlock_item = {
			{
				2,
				15022,
				1
			}
		},
		default_zone = {
			{
				20220,
				"Tianlangxing"
			},
			{
				30221,
				"Nengdai"
			},
			{
				19903,
				"Ankeleiqi"
			}
		},
		furniture_zones = {
			4005
		},
		recall_list = {},
		invite_cost = {
			{
				20220,
				270110
			},
			{
				30221,
				270111
			},
			{
				19903,
				270112
			}
		},
		invite_banner = {
			{
				20220,
				{
					"banner_beach1",
					"banner_beach2"
				}
			},
			{
				30221,
				{
					"banner_beach3"
				}
			},
			{
				19903,
				{
					"banner_beach4"
				}
			}
		},
		invite_icon = {
			{
				20220,
				"dorm3dicon/3Ddrom_invitation"
			},
			{
				30221,
				"dorm3dicon/3Ddrom_invitation"
			},
			{
				19903,
				"dorm3dicon/3Ddrom_invitation"
			}
		},
		invite_mark = {
			{
				20220,
				{
					1,
					5,
					6
				}
			},
			{
				30221,
				{
					1,
					5,
					6
				}
			},
			{
				19903,
				{
					1,
					5,
					6
				}
			}
		},
		ar_anim = {
			{
				20220,
				{
					4001,
					4002,
					4003,
					4004,
					4005
				}
			},
			{
				30221,
				{
					4201,
					4202,
					4203,
					4204,
					4205
				}
			},
			{
				19903,
				{
					4401,
					4402,
					4403,
					4404,
					4405
				}
			}
		}
	},
	{
		type = 1,
		recall_list = "",
		default_zone = "",
		resource_name = "Bathroom",
		invite_cost = "",
		ar_anim = "",
		room_bgm = "story-room-sirius",
		room_des = "",
		scene_info = "",
		in_map = "floor_1",
		room = "浴室",
		invite_mark = "",
		tag = "",
		furniture_zones = "",
		invite_icon = "",
		invite_banner = "",
		assets_prefix = "Bathroom",
		is_common = 1,
		id = 5,
		character = {
			20220
		},
		character_pay = {},
		character_welcome = {
			{
				20220,
				1000
			}
		},
		character_range = {
			0,
			0
		},
		unlock_item = {
			{
				2,
				15022,
				1
			}
		}
	},
	[11] = {
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Xinzexi_DB",
		assets_prefix = "Xinzexi",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_newjerseyhostel_01|Xinzexi_DB/Newjerseyhostel",
		in_map = "floor_2",
		room = "新泽西",
		invite_mark = "",
		id = 11,
		room_bgm = "Story-room-newjersey",
		room_des = "",
		character = {
			10517
		},
		character_pay = {},
		character_welcome = {
			{
				10517,
				0
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				10517,
				"Chair"
			}
		},
		furniture_zones = {
			11001,
			11002,
			11003
		},
		recall_list = {
			101,
			102,
			103,
			104
		},
		ar_anim = {
			{
				10517,
				{
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
					11014
				}
			}
		}
	},
	[12] = {
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Dafeng_DB",
		assets_prefix = "Dafeng",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_dafeng_01|Dafeng_DB/Dafenghostel",
		in_map = "floor_2",
		room = "大凤",
		invite_mark = "",
		id = 12,
		room_bgm = "story-room-taiho",
		room_des = "",
		character = {
			30707
		},
		character_pay = {},
		character_welcome = {
			{
				30707,
				0
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				30707,
				"Chair"
			}
		},
		furniture_zones = {
			12001,
			12002,
			12003
		},
		recall_list = {
			121,
			122,
			123,
			124
		},
		ar_anim = {
			{
				30707,
				{
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
					12019
				}
			}
		}
	},
	[14] = {
		invite_icon = "",
		invite_banner = "",
		tag = "",
		resource_name = "Aijier_DB",
		assets_prefix = "Aijier",
		type = 2,
		invite_cost = "",
		is_common = 0,
		scene_info = "map_aijier_01|Aijier_DB/Aijierhostel",
		in_map = "floor_2",
		room = "埃吉尔",
		invite_mark = "",
		id = 14,
		room_bgm = "story-room-agir",
		room_des = "",
		character = {
			49905
		},
		character_pay = {},
		character_welcome = {
			{
				49905,
				0
			}
		},
		character_range = {
			1
		},
		unlock_item = {},
		default_zone = {
			{
				49905,
				"Chair"
			}
		},
		furniture_zones = {
			14001,
			14002,
			14003
		},
		recall_list = {
			141,
			142,
			143,
			144
		},
		ar_anim = {
			{
				49905,
				{
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
					14015
				}
			}
		}
	},
	[16] = {
		type = 1,
		room_des = "优雅与精致，奢华与愉悦。在金色的流光中，经历这一场梦幻奇遇。",
		tag = "cafe",
		resource_name = "Publiccafe",
		assets_prefix = "Publiccafe",
		scene_info = "map_publiccafe_01|Publiccafe",
		is_common = 0,
		in_map = "floor_2",
		room = "咖啡馆",
		id = 16,
		room_bgm = "Story-room-bar",
		character = {},
		character_pay = {
			10517,
			30707,
			49905
		},
		character_welcome = {
			{
				10517,
				0
			},
			{
				30707,
				0
			},
			{
				49905,
				0
			}
		},
		character_range = {
			0,
			3
		},
		unlock_item = {
			{
				2,
				15023,
				1
			}
		},
		default_zone = {
			{
				10517,
				"xinzexi"
			},
			{
				30707,
				"dafeng"
			},
			{
				49905,
				"aijier"
			}
		},
		furniture_zones = {},
		recall_list = {},
		invite_cost = {
			{
				10517,
				270113
			},
			{
				30707,
				270114
			},
			{
				49905,
				270115
			}
		},
		invite_banner = {
			{
				10517,
				{
					"banner_cafe1"
				}
			},
			{
				30707,
				{
					"banner_cafe2"
				}
			},
			{
				49905,
				{
					"banner_cafe3"
				}
			}
		},
		invite_icon = {
			{
				10517,
				"dorm3dicon/3Ddrom_invitation"
			},
			{
				30707,
				"dorm3dicon/3Ddrom_invitation"
			},
			{
				49905,
				"dorm3dicon/3Ddrom_invitation"
			}
		},
		invite_mark = {
			{
				10517,
				{
					1,
					5,
					6
				}
			},
			{
				30707,
				{
					1,
					5,
					6
				}
			},
			{
				49905,
				{
					1,
					5,
					6
				}
			}
		},
		ar_anim = {
			{
				10517,
				{
					16001,
					16001,
					16003,
					16004,
					16005
				}
			},
			{
				30707,
				{
					16006,
					16007,
					16008,
					16009,
					16010
				}
			},
			{
				49905,
				{
					16011,
					16012,
					16013,
					16014,
					16015
				}
			}
		}
	},
	get_id_list_by_in_map = {
		floor_1 = {
			1,
			2,
			3,
			4,
			5
		},
		floor_2 = {
			11,
			12,
			14,
			16
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		11,
		12,
		14,
		16
	}
}
