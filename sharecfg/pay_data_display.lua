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
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
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
		40,
		41,
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
		58,
		59,
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
		95,
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
		1023,
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
		2014,
		2015,
		2016,
		2017,
		2018,
		2019,
		2020,
		2021,
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
		5001,
		5002,
		5003,
		5004,
		5005,
		5006,
		5007,
		5011,
		5012,
		5013,
		5014,
		5015,
		5016,
		5017
	}
}, confHX)
pg.base = pg.base or {}
pg.base.pay_data_display = {
	{
		descrip = "ダイヤ$1個+30日間毎日資源が貰える",
		name = "貿易許可証（30日間）",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "貿易許可証（30日間）",
		tip = "",
		tip_open = 0,
		id = 1,
		money = 1000,
		name_display = "貿易許可証（30日間）",
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
		id_str = "com.bilibili.blhx.zuanshi102",
		first_pay_double = 0,
		extra_gem = 10,
		limit_arg = 7,
		airijp_id = "com.yostarjp.azurlane.passport1",
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
		descrip = "ダイヤなどのアイテムを入手可能",
		name = "新規着任パック",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "新規着任パック",
		tip = "",
		tip_open = 0,
		id = 2,
		money = 160,
		name_display = "新規着任パック",
		tag = 1,
		akashi_pick = 1,
		gem = 80,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 1,
		package_tag = "新人 ",
		picture = "boxNewplayer",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi101",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond101",
		extra_service_item = {
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
				80
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
		descrip = "+おまけ$1個",
		name = "ダイヤ一摘み",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ一摘み",
		tip = "",
		tip_open = 0,
		id = 3,
		money = 160,
		name_display = "ダイヤ一摘み",
		tag = 0,
		akashi_pick = 0,
		gem = 80,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 99,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "1",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi1",
		first_pay_double = 1,
		extra_gem = 0,
		limit_arg = 10,
		airijp_id = "com.yostarjp.azurlane.diamond1",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "+おまけ$1個",
		name = "ダイヤ一握り",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ一握り",
		tip = "",
		tip_open = 0,
		id = 4,
		money = 650,
		name_display = "ダイヤ一握り",
		tag = 0,
		akashi_pick = 0,
		gem = 325,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 99,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "2",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi2",
		first_pay_double = 1,
		extra_gem = 30,
		limit_arg = 10,
		airijp_id = "com.yostarjp.azurlane.diamond2",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "+おまけ$1個",
		name = "ダイヤ一袋",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ一袋",
		tip = "",
		tip_open = 0,
		id = 5,
		money = 1200,
		name_display = "ダイヤ一袋",
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
		id_str = "com.bilibili.blhx.zuanshi3",
		first_pay_double = 1,
		extra_gem = 145,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.diamond3",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "+おまけ$1個",
		name = "ダイヤ小箱",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ小箱",
		tip = "",
		tip_open = 0,
		id = 6,
		money = 2400,
		name_display = "ダイヤ小箱",
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
		id_str = "com.bilibili.blhx.zuanshi4",
		first_pay_double = 1,
		extra_gem = 350,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.diamond4",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "+おまけ$1個",
		name = "ダイヤ大箱",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ大箱",
		tip = "",
		tip_open = 0,
		id = 7,
		money = 4900,
		name_display = "ダイヤ大箱",
		tag = 0,
		akashi_pick = 0,
		gem = 2450,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "5",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi5",
		first_pay_double = 1,
		extra_gem = 880,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.diamond5",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "+おまけ$1個",
		name = "ダイヤ一船",
		descrip_extra = "",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "ダイヤ一船",
		tip = "",
		tip_open = 0,
		id = 8,
		money = 10000,
		name_display = "ダイヤ一船",
		tag = 1,
		akashi_pick = 0,
		gem = 5000,
		extra_service_item = "0",
		extra_service = 0,
		limit_type = 0,
		time = "always",
		show_group = "",
		package_tag = "",
		picture = "6",
		package_tag_open = 0,
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi6",
		first_pay_double = 1,
		extra_gem = 2500,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.diamond6",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		descrip = "アイテム・資源とランダムに正月シリーズの着せ替え衣装を入手可能",
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n※すでに所有している衣装を入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋",
		tip = "",
		tip_open = 0,
		id = 9,
		money = 3800,
		name_display = "福袋",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi103",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond103",
		extra_service_item = {
			{
				2,
				69901,
				1
			},
			{
				2,
				30302,
				3
			},
			{
				1,
				14,
				2018
			},
			{
				2,
				20001,
				8
			},
			{
				2,
				15003,
				4
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
					2017,
					12,
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
					2018,
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
				69901,
				1
			},
			{
				2,
				30302,
				3
			},
			{
				1,
				14,
				2018
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40901,
				1
			}
		}
	},
	{
		descrip = "など6つのアイテム",
		name = "新生活キャンペｰン",
		descrip_extra = "アプリストア新生活キャンペーン特典",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "新生活キャンペｰン",
		tip = "",
		tip_open = 0,
		id = 10,
		money = 1200,
		name_display = "新生活キャンペｰン",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "box-act",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi104",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond104",
		extra_service_item = {
			{
				1,
				14,
				700
			},
			{
				1,
				6,
				100
			},
			{
				1,
				1,
				3000
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
				2,
				850
			}
		},
		time = {
			{
				{
					2018,
					3,
					2
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
				1,
				14,
				700
			},
			{
				1,
				6,
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
		drop_item = {
			{
				2,
				40901,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		name = "一周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の初回割引販売時の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋",
		tip = "",
		tip_open = 0,
		id = 11,
		money = 3800,
		name_display = "一周年福袋",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi108",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond105",
		extra_service_item = {
			{
				2,
				69902,
				1
			},
			{
				1,
				14,
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
					2018,
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
					2018,
					10,
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
				69902,
				1
			},
			{
				1,
				14,
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
		drop_item = {
			{
				2,
				40902,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにお正月シリーズの着せ替え衣装を入手可能",
		name = "福袋2019",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋2019",
		tip = "",
		tip_open = 0,
		id = 12,
		money = 3800,
		name_display = "福袋2019",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi109",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond106",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
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
					2018,
					12,
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
					1,
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
				69903,
				1
			},
			{
				1,
				14,
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
		drop_item = {
			{
				2,
				40903,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		name = "春節福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋",
		tip = "",
		tip_open = 0,
		id = 13,
		money = 3800,
		name_display = "春節福袋",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi110",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond107",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
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
				14,
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
		drop_item = {
			{
				2,
				40904,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋",
		tip = "",
		tip_open = 0,
		id = 14,
		money = 3800,
		name_display = "福袋",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe1_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi111",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond108",
		extra_service_item = {
			{
				2,
				69905,
				1
			},
			{
				1,
				14,
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
				14,
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
		drop_item = {
			{
				2,
				40905,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		name = "二週年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "二週年福袋",
		tip = "",
		tip_open = 0,
		id = 15,
		money = 3800,
		name_display = "二週年福袋",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe2_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi113",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond109",
		extra_service_item = {
			{
				2,
				69907,
				1
			},
			{
				1,
				14,
				2059
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
				69907,
				1
			},
			{
				1,
				14,
				2059
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
		drop_item = {
			{
				2,
				40906,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋2020",
		tip = "",
		tip_open = 0,
		id = 16,
		money = 3800,
		name_display = "新年福袋2020",
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
		id_str = "com.bilibili.blhx.zuanshi118",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond110",
		extra_service_item = {
			{
				2,
				69908,
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
				40908,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムにお正月2019シリーズの着せ替え衣装を入手可能",
		name = "新年福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋復刻(2019)",
		tip = "",
		tip_open = 0,
		id = 17,
		money = 3800,
		name_display = "新年福袋復刻(2019)",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi119",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond111",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
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
				14,
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
		drop_item = {
			{
				2,
				40903,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋2020",
		tip = "",
		tip_open = 0,
		id = 18,
		money = 3800,
		name_display = "春節福袋2020",
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
		id_str = "com.bilibili.blhx.zuanshi120",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond112",
		extra_service_item = {
			{
				2,
				69909,
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
				40909,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		name = "春節福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋復刻(2019)",
		tip = "",
		tip_open = 0,
		id = 19,
		money = 3800,
		name_display = "春節福袋復刻(2019)",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi121",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond113",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
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
				14,
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
		drop_item = {
			{
				2,
				40904,
				1
			}
		}
	},
	{
		descrip = "ダイヤ×180、燃料貯蔵箱(1000)×2などのアイテムを入手可能",
		name = "着任応援パック・Ⅰ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "着任応援パック・Ⅰ",
		tip = "",
		tip_open = 0,
		id = 20,
		money = 320,
		name_display = "着任応援パック・Ⅰ",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao101",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package101",
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
	{
		descrip = "ダイヤ×780、SSR選択装備箱×2、燃料貯蔵箱(1000)×4などのアイテムを入手可能",
		name = "着任応援パック・Ⅱ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "着任応援パック・Ⅱ",
		tip = "",
		tip_open = 0,
		id = 21,
		money = 1500,
		name_display = "着任応援パック・Ⅱ",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao102",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package102",
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
	{
		descrip = "ダイヤ×1680、SSR選択装備箱×4、燃料貯蔵箱(1000)×8などのアイテムを入手可能",
		name = "着任応援パック・Ⅲ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "着任応援パック・Ⅲ",
		tip = "",
		tip_open = 0,
		id = 22,
		money = 3000,
		name_display = "着任応援パック・Ⅲ",
		tag = 1,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		time = "always",
		package_tag_open = 0,
		package_tag = "",
		picture = "support3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao103",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package103",
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
	{
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		name = "福袋（夏2020）",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n既に所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋（夏2020）",
		tip = "",
		tip_open = 0,
		id = 23,
		money = 3800,
		name_display = "福袋（夏2020）",
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
		id_str = "com.bilibili.blhx.zuanshi122",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond114",
		extra_service_item = {
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
	{
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "三周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "三周年福袋",
		tip = "",
		tip_open = 0,
		id = 24,
		money = 3800,
		name_display = "三周年福袋",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe4_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi123",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond115",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
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
				14,
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
	{
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋2021",
		tip = "",
		tip_open = 0,
		id = 25,
		money = 3800,
		name_display = "新年福袋2021",
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
		id_str = "com.bilibili.blhx.zuanshi124",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond116",
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
	{
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋2020(復刻)",
		tip = "",
		tip_open = 0,
		id = 26,
		money = 3800,
		name_display = "新年福袋2020(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi125",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond117",
		extra_service_item = {
			{
				2,
				69908,
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
				40908,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋2021",
		tip = "",
		tip_open = 0,
		id = 27,
		money = 3800,
		name_display = "春節福袋2021",
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
		id_str = "com.bilibili.blhx.zuanshi126",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond118",
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
	{
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋2020(復刻)",
		tip = "",
		tip_open = 0,
		id = 28,
		money = 3800,
		name_display = "春節福袋2020(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi127",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond119",
		extra_service_item = {
			{
				2,
				69909,
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
				40909,
				1
			}
		}
	},
	{
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2021)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "四周年礼盒",
		tip = "",
		tip_open = 0,
		id = 29,
		money = 3800,
		name_display = "福袋(夏2021)",
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
		id_str = "com.bilibili.blhx.zuanshi128",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond120",
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
	{
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2020) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "三周年礼盒复刻",
		tip = "",
		tip_open = 0,
		id = 30,
		money = 3800,
		name_display = "福袋(夏2020) (復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi129",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond121",
		extra_service_item = {
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
	{
		descrip = "ダイヤ×1980、兵装開発専用①・選択装備箱×1などのアイテムを入手可能！",
		name = "着任応援パック・Ⅳ",
		descrip_extra = "※購入されたパックはメールに送られます。ご注意ください",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "着任応援パック・Ⅳ",
		tip = "",
		tip_open = 0,
		id = 31,
		money = 3800,
		name_display = "着任応援パック・Ⅳ",
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
		id_str = "com.bilibili.blhx.zuanshi130",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond122",
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
	{
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "四周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "四周年福袋",
		tip = "",
		tip_open = 0,
		id = 32,
		money = 3800,
		name_display = "四周年福袋",
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
		id_str = "com.bilibili.blhx.zuanshi131",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond123",
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
	{
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "三周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "三周年福袋 (復刻)",
		tip = "",
		tip_open = 0,
		id = 33,
		money = 3800,
		name_display = "三周年福袋 (復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi132",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond124",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
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
				14,
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
	{
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋2022",
		tip = "",
		tip_open = 0,
		id = 34,
		money = 3800,
		name_display = "新年福袋2022",
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
		id_str = "com.bilibili.blhx.zuanshi133",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond125",
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
	{
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "新年福袋2021(復刻)",
		tip = "",
		tip_open = 0,
		id = 35,
		money = 3800,
		name_display = "新年福袋2021(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi134",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond126",
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
	{
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋2022",
		tip = "",
		tip_open = 0,
		id = 36,
		money = 3800,
		name_display = "春節福袋2022",
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
		id_str = "com.bilibili.blhx.zuanshi135",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond127",
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
	{
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "春節福袋2021(復刻)",
		tip = "",
		tip_open = 0,
		id = 37,
		money = 3800,
		name_display = "春節福袋2021(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi136",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond128",
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
	{
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2022)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋(夏2022)",
		tip = "",
		tip_open = 0,
		id = 38,
		money = 3800,
		name_display = "福袋(夏2022)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe7_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi137",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond129",
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
	{
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2021) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 0,
		subject = "福袋(夏2021) (復刻)",
		tip = "",
		tip_open = 0,
		id = 39,
		money = 3800,
		name_display = "福袋(夏2021) (復刻)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe5_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi138",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond130",
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
	{
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "五周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "五周年福袋",
		tip = "",
		tip_open = 0,
		id = 40,
		money = 3800,
		name_display = "五周年福袋",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe7_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi139",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond131",
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
					2022,
					10,
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
	{
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "四周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "四周年福袋 (復刻)",
		tip = "",
		tip_open = 0,
		id = 41,
		money = 3800,
		name_display = "四周年福袋 (復刻)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe5_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi140",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond132",
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
					2022,
					10,
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
	[44] = {
		descrip = "購入すると材料を大量に入手可能",
		name = "カムバックパック",
		descrip_extra = "購入すると、アイテムはメールボックスに送られます",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "カムバックパック",
		tip = "",
		tip_open = 0,
		id = 44,
		money = 2600,
		name_display = "カムバックパック",
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
		id_str = "com.bilibili.blhx.zuanshi141",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond133",
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
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		name = "冬の水着福袋2023①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "冬の水着福袋2023①",
		tip = "",
		tip_open = 0,
		id = 45,
		money = 3800,
		name_display = "冬の水着福袋2023①",
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
		id_str = "com.bilibili.blhx.zuanshi142",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond134",
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
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		name = "冬の水着福袋2023②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "冬の水着福袋2023②",
		tip = "",
		tip_open = 0,
		id = 46,
		money = 3800,
		name_display = "冬の水着福袋2023②",
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
		id_str = "com.bilibili.blhx.zuanshi143",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond135",
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
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		name = "新年福袋2022(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2022",
		tip = "",
		tip_open = 0,
		id = 47,
		money = 3800,
		name_display = "新年福袋2022(復刻) ",
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
		id_str = "com.bilibili.blhx.zuanshi144",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond136",
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
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2023・Ⅰ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2023・Ⅰ ",
		tip = "",
		tip_open = 0,
		id = 48,
		money = 3800,
		name_display = "春節福袋2023・Ⅰ ",
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
		id_str = "com.bilibili.blhx.zuanshi145",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond137",
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
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2023・Ⅱ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2023・Ⅱ ",
		tip = "",
		tip_open = 0,
		id = 49,
		money = 3800,
		name_display = "春節福袋2023・Ⅱ ",
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
		id_str = "com.bilibili.blhx.zuanshi146",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond138",
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
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		name = "春節福袋2022(復刻) ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2022(復刻) ",
		tip = "",
		tip_open = 0,
		id = 50,
		money = 3800,
		name_display = "春節福袋2022(復刻) ",
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
		id_str = "com.bilibili.blhx.zuanshi147",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond139",
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
		descrip = "アイテム・資源とランダムな夏の水着2023シリーズの着せ替え衣装を入手可能",
		name = "夏の水着福袋2023",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2023",
		tip = "",
		tip_open = 0,
		id = 51,
		money = 3800,
		name_display = "夏の水着福袋2023",
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
		id_str = "com.bilibili.blhx.zuanshi151",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond140",
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
		descrip = "アイテム・資源とランダムなドレス（夏2023）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2023)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "福袋(夏2023)",
		tip = "",
		tip_open = 0,
		id = 52,
		money = 3800,
		name_display = "福袋(夏2023)",
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
		id_str = "com.bilibili.blhx.zuanshi152",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond141",
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
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
		name = "福袋(夏2022) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "福袋(夏2022) (復刻)",
		tip = "",
		tip_open = 0,
		id = 53,
		money = 3800,
		name_display = "福袋(夏2022) (復刻)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "lihe7_l",
		skin_inquire_relation = 69919,
		id_str = "com.bilibili.blhx.zuanshi153",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond142",
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
		descrip = "アイテム・資源とランダムな六周年②の着せ替え衣装を入手可能",
		name = "六周年福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "六周年福袋②",
		tip = "",
		tip_open = 0,
		id = 55,
		money = 3800,
		name_display = "六周年福袋②",
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
		id_str = "com.bilibili.blhx.zuanshi155",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond144",
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
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name = "五周年福袋(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "五周年福袋(復刻)",
		tip = "",
		tip_open = 0,
		id = 56,
		money = 3800,
		name_display = "五周年福袋(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi156",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond145",
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
		descrip = "アイテム・資源とランダムな六周年①の着せ替え衣装を入手可能",
		name = "六周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "六周年福袋①",
		tip = "",
		tip_open = 0,
		id = 57,
		money = 3800,
		name_display = "六周年福袋①",
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
		id_str = "com.bilibili.blhx.zuanshi157",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond143",
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
	[58] = {
		descrip = "ダイヤ×1980と、選べるアイテムボックス×1などを入手可能",
		name = "選べる迎春福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックスは倉庫で使用でき、指定されたアイテムを入手できます。",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "選べる迎春福袋①",
		tip = "",
		tip_open = 0,
		id = 58,
		money = 3800,
		name_display = "選べる迎春福袋①",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_198",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi158",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond155",
		extra_service_item = {
			{
				2,
				59504,
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
				17003,
				20
			},
			{
				2,
				17013,
				20
			},
			{
				2,
				17023,
				20
			},
			{
				2,
				17033,
				20
			},
			{
				2,
				17043,
				20
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
				59504,
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
				40988,
				1
			}
		}
	},
	[59] = {
		descrip = "ダイヤ×3280と、選べるアイテムボックス・Ⅱ×1などを入手可能",
		name = "選べる迎春福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックス・Ⅱは倉庫にて使用できます。\n*キャンペーン着せ替え交換チケットは期間終了後に交換対象が変更されてしまいますので、ご注意ください。",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "選べる迎春福袋②",
		tip = "",
		tip_open = 0,
		id = 59,
		money = 6800,
		name_display = "選べる迎春福袋②",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_328",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi159",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond156",
		extra_service_item = {
			{
				2,
				59505,
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
				59505,
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
				40989,
				1
			}
		}
	},
	[61] = {
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2024①",
		tip = "",
		tip_open = 0,
		id = 61,
		money = 3800,
		name_display = "新年福袋2024①",
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
		id_str = "com.bilibili.blhx.zuanshi161",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond147",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "冬の水着福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "冬の水着福袋2023①(復刻)",
		tip = "",
		tip_open = 0,
		id = 62,
		money = 3800,
		name_display = "冬の水着福袋2023①(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi162",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond148",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2024②",
		tip = "",
		tip_open = 0,
		id = 63,
		money = 3800,
		name_display = "新年福袋2024②",
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
		id_str = "com.bilibili.blhx.zuanshi163",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond149",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "冬の水着福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "冬の水着福袋2023②(復刻)",
		tip = "",
		tip_open = 0,
		id = 64,
		money = 3800,
		name_display = "冬の水着福袋2023②(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi164",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond150",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2024①",
		tip = "",
		tip_open = 0,
		id = 65,
		money = 3800,
		name_display = "春節福袋2024①",
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
		id_str = "com.bilibili.blhx.zuanshi165",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond151",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2023①(復刻)",
		tip = "",
		tip_open = 0,
		id = 66,
		money = 3800,
		name_display = "春節福袋2023①(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi166",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond152",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2024②",
		tip = "",
		tip_open = 0,
		id = 67,
		money = 3800,
		name_display = "春節福袋2024②",
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
		id_str = "com.bilibili.blhx.zuanshi167",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond153",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2023②(復刻)",
		tip = "",
		tip_open = 0,
		id = 68,
		money = 3800,
		name_display = "春節福袋2023②(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi168",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond154",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "夏の水着福袋2024",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2024",
		tip = "",
		tip_open = 0,
		id = 69,
		money = 3800,
		name_display = "夏の水着福袋2024",
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
		id_str = "com.bilibili.blhx.zuanshi169",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond157",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "夏の水着福袋2023(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2023(復刻)",
		tip = "",
		tip_open = 0,
		id = 70,
		money = 3800,
		name_display = "夏の水着福袋2023(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi172",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond158",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "福袋(夏2024)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "福袋(夏2024)",
		tip = "",
		tip_open = 0,
		id = 71,
		money = 3800,
		name_display = "福袋(夏2024)",
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
		id_str = "com.bilibili.blhx.zuanshi170",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond159",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "福袋(夏2023)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "福袋(夏2023)(復刻)",
		tip = "",
		tip_open = 0,
		id = 72,
		money = 3800,
		name_display = "福袋(夏2023)(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi171",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond160",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "七周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 3,
		subject = "七周年福袋① ",
		tip = "",
		tip_open = 0,
		id = 73,
		money = 3800,
		name_display = "七周年福袋① ",
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
		id_str = "com.bilibili.blhx.zuanshi173",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond161",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "六周年福袋①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 3,
		subject = "六周年福袋①(復刻)",
		tip = "",
		tip_open = 0,
		id = 74,
		money = 3800,
		name_display = "六周年福袋①(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi174",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond162",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "七周年福袋② ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "七周年福袋② ",
		tip = "",
		tip_open = 0,
		id = 75,
		money = 3800,
		name_display = "七周年福袋② ",
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
		id_str = "com.bilibili.blhx.zuanshi175",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond163",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "六周年福袋②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "六周年福袋②(復刻)",
		tip = "",
		tip_open = 0,
		id = 76,
		money = 3800,
		name_display = "六周年福袋②(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi176",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond164",
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
	[82] = {
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2025A",
		tip = "",
		tip_open = 0,
		id = 82,
		money = 3800,
		name_display = "新年福袋2025A",
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
		id_str = "com.bilibili.blhx.zuanshi182",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond170",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2024A(復刻)",
		tip = "",
		tip_open = 0,
		id = 83,
		money = 3800,
		name_display = "新年福袋2024A(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi183",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond171",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2025B",
		tip = "",
		tip_open = 0,
		id = 84,
		money = 3800,
		name_display = "新年福袋2025B",
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
		id_str = "com.bilibili.blhx.zuanshi184",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond172",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "新年福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "新年福袋2024B(復刻)",
		tip = "",
		tip_open = 0,
		id = 85,
		money = 3800,
		name_display = "新年福袋2024B(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi185",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond173",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2025A",
		tip = "",
		tip_open = 0,
		id = 86,
		money = 3800,
		name_display = "春節福袋2025A",
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
		id_str = "com.bilibili.blhx.zuanshi186",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond174",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2025B",
		tip = "",
		tip_open = 0,
		id = 87,
		money = 3800,
		name_display = "春節福袋2025B",
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
		id_str = "com.bilibili.blhx.zuanshi187",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond175",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2024A(復刻)",
		tip = "",
		tip_open = 0,
		id = 88,
		money = 3800,
		name_display = "春節福袋2024A(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi188",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond176",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "春節福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "春節福袋2024B(復刻)",
		tip = "",
		tip_open = 0,
		id = 89,
		money = 3800,
		name_display = "春節福袋2024B(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi189",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond177",
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
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name = "着せ替えパック(学園)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "着せ替えパック(学園)",
		tip = "",
		tip_open = 0,
		id = 90,
		money = 1000,
		name_display = "着せ替えパック(学園)",
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
		id_str = "com.bilibili.blhx.zuanshi190",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.diamond178",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "夏の水着福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2025A",
		tip = "",
		tip_open = 0,
		id = 91,
		money = 3800,
		name_display = "夏の水着福袋2025A",
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
		id_str = "com.bilibili.blhx.zuanshi191",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond179",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "夏の水着福袋2024(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2024(復刻)",
		tip = "",
		tip_open = 0,
		id = 92,
		money = 3800,
		name_display = "夏の水着福袋2024(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi192",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond180",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "夏の水着福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "夏の水着福袋2025B",
		tip = "",
		tip_open = 0,
		id = 93,
		money = 3800,
		name_display = "夏の水着福袋2025B",
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
		id_str = "com.bilibili.blhx.zuanshi193",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond181",
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
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name = "福袋(夏2024)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "福袋(夏2024)(復刻)",
		tip = "",
		tip_open = 0,
		id = 94,
		money = 3800,
		name_display = "福袋(夏2024)(復刻)",
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
		id_str = "com.bilibili.blhx.zuanshi194",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.diamond182",
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
	[95] = {
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name = "着せ替えパック(バニー)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		limit_group = 0,
		type_order = 2,
		subject = "着せ替えパック(バニー)",
		tip = "",
		tip_open = 0,
		id = 95,
		money = 1000,
		name_display = "着せ替えパック(バニー)",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "fudai26",
		skin_inquire_relation = 86215,
		id_str = "com.bilibili.blhx.zuanshi195",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.diamond183",
		extra_service_item = {
			{
				2,
				86215,
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
					7,
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
					8,
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
				86215,
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
				81215,
				1
			}
		}
	},
	[1000] = {
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "クルーズパス",
		tip = "",
		tip_open = 0,
		id = 1000,
		money = 1200,
		name_display = "クルーズパス",
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
		id_str = "com.bilibili.blhx.battlepass1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass1",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(21初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "クルーズパス(21初冬)",
		tip = "",
		tip_open = 0,
		id = 1001,
		money = 1200,
		name_display = "クルーズパス(21初冬)",
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
		id_str = "com.bilibili.blhx.battlepass2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass2",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "クルーズパス(22冬)",
		tip = "",
		tip_open = 0,
		id = 1002,
		money = 1200,
		name_display = "クルーズパス(22冬)",
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
		id_str = "com.bilibili.blhx.battlepass3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass3",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "クルーズパス(22春)",
		tip = "",
		tip_open = 0,
		id = 1003,
		money = 1200,
		name_display = "クルーズパス(22春)",
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
		id_str = "com.bilibili.blhx.battlepass4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass4",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "クルーズパス(22初夏)",
		tip = "",
		tip_open = 0,
		id = 1004,
		money = 1200,
		name_display = "クルーズパス(22初夏)",
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
		id_str = "com.bilibili.blhx.battlepass5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass5",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(22夏)",
		tip = "",
		tip_open = 0,
		id = 1005,
		money = 1200,
		name_display = "クルーズパス(22夏)",
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
		id_str = "com.bilibili.blhx.battlepass6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass6",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(22秋)",
		tip = "",
		tip_open = 0,
		id = 1006,
		money = 1200,
		name_display = "クルーズパス(22秋)",
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
		id_str = "com.bilibili.blhx.battlepass7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass7",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(22初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(22初冬)",
		tip = "",
		tip_open = 0,
		id = 1007,
		money = 1200,
		name_display = "クルーズパス(22初冬)",
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
		id_str = "com.bilibili.blhx.battlepass8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass8",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23冬)",
		tip = "",
		tip_open = 0,
		id = 1008,
		money = 1200,
		name_display = "クルーズパス(23冬)",
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
		id_str = "com.bilibili.blhx.battlepass9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass9",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23春)",
		tip = "",
		tip_open = 0,
		id = 1009,
		money = 1200,
		name_display = "クルーズパス(23春)",
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
		id_str = "com.bilibili.blhx.battlepass10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass10",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23初夏)",
		tip = "",
		tip_open = 0,
		id = 1010,
		money = 1200,
		name_display = "クルーズパス(23初夏)",
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
		id_str = "com.bilibili.blhx.battlepass12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass11",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23夏)",
		tip = "",
		tip_open = 0,
		id = 1011,
		money = 1200,
		name_display = "クルーズパス(23夏)",
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
		id_str = "com.bilibili.blhx.battlepass13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass12",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23秋)",
		tip = "",
		tip_open = 0,
		id = 1012,
		money = 1200,
		name_display = "クルーズパス(23秋)",
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
		id_str = "com.bilibili.blhx.battlepass14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass13",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(23初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(23初冬)",
		tip = "",
		tip_open = 0,
		id = 1013,
		money = 1200,
		name_display = "クルーズパス(23初冬)",
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
		id_str = "com.bilibili.blhx.battlepass15",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass14",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(24冬)",
		tip = "",
		tip_open = 0,
		id = 1014,
		money = 1200,
		name_display = "クルーズパス(24冬)",
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
		id_str = "com.bilibili.blhx.battlepass16",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass15",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(24春)",
		tip = "",
		tip_open = 0,
		id = 1015,
		money = 1200,
		name_display = "クルーズパス(24春)",
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
		id_str = "com.bilibili.blhx.battlepass17",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass16",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(24初夏)",
		tip = "",
		tip_open = 0,
		id = 1016,
		money = 1200,
		name_display = "クルーズパス(24初夏)",
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
		id_str = "com.bilibili.blhx.battlepass18",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass17",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(24夏)",
		tip = "",
		tip_open = 0,
		id = 1017,
		money = 1200,
		name_display = "クルーズパス(24夏)",
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
		id_str = "com.bilibili.blhx.battlepass19",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass18",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "クルーズパス(24秋)",
		tip = "",
		tip_open = 0,
		id = 1018,
		money = 1200,
		name_display = "クルーズパス(24秋)",
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
		id_str = "com.bilibili.blhx.battlepass20",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass19",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(24初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "クルーズパス(24初冬)",
		tip = "",
		tip_open = 0,
		id = 1019,
		money = 1200,
		name_display = "クルーズパス(24初冬)",
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
		id_str = "com.bilibili.blhx.battlepass21",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass20",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(25冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "クルーズパス(25冬)",
		tip = "",
		tip_open = 0,
		id = 1020,
		money = 1200,
		name_display = "クルーズパス(25冬)",
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
		id_str = "com.bilibili.blhx.battlepass22",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass21",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(25春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "クルーズパス(25春)",
		tip = "",
		tip_open = 0,
		id = 1021,
		money = 1200,
		name_display = "クルーズパス(25春)",
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
		id_str = "com.bilibili.blhx.battlepass23",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass22",
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
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(25初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "クルーズパス(25初夏)",
		tip = "",
		tip_open = 0,
		id = 1022,
		money = 1200,
		name_display = "クルーズパス(25初夏)",
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
		id_str = "com.bilibili.blhx.battlepass24",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass23",
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
	[1023] = {
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		name = "クルーズパス(25夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "クルーズパス(25夏)",
		tip = "",
		tip_open = 0,
		id = 1023,
		money = 1200,
		name_display = "クルーズパス(25夏)",
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
		id_str = "com.bilibili.blhx.battlepass25",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.seasonpass24",
		extra_service_item = {
			{
				1,
				4024,
				1500
			},
			{
				8,
				65101,
				1
			}
		},
		time = {
			{
				{
					2025,
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
					2025,
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
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7024,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2001] = {
		descrip = "特別計画艦・Ⅰ期と交換できるアイテムなどを入手できます",
		name = "PR特別計画艦パック・Ⅰ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅰ期",
		tip = "",
		tip_open = 0,
		id = 2001,
		money = 2000,
		name_display = "PR特別計画艦パック・Ⅰ期",
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
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.tech",
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
		descrip = "内容",
		name = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		tip = "",
		tip_open = 0,
		id = 2002,
		money = 2000,
		name_display = "PR艦船Ⅰ期交換アイテム\n＋強化ユニットセット",
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
		id_str = "com.bilibili.blhx.keyan1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.tech1",
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
		descrip = "内容",
		name = "PR艦船Ⅰ期交換アイテム",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム",
		tip = "",
		tip_open = 0,
		id = 2003,
		money = 1200,
		name_display = "PR艦船Ⅰ期交換アイテム",
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
		id_str = "com.bilibili.blhx.keyan2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.tech2",
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
		descrip = "内容",
		name = "PR特別計画艦Ⅰ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅰ期×343個を入手可能",
		type = 0,
		limit_group = 1,
		type_order = 0,
		subject = "強化ユニット",
		tip = "",
		tip_open = 0,
		id = 2004,
		money = 1000,
		name_display = "強化ユニット",
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
		id_str = "com.bilibili.blhx.keyan3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostarjp.azurlane.tech3",
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
		descrip = "特別計画艦・Ⅱ期と交換できるアイテムなどを入手できます",
		name = "PR特別計画艦パック・Ⅱ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅱ期",
		tip = "",
		tip_open = 0,
		id = 2005,
		money = 2000,
		name_display = "PR特別計画艦パック・Ⅱ期",
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
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.tech",
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
		descrip = "内容",
		name = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		tip = "",
		tip_open = 0,
		id = 2006,
		money = 2000,
		name_display = "PR艦船Ⅱ期交換アイテム\n＋強化ユニットセット",
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
		id_str = "com.bilibili.blhx.keyan4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.tech4",
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
		descrip = "内容",
		name = "PR艦船Ⅱ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム",
		tip = "",
		tip_open = 0,
		id = 2007,
		money = 1200,
		name_display = "PR艦船Ⅱ期交換アイテム",
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
		id_str = "com.bilibili.blhx.keyan5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.tech5",
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
		descrip = "内容",
		name = "PR特別計画艦Ⅱ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅱ期×343個を入手可能",
		type = 0,
		limit_group = 2,
		type_order = 0,
		subject = "強化ユニット",
		tip = "",
		tip_open = 0,
		id = 2008,
		money = 1000,
		name_display = "強化ユニット",
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
		id_str = "com.bilibili.blhx.keyan6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostarjp.azurlane.tech6",
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
		descrip = "購入すると指揮官レベルがLv70に上がり、さらにアイテムを大量に入手可能",
		name = "指揮官レベルアップパック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 7,
		subject = "指揮官レベルアップパック",
		tip = "",
		tip_open = 0,
		id = 2009,
		money = 650,
		name_display = "指揮官レベルアップパック",
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
		id_str = "com.bilibili.blhx.libao104",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package104",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2010,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao105",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package105",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2011,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao106",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package106",
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
	[2014] = {
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2014,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao109",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package109",
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
		descrip = "特別計画艦・Ⅲ期と交換できるアイテムなどを入手できます",
		name = "PR特別計画艦パック・Ⅲ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅲ期",
		tip = "",
		tip_open = 0,
		id = 2015,
		money = 2000,
		name_display = "PR特別計画艦パック・Ⅲ期",
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
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.tech",
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
		descrip = "内容",
		name = "PR艦船Ⅲ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
		tip = "",
		tip_open = 0,
		id = 2016,
		money = 2000,
		name_display = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
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
		id_str = "com.bilibili.blhx.keyan7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.tech7",
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
		descrip = "内容",
		name = "PR艦船Ⅲ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム",
		tip = "",
		tip_open = 0,
		id = 2017,
		money = 1200,
		name_display = "PR艦船Ⅲ期交換アイテム",
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
		id_str = "com.bilibili.blhx.keyan8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.tech8",
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
		descrip = "内容",
		name = "PR特別計画艦Ⅲ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅲ期×343個を入手可能",
		type = 0,
		limit_group = 3,
		type_order = 0,
		subject = "強化ユニット",
		tip = "",
		tip_open = 0,
		id = 2018,
		money = 1000,
		name_display = "強化ユニット",
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
		id_str = "com.bilibili.blhx.keyan9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostarjp.azurlane.tech9",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2019,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao110",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package110",
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
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		name = "冬のお得福袋・2024",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "冬のお得福袋・2024",
		tip = "",
		tip_open = 0,
		id = 2020,
		money = 5280,
		name_display = "冬のお得福袋・2024",
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
		id_str = "com.bilibili.blhx.libao111",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package111",
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
	[2021] = {
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name = "選べるUR着せ替え福袋①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "選べるUR着せ替え福袋①",
		tip = "",
		tip_open = 0,
		id = 2021,
		money = 2600,
		name_display = "選べるUR着せ替え福袋①",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "",
		picture = "haishangchuanqi",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao112",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.package112",
		extra_service_item = {
			{
				2,
				59550,
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
				59550,
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
				40030,
				1
			}
		}
	},
	[2022] = {
		descrip = "キューブ10個を入手可能",
		name = "キューブ補給パック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "キューブ補給パック①",
		tip = "",
		tip_open = 0,
		id = 2022,
		money = 250,
		name_display = "キューブ補給パック①",
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
		id_str = "com.bilibili.blhx.libao113",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.package113",
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
		descrip = "キューブ20個を入手可能",
		name = "キューブ補給パック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "キューブ補給パック②",
		tip = "",
		tip_open = 0,
		id = 2023,
		money = 610,
		name_display = "キューブ補給パック②",
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
		id_str = "com.bilibili.blhx.libao114",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.package114",
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
		descrip = "キューブ30個を入手可能",
		name = "キューブ補給パック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "キューブ補給パック③",
		tip = "",
		tip_open = 0,
		id = 2024,
		money = 1100,
		name_display = "キューブ補給パック③",
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
		id_str = "com.bilibili.blhx.libao115",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.package115",
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
		descrip = "購入するとキューブ1個、燃料1200を入手可能",
		name = "お得パック(デイリー)",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 6,
		subject = "お得パック(デイリー)",
		tip = "",
		tip_open = 0,
		id = 2025,
		money = 120,
		name_display = "お得パック(デイリー)",
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
		id_str = "com.bilibili.blhx.libao116",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package116",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2026,
		money = 480,
		name_display = "教科書パック ",
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
		id_str = "com.bilibili.blhx.libao118",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package118",
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
		descrip = "特別計画艦・Ⅳ期と交換できるアイテムなどを入手できます",
		name = "PR特別計画艦パック·Ⅳ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅳ期",
		tip = "",
		tip_open = 0,
		id = 2027,
		money = 2000,
		name_display = "PR特別計画艦パック·Ⅳ期",
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
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.tech",
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
		descrip = "内容",
		name = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		tip = "",
		tip_open = 0,
		id = 2028,
		money = 2000,
		name_display = "PR艦船Ⅳ期交換アイテム\n＋強化ユニットセット",
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
		id_str = "com.bilibili.blhx.keyan10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.tech10",
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
		descrip = "内容",
		name = "PR艦船Ⅳ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム",
		tip = "",
		tip_open = 0,
		id = 2029,
		money = 1200,
		name_display = "PR艦船Ⅳ期交換アイテム",
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
		id_str = "com.bilibili.blhx.keyan11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.tech11",
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
		descrip = "内容",
		name = "PR特別計画艦Ⅳ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅳ期×343個を入手可能",
		type = 0,
		limit_group = 4,
		type_order = 0,
		subject = "強化ユニット",
		tip = "",
		tip_open = 0,
		id = 2030,
		money = 1000,
		name_display = "強化ユニット",
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
		id_str = "com.bilibili.blhx.keyan12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostarjp.azurlane.tech12",
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
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name = "選べるUR着せ替え福袋②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "選べるUR着せ替え福袋②",
		tip = "",
		tip_open = 0,
		id = 2031,
		money = 2600,
		name_display = "選べるUR着せ替え福袋②",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "",
		picture = "daofeng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao119",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package119",
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
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		name = "戦闘UI・レインボー",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "戦闘UI・レインボー",
		tip = "",
		tip_open = 0,
		id = 2032,
		money = 1600,
		name_display = "戦闘UI・レインボー",
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
		id_str = "com.bilibili.blhx.ui",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.ui",
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
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		name = "戦闘UI・レインボー（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "戦闘UI・レインボー（単品）",
		tip = "",
		tip_open = 0,
		id = 2033,
		money = 1600,
		name_display = "戦闘UI・レインボー（単品）",
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
		id_str = "com.bilibili.blhx.ui1",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui1",
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
		descrip = "戦闘UIテーマ・レインボー,ダイヤ×3060を入手できます",
		name = "戦闘UI・レインボー（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 101,
		type_order = 4,
		subject = "戦闘UI・レインボー（セット）",
		tip = "",
		tip_open = 0,
		id = 2034,
		money = 4700,
		name_display = "戦闘UI・レインボー（セット）",
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
		id_str = "com.bilibili.blhx.ui2",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui2",
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
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name = "選べるUR着せ替え福袋③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "選べるUR着せ替え福袋③",
		tip = "",
		tip_open = 0,
		id = 2035,
		money = 2600,
		name_display = "選べるUR着せ替え福袋③",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 0,
		package_tag = "お得 ",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao120",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package120",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2036,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao121",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package121",
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
		descrip = "戦闘UI・クリスマスを入手できます",
		name = "戦闘UI・クリスマス",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "戦闘UI・クリスマス",
		tip = "",
		tip_open = 0,
		id = 2037,
		money = 1600,
		name_display = "戦闘UI・クリスマス",
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
		id_str = "com.bilibili.blhx.ui3",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.ui3",
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
		descrip = "戦闘UI・クリスマスを入手できます",
		name = "戦闘UI・クリスマス（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "戦闘UI・クリスマス（単品）",
		tip = "",
		tip_open = 0,
		id = 2038,
		money = 1600,
		name_display = "戦闘UI・クリスマス（単品）",
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
		id_str = "com.bilibili.blhx.ui4",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui4",
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
		descrip = "戦闘UI・クリスマス,ダイヤ×3060を入手できます",
		name = "戦闘UI・クリスマス（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 102,
		type_order = 4,
		subject = "戦闘UI・クリスマス（セット）",
		tip = "",
		tip_open = 0,
		id = 2039,
		money = 4700,
		name_display = "戦闘UI・クリスマス（セット）",
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
		id_str = "com.bilibili.blhx.ui5",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui5",
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
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		name = "冬のお得福袋・2025",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 4,
		subject = "冬のお得福袋・2025",
		tip = "",
		tip_open = 0,
		id = 2040,
		money = 5280,
		name_display = "冬のお得福袋・2025",
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
		id_str = "com.bilibili.blhx.libao122",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package122",
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
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name = "選べるUR着せ替え福袋D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "選べるUR着せ替え福袋D",
		tip = "",
		tip_open = 0,
		id = 2041,
		money = 2600,
		name_display = "選べるUR着せ替え福袋D",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao123",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package123",
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
		descrip = "戦闘UI・ファラオを入手できます",
		name = "戦闘UI・ファラオ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = "戦闘UI・ファラオ",
		tip = "",
		tip_open = 0,
		id = 2042,
		money = 1600,
		name_display = "戦闘UI・ファラオ",
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
		id_str = "com.bilibili.blhx.ui6",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.ui6",
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
		descrip = "戦闘UI・ファラオを入手できます",
		name = "戦闘UI・ファラオ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = "戦闘UI・ファラオ（単品）",
		tip = "",
		tip_open = 0,
		id = 2043,
		money = 1600,
		name_display = "戦闘UI・ファラオ（単品）",
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
		id_str = "com.bilibili.blhx.ui7",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui7",
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
		descrip = "戦闘UI・ファラオ,ダイヤ×3060を入手できます",
		name = "戦闘UI・ファラオ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 103,
		type_order = 4,
		subject = "戦闘UI・ファラオ（セット）",
		tip = "",
		tip_open = 0,
		id = 2044,
		money = 4700,
		name_display = "戦闘UI・ファラオ（セット）",
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
		id_str = "com.bilibili.blhx.ui8",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui8",
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
		descrip = "戦闘UI・ジーンを入手できます",
		name = "戦闘UI・ジーン",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "戦闘UI・ジーン",
		tip = "",
		tip_open = 0,
		id = 2045,
		money = 1600,
		name_display = "戦闘UI・ジーン",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "お得 ",
		picture = "ui4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.ui9",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.ui9",
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
		descrip = "戦闘UI・ジーンを入手できます",
		name = "戦闘UI・ジーン（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "戦闘UI・ジーン（単品）",
		tip = "",
		tip_open = 0,
		id = 2046,
		money = 1600,
		name_display = "戦闘UI・ジーン（単品）",
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
		id_str = "com.bilibili.blhx.ui10",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui10",
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
		descrip = "戦闘UI・ジーン,ダイヤ×3060を入手できます",
		name = "戦闘UI・ジーン（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 104,
		type_order = 4,
		subject = "戦闘UI・ジーン（セット）",
		tip = "",
		tip_open = 0,
		id = 2047,
		money = 4700,
		name_display = "戦闘UI・ジーン（セット）",
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
		id_str = "com.bilibili.blhx.ui11",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui11",
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
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name = "選べるUR着せ替え福袋E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "選べるUR着せ替え福袋E",
		tip = "",
		tip_open = 0,
		id = 2048,
		money = 2600,
		name_display = "選べるUR着せ替え福袋E",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		sub_display = "",
		extra_service = 3,
		limit_type = 2,
		show_group = "",
		package_tag_open = 1,
		package_tag = "",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao124",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package124",
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
		descrip = "購入すると教科書を大量に入手可能",
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "教科書パック",
		tip = "",
		tip_open = 0,
		id = 2049,
		money = 480,
		name_display = "教科書パック",
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
		id_str = "com.bilibili.blhx.libao125",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 4,
		airijp_id = "com.yostarjp.azurlane.package125",
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
		descrip = "戦闘UI・シーサイドを入手できます",
		name = "戦闘UI・シーサイド",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "戦闘UI・シーサイド",
		tip = "",
		tip_open = 0,
		id = 2050,
		money = 1600,
		name_display = "戦闘UI・シーサイド",
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
		id_str = "com.bilibili.blhx.ui12",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.ui12",
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
		descrip = "戦闘UI・シーサイドを入手できます",
		name = "戦闘UI・シーサイド（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "戦闘UI・シーサイド（単品）",
		tip = "",
		tip_open = 0,
		id = 2051,
		money = 1600,
		name_display = "戦闘UI・シーサイド（単品）",
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
		id_str = "com.bilibili.blhx.ui13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui13",
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
		descrip = "戦闘UI・シーサイド,ダイヤ×3060を入手できます",
		name = "戦闘UI・シーサイド（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 105,
		type_order = 4,
		subject = "戦闘UI・シーサイド（セット）",
		tip = "",
		tip_open = 0,
		id = 2052,
		money = 4700,
		name_display = "戦闘UI・シーサイド（セット）",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "uigift",
		limit_type = 5,
		package_tag_open = 0,
		package_tag = "お得 ",
		picture = "ui5",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.ui14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.ui14",
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
		descrip = "特別計画艦・Ⅴ期と交換できるアイテムなどを入手できます",
		name = "PR特別計画艦パック·Ⅴ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅴ期",
		tip = "",
		tip_open = 0,
		id = 2053,
		money = 2000,
		name_display = "PR特別計画艦パック·Ⅴ期",
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
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 0,
		airijp_id = "com.yostarjp.azurlane.tech",
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
		descrip = "内容",
		name = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		tip = "",
		tip_open = 0,
		id = 2054,
		money = 2000,
		name_display = "PR艦船Ⅴ期交換アイテム\n＋強化ユニットセット",
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
		id_str = "com.bilibili.blhx.keyan13",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.tech13",
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
		descrip = "内容",
		name = "PR艦船Ⅴ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム",
		tip = "",
		tip_open = 0,
		id = 2055,
		money = 1200,
		name_display = "PR艦船Ⅴ期交換アイテム",
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
		id_str = "com.bilibili.blhx.keyan14",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 2,
		airijp_id = "com.yostarjp.azurlane.tech14",
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
		descrip = "内容",
		name = "PR特別計画艦Ⅴ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅴ期×343個を入手可能",
		type = 0,
		limit_group = 5,
		type_order = 0,
		subject = "強化ユニット",
		tip = "",
		tip_open = 0,
		id = 2056,
		money = 1000,
		name_display = "強化ユニット",
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
		id_str = "com.bilibili.blhx.keyan15",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 3,
		airijp_id = "com.yostarjp.azurlane.tech15",
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
	[5001] = {
		descrip = "ダイヤ×60と、上級指向型強化ユニット・五期目×2を入手可能",
		name = "お得デイリーパック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック①",
		tip = "",
		tip_open = 0,
		id = 5001,
		money = 120,
		name_display = "お得デイリーパック①",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao201",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package201",
		extra_service_item = {
			{
				2,
				42046,
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
				42046,
				2
			},
			{
				1,
				14,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40990,
				1
			}
		}
	},
	[5002] = {
		descrip = "ダイヤ×200を入手可能",
		name = "お得デイリーパック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック②",
		tip = "",
		tip_open = 0,
		id = 5002,
		money = 120,
		name_display = "お得デイリーパック②",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao202",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package202",
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
					3,
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
				1,
				14,
				200
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40991,
				1
			}
		}
	},
	[5003] = {
		descrip = "SSR選択装備箱×1と、指向性強化パーツT4×5を入手可能",
		name = "お得デイリーパック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック③",
		tip = "",
		tip_open = 0,
		id = 5003,
		money = 120,
		name_display = "お得デイリーパック③",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao203",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package203",
		extra_service_item = {
			{
				2,
				30202,
				1
			},
			{
				2,
				30114,
				5
			}
		},
		time = {
			{
				{
					2024,
					3,
					2
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
				30202,
				1
			},
			{
				2,
				30114,
				5
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40992,
				1
			}
		}
	},
	[5004] = {
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		name = "お得デイリーパック④",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック④",
		tip = "",
		tip_open = 0,
		id = 5004,
		money = 120,
		name_display = "お得デイリーパック④",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao204",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package204",
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
					3,
					3
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
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40993,
				1
			}
		}
	},
	[5005] = {
		descrip = "艦船経験値パックT2×60を入手可能",
		name = "お得デイリーパック⑤",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック⑤",
		tip = "",
		tip_open = 0,
		id = 5005,
		money = 120,
		name_display = "お得デイリーパック⑤",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day5",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao205",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package205",
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
					3,
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
				16502,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40994,
				1
			}
		}
	},
	[5006] = {
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		name = "お得デイリーパック⑥",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック⑥",
		tip = "",
		tip_open = 0,
		id = 5006,
		money = 120,
		name_display = "お得デイリーパック⑥",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao206",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package206",
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
					3,
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
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40995,
				1
			}
		}
	},
	[5007] = {
		descrip = "ダイヤ×60と、上級指向型強化ユニット・六期目×2を入手可能",
		name = "お得デイリーパック⑦",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 0,
		subject = "お得デイリーパック⑦",
		tip = "",
		tip_open = 0,
		id = 5007,
		money = 120,
		name_display = "お得デイリーパック⑦",
		tag = 2,
		akashi_pick = 1,
		gem = 0,
		extra_service = 3,
		show_group = "",
		limit_type = 2,
		package_tag_open = 0,
		package_tag = "",
		picture = "pack_day7",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao207",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package207",
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
					3,
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
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40996,
				1
			}
		}
	},
	[5011] = {
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅵ期目×2を入手可能",
		name = "お得デイリーパック2025A",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025A",
		tip = "",
		tip_open = 0,
		id = 5011,
		money = 120,
		name_display = "お得デイリーパック2025A",
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
		id_str = "com.bilibili.blhx.libao211",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package211",
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
		descrip = "ダイヤ×200を入手可能",
		name = "お得デイリーパック2025B",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025B",
		tip = "",
		tip_open = 0,
		id = 5012,
		money = 120,
		name_display = "お得デイリーパック2025B",
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
		id_str = "com.bilibili.blhx.libao212",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package212",
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
					2025,
					2,
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
		descrip = "指向性強化パーツT4×5、メンタルユニット×200を入手可能",
		name = "お得デイリーパック2025C",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025C",
		tip = "",
		tip_open = 0,
		id = 5013,
		money = 120,
		name_display = "お得デイリーパック2025C",
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
		id_str = "com.bilibili.blhx.libao213",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package213",
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
					2025,
					3,
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
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		name = "お得デイリーパック2025D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025D",
		tip = "",
		tip_open = 0,
		id = 5014,
		money = 120,
		name_display = "お得デイリーパック2025D",
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
		id_str = "com.bilibili.blhx.libao214",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package214",
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
					2025,
					3,
					2
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
		descrip = "艦船経験値パックT2×60を入手可能",
		name = "お得デイリーパック2025E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025E",
		tip = "",
		tip_open = 0,
		id = 5015,
		money = 120,
		name_display = "お得デイリーパック2025E",
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
		id_str = "com.bilibili.blhx.libao215",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package215",
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
					2025,
					3,
					3
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
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		name = "お得デイリーパック2025F",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025F",
		tip = "",
		tip_open = 0,
		id = 5016,
		money = 120,
		name_display = "お得デイリーパック2025F",
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
		id_str = "com.bilibili.blhx.libao216",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package216",
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
					2025,
					3,
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
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅶ期目×2を入手可能",
		name = "お得デイリーパック2025G",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		limit_group = 0,
		type_order = 5,
		subject = "お得デイリーパック2025G",
		tip = "",
		tip_open = 0,
		id = 5017,
		money = 120,
		name_display = "お得デイリーパック2025G",
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
		id_str = "com.bilibili.blhx.libao217",
		first_pay_double = 0,
		extra_gem = 0,
		limit_arg = 1,
		airijp_id = "com.yostarjp.azurlane.package217",
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
					2025,
					3,
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
	}
}
