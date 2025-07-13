pg = pg or {}
pg.pay_data_display = setmetatable({
	__name = "pay_data_display",
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		42,
		43,
		44,
		45,
		46,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		55,
		56,
		57,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		69,
		70,
		71,
		72,
		73,
		74,
		75,
		76,
		77,
		78,
		79,
		82,
		83,
		84,
		85,
		86,
		87,
		88,
		89,
		90,
		91,
		92,
		93,
		94,
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
		1013,
		1014,
		1015,
		1016,
		1017,
		1018,
		1019,
		1020,
		1021,
		1022,
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
		100,
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		115,
		116,
		117,
		118,
		119,
		120,
		121,
		122,
		123,
		124,
		125,
		126,
		127,
		128,
		129,
		130,
		131,
		132,
		133,
		134,
		135,
		136,
		137,
		138,
		2014,
		2015,
		2016,
		2017,
		2018,
		2019,
		2020,
		2022,
		2023,
		2024,
		2025,
		2026,
		2027,
		2028,
		2029,
		2030,
		2031,
		2032,
		2033,
		2034,
		2035,
		2036,
		2037,
		2038,
		2039,
		2040,
		2041,
		2042,
		2043,
		2044,
		2045,
		2046,
		2047,
		2048,
		2049,
		2050,
		2051,
		2052,
		2053,
		2054,
		2055,
		2056,
		5011,
		5012,
		5013,
		5014,
		5015,
		5016,
		5017,
		139,
		140,
		141,
		142,
		143,
		144,
		145,
		146,
		147,
		148,
		149,
		150,
		151,
		152,
		153,
		154,
		155,
		156,
		157,
		158
	}
}, confHX)
pg.base = pg.base or {}
pg.base.pay_data_display = {
	{
		descrip = "Receive $1 Gems immediately and resources every day for \n30 days.",
		name = "Trade License (30 days)",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Trade License",
		tip = "",
		tip_open = 0,
		id = 1,
		money = 799,
		name_display = "Trade License (30 days)",
		tag = 2,
		akashi_pick = 0,
		gem = 500,
		extra_service = 2,
		show_group = "",
		limit_type = 1,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "month",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 7,
		airijp_id = "com.yostaren.azurlane.passport1",
		extra_service_item = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		},
		display = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		}
	},
	{
		descrip = "Three Supplies",
		name = "Novice sailing supplies",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Novice sailing supplies",
		tip = "",
		tip_open = 0,
		id = 2,
		money = 99,
		name_display = "Novice sailing supplies",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 1,
		package_tag = "Good for\nBeginners",
		picture = "boxNewplayer",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond101",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond101",
		extra_service_item = {
			{
				1,
				4,
				60
			},
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		},
		display = {
			{
				1,
				4,
				60
			},
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Handful of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "60 Gems",
		tip = "",
		tip_open = 0,
		id = 3,
		money = 99,
		name_display = "Handful of Gems",
		tag = 0,
		akashi_pick = 0,
		gem = 60,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 99,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "1",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond1",
		first_pay_double = 1,
		extra_gem = 0,
		limit_arg = 10,
		airijp_id = "com.yostaren.azurlane.diamond1",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Pile of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "300 Gems",
		tip = "",
		tip_open = 0,
		id = 4,
		money = 499,
		name_display = "Pile of Gems",
		tag = 0,
		akashi_pick = 0,
		gem = 300,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 99,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "2",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond2",
		first_pay_double = 1,
		extra_gem = 30,
		limit_arg = 10,
		airijp_id = "com.yostaren.azurlane.diamond2",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Sack of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "980 Gems",
		tip = "",
		tip_open = 0,
		id = 5,
		money = 999,
		name_display = "Sack of Gems",
		tag = 0,
		akashi_pick = 0,
		gem = 600,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "3",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond3",
		first_pay_double = 1,
		extra_gem = 150,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond3",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Box of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "1980 Gems",
		tip = "",
		tip_open = 0,
		id = 6,
		money = 1999,
		name_display = "Box of Gems",
		tag = 0,
		akashi_pick = 0,
		gem = 1200,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "4",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond4",
		first_pay_double = 1,
		extra_gem = 360,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond4",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Chest of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "3280 Gems",
		tip = "",
		tip_open = 0,
		id = 7,
		money = 3999,
		name_display = "Chest of Gems",
		tag = 0,
		akashi_pick = 0,
		gem = 2400,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "5",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond5",
		first_pay_double = 1,
		extra_gem = 880,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond5",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "Get $1 Gems as bonus",
		name = "Ship of Gems",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "6480 Gems",
		tip = "",
		tip_open = 0,
		id = 8,
		money = 7999,
		name_display = "Ship of Gems",
		tag = 1,
		akashi_pick = 0,
		gem = 4900,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "6",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond6",
		first_pay_double = 1,
		extra_gem = 2500,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond6",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[24] = {
		descrip = "Contains a random character outfit, 2020 Gems, and a large amount of supplies. ",
		name = "2020 Party Dress Lucky Bag",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "2020 Party Dress Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 24,
		money = 2999,
		name_display = "2020 Party Dress Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe3_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond138",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond138",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69911,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40911,
				1
			}
		}
	},
	[25] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Shougatsu Lucky Bag 2021 ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Bag 2021",
		tip = "",
		tip_open = 0,
		id = 25,
		money = 2999,
		name_display = "Shougatsu Lucky Bag 2021 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond142",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond142",
		extra_service_item = {
			{
				2,
				69912,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					1,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69912,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40912,
				1
			}
		}
	},
	[26] = {
		descrip = "Contains a random character outfit, 2020 Gems, and a large amount of supplies. ",
		name = "Shougatsu Lucky Bag 2020 ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Bag 2020",
		tip = "",
		tip_open = 0,
		id = 26,
		money = 2999,
		name_display = "Shougatsu Lucky Bag 2020 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond126",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond126",
		extra_service_item = {
			{
				2,
				69908,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					1,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69908,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40908,
				1
			}
		}
	},
	[27] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Lunar New Year Lucky Bag (2021)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2021)",
		tip = "",
		tip_open = 0,
		id = 27,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2021)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond143",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond143",
		extra_service_item = {
			{
				2,
				69913,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					2,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					2,
					18
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69913,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40913,
				1
			}
		}
	},
	[28] = {
		descrip = "Contains a random character outfit, 2020 Gems, and a large amount of supplies. ",
		name = "Lunar New Year Lucky Bag (2020)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2020)",
		tip = "",
		tip_open = 0,
		id = 28,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2020)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond128",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond128",
		extra_service_item = {
			{
				2,
				69909,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					2,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					2,
					18
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69909,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40909,
				1
			}
		}
	},
	[29] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Exquisite Lucky Box 2021 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Exquisite Lucky Box 2021 ",
		tip = "",
		tip_open = 0,
		id = 29,
		money = 2999,
		name_display = "Exquisite Lucky Box 2021 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond146",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond146",
		extra_service_item = {
			{
				2,
				69914,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					5,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					6,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40914,
				1
			}
		}
	},
	[30] = {
		descrip = "Contains a random character outfit, 2020 Gems, and a large amount of supplies. ",
		name = "Exquisite Lucky Bag 2020 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Exquisite Lucky Bag 2020 ",
		tip = "",
		tip_open = 0,
		id = 30,
		money = 2999,
		name_display = "Exquisite Lucky Bag 2020 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe1_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond147",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond147",
		extra_service_item = {
			{
				2,
				69910,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					5,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					6,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69910,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40910,
				1
			}
		}
	},
	[31] = {
		descrip = "Contains 1980 x Gems, 35x Universal T4 Plate, 1x Gear Lab Development Pack, and other rewards ",
		name = "New Commanders Support Pack IV ",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "New Commanders Support Pack IV ",
		tip = "",
		tip_open = 0,
		id = 31,
		money = 2999,
		name_display = "New Commanders Support Pack IV ",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond148",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond148",
		extra_service_item = {
			{
				1,
				14,
				1980
			},
			{
				2,
				30121,
				10
			},
			{
				2,
				30114,
				35
			},
			{
				2,
				30113,
				100
			},
			{
				2,
				14004,
				25
			},
			{
				2,
				30203,
				1
			},
			{
				2,
				42036,
				5
			},
			{
				2,
				16003,
				10
			},
			{
				2,
				16013,
				5
			},
			{
				2,
				16023,
				5
			},
			{
				2,
				15008,
				500
			},
			{
				4,
				100011,
				1
			}
		},
		display = {
			{
				1,
				14,
				1980
			},
			{
				2,
				30114,
				35
			},
			{
				2,
				30121,
				10
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40015,
				1
			}
		}
	},
	[32] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "2021 Party Dress Lucky Box",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "2021 Party Dress Lucky Box",
		tip = "",
		tip_open = 0,
		id = 32,
		money = 2999,
		name_display = "2021 Party Dress Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond151",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond151",
		extra_service_item = {
			{
				2,
				69915,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					9,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					10,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69915,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40915,
				1
			}
		}
	},
	[33] = {
		descrip = "Contains a random character outfit, 2020 Gems, and a large amount of supplies. ",
		name = "2020 Party Dress Lucky Box",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "2020 Party Dress Lucky Box",
		tip = "",
		tip_open = 0,
		id = 33,
		money = 2999,
		name_display = "2020 Party Dress Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe3_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond150",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond150",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					9,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					10,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69911,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40911,
				1
			}
		}
	},
	[34] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies. ",
		name = "Shougatsu Lucky Box 2022 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Box 2022 ",
		tip = "",
		tip_open = 0,
		id = 34,
		money = 2999,
		name_display = "Shougatsu Lucky Box 2022 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai6",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond154",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond154",
		extra_service_item = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40916,
				1
			}
		}
	},
	[35] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Shougatsu Lucky Bag 2021 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Bag 2021 ",
		tip = "",
		tip_open = 0,
		id = 35,
		money = 2999,
		name_display = "Shougatsu Lucky Bag 2021 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond153",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond153",
		extra_service_item = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40912,
				1
			}
		}
	},
	[36] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies. ",
		name = "Lunar New Year Lucky Bag (2022)",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2022)",
		tip = "",
		tip_open = 0,
		id = 36,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2022)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai7",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond156",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond156",
		extra_service_item = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					1,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					2,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40917,
				1
			}
		}
	},
	[37] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Lunar New Year Lucky Bag (2021)",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2021)",
		tip = "",
		tip_open = 0,
		id = 37,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2021)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond155",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond155",
		extra_service_item = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					1,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					2,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40913,
				1
			}
		}
	},
	[38] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies. ",
		name = "Exquisite Lucky Box 2022 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Exquisite Lucky Box 2022 ",
		tip = "",
		tip_open = 0,
		id = 38,
		money = 2999,
		name_display = "Exquisite Lucky Box 2022 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe8_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond167",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond167",
		extra_service_item = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40919,
				1
			}
		}
	},
	[39] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies. ",
		name = "Exquisite Lucky Box 2021 ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Exquisite Lucky Box 2021 ",
		tip = "",
		tip_open = 0,
		id = 39,
		money = 2999,
		name_display = "Exquisite Lucky Box 2021 ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond168",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond168",
		extra_service_item = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40914,
				1
			}
		}
	},
	[42] = {
		descrip = "Contains a random character outfit, 2021 Gems, and a large amount of supplies.",
		name = "Party Dress Lucky Box 2021 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Party Dress Lucky Box 2021 Rerun",
		tip = "",
		tip_open = 0,
		id = 42,
		money = 2999,
		name_display = "Party Dress Lucky Box 2021 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond175",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond175",
		extra_service_item = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					9,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					10,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40915,
				1
			}
		}
	},
	[43] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies.",
		name = "Party Dress Lucky Box 2022",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Party Dress Lucky Box 2022",
		tip = "",
		tip_open = 0,
		id = 43,
		money = 2999,
		name_display = "Party Dress Lucky Box 2022",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe8_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond176",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond176",
		extra_service_item = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					9,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					10,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40920,
				1
			}
		}
	},
	[44] = {
		descrip = "Contains loads of valuable rewads.",
		name = "Welcome Back Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Welcome Back Pack",
		tip = "",
		tip_open = 0,
		id = 44,
		money = 1799,
		name_display = "Welcome Back Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "support6",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond179",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond179",
		extra_service_item = {
			{
				2,
				20001,
				40
			},
			{
				2,
				15003,
				20
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				200
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				30113,
				60
			},
			{
				1,
				3,
				20000
			},
			{
				2,
				59900,
				1000
			}
		},
		time = {
			{
				{
					2022,
					11,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					12,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				40
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				16502,
				200
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40921,
				1
			}
		}
	},
	[45] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Winter Swimsuit Lucky Bag 2022 A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Winter Swimsuit Lucky Bag 2022 A",
		tip = "",
		tip_open = 0,
		id = 45,
		money = 2999,
		name_display = "Winter Swimsuit Lucky Bag 2022 A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe10_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag2",
		extra_service_item = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40922,
				1
			}
		}
	},
	[46] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Winter Swimsuit Lucky Bag 2022 B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Winter Swimsuit Lucky Bag 2022 B",
		tip = "",
		tip_open = 0,
		id = 46,
		money = 2999,
		name_display = "Winter Swimsuit Lucky Bag 2022 B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe11_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag3",
		extra_service_item = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40923,
				1
			}
		}
	},
	[47] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies.",
		name = "Shougatsu Lucky Box 2022 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Shougatsu Lucky Box 2022 Rerun",
		tip = "",
		tip_open = 0,
		id = 47,
		money = 2999,
		name_display = "Shougatsu Lucky Box 2022 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai6",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag1",
		extra_service_item = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40916,
				1
			}
		}
	},
	[48] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2023 A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2023 A",
		tip = "",
		tip_open = 0,
		id = 48,
		money = 2999,
		name_display = "Spring Lucky Bag 2023 A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudaiqp1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag5",
		extra_service_item = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40924,
				1
			}
		}
	},
	[49] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2023 B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2023 B",
		tip = "",
		tip_open = 0,
		id = 49,
		money = 2999,
		name_display = "Spring Lucky Bag 2023 B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudaiqp2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag7",
		extra_service_item = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40925,
				1
			}
		}
	},
	[50] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies.",
		name = "Lunar New Year Lucky Bag 2022 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Lunar New Year Lucky Bag 2022 Rerun",
		tip = "",
		tip_open = 0,
		id = 50,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag 2022 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai7",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag6",
		extra_service_item = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40917,
				1
			}
		}
	},
	[51] = {
		descrip = "Contains items, resources, and a random Summer 2023 swimsuit skin.",
		name = "Swimsuit Lucky Bag 2023",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2023",
		tip = "",
		tip_open = 0,
		id = 51,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2023",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihecn6ss_l",
		skin_inquire_relation = 69926,
		id_str = "com.yostaren.azurlane.luckybag10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag10",
		extra_service_item = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					5,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40926,
				1
			}
		}
	},
	[52] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Exquisite Lucky Box 2023",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Exquisite Lucky Box 2023",
		tip = "",
		tip_open = 0,
		id = 52,
		money = 2999,
		name_display = "Exquisite Lucky Box 2023",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "liheus6lf_l",
		skin_inquire_relation = 69927,
		id_str = "com.yostaren.azurlane.luckybag11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag11",
		extra_service_item = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40927,
				1
			}
		}
	},
	[53] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies.",
		name = "Exquisite Lucky Box 2022 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Exquisite Lucky Box 2022 Rerun",
		tip = "",
		tip_open = 0,
		id = 53,
		money = 2999,
		name_display = "Exquisite Lucky Box 2022 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe8_l",
		skin_inquire_relation = 69919,
		id_str = "com.yostaren.azurlane.luckybag12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag12",
		extra_service_item = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40919,
				1
			}
		}
	},
	[55] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Autumn Classics Lucky Box ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Autumn Classics Lucky Box ",
		tip = "",
		tip_open = 0,
		id = 55,
		money = 2999,
		name_display = "Autumn Classics Lucky Box ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihejp6lf_l",
		skin_inquire_relation = 69929,
		id_str = "com.yostaren.azurlane.luckybag16",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag16",
		extra_service_item = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40929,
				1
			}
		}
	},
	[56] = {
		descrip = "Contains a random character outfit, 2022 Gems, and a large amount of supplies.",
		name = "Party Dress Lucky Box 2022 Rerun ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Party Dress Lucky Box 2022 Rerun ",
		tip = "",
		tip_open = 0,
		id = 56,
		money = 2999,
		name_display = "Party Dress Lucky Box 2022 Rerun ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe8_l",
		skin_inquire_relation = 69920,
		id_str = "com.yostaren.azurlane.luckybag17",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag17",
		extra_service_item = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40920,
				1
			}
		}
	},
	[57] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Fashion Collection Lucky Bag ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Fashion Collection Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 57,
		money = 2999,
		name_display = "Fashion Collection Lucky Bag ",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihejp6ss_l",
		skin_inquire_relation = 69928,
		id_str = "com.yostaren.azurlane.luckybag15",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag15",
		extra_service_item = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40928,
				1
			}
		}
	},
	[61] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Resplendent Night Lucky Bag I",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Resplendent Night Lucky Bag I",
		tip = "",
		tip_open = 0,
		id = 61,
		money = 2999,
		name_display = "Resplendent Night Lucky Bag I",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai9",
		skin_inquire_relation = 86200,
		id_str = "com.yostaren.azurlane.luckybag21",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag21",
		extra_service_item = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81200,
				1
			}
		}
	},
	[62] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Winter Swimsuit Lucky Bag 2022 A Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Winter Swimsuit Lucky Bag 2022 A Rerun",
		tip = "",
		tip_open = 0,
		id = 62,
		money = 2999,
		name_display = "Winter Swimsuit Lucky Bag 2022 A Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe10_l",
		skin_inquire_relation = 69922,
		id_str = "com.yostaren.azurlane.luckybag20",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag20",
		extra_service_item = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40922,
				1
			}
		}
	},
	[63] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Resplendent Night Lucky Bag II",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Resplendent Night Lucky Bag II",
		tip = "",
		tip_open = 0,
		id = 63,
		money = 2999,
		name_display = "Resplendent Night Lucky Bag II",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai10",
		skin_inquire_relation = 86201,
		id_str = "com.yostaren.azurlane.luckybag23",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag23",
		extra_service_item = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					10
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81201,
				1
			}
		}
	},
	[64] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Winter Swimsuit Lucky Bag 2022 B Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Winter Swimsuit Lucky Bag 2022 B Rerun",
		tip = "",
		tip_open = 0,
		id = 64,
		money = 2999,
		name_display = "Winter Swimsuit Lucky Bag 2022 B Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe11_l",
		skin_inquire_relation = 69923,
		id_str = "com.yostaren.azurlane.luckybag22",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag22",
		extra_service_item = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					10
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40923,
				1
			}
		}
	},
	[65] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Spring Lucky Box 2024 A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Box 2024 A",
		tip = "",
		tip_open = 0,
		id = 65,
		money = 2999,
		name_display = "Spring Lucky Box 2024 A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai11",
		skin_inquire_relation = 86202,
		id_str = "com.yostaren.azurlane.luckybag25",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag25",
		extra_service_item = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					1,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81202,
				1
			}
		}
	},
	[66] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2023 A Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2023 A Rerun",
		tip = "",
		tip_open = 0,
		id = 66,
		money = 2999,
		name_display = "Spring Lucky Bag 2023 A Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudaiqp1",
		skin_inquire_relation = 69924,
		id_str = "com.yostaren.azurlane.luckybag24",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag24",
		extra_service_item = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					1,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40924,
				1
			}
		}
	},
	[67] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Spring Lucky Box 2024 B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Box 2024 B",
		tip = "",
		tip_open = 0,
		id = 67,
		money = 2999,
		name_display = "Spring Lucky Box 2024 B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai12",
		skin_inquire_relation = 86203,
		id_str = "com.yostaren.azurlane.luckybag27",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag27",
		extra_service_item = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					2,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81203,
				1
			}
		}
	},
	[68] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2023 B Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2023 B Rerun",
		tip = "",
		tip_open = 0,
		id = 68,
		money = 2999,
		name_display = "Spring Lucky Bag 2023 B Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudaiqp2",
		skin_inquire_relation = 69925,
		id_str = "com.yostaren.azurlane.luckybag26",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag26",
		extra_service_item = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					2,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40925,
				1
			}
		}
	},
	[69] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Swimsuit Lucky Bag 2024",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2024",
		tip = "",
		tip_open = 0,
		id = 69,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2024",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai13",
		skin_inquire_relation = 86204,
		id_str = "com.yostaren.azurlane.luckybag31",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag31",
		extra_service_item = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81204,
				1
			}
		}
	},
	[70] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Swimsuit Lucky Bag 2023 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2023 Rerun",
		tip = "",
		tip_open = 0,
		id = 70,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2023 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihecn6ss_l",
		skin_inquire_relation = 69926,
		id_str = "com.yostaren.azurlane.luckybag32",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag32",
		extra_service_item = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40926,
				1
			}
		}
	},
	[71] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Exquisite Lucky Envelope 2024",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Exquisite Lucky Envelope 2024",
		tip = "",
		tip_open = 0,
		id = 71,
		money = 2999,
		name_display = "Exquisite Lucky Envelope 2024",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai14",
		skin_inquire_relation = 86205,
		id_str = "com.yostaren.azurlane.luckybag33",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag33",
		extra_service_item = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81205,
				1
			}
		}
	},
	[72] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Exquisite Lucky Box 2023 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Exquisite Lucky Box 2023 Rerun",
		tip = "",
		tip_open = 0,
		id = 72,
		money = 2999,
		name_display = "Exquisite Lucky Box 2023 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihecn6lf_l",
		skin_inquire_relation = 69927,
		id_str = "com.yostaren.azurlane.luckybag34",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag34",
		extra_service_item = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40927,
				1
			}
		}
	},
	[73] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Dreamland Lucky Bag A",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack.",
		type = 1,
		limit_group = 0,
		type_order = 3,
		subject = "Dreamland Lucky Bag A",
		tip = "",
		tip_open = 0,
		id = 73,
		money = 2999,
		name_display = "Dreamland Lucky Bag A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai15",
		skin_inquire_relation = 86206,
		id_str = "com.yostaren.azurlane.luckybag38",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag38",
		extra_service_item = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81206,
				1
			}
		}
	},
	[74] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Fashion Collection Lucky Bag Rerun",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack.",
		type = 1,
		limit_group = 0,
		type_order = 3,
		subject = "Fashion Collection Lucky Bag Rerun",
		tip = "",
		tip_open = 0,
		id = 74,
		money = 2999,
		name_display = "Fashion Collection Lucky Bag Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihejp6ss_l",
		skin_inquire_relation = 69928,
		id_str = "com.yostaren.azurlane.luckybag39",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag39",
		extra_service_item = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40928,
				1
			}
		}
	},
	[75] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Dreamland Lucky Bag B",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Dreamland Lucky Bag B",
		tip = "",
		tip_open = 0,
		id = 75,
		money = 2999,
		name_display = "Dreamland Lucky Bag B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai16",
		skin_inquire_relation = 86207,
		id_str = "com.yostaren.azurlane.luckybag40",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag40",
		extra_service_item = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81207,
				1
			}
		}
	},
	[76] = {
		descrip = "Contains a random character outfit, 2023 Gems, and a large amount of supplies.",
		name = "Autumn Classics Lucky Box Rerun",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Autumn Classics Lucky Box Rerun",
		tip = "",
		tip_open = 0,
		id = 76,
		money = 2999,
		name_display = "Autumn Classics Lucky Box Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihejp6lf_l",
		skin_inquire_relation = 69929,
		id_str = "com.yostaren.azurlane.luckybag41",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag41",
		extra_service_item = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40929,
				1
			}
		}
	},
	[77] = {
		descrip = "Contains 980x Gems, 1x Choose-Your-Own Gift Pack I, and loads of other valuable rewards.",
		name = "Choose-Your-Own Gift Pack I",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 2,
		subject = "Choose-Your-Own Gift Pack I",
		tip = "",
		tip_open = 0,
		id = 77,
		money = 1499,
		name_display = "Choose-Your-Own Gift Pack I",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_2024_98",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfchoosebag3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfchoosebag3",
		extra_service_item = {
			{
				2,
				59555,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			},
			{
				2,
				59010,
				1000
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59555,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81407,
				1
			}
		}
	},
	[78] = {
		descrip = "Contains 1980x Gems, 1x Choose-Your-Own Gift Pack II, and loads of other valuable rewards.",
		name = "Choose-Your-Own Gift Pack II",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 2,
		subject = "Choose-Your-Own Gift Pack II",
		tip = "",
		tip_open = 0,
		id = 78,
		money = 2999,
		name_display = "Choose-Your-Own Gift Pack II",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_2024_198",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfchoosebag4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfchoosebag4",
		extra_service_item = {
			{
				2,
				59556,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				30114,
				30
			},
			{
				2,
				59010,
				2000
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59556,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81408,
				1
			}
		}
	},
	[79] = {
		descrip = "Contains 3280x Gems, 1x Choose-Your-Own Gift Pack III, and loads of other valuable rewards.",
		name = "Choose-Your-Own Gift Pack III",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 2,
		subject = "Choose-Your-Own Gift Pack III",
		tip = "",
		tip_open = 0,
		id = 79,
		money = 4499,
		name_display = "Choose-Your-Own Gift Pack III",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_2024_328",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfchoosebag5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfchoosebag5",
		extra_service_item = {
			{
				2,
				59557,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				15008,
				2000
			},
			{
				2,
				16004,
				2
			},
			{
				2,
				16014,
				2
			},
			{
				2,
				16024,
				2
			},
			{
				2,
				16032,
				30
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59557,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81409,
				1
			}
		}
	},
	[82] = {
		descrip = "Contains items, resources, and a random skin.",
		name = "Game Night Lucky Bag A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Game Night Lucky Bag A",
		tip = "",
		tip_open = 0,
		id = 82,
		money = 2999,
		name_display = "Game Night Lucky Bag A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai19",
		skin_inquire_relation = 86208,
		id_str = "com.yostaren.azurlane.luckybag45",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag45",
		extra_service_item = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81208,
				1
			}
		}
	},
	[83] = {
		descrip = "Contains items, resources, and a random skin.",
		name = "Resplendent Night Lucky Bag I Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Resplendent Night Lucky Bag I Rerun",
		tip = "",
		tip_open = 0,
		id = 83,
		money = 2999,
		name_display = "Resplendent Night Lucky Bag I Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai9",
		skin_inquire_relation = 86200,
		id_str = "com.yostaren.azurlane.luckybag46",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag46",
		extra_service_item = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81200,
				1
			}
		}
	},
	[84] = {
		descrip = "Contains items, resources, and a random skin.",
		name = "Game Night Lucky Bag B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Game Night Lucky Bag B",
		tip = "",
		tip_open = 0,
		id = 84,
		money = 2999,
		name_display = "Game Night Lucky Bag B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai20",
		skin_inquire_relation = 86209,
		id_str = "com.yostaren.azurlane.luckybag47",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag47",
		extra_service_item = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81209,
				1
			}
		}
	},
	[85] = {
		descrip = "Contains items, resources, and a random skin.",
		name = "Resplendent Night Lucky Bag II Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Resplendent Night Lucky Bag II Rerun",
		tip = "",
		tip_open = 0,
		id = 85,
		money = 2999,
		name_display = "Resplendent Night Lucky Bag II Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai10",
		skin_inquire_relation = 86201,
		id_str = "com.yostaren.azurlane.luckybag48",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag48",
		extra_service_item = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81201,
				1
			}
		}
	},
	[86] = {
		descrip = "Contains a random character outfit, 2025 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2025 A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2025 A",
		tip = "",
		tip_open = 0,
		id = 86,
		money = 2999,
		name_display = "Spring Lucky Bag 2025 A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai21",
		skin_inquire_relation = 86210,
		id_str = "com.yostaren.azurlane.luckybag49",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag49",
		extra_service_item = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81210,
				1
			}
		}
	},
	[87] = {
		descrip = "Contains a random character outfit, 2025 Gems, and a large amount of supplies.",
		name = "Spring Lucky Bag 2025 B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Bag 2025 B",
		tip = "",
		tip_open = 0,
		id = 87,
		money = 2999,
		name_display = "Spring Lucky Bag 2025 B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai22",
		skin_inquire_relation = 86211,
		id_str = "com.yostaren.azurlane.luckybag51",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag51",
		extra_service_item = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81211,
				1
			}
		}
	},
	[88] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Spring Lucky Box 2024 A (Rerun)",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Box 2024 A (Rerun)",
		tip = "",
		tip_open = 0,
		id = 88,
		money = 2999,
		name_display = "Spring Lucky Box 2024 A (Rerun)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai11",
		skin_inquire_relation = 86202,
		id_str = "com.yostaren.azurlane.luckybag50",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag50",
		extra_service_item = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81202,
				1
			}
		}
	},
	[89] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Spring Lucky Box 2024 B (Rerun)",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Spring Lucky Box 2024 B (Rerun)",
		tip = "",
		tip_open = 0,
		id = 89,
		money = 2999,
		name_display = "Spring Lucky Box 2024 B (Rerun)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai12",
		skin_inquire_relation = 86203,
		id_str = "com.yostaren.azurlane.luckybag52",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag52",
		extra_service_item = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81203,
				1
			}
		}
	},
	[90] = {
		descrip = "Contains 1 of the following skins you do not yet own, chosen at random (if you already own all the listed skins, you will receive Gems instead), as well as other items.",
		name = "School Return Lucky Box",
		descrip_extra = "* The Lucky Box will be sent to your ingame Mail.\n* If you already own all the listed skins, you will receive Gems x680 instead.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "School Return Lucky Box",
		tip = "",
		tip_open = 0,
		id = 90,
		money = 699,
		name_display = "School Return Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai23",
		skin_inquire_relation = 86212,
		id_str = "com.yostaren.azurlane.luckybag55",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.luckybag55",
		extra_service_item = {
			{
				2,
				86212,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2025,
					3,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86212,
				1
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81212,
				1
			}
		}
	},
	[91] = {
		descrip = "Contains 1 random skin, 2025 Gems, and supplies.",
		name = "Swimsuit Lucky Bag 2025 A",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2025 A",
		tip = "",
		tip_open = 0,
		id = 91,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2025 A",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai24",
		skin_inquire_relation = 86213,
		id_str = "com.yostaren.azurlane.luckybag57",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag57",
		extra_service_item = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81213,
				1
			}
		}
	},
	[92] = {
		descrip = "Contains 1 random skin, 2024 Gems, and supplies.",
		name = "Swimsuit Lucky Bag 2024 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2024 Rerun",
		tip = "",
		tip_open = 0,
		id = 92,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2024 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai13",
		skin_inquire_relation = 86204,
		id_str = "com.yostaren.azurlane.luckybag58",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag58",
		extra_service_item = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81204,
				1
			}
		}
	},
	[93] = {
		descrip = "Contains 1 random skin, 2025 Gems, and supplies.",
		name = "Swimsuit Lucky Bag 2025 B",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Swimsuit Lucky Bag 2025 B",
		tip = "",
		tip_open = 0,
		id = 93,
		money = 2999,
		name_display = "Swimsuit Lucky Bag 2025 B",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai25",
		skin_inquire_relation = 86214,
		id_str = "com.yostaren.azurlane.luckybag59",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag59",
		extra_service_item = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81214,
				1
			}
		}
	},
	[94] = {
		descrip = "Contains 1 random skin, 2024 Gems, and supplies.",
		name = "Exquisite Lucky Envelope 2024 Rerun",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit.",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Exquisite Lucky Envelope 2024 Rerun",
		tip = "",
		tip_open = 0,
		id = 94,
		money = 2999,
		name_display = "Exquisite Lucky Envelope 2024 Rerun",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai14",
		skin_inquire_relation = 86205,
		id_str = "com.yostaren.azurlane.luckybag60",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag60",
		extra_service_item = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81205,
				1
			}
		}
	},
	[1000] = {
		descrip = "Purchase to unlock additional Fair Winds Cruise rewards, including an exclusive outfit for Yorktown and more! ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1000,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport2",
		extra_service_item = {
			{
				1,
				4001,
				1500
			},
			{
				8,
				59242,
				1
			}
		},
		time = {
			{
				{
					2021,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4001,
				1500
			}
		},
		sub_display = {
			7001,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1001] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards. ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1001,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport3",
		extra_service_item = {
			{
				1,
				4002,
				1500
			},
			{
				8,
				59254,
				1
			}
		},
		time = {
			{
				{
					2021,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4002,
				1500
			}
		},
		sub_display = {
			7002,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1002] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards. ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1002,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport4",
		extra_service_item = {
			{
				1,
				4003,
				1500
			},
			{
				8,
				59270,
				1
			}
		},
		time = {
			{
				{
					2022,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4003,
				1500
			}
		},
		sub_display = {
			7003,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1003] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards. ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1003,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport5",
		extra_service_item = {
			{
				1,
				4004,
				1500
			},
			{
				8,
				59281,
				1
			}
		},
		time = {
			{
				{
					2022,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4004,
				1500
			}
		},
		sub_display = {
			7004,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1004] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards. ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1004,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport6",
		extra_service_item = {
			{
				1,
				4005,
				1500
			},
			{
				8,
				59291,
				1
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4005,
				1500
			}
		},
		sub_display = {
			7005,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1005] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards. ",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards. ",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1005,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport7",
		extra_service_item = {
			{
				1,
				4006,
				1500
			},
			{
				8,
				59292,
				1
			}
		},
		time = {
			{
				{
					2022,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4006,
				1500
			}
		},
		sub_display = {
			7006,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1006] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1006,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport8",
		extra_service_item = {
			{
				1,
				4007,
				1500
			},
			{
				8,
				59294,
				1
			}
		},
		time = {
			{
				{
					2022,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4007,
				1500
			}
		},
		sub_display = {
			7007,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1007] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1007,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport10",
		extra_service_item = {
			{
				1,
				4008,
				1500
			},
			{
				8,
				59297,
				1
			}
		},
		time = {
			{
				{
					2022,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4008,
				1500
			}
		},
		sub_display = {
			7008,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1008] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1008,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport11",
		extra_service_item = {
			{
				1,
				4009,
				1500
			},
			{
				8,
				59299,
				1
			}
		},
		time = {
			{
				{
					2023,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4009,
				1500
			}
		},
		sub_display = {
			7009,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1009] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1009,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport12",
		extra_service_item = {
			{
				1,
				4010,
				1500
			},
			{
				8,
				59404,
				1
			}
		},
		time = {
			{
				{
					2023,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4010,
				1500
			}
		},
		sub_display = {
			7010,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1010] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2023.6)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1010,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport13",
		extra_service_item = {
			{
				1,
				4011,
				1500
			},
			{
				8,
				59456,
				1
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4011,
				1500
			}
		},
		sub_display = {
			7011,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1011] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2023.8)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1011,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport14",
		extra_service_item = {
			{
				1,
				4012,
				1500
			},
			{
				8,
				59468,
				1
			}
		},
		time = {
			{
				{
					2023,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4012,
				1500
			}
		},
		sub_display = {
			7012,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1012] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2023.10)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1012,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport15",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport15",
		extra_service_item = {
			{
				1,
				4013,
				1500
			},
			{
				8,
				59494,
				1
			}
		},
		time = {
			{
				{
					2023,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4013,
				1500
			}
		},
		sub_display = {
			7013,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1013] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2023.12)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1013,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport16",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport16",
		extra_service_item = {
			{
				1,
				4014,
				1500
			},
			{
				8,
				59511,
				1
			}
		},
		time = {
			{
				{
					2023,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4014,
				1500
			}
		},
		sub_display = {
			7014,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1014] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.2)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1014,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport17",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport17",
		extra_service_item = {
			{
				1,
				4015,
				1500
			},
			{
				8,
				59526,
				1
			}
		},
		time = {
			{
				{
					2024,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4015,
				1500
			}
		},
		sub_display = {
			7015,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1015] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.4)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1015,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport18",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport18",
		extra_service_item = {
			{
				1,
				4016,
				1500
			},
			{
				8,
				59541,
				1
			}
		},
		time = {
			{
				{
					2024,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4016,
				1500
			}
		},
		sub_display = {
			7016,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1016] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.6)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1016,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport19",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport19",
		extra_service_item = {
			{
				1,
				4017,
				1500
			},
			{
				8,
				59584,
				1
			}
		},
		time = {
			{
				{
					2024,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4017,
				1500
			}
		},
		sub_display = {
			7017,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1017] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.8)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1017,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport20",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport20",
		extra_service_item = {
			{
				1,
				4018,
				1500
			},
			{
				8,
				65001,
				1
			}
		},
		time = {
			{
				{
					2024,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4018,
				1500
			}
		},
		sub_display = {
			7018,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1018] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.10)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1018,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport21",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport21",
		extra_service_item = {
			{
				1,
				4019,
				1500
			},
			{
				8,
				65028,
				1
			}
		},
		time = {
			{
				{
					2024,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4019,
				1500
			}
		},
		sub_display = {
			7019,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1019] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2024.12)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1019,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport22",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport22",
		extra_service_item = {
			{
				1,
				4020,
				1500
			},
			{
				8,
				65057,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7020,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1020] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2025.2)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1020,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport23",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport23",
		extra_service_item = {
			{
				1,
				4021,
				1500
			},
			{
				8,
				65074,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7021,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1021] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass 2025.4",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1021,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport24",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport24",
		extra_service_item = {
			{
				1,
				4022,
				1500
			},
			{
				8,
				65086,
				1
			}
		},
		time = {
			{
				{
					2025,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7022,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1022] = {
		descrip = "Purchase to immediately gain 1,500 Progress Points, and also unlock additional Fair Winds Cruise rewards.",
		name = "Fair Winds Cruise Pass (2025.6)",
		descrip_extra = "You must complete certain missions to obtain these rewards.",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "Fair Winds Cruise Pass",
		tip = "",
		tip_open = 0,
		id = 1022,
		money = 999,
		name_display = "Fair Winds Cruise Pass",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 4,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.passport25",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.passport25",
		extra_service_item = {
			{
				1,
				4023,
				1500
			},
			{
				8,
				65100,
				1
			}
		},
		time = {
			{
				{
					2025,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7023,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2001] = {
		descrip = "Contains one PR Voucher - Series 1 and 343 General Blueprints - Series 1.",
		name = "PR Construction Pack - Series 1",
		descrip_extra = "",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "PR Construction Pack - Series 1",
		tip = "",
		tip_open = 0,
		id = 2001,
		money = 1599,
		name_display = "PR Construction Pack - Series 1",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech1_display",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond158",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond158",
		extra_service_item = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {}
	},
	[2002] = {
		descrip = "Contains:",
		name = "PR Voucher & Blueprint Bundle - Series 1",
		descrip_extra = "If you've already built all Series 1 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "Voucher & Blueprint Bundle",
		tip = "",
		tip_open = 0,
		id = 2002,
		money = 1599,
		name_display = "PR Voucher & Blueprint \n         Bundle - Series 1",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech1_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond158",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond158",
		extra_service_item = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40016,
				1
			}
		}
	},
	[2003] = {
		descrip = "Contains:",
		name = "PR Voucher - Series 1",
		descrip_extra = "If you've already built all Series 1 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "Voucher",
		tip = "",
		tip_open = 0,
		id = 2003,
		money = 999,
		name_display = "PR Voucher - Series 1",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech1_normal",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond159",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.diamond159",
		extra_service_item = {
			{
				2,
				40124,
				1
			}
		},
		display = {
			{
				2,
				40124,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40017,
				1
			}
		}
	},
	[2004] = {
		descrip = "Contains:",
		name = "PR Blueprint Pack - Series 1",
		descrip_extra = "Buy to receive 343 General Blueprints - Series 1.",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "Blueprints",
		tip = "",
		tip_open = 0,
		id = 2004,
		money = 699,
		name_display = "PR Blueprint Pack - Series 1",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech1_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond160",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostaren.azurlane.diamond160",
		extra_service_item = {
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40018,
				1
			}
		}
	},
	[2005] = {
		descrip = "Contains one PR Voucher - Series 2 and 343 General Blueprints - Series 2.",
		name = "PR Construction Pack - Series 2",
		descrip_extra = "",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "PR Construction Pack - Series 2",
		tip = "",
		tip_open = 0,
		id = 2005,
		money = 1599,
		name_display = "PR Construction Pack - Series 2",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech2_display",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond161",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.diamond161",
		extra_service_item = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {}
	},
	[2006] = {
		descrip = "Contains:",
		name = "PR Voucher & Blueprint Bundle - Series 2",
		descrip_extra = "If you've already built all Series 2 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "PR Voucher & Blueprint Bundle - Series 2",
		tip = "",
		tip_open = 0,
		id = 2006,
		money = 1599,
		name_display = "PR Voucher & Blueprint \n         Bundle - Series 2",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech2_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond161",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond161",
		extra_service_item = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40019,
				1
			}
		}
	},
	[2007] = {
		descrip = "Contains:",
		name = "PR Voucher - Series 2",
		descrip_extra = "If you've already built all Series 2 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "Voucher",
		tip = "",
		tip_open = 0,
		id = 2007,
		money = 999,
		name_display = "PR Voucher - Series 2",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech2_normal",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond162",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.diamond162",
		extra_service_item = {
			{
				2,
				40125,
				1
			}
		},
		display = {
			{
				2,
				40125,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40020,
				1
			}
		}
	},
	[2008] = {
		descrip = "Contains:",
		name = "PR Blueprint Pack - Series 2",
		descrip_extra = "Buy to receive 343 General Blueprints - Series 2.",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "Blueprints",
		tip = "",
		tip_open = 0,
		id = 2008,
		money = 699,
		name_display = "PR Blueprint Pack - Series 2",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech2_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond163",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostaren.azurlane.diamond163",
		extra_service_item = {
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40021,
				1
			}
		}
	},
	[2009] = {
		descrip = "Buying this pack will raise your Commander Level to 70 and grant you many useful items.",
		name = "Commander Level Boost Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 7,
		subject = "Commander Level Boost Pack",
		tip = "",
		tip_open = 0,
		id = 2009,
		money = 499,
		name_display = "Commander Level Boost Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "lv_70",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond164",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond164",
		extra_service_item = {
			{
				2,
				40126,
				1
			},
			{
				2,
				16502,
				200
			},
			{
				4,
				100011,
				4
			},
			{
				4,
				100001,
				4
			},
			{
				2,
				69001,
				1
			}
		},
		display = {
			{
				2,
				40126,
				1
			},
			{
				2,
				16502,
				200
			},
			{
				4,
				100011,
				4
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"lv_70",
				70
			}
		},
		drop_item = {
			{
				2,
				40022,
				1
			}
		}
	},
	[2010] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2010,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond165",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.diamond165",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2022,
					4,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2011] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2011,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond172",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.diamond172",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2022,
					9,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					11,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[100] = {
		descrip = "Contains 1 x Nep Ship skin, 3 x Nep Gear skins, and other rewards.",
		name = "Nep's Lucky Bag ",
		descrip_extra = "*Nep's Lucky Bag will appear in your mailbox. \n* If you draw an already owned ship skin, you will be refunded 80% of the gem cost.",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Nep's Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 100,
		money = 2999,
		name_display = "Nep's Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "usfudai1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond110",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond110",
		extra_service_item = {
			{
				2,
				69951,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30303,
				3
			},
			{
				2,
				15003,
				4
			},
			{
				2,
				20001,
				8
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2018,
					11,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69951,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30303,
				3
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[101] = {
		descrip = "Contains 1 x School Girl Ship skin, 3 x School Gear skins, and other rewards.",
		name = "Black Friday Lucky Bag ",
		descrip_extra = "*Black Friday Lucky Bag will appear in your mailbox. \n* If you draw an already owned ship skin, you will be refunded 100% of the gem cost.",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Black Friday Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 101,
		money = 2999,
		name_display = "Black Friday Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "usfudai2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond111",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond111",
		extra_service_item = {
			{
				2,
				69952,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30305,
				3
			},
			{
				2,
				15003,
				4
			},
			{
				2,
				20001,
				8
			},
			{
				1,
				6,
				100
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				54035,
				1
			}
		},
		time = {
			{
				{
					2018,
					11,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69952,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30305,
				3
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[102] = {
		descrip = "Contains 1 x Christmas Ship skin, 3 x Christmas Gear skins, and other rewards. ",
		name = "Christmas Lucky Bag ",
		descrip_extra = "*Christmas Lucky Bag will appear in your mailbox. \n* If you drew a ship skin that you already have, you will be refunded 80% of the gem cost. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Christmas Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 102,
		money = 2999,
		name_display = "Christmas Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond112",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond112",
		extra_service_item = {
			{
				2,
				69953,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30306,
				3
			},
			{
				2,
				15003,
				4
			},
			{
				2,
				20001,
				8
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2018,
					12,
					13
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69953,
				1
			},
			{
				1,
				4,
				2018
			},
			{
				2,
				30306,
				3
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[103] = {
		descrip = "Contains 1 x Promise Ring, 1 x Universal Bulin, 10 x Quick Finishers, and 5 x Full Courses",
		name = "Heartthrob Pack",
		descrip_extra = "*The pack contains 1 x Promise Ring, 1 x Universal Bulin, 10 x Quick Finishers, and 5 x Full Courses",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Heartthrob Pack",
		tip = "",
		tip_open = 0,
		id = 103,
		money = 999,
		name_display = "Heartthrob Pack",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai49",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond113",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond113",
		extra_service_item = {
			{
				2,
				15006,
				1
			},
			{
				4,
				100001,
				1
			},
			{
				2,
				15003,
				10
			},
			{
				2,
				50006,
				5
			}
		},
		time = {
			{
				{
					2018,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				15006,
				1
			},
			{
				2,
				15003,
				10
			},
			{
				2,
				50006,
				5
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[104] = {
		descrip = "Contains 1 x Mystery T4 Tech Pack, 6 x Wisdom Cubes, 3 x Quick Finishers, 100 x Gems, and 3000 x Coins",
		name = "Santa's Lucky Sack (Daily)",
		descrip_extra = "*The sack contains 1 x Mystery T4 Tech Pack, 6 x Wisdom Cubes, 3 x Quick Finishers, 100 x Gems, and 3000 x Coins",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Santa's Lucky Sack (Daily)",
		tip = "",
		tip_open = 0,
		id = 104,
		money = 499,
		name_display = "Santa's Lucky Sack (Daily)",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 99,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai50",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond114",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond114",
		extra_service_item = {
			{
				2,
				54039,
				1
			},
			{
				2,
				20001,
				6
			},
			{
				2,
				15003,
				3
			},
			{
				1,
				4,
				100
			},
			{
				1,
				1,
				3000
			}
		},
		time = {
			{
				{
					2018,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					31
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				54039,
				1
			},
			{
				1,
				4,
				100
			},
			{
				1,
				1,
				3000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[105] = {
		descrip = "Contains 1 x Kimono Ship skin, 2019 x Gems, and other rewards. ",
		name = "Shougatsu Lucky Bag (2019)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shogatsu Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 105,
		money = 2999,
		name_display = "Shougatsu Lucky Bag (2019)",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai51",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond115",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond115",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				17003,
				20
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					1,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					31
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69903,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				17003,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[106] = {
		descrip = "Contains 1 x Ship skin, 2019 x Gems, and other rewards. ",
		name = "Lunar New Year Lucky Bag (2019)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you’ve received a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 106,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2019)",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai52",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond116",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond116",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				18013,
				1
			},
			{
				2,
				18012,
				5
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					1,
					31
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69904,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				18013,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[107] = {
		descrip = "Contains 1 x random Ship skin (Winter‘s Crown), 3 x random Gear skins (Winter's Crown), and other rewards ",
		name = "Glacier Blast ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Glacier Blast ",
		tip = "",
		tip_open = 0,
		id = 107,
		money = 2999,
		name_display = "Glacier Blast ",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai53",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond117",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond117",
		extra_service_item = {
			{
				2,
				69954,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				30311,
				3
			},
			{
				2,
				15003,
				10
			},
			{
				2,
				20001,
				20
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					2,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69954,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				30311,
				3
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[108] = {
		descrip = "Contains 1 x random Ship skin (Hanami), 100 x Cognitive Chips, and other rewards",
		name = "Hanami Lucky Bag ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems.",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Hanami Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 108,
		money = 2999,
		name_display = "Hanami Lucky Bag ",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai54",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond118",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond118",
		extra_service_item = {
			{
				2,
				69955,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				100
			},
			{
				2,
				15003,
				10
			},
			{
				2,
				20001,
				20
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					4,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69955,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				100
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[109] = {
		descrip = "Contains 1 x Random Blueprint, 6 x Wisdom Cubes, 3 x Quick Finishers, 100 x Gems, and 3000 x Coins ",
		name = "Research Supply (daily) ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox.",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Research Supply (daily) ",
		tip = "",
		tip_open = 0,
		id = 109,
		money = 499,
		name_display = "Research Supply (daily) ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 99,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai55",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond119",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond119",
		extra_service_item = {
			{
				2,
				52001,
				1
			},
			{
				2,
				20001,
				6
			},
			{
				2,
				15003,
				3
			},
			{
				1,
				4,
				100
			},
			{
				1,
				1,
				3000
			}
		},
		time = {
			{
				{
					2019,
					5,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				52001,
				1
			},
			{
				1,
				4,
				100
			},
			{
				2,
				20001,
				6
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[110] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards ",
		name = "Scherzo Lucky Box ",
		descrip_extra = "*After your purchase, the Lucky Box will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Scherzo Lucky Box ",
		tip = "",
		tip_open = 0,
		id = 110,
		money = 2999,
		name_display = "Scherzo Lucky Box ",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe1_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond120",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond120",
		extra_service_item = {
			{
				2,
				69905,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					5,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69905,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[111] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards ",
		name = "1st Anniversary Lucky Bag ",
		descrip_extra = "*After your purchase, the Lucky Box will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's on sale value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "1st Anniversary Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 111,
		money = 2999,
		name_display = "1st Anniversary Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai56",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond121",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond121",
		extra_service_item = {
			{
				2,
				69956,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					8,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					9,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69905,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[112] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards ",
		name = "Yukata Lucky Bag",
		descrip_extra = "*After your purchase, the Lucky Box will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Yukata Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 112,
		money = 2999,
		name_display = "Yukata Lucky Bag",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai57",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond122",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond122",
		extra_service_item = {
			{
				2,
				69957,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				20013,
				1
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					8,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					9,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69905,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				20013,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[113] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards ",
		name = "Full Dress Lucky Bag ",
		descrip_extra = "*After your purchase, the Lucky Box will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Full Dress Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 113,
		money = 2999,
		name_display = "Full Dress Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai58",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond123",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond123",
		extra_service_item = {
			{
				2,
				69906,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					10,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69906,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[114] = {
		descrip = "Contains 1 x random Ship skin, 2450 x Gems, and other rewards ",
		name = "Black Friday Lucky Box ",
		descrip_extra = "*After your purchase, the Lucky Box will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Black Friday Lucky Box ",
		tip = "",
		tip_open = 0,
		id = 114,
		money = 2999,
		name_display = "Black Friday Lucky Box ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai59",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond124",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond124",
		extra_service_item = {
			{
				2,
				69958,
				1
			},
			{
				1,
				4,
				2450
			},
			{
				2,
				54035,
				1
			},
			{
				2,
				54006,
				3
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					11,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69958,
				1
			},
			{
				1,
				4,
				2450
			},
			{
				2,
				54035,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[115] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards ",
		name = "Christmas Lucky Bag ",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Christmas Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 115,
		money = 2999,
		name_display = "Christmas Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai60",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond125",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond125",
		extra_service_item = {
			{
				2,
				69960,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				1,
				2,
				2000
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69960,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				1,
				2,
				2000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[116] = {
		descrip = "Contains 1 x random Ship skin, 2020 x Gems, and other rewards. ",
		name = "Shougatsu Lucky Bag (2020)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Bag (2020)",
		tip = "",
		tip_open = 0,
		id = 116,
		money = 2999,
		name_display = "Shougatsu Lucky Bag (2020)",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond126",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond126",
		extra_service_item = {
			{
				2,
				69908,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69908,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[117] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards. ",
		name = "Shougatsu Lucky Bag (2019)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shougatsu Lucky Bag (2019)",
		tip = "",
		tip_open = 0,
		id = 117,
		money = 2999,
		name_display = "Shougatsu Lucky Bag (2019)",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond127",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond127",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69903,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[118] = {
		descrip = "Contains 1 x random Ship skin, 2020 x Gems, and other rewards. ",
		name = "Lunar New Year Lucky Bag (2020)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2020)",
		tip = "",
		tip_open = 0,
		id = 118,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2020)",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond128",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond128",
		extra_service_item = {
			{
				2,
				69909,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					1,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69909,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[119] = {
		descrip = "Contains 1 x random Ship skin, 2019 x Gems, and other rewards. ",
		name = "Lunar New Year Lucky Bag (2019)",
		descrip_extra = "*After your purchase, the Lucky Bag will be sent to your mailbox. \n*If you receive a ship skin that you already own, you will instead be given the corresponding skin's value in Gems. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Lunar New Year Lucky Bag (2019)",
		tip = "",
		tip_open = 0,
		id = 119,
		money = 2999,
		name_display = "Lunar New Year Lucky Bag (2019)",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond129",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond129",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					1,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69904,
				1
			},
			{
				1,
				4,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[120] = {
		descrip = "Contains 180 Gems, 2x Oil Reserve Supply (1000) Packs, and more!",
		name = "New Commanders Support Pack I",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "New Commanders Support Pack I",
		tip = "",
		tip_open = 0,
		id = 120,
		money = 299,
		name_display = "New Commanders Support Pack I",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond130",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond130",
		extra_service_item = {
			{
				1,
				14,
				180
			},
			{
				2,
				30121,
				2
			},
			{
				4,
				100001,
				1
			},
			{
				2,
				15001,
				30
			},
			{
				2,
				16002,
				4
			},
			{
				2,
				16012,
				4
			},
			{
				2,
				16022,
				4
			},
			{
				2,
				30112,
				30
			}
		},
		display = {
			{
				1,
				14,
				180
			},
			{
				2,
				30121,
				2
			},
			{
				4,
				100001,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40012,
				1
			}
		}
	},
	[121] = {
		descrip = "Contains 780 Gems, 2x T4 Gear Development Packs, 4x Oil Reserve Supply (1000) Packs, and more!",
		name = "New Commanders Support Pack II",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "New Commanders Support Pack II",
		tip = "",
		tip_open = 0,
		id = 121,
		money = 1199,
		name_display = "New Commanders Support Pack II",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond131",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond131",
		extra_service_item = {
			{
				1,
				14,
				780
			},
			{
				2,
				30202,
				2
			},
			{
				2,
				30121,
				4
			},
			{
				4,
				100001,
				1
			},
			{
				2,
				15001,
				50
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			},
			{
				2,
				16002,
				3
			},
			{
				2,
				16012,
				3
			},
			{
				2,
				16022,
				3
			},
			{
				2,
				30113,
				30
			},
			{
				2,
				30112,
				50
			}
		},
		display = {
			{
				1,
				14,
				780
			},
			{
				2,
				30202,
				2
			},
			{
				2,
				30121,
				4
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40013,
				1
			}
		}
	},
	[122] = {
		descrip = "Contains 1680 Gems, 4x T4 Gear Development Packs, 8x Oil Reserve Supply (1000) Packs, and more!",
		name = "New Commanders Support Pack III",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "New Commanders Support Pack III",
		tip = "",
		tip_open = 0,
		id = 122,
		money = 2599,
		name_display = "New Commanders Support Pack III",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond132",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond132",
		extra_service_item = {
			{
				1,
				14,
				1680
			},
			{
				2,
				30202,
				4
			},
			{
				2,
				30121,
				8
			},
			{
				4,
				100011,
				1
			},
			{
				2,
				59900,
				1000
			},
			{
				2,
				15001,
				80
			},
			{
				2,
				16003,
				5
			},
			{
				2,
				16013,
				5
			},
			{
				2,
				16023,
				5
			},
			{
				2,
				16002,
				5
			},
			{
				2,
				16012,
				5
			},
			{
				2,
				16022,
				5
			},
			{
				2,
				30113,
				100
			},
			{
				2,
				30112,
				100
			}
		},
		display = {
			{
				1,
				14,
				1680
			},
			{
				2,
				30202,
				4
			},
			{
				2,
				30121,
				8
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40014,
				1
			}
		}
	},
	[123] = {
		descrip = "Contains 1 x random Ship skin, 2020 x Gems, and other rewards. ",
		name = "Crimson Echoes' Lucky Bag",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Crimson Echoes' Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 123,
		money = 2999,
		name_display = "Crimson Echoes' Lucky Bag",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai61",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond133",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond133",
		extra_service_item = {
			{
				2,
				69961,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					4,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					5,
					6
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69961,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[124] = {
		descrip = "Contains 1 x random Ship skin, 2020 x Gems, and other rewards. ",
		name = "Night Out Lucky Bag ",
		descrip_extra = "The pack includes lots of material rewards. The Startup Pack will be sent to you via in-game mail, please check your mailbox to claim the pack. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Night Out Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 124,
		money = 2999,
		name_display = "Night Out Lucky Bag ",
		tag = 1,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe1_l",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond134",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond134",
		extra_service_item = {
			{
				2,
				69910,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69910,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[125] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Skybound Oratorio Lucky Bag",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Skybound Oratorio Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 125,
		money = 2999,
		name_display = "Skybound Oratorio Lucky Bag",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai63",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond135",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond135",
		extra_service_item = {
			{
				2,
				69962,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					6,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					25
				},
				{
					8,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69962,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[126] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Aurora Noctis Lucky Bag ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Aurora Noctis Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 126,
		money = 2999,
		name_display = "Aurora Noctis Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai64",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond136",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond136",
		extra_service_item = {
			{
				2,
				69963,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					8,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					8,
					19
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69963,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[127] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Summer Scherzo Lucky Bag ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Summer Scherzo Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 127,
		money = 2999,
		name_display = "Summer Scherzo Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai65",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond137",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond137",
		extra_service_item = {
			{
				2,
				69964,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					8,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					9,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69964,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[128] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Shining Star Lucky Bag ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Shining Star Lucky Bag ",
		tip = "",
		tip_open = 0,
		id = 128,
		money = 2999,
		name_display = "Shining Star Lucky Bag ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai66",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond139",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond139",
		extra_service_item = {
			{
				2,
				69965,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					10,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					11,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69965,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[129] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Azur Black Friday Lucky Box ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Azur Black Friday Lucky Box ",
		tip = "",
		tip_open = 0,
		id = 129,
		money = 2999,
		name_display = "Azur Black Friday Lucky Box ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai67",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond140",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond140",
		extra_service_item = {
			{
				2,
				69966,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				34
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					11,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					12,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69966,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				20001,
				34
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[130] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Crimson Black Friday Lucky Box ",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Crimson Black Friday Lucky Box ",
		tip = "",
		tip_open = 0,
		id = 130,
		money = 2999,
		name_display = "Crimson Black Friday Lucky Box ",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai68",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond141",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond141",
		extra_service_item = {
			{
				2,
				69967,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				34
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					11,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					12,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69967,
				1
			},
			{
				1,
				4,
				2020
			},
			{
				2,
				20001,
				34
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[131] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Dawn's Rime Lucky Pack",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Dawn's Rime Lucky Pack",
		tip = "",
		tip_open = 0,
		id = 131,
		money = 2999,
		name_display = "Dawn's Rime Lucky Pack",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai69",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond144",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond144",
		extra_service_item = {
			{
				2,
				69968,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					2,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69968,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[132] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Daedalian Hymn's Lucky Bag",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Daedalian Hymn's Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 132,
		money = 2999,
		name_display = "Daedalian Hymn's Lucky Bag",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai70",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond145",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond145",
		extra_service_item = {
			{
				2,
				69969,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					4,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					5,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69969,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[133] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Microlayer Medley Lucky Box 2021",
		descrip_extra = "*The contents of the Lucky Bag will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Microlayer Medley Lucky Box 2021",
		tip = "",
		tip_open = 0,
		id = 133,
		money = 2999,
		name_display = "Microlayer Medley Lucky Box 2021",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai71",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond149",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond149",
		extra_service_item = {
			{
				2,
				69970,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					8,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					9,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69970,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[134] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Black Friday Lucky Music Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Black Friday Lucky Music Box",
		tip = "",
		tip_open = 0,
		id = 134,
		money = 2999,
		name_display = "Black Friday Lucky Music Box",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai72",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond152",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond152",
		extra_service_item = {
			{
				2,
				69971,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					11,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					12,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69971,
				1
			},
			{
				1,
				4,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[135] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Abyssal Refrain Lucky Pack",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Abyssal Refrain Lucky Pack",
		tip = "",
		tip_open = 0,
		id = 135,
		money = 2999,
		name_display = "Abyssal Refrain Lucky Pack",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai73",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond157",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond157",
		extra_service_item = {
			{
				2,
				69972,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					2,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					3,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69972,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[136] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Crimson Offering Lucky Chalice",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Crimson Offering Lucky Chalice",
		tip = "",
		tip_open = 0,
		id = 136,
		money = 2999,
		name_display = "Crimson Offering Lucky Chalice",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai74",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond166",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond166",
		extra_service_item = {
			{
				2,
				69973,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					4,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					5,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69973,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[137] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Aquilifer's Ballade Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "Aquilifer's Ballade Lucky Box",
		tip = "",
		tip_open = 0,
		id = 137,
		money = 2999,
		name_display = "Aquilifer's Ballade Lucky Box",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai75",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond169",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond169",
		extra_service_item = {
			{
				2,
				69974,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					7,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					8,
					10
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69974,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[138] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "4th Anniversary Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "4th Anniversary Lucky Box",
		tip = "",
		tip_open = 0,
		id = 138,
		money = 2999,
		name_display = "4th Anniversary Lucky Box",
		tag = 2,
		akashi_pick = 0,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai76",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond171",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond171",
		extra_service_item = {
			{
				2,
				69975,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					8,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					8,
					31
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69975,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2014] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2014,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.pack1",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2023,
					4,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					7,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2015] = {
		descrip = "Contains one PR Voucher - Series 3 and 343 General Blueprints - Series 3.",
		name = "PR Construction Pack - Series 3",
		descrip_extra = "",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "PR Construction Pack - Series 3",
		tip = "",
		tip_open = 0,
		id = 2015,
		money = 1599,
		name_display = "PR Construction Pack - Series 3",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech3_display",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack4",
		extra_service_item = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {}
	},
	[2016] = {
		descrip = "Contains:",
		name = "PR Voucher & Blueprint Bundle - Series 3",
		descrip_extra = "If you've already built all Series 3 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "PR Voucher & Blueprint Bundle - Series 3",
		tip = "",
		tip_open = 0,
		id = 2016,
		money = 1599,
		name_display = "PR Voucher & Blueprint \n         Bundle - Series 3",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech3_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack4",
		extra_service_item = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40026,
				1
			}
		}
	},
	[2017] = {
		descrip = "Contains:",
		name = "PR Voucher Pack - Series 3",
		descrip_extra = "If you've already built all Series 3 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "Voucher",
		tip = "",
		tip_open = 0,
		id = 2017,
		money = 999,
		name_display = "PR Voucher - Series 3",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech3_normal",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.pack2",
		extra_service_item = {
			{
				2,
				40130,
				1
			}
		},
		display = {
			{
				2,
				40130,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40027,
				1
			}
		}
	},
	[2018] = {
		descrip = "Contains:",
		name = "PR Blueprint Pack - Series 3",
		descrip_extra = "Buy to receive 343 General Blueprints - Series 3.",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "Blueprints",
		tip = "",
		tip_open = 0,
		id = 2018,
		money = 699,
		name_display = "PR Voucher - Series 3",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech3_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostaren.azurlane.pack3",
		extra_service_item = {
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40028,
				1
			}
		}
	},
	[2019] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2019,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.pack5",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2023,
					11,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					4,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2020] = {
		descrip = "Contains 3880 Gems, 1 Specialized Bulin Custom MKIII and other rewards.",
		name = "Premium Winter Gift Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Premium Winter Gift Pack",
		tip = "",
		tip_open = 0,
		id = 2020,
		money = 3699,
		name_display = "Premium Winter Gift Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "dongzhi3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.winterpack1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.winterpack1",
		extra_service_item = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				16502,
				60
			},
			{
				2,
				30113,
				150
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40029,
				1
			}
		}
	},
	[2022] = {
		descrip = "Contains 10 Wisdom Cubes.",
		name = "Wisdom Cube Supply Pack I",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Wisdom Cube Supply Pack I",
		tip = "",
		tip_open = 0,
		id = 2022,
		money = 199,
		name_display = "Wisdom Cube Supply Pack I",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "mofangzhiyuan1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.cubepack1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.cubepack1",
		extra_service_item = {
			{
				2,
				20001,
				10
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				10
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40031,
				1
			}
		}
	},
	[2023] = {
		descrip = "Contains 20 Wisdom Cubes.",
		name = "Wisdom Cube Supply Pack II",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Wisdom Cube Supply Pack II",
		tip = "",
		tip_open = 0,
		id = 2023,
		money = 499,
		name_display = "Wisdom Cube Supply Pack II",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "mofangzhiyuan2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.cubepack2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.cubepack2",
		extra_service_item = {
			{
				2,
				20001,
				20
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				20
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40032,
				1
			}
		}
	},
	[2024] = {
		descrip = "Contains 30 Wisdom Cubes.",
		name = "Wisdom Cube Supply Pack III",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Wisdom Cube Supply Pack III",
		tip = "",
		tip_open = 0,
		id = 2024,
		money = 799,
		name_display = "Wisdom Cube Supply Pack III",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "mofangzhiyuan3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.cubepack3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.cubepack3",
		extra_service_item = {
			{
				2,
				20001,
				30
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				30
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40033,
				1
			}
		}
	},
	[2025] = {
		descrip = "Contains 1 Wisdom Cube and 1200 Oil.",
		name = "Daily Sortie Refuel Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "Daily Sortie Refuel Pack",
		tip = "",
		tip_open = 0,
		id = 2025,
		money = 99,
		name_display = "Daily Sortie Refuel Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 4,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "richang",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.dailybag1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.dailybag1",
		extra_service_item = {
			{
				1,
				2,
				1200
			},
			{
				2,
				20001,
				1
			}
		},
		display = {
			{
				1,
				2,
				1200
			},
			{
				2,
				20001,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40043,
				1
			}
		}
	},
	[2026] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2026,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.pack6",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2024,
					4,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					6
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2027] = {
		descrip = "Contains one PR Voucher - Series 4 and 343 General Blueprints - Series 4.",
		name = "PR Construction Pack - Series 4",
		descrip_extra = "",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR Construction Pack - Series 4",
		tip = "",
		tip_open = 0,
		id = 2027,
		money = 1599,
		name_display = "PR Construction Pack - Series 4",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech4_display",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack9",
		extra_service_item = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {}
	},
	[2028] = {
		descrip = "Contains:",
		name = "PR Voucher & Blueprint Bundle - Series 4",
		descrip_extra = "If you've already built all Series 4 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR Voucher & Blueprint Bundle - Series 4",
		tip = "",
		tip_open = 0,
		id = 2028,
		money = 1599,
		name_display = "PR Voucher & Blueprint \n         Bundle - Series 4",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech4_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack9",
		extra_service_item = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40044,
				1
			}
		}
	},
	[2029] = {
		descrip = "Contains:",
		name = "PR Voucher - Series 4",
		descrip_extra = "If you've already built all Series 4 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR Voucher - Series 4",
		tip = "",
		tip_open = 0,
		id = 2029,
		money = 999,
		name_display = "PR Voucher Pack - Series 4",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech4_normal",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.pack7",
		extra_service_item = {
			{
				2,
				40139,
				1
			}
		},
		display = {
			{
				2,
				40139,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40045,
				1
			}
		}
	},
	[2030] = {
		descrip = "Contains:",
		name = "PR Blueprint Pack - Series 4",
		descrip_extra = "Buy to receive 343 General Blueprints - Series 4.",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR Blueprint Pack - Series 4",
		tip = "",
		tip_open = 0,
		id = 2030,
		money = 699,
		name_display = "PR Blueprint Pack - Series 4",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech4_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostaren.azurlane.pack8",
		extra_service_item = {
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40046,
				1
			}
		}
	},
	[2031] = {
		descrip = "Contains an Outfit Selection Voucher, Wisdom Cubes, T2 EXP Data Packs, and more.",
		name = "Outfit Selection Pack (Shimakaze)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Outfit Selection Pack (Shimakaze)",
		tip = "",
		tip_open = 0,
		id = 2031,
		money = 1799,
		name_display = "Outfit Selection Pack (Shimakaze)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "Great\nDeal",
		picture = "daofeng_package",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack11",
		extra_service_item = {
			{
				2,
				59553,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2024,
					7,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					8,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59553,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40047,
				1
			}
		}
	},
	[2032] = {
		descrip = "Contains a new combat UI theme.",
		name = "Iridescent Fantasy Pack",
		descrip_extra = "",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "Iridescent Fantasy Pack",
		tip = "",
		tip_open = 0,
		id = 2032,
		money = 1199,
		name_display = "Iridescent Fantasy Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack12",
		extra_service_item = {
			{
				31,
				103,
				1
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2033] = {
		descrip = "Contains a new combat UI theme.",
		name = "Iridescent Fantasy Pack (Basic)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "Iridescent Fantasy Pack (Basic)",
		tip = "",
		tip_open = 0,
		id = 2033,
		money = 1199,
		name_display = "Iridescent Fantasy Pack (Basic)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack12",
		extra_service_item = {
			{
				31,
				103,
				1
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40048,
				1
			}
		}
	},
	[2034] = {
		descrip = "Contains a new combat UI theme and Gems x 3,060.",
		name = "Iridescent Fantasy Pack (Premium)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "Iridescent Fantasy Pack (Premium)",
		tip = "",
		tip_open = 0,
		id = 2034,
		money = 3699,
		name_display = "Iridescent Fantasy Pack (Premium)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack13",
		extra_service_item = {
			{
				31,
				103,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40049,
				1
			}
		}
	},
	[2035] = {
		descrip = "Contains an Outfit Selection Voucher, Wisdom Cubes, T2 EXP Data Packs, and more.",
		name = "Outfit Selection Pack (Ulrich von Hutten)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 2,
		subject = "Outfit Selection Pack (Ulrich von Hutten)",
		tip = "",
		tip_open = 0,
		id = 2035,
		money = 1799,
		name_display = "Outfit Selection Pack (Ulrich von Hutten)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack14",
		extra_service_item = {
			{
				2,
				59554,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2024,
					10,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59554,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40050,
				1
			}
		}
	},
	[2036] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack (2024.11)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2036,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack15",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.pack15",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2024,
					11,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2037] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Christmas",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "Battle UI Pack - Christmas",
		tip = "",
		tip_open = 0,
		id = 2037,
		money = 1199,
		name_display = "Battle UI Pack - Christmas",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack17",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack17",
		extra_service_item = {
			{
				31,
				201,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2038] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Christmas (Basic)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "Battle UI Pack - Christmas (Basic)",
		tip = "",
		tip_open = 0,
		id = 2038,
		money = 1199,
		name_display = "Battle UI Pack - Christmas (Basic)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack17",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack17",
		extra_service_item = {
			{
				31,
				201,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40051,
				1
			}
		}
	},
	[2039] = {
		descrip = "Contains a new combat UI theme and Gems x 3,060.",
		name = "Battle UI Pack - Christmas (Premium)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "Battle UI Pack - Christmas (Premium)",
		tip = "",
		tip_open = 0,
		id = 2039,
		money = 3699,
		name_display = "Battle UI Pack - Christmas (Premium)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack18",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack18",
		extra_service_item = {
			{
				31,
				201,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40052,
				1
			}
		}
	},
	[2040] = {
		descrip = "Contains 3880 Gems, 1 Specialized Bulin Custom MKIII and other rewards.",
		name = "Premium Winter Gift Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "Premium Winter Gift Pack",
		tip = "",
		tip_open = 0,
		id = 2040,
		money = 3699,
		name_display = "Premium Winter Gift Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "dongzhi3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack16",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack16",
		extra_service_item = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				16502,
				60
			},
			{
				2,
				30113,
				150
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40053,
				1
			}
		}
	},
	[2041] = {
		descrip = "Contains an Outfit Voucher, Wisdom Cubes, T2 EXP Data Packs, and more.",
		name = "Outfit Pack (Kronshtadt)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Outfit Pack (Kronshtadt)",
		tip = "",
		tip_open = 0,
		id = 2041,
		money = 1799,
		name_display = "Outfit Pack (Kronshtadt)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "Great\nDeal",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack19",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack19",
		extra_service_item = {
			{
				2,
				59561,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2025,
					1,
					9
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59561,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40050,
				1
			}
		}
	},
	[2042] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack – Pharaoh",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = "Battle UI Pack – Pharaoh",
		tip = "",
		tip_open = 0,
		id = 2042,
		money = 1199,
		name_display = "Battle UI Pack – Pharaoh",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack20",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack20",
		extra_service_item = {
			{
				31,
				202,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2043] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Pharaoh (Basic)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = " Battle UI Pack - Pharaoh (Basic)",
		tip = "",
		tip_open = 0,
		id = 2043,
		money = 1199,
		name_display = "Battle UI Pack - Pharaoh (Basic)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack20",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack20",
		extra_service_item = {
			{
				31,
				202,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40055,
				1
			}
		}
	},
	[2044] = {
		descrip = "Contains a new combat UI theme and Gems x 3,060.",
		name = "Battle UI Pack - Pharaoh (Premium)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = "Battle UI Pack - Pharaoh (Premium)",
		tip = "",
		tip_open = 0,
		id = 2044,
		money = 3699,
		name_display = "Battle UI Pack - Pharaoh (Premium)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack21",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack21",
		extra_service_item = {
			{
				31,
				202,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40056,
				1
			}
		}
	},
	[2045] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Genetic Origin",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "Battle UI Pack - Genetic Origin",
		tip = "",
		tip_open = 0,
		id = 2045,
		money = 1199,
		name_display = "Battle UI Pack - Genetic Origin",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack22",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack22",
		extra_service_item = {
			{
				31,
				203,
				1
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2046] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Genetic Origin (Basic)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "Battle UI Pack - Genetic Origin (Basic)",
		tip = "",
		tip_open = 0,
		id = 2046,
		money = 1199,
		name_display = "Battle UI Pack - Genetic Origin (Basic)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack22",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack22",
		extra_service_item = {
			{
				31,
				203,
				1
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40057,
				1
			}
		}
	},
	[2047] = {
		descrip = "Contains a new combat UI theme and Gems x 3,060.",
		name = "Battle UI Pack - Genetic Origin (Premium)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "Battle UI Pack - Genetic Origin (Premium)",
		tip = "",
		tip_open = 0,
		id = 2047,
		money = 3699,
		name_display = "Battle UI Pack - Genetic Origin (Premium)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack23",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack23",
		extra_service_item = {
			{
				31,
				203,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40058,
				1
			}
		}
	},
	[2048] = {
		descrip = "Contains an Outfit Voucher, Wisdom Cubes, T2 EXP Data Packs, and more.",
		name = "Outfit Pack (Vanguard)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Outfit Pack (Vanguard)",
		tip = "",
		tip_open = 0,
		id = 2048,
		money = 1799,
		name_display = "Outfit Pack (Vanguard)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "Great\nDeal",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack24",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack24",
		extra_service_item = {
			{
				2,
				59564,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2025,
					4,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					23
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59564,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40059,
				1
			}
		}
	},
	[2049] = {
		descrip = "Buy to receive a large amount of Skill Books.",
		name = "Skill Book Pack",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "Skill Book Pack",
		tip = "",
		tip_open = 0,
		id = 2049,
		money = 299,
		name_display = "Skill Book Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack25",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostaren.azurlane.pack25",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2025,
					4,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					11,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	},
	[2050] = {
		descrip = "Contains a new combat UI theme.",
		name = "Battle UI Pack - Seaside Splash",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "Battle UI Pack - Seaside Splash",
		tip = "",
		tip_open = 0,
		id = 2050,
		money = 1199,
		name_display = "Battle UI Pack - Seaside Splash",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui5",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack26",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack26",
		extra_service_item = {
			{
				31,
				204,
				1
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2051] = {
		descrip = "Contains the Battle UI - Seaside Splash theme and 1,000 Coins.",
		name = "Battle UI Pack - Seaside Splash (Basic)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "Battle UI Pack - Seaside Splash (Basic)",
		tip = "",
		tip_open = 0,
		id = 2051,
		money = 1199,
		name_display = "Battle UI Pack - Seaside Splash (Basic)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui5",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack26",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack26",
		extra_service_item = {
			{
				31,
				204,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40060,
				1
			}
		}
	},
	[2052] = {
		descrip = "Contains the Battle UI - Seaside Splash theme and 3,060 Gems.",
		name = "Battle UI Pack - Seaside Splash (Premium)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "Battle UI Pack - Seaside Splash (Premium)",
		tip = "",
		tip_open = 0,
		id = 2052,
		money = 3699,
		name_display = "Battle UI Pack - Seaside Splash (Premium)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "",
		picture = "ui5",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack27",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack27",
		extra_service_item = {
			{
				31,
				204,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40061,
				1
			}
		}
	},
	[2053] = {
		descrip = "Contains one PR Voucher - Series 5 and 343 General Blueprints - Series 5.",
		name = "PR Construction Pack - Series 5",
		descrip_extra = "",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR Construction Pack - Series 5",
		tip = "",
		tip_open = 0,
		id = 2053,
		money = 1599,
		name_display = "PR Construction Pack - Series 5",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech5_display",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack30",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostaren.azurlane.pack30",
		extra_service_item = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {}
	},
	[2054] = {
		descrip = "Contains:",
		name = "PR Voucher & Blueprint Bundle - Series 5",
		descrip_extra = "If you've already built all Series 5 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR Voucher & Blueprint Bundle - Series 5",
		tip = "",
		tip_open = 0,
		id = 2054,
		money = 1599,
		name_display = "PR Voucher & Blueprint \n         Bundle - Series 5",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech5_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack30",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.pack30",
		extra_service_item = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40062,
				1
			}
		}
	},
	[2055] = {
		descrip = "Contains:",
		name = "PR Voucher - Series 5",
		descrip_extra = "If you've already built all Series 5 PRs, the contents will be exchanged for other items. Tap the icon to view the item table.",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR Voucher - Series 5",
		tip = "",
		tip_open = 0,
		id = 2055,
		money = 999,
		name_display = "PR Voucher Pack - Series 5",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech5_normal",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack28",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.pack28",
		extra_service_item = {
			{
				2,
				40140,
				1
			}
		},
		display = {
			{
				2,
				40140,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40063,
				1
			}
		}
	},
	[2056] = {
		descrip = "Contains:",
		name = "PR Blueprint Pack - Series 5",
		descrip_extra = "Buy to receive 343 General Blueprints - Series 5.",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR Blueprint Pack - Series 5",
		tip = "",
		tip_open = 0,
		id = 2056,
		money = 699,
		name_display = "PR Blueprint Pack - Series 5",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "tech",
		limit_type = 3,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "tech5_promotion",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.pack29",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostaren.azurlane.pack29",
		extra_service_item = {
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40064,
				1
			}
		}
	},
	[5011] = {
		descrip = "Contains 60x Gems, 2x Special General Blueprints - Series 6.",
		name = "Daily Paid Pack (Day 1)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 1)",
		tip = "",
		tip_open = 0,
		id = 5011,
		money = 99,
		name_display = "Daily Paid Pack (Day 1)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day1",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag8",
		extra_service_item = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81410,
				1
			}
		}
	},
	[5012] = {
		descrip = "Contains 200x Gems.",
		name = "Daily Paid Pack (Day 2)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 2)",
		tip = "",
		tip_open = 0,
		id = 5012,
		money = 99,
		name_display = "Daily Paid Pack (Day 2)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day2",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag9",
		extra_service_item = {
			{
				1,
				14,
				200
			}
		},
		time = {
			{
				{
					2024,
					11,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				200
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81411,
				1
			}
		}
	},
	[5013] = {
		descrip = "Contains 200x Cognitive Chips, 5x Universal T4 Parts.",
		name = "Daily Paid Pack (Day 3)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 3)",
		tip = "",
		tip_open = 0,
		id = 5013,
		money = 99,
		name_display = "Daily Paid Pack (Day 3)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day3",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag10",
		extra_service_item = {
			{
				2,
				30114,
				5
			},
			{
				2,
				15008,
				200
			}
		},
		time = {
			{
				{
					2024,
					11,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				30114,
				5
			},
			{
				2,
				15008,
				200
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81412,
				1
			}
		}
	},
	[5014] = {
		descrip = "Contains 60x Gems, 1x Prototype Bulin MKII.",
		name = "Daily Paid Pack (Day 4)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 4)",
		tip = "",
		tip_open = 0,
		id = 5014,
		money = 99,
		name_display = "Daily Paid Pack (Day 4)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day4",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag11",
		extra_service_item = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					11,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81413,
				1
			}
		}
	},
	[5015] = {
		descrip = "Contains 60x T2 EXP Data Packs.",
		name = "Daily Paid Pack (Day 5)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 5)",
		tip = "",
		tip_open = 0,
		id = 5015,
		money = 99,
		name_display = "Daily Paid Pack (Day 5)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day5",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag12",
		extra_service_item = {
			{
				2,
				16502,
				60
			}
		},
		time = {
			{
				{
					2024,
					11,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16502,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81414,
				1
			}
		}
	},
	[5016] = {
		descrip = "Contains 10x Wisdom Cubes, 5x Quick Finishers.",
		name = "Daily Paid Pack (Day 6)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 6)",
		tip = "",
		tip_open = 0,
		id = 5016,
		money = 99,
		name_display = "Daily Paid Pack (Day 6)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day6",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag13",
		extra_service_item = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		time = {
			{
				{
					2024,
					11,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81415,
				1
			}
		}
	},
	[5017] = {
		descrip = "Contains 60x Gems, 2x Special General Blueprints - Series 7.",
		name = "Daily Paid Pack (Day 7)",
		descrip_extra = "*After your purchase, the Pack will be sent to your mailbox.",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "Daily Paid Pack (Day 7)",
		tip = "",
		tip_open = 0,
		id = 5017,
		money = 99,
		name_display = "Daily Paid Pack (Day 7)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day7",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.bfdailybag14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.bfdailybag14",
		extra_service_item = {
			{
				2,
				42066,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					11,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81416,
				1
			}
		}
	},
	[139] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Black Friday Lucky Bag (2022)",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Black Friday Lucky Bag (2022)",
		tip = "",
		tip_open = 0,
		id = 139,
		money = 2999,
		name_display = "Black Friday Lucky Bag (2022)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai77",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.diamond177",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.diamond177",
		extra_service_item = {
			{
				2,
				69976,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					11,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					11,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69976,
				1
			},
			{
				1,
				4,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40024,
				1
			}
		}
	},
	[140] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "New Semester Lucky Pack",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "New Semester Lucky Pack",
		tip = "",
		tip_open = 0,
		id = 140,
		money = 2999,
		name_display = "New Semester Lucky Pack",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai78",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag8",
		extra_service_item = {
			{
				2,
				69978,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					2,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					3,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69978,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40025,
				1
			}
		}
	},
	[141] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Onsen Souvenir Lucky Bag",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Onsen Souvenir Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 141,
		money = 2999,
		name_display = "Onsen Souvenir Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai79",
		skin_inquire_relation = 0,
		id_str = "com.yostaren.azurlane.luckybag9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag9",
		extra_service_item = {
			{
				2,
				69979,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					3,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					4,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69979,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				70052,
				1
			}
		}
	},
	[142] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Office Hour Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Office Hour Lucky Box",
		tip = "",
		tip_open = 0,
		id = 142,
		money = 2999,
		name_display = "Office Hour Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai80",
		skin_inquire_relation = 69980,
		id_str = "com.yostaren.azurlane.luckybag13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag13",
		extra_service_item = {
			{
				2,
				69980,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					6,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					7,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69980,
				1
			},
			{
				1,
				4,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40985,
				1
			}
		}
	},
	[143] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "5th Anniversary Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "5th Anniversary Lucky Box",
		tip = "",
		tip_open = 0,
		id = 143,
		money = 2999,
		name_display = "5th Anniversary Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai81",
		skin_inquire_relation = 69981,
		id_str = "com.yostaren.azurlane.luckybag14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag14",
		extra_service_item = {
			{
				2,
				69981,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					8,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					8,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69981,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40986,
				1
			}
		}
	},
	[144] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Halloween Lucky Box 2023",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Halloween Lucky Box 2023",
		tip = "",
		tip_open = 0,
		id = 144,
		money = 2999,
		name_display = "Halloween Lucky Box 2023",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai82",
		skin_inquire_relation = 69982,
		id_str = "com.yostaren.azurlane.luckybag18",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag18",
		extra_service_item = {
			{
				2,
				69982,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					10,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					11,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69982,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40987,
				1
			}
		}
	},
	[145] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Black Friday Lucky Bag (2023)",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 2,
		limit_group = 0,
		type_order = 2,
		subject = "Black Friday Lucky Bag (2023)",
		tip = "",
		tip_open = 0,
		id = 145,
		money = 2999,
		name_display = "Black Friday Lucky Bag (2023)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai82",
		skin_inquire_relation = 69983,
		id_str = "com.yostaren.azurlane.luckybag19",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag19",
		extra_service_item = {
			{
				2,
				69983,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					11,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					11,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69983,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40997,
				1
			}
		}
	},
	[146] = {
		descrip = "Contains a random character outfit, 2024 Gems, and a large amount of supplies.",
		name = "Cyber City Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Cyber City Lucky Box",
		tip = "",
		tip_open = 0,
		id = 146,
		money = 2999,
		name_display = "Cyber City Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai84",
		skin_inquire_relation = 86400,
		id_str = "com.yostaren.azurlane.luckybag28",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag28",
		extra_service_item = {
			{
				2,
				86400,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					2,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86400,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81400,
				1
			}
		}
	},
	[147] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Adventurer's Lucky Chest",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Adventurer's Lucky Chest",
		tip = "",
		tip_open = 0,
		id = 147,
		money = 2999,
		name_display = "Adventurer's Lucky Chest",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai85",
		skin_inquire_relation = 86401,
		id_str = "com.yostaren.azurlane.luckybag29",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag29",
		extra_service_item = {
			{
				2,
				86401,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					3,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					4,
					10
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86401,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81401,
				1
			}
		}
	},
	[148] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Lavish Lucky Boombox",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Lavish Lucky Boombox",
		tip = "",
		tip_open = 0,
		id = 148,
		money = 2999,
		name_display = "Lavish Lucky Boombox",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai86",
		skin_inquire_relation = 86402,
		id_str = "com.yostaren.azurlane.luckybag30",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag30",
		extra_service_item = {
			{
				2,
				86402,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					4,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					5,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86402,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81402,
				1
			}
		}
	},
	[149] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "School Time Lucky Bag",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "School Time Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 149,
		money = 2999,
		name_display = "School Time Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai87",
		skin_inquire_relation = 86403,
		id_str = "com.yostaren.azurlane.luckybag35",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag35",
		extra_service_item = {
			{
				2,
				86403,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					6,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86403,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81403,
				1
			}
		}
	},
	[150] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "High Speed Lucky Bag",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "High Speed Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 150,
		money = 2999,
		name_display = "High Speed Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai88",
		skin_inquire_relation = 86404,
		id_str = "com.yostaren.azurlane.luckybag36",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag36",
		extra_service_item = {
			{
				2,
				86404,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					7,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					8,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86404,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81404,
				1
			}
		}
	},
	[151] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "6th Anniversary Lucky Barrel",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "6th Anniversary Lucky Barrel",
		tip = "",
		tip_open = 0,
		id = 151,
		money = 2999,
		name_display = "6th Anniversary Lucky Barrel",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai89",
		skin_inquire_relation = 86405,
		id_str = "com.yostaren.azurlane.luckybag37",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag37",
		extra_service_item = {
			{
				2,
				86405,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					8,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					8,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86405,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81405,
				1
			}
		}
	},
	[152] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Halloween Lucky Box 2024",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Halloween Lucky Box 2024",
		tip = "",
		tip_open = 0,
		id = 152,
		money = 2999,
		name_display = "Halloween Lucky Box 2024",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai90",
		skin_inquire_relation = 86406,
		id_str = "com.yostaren.azurlane.luckybag42",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag42",
		extra_service_item = {
			{
				2,
				86406,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					10,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					6
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86406,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81406,
				1
			}
		}
	},
	[153] = {
		descrip = "Contains a random unowned rerun L2D outfit and other supplies",
		name = "Live2D Surprise Lucky Bag (2024)",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Black Friday Lucky Bag (2024)",
		tip = "",
		tip_open = 0,
		id = 153,
		money = 999,
		name_display = "Live2D Surprise Lucky Bag (2024)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai_L2d_new",
		skin_inquire_relation = 86407,
		id_str = "com.yostaren.azurlane.luckybag44",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostaren.azurlane.luckybag44",
		extra_service_item = {
			{
				2,
				86407,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86407,
				1
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81417,
				1
			}
		}
	},
	[154] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Black Friday Lucky Bag (2024)",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Black Friday Lucky Bag (2024)",
		tip = "",
		tip_open = 0,
		id = 154,
		money = 2999,
		name_display = "Black Friday Lucky Bag (2024)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai92",
		skin_inquire_relation = 86408,
		id_str = "com.yostaren.azurlane.luckybag43",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag43",
		extra_service_item = {
			{
				2,
				86408,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					11,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					12,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86408,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81418,
				1
			}
		}
	},
	[155] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Nile Colors Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Nile Colors Lucky Box",
		tip = "",
		tip_open = 0,
		id = 155,
		money = 2999,
		name_display = "Nile Colors Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai93",
		skin_inquire_relation = 86413,
		id_str = "com.yostaren.azurlane.luckybag53",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag53",
		extra_service_item = {
			{
				2,
				86413,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81422,
				1
			}
		}
	},
	[156] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Hospital Adventure Lucky Bag",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Hospital Adventure Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 156,
		money = 2999,
		name_display = "Hospital Adventure Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai94",
		skin_inquire_relation = 86414,
		id_str = "com.yostaren.azurlane.luckybag54",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag54",
		extra_service_item = {
			{
				2,
				86414,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86414,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81423,
				1
			}
		}
	},
	[157] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Pajama Party Lucky Bag",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Pajama Party Lucky Bag",
		tip = "",
		tip_open = 0,
		id = 157,
		money = 2999,
		name_display = "Pajama Party Lucky Bag",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai95",
		skin_inquire_relation = 86415,
		id_str = "com.yostaren.azurlane.luckybag56",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag56",
		extra_service_item = {
			{
				2,
				86415,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					4,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					5,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86415,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81424,
				1
			}
		}
	},
	[158] = {
		descrip = "Contains a random character outfit and a large amount of supplies ",
		name = "Office Cabinet Lucky Box",
		descrip_extra = "*The contents of the Lucky Box will be sent to your ingame inbox. Please remember to check it. \n*It is possible to obtain an outfit you already own. In such cases, you will instead receive Gems equivalent to the value of that outfit. ",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "Office Cabinet Lucky Box",
		tip = "",
		tip_open = 0,
		id = 158,
		money = 2999,
		name_display = "Office Cabinet Lucky Box",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai96",
		skin_inquire_relation = 86416,
		id_str = "com.yostaren.azurlane.luckybag61",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostaren.azurlane.luckybag61",
		extra_service_item = {
			{
				2,
				86416,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					6,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86416,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81426,
				1
			}
		}
	}
}
