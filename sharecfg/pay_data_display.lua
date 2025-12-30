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
		96,
		97,
		98,
		99,
		9001,
		9007,
		9008,
		9009,
		9010,
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
		1024,
		1025,
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
		2057,
		2058,
		2059,
		2063,
		2064,
		2068,
		2069,
		2070,
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
		limit_group = 0,
		name = "貿易許可証（30日間）",
		descrip_extra = "",
		type = 0,
		second_text = "30日間毎日入手",
		type_order = 0,
		subject = "貿易許可証（30日間）",
		first_text = "すぐに入手",
		limit_arg = 7,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		id = 1,
		gem = 500,
		name_display = "貿易許可証（30日間）",
		package_sort_id = 0,
		limit_type = 1,
		time = "always",
		akashi_pick = 0,
		package_tag = "",
		picture = "month",
		extra_service = 2,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi102",
		first_pay_double = 0,
		extra_gem = 10,
		descrip = "ダイヤ$1個+30日間毎日資源が貰える",
		package_tag_open = 0,
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
		},
		first_icon = {
			{
				1,
				14,
				500
			}
		}
	},
	{
		limit_group = 0,
		name = "新規着任パック",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "新規着任パック",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 160,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 80,
		id = 2,
		name_display = "新規着任パック",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "新人",
		picture = "boxNewplayer",
		package_sort_id = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi101",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤなどのアイテムを入手可能",
		show_group = "",
		package_tag_open = 1,
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
		limit_group = 0,
		name = "ダイヤ一摘み",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一摘み",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 160,
		id = 3,
		name_display = "ダイヤ一摘み",
		extra_service_item = "0",
		gem = 80,
		show_group = "",
		limit_type = 99,
		package_tag = "",
		picture = "1",
		id_str = "com.bilibili.blhx.zuanshi1",
		extra_gem = 0,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond1",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 10,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "ダイヤ一握り",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一握り",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 650,
		id = 4,
		name_display = "ダイヤ一握り",
		extra_service_item = "0",
		gem = 325,
		show_group = "",
		limit_type = 99,
		package_tag = "",
		picture = "2",
		id_str = "com.bilibili.blhx.zuanshi2",
		extra_gem = 30,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond2",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 10,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "ダイヤ一袋",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一袋",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 1200,
		id = 5,
		name_display = "ダイヤ一袋",
		extra_service_item = "0",
		gem = 600,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "3",
		id_str = "com.bilibili.blhx.zuanshi3",
		extra_gem = 145,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond3",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 0,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "ダイヤ小箱",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ小箱",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2400,
		id = 6,
		name_display = "ダイヤ小箱",
		extra_service_item = "0",
		gem = 1200,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "4",
		id_str = "com.bilibili.blhx.zuanshi4",
		extra_gem = 350,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond4",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 0,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "ダイヤ大箱",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ大箱",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 4900,
		id = 7,
		name_display = "ダイヤ大箱",
		extra_service_item = "0",
		gem = 2450,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "5",
		id_str = "com.bilibili.blhx.zuanshi5",
		extra_gem = 880,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond5",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 0,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "ダイヤ一船",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一船",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 10000,
		id = 8,
		name_display = "ダイヤ一船",
		extra_service_item = "0",
		gem = 5000,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "6",
		id_str = "com.bilibili.blhx.zuanshi6",
		extra_gem = 2500,
		descrip = "+おまけ$1個",
		airijp_id = "com.yostarjp.azurlane.diamond6",
		first_icon = "",
		first_text = "",
		tag = 1,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		limit_arg = 0,
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		limit_group = 0,
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n※すでに所有している衣装を入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 9,
		name_display = "福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi103",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに正月シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新生活キャンペｰン",
		descrip_extra = "アプリストア新生活キャンペーン特典",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "新生活キャンペｰン",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 10,
		name_display = "新生活キャンペｰン",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "box-act",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi104",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "など6つのアイテム",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "一周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の初回割引販売時の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 11,
		name_display = "一周年福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi108",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋2019",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋2019",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 12,
		name_display = "福袋2019",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi109",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 13,
		name_display = "春節福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi110",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 14,
		name_display = "福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe1_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi111",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "二週年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "二週年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 15,
		name_display = "二週年福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe2_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi113",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2020",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 16,
		name_display = "新年福袋2020",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi118",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋復刻(2019)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 17,
		name_display = "新年福袋復刻(2019)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi119",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2019シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋2020",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 18,
		name_display = "春節福袋2020",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi120",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋復刻(2019)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 19,
		name_display = "春節福袋復刻(2019)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi121",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "着任応援パック・Ⅰ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		type_order = 0,
		subject = "着任応援パック・Ⅰ",
		first_text = "ダイヤ入手",
		limit_arg = 1,
		tip = "",
		money = 320,
		tip_open = 0,
		tag = 1,
		id = 20,
		gem = 0,
		name_display = "着任応援パック・Ⅰ",
		package_sort_id = 1,
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao101",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×180、燃料貯蔵箱(1000)×2などのアイテムを入手可能",
		package_tag_open = 0,
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
				4,
				100001,
				1
			},
			{
				2,
				30121,
				2
			},
			{
				2,
				15001,
				30
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
		},
		first_icon = {
			{
				1,
				14,
				180
			}
		}
	},
	{
		limit_group = 0,
		name = "着任応援パック・Ⅱ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		type_order = 0,
		subject = "着任応援パック・Ⅱ",
		first_text = "ダイヤ入手",
		limit_arg = 1,
		tip = "",
		money = 1500,
		tip_open = 0,
		tag = 1,
		id = 21,
		gem = 0,
		name_display = "着任応援パック・Ⅱ",
		package_sort_id = 1,
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao102",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×780、SSR選択装備箱×2、燃料貯蔵箱(1000)×4などのアイテムを入手可能",
		package_tag_open = 0,
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
				4,
				100001,
				1
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
		},
		first_icon = {
			{
				1,
				14,
				780
			}
		}
	},
	{
		limit_group = 0,
		name = "着任応援パック・Ⅲ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		type_order = 0,
		subject = "着任応援パック・Ⅲ",
		first_text = "ダイヤ入手",
		limit_arg = 1,
		tip = "",
		money = 3000,
		tip_open = 0,
		tag = 1,
		id = 22,
		gem = 0,
		name_display = "着任応援パック・Ⅲ",
		package_sort_id = 1,
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao103",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×1680、SSR選択装備箱×4、燃料貯蔵箱(1000)×8などのアイテムを入手可能",
		package_tag_open = 0,
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
				4,
				100011,
				1
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
		},
		first_icon = {
			{
				1,
				14,
				1680
			}
		}
	},
	{
		limit_group = 0,
		name = "福袋（夏2020）",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n既に所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋（夏2020）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 23,
		name_display = "福袋（夏2020）",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe3_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi122",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "三周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "三周年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 24,
		name_display = "三周年福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe4_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi123",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2021",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 25,
		name_display = "新年福袋2021",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi124",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2020(復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 26,
		name_display = "新年福袋2020(復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi125",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋2021",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 27,
		name_display = "春節福袋2021",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi126",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋2020(復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 28,
		name_display = "春節福袋2020(復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi127",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋(夏2021)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "四周年礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 29,
		name_display = "福袋(夏2021)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe6_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi128",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋(夏2020) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "三周年礼盒复刻",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 30,
		name_display = "福袋(夏2020) (復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe3_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi129",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "着任応援パック・Ⅳ",
		descrip_extra = "※購入されたパックはメールに送られます。ご注意ください",
		type = 1,
		second_text = "+資源",
		type_order = 0,
		subject = "着任応援パック・Ⅳ",
		first_text = "ダイヤ入手",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 1,
		id = 31,
		gem = 0,
		name_display = "着任応援パック・Ⅳ",
		package_sort_id = 1,
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi130",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×1980、兵装開発専用①・選択装備箱×1などのアイテムを入手可能！",
		package_tag_open = 0,
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
				2,
				14004,
				25
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
		},
		first_icon = {
			{
				1,
				14,
				1980
			}
		}
	},
	{
		limit_group = 0,
		name = "四周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "四周年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 32,
		name_display = "四周年福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe6_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi131",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "三周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "三周年福袋 (復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 33,
		name_display = "三周年福袋 (復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe3_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi132",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 34,
		name_display = "新年福袋2022",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi133",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2021(復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 35,
		name_display = "新年福袋2021(復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi134",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 36,
		name_display = "春節福袋2022",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi135",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春節福袋2021(復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 37,
		name_display = "春節福袋2021(復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi136",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋(夏2022)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋(夏2022)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 38,
		name_display = "福袋(夏2022)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe7_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi137",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "福袋(夏2021) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "福袋(夏2021) (復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 39,
		name_display = "福袋(夏2021) (復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe5_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi138",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "五周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "五周年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 40,
		name_display = "五周年福袋",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe7_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi139",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "四周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "四周年福袋 (復刻)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 41,
		name_display = "四周年福袋 (復刻)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe5_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi140",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "カムバックパック",
		descrip_extra = "購入すると、アイテムはメールボックスに送られます",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "カムバックパック",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 44,
		name_display = "カムバックパック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "support6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi141",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると材料を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "冬の水着福袋2023①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "冬の水着福袋2023①",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 45,
		name_display = "冬の水着福袋2023①",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe10_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi142",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "冬の水着福袋2023②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "冬の水着福袋2023②",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 46,
		name_display = "冬の水着福袋2023②",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe11_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi143",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2022(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "新年福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 47,
		name_display = "新年福袋2022(復刻) ",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi144",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2023・Ⅰ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "春節福袋2023・Ⅰ ",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 48,
		name_display = "春節福袋2023・Ⅰ ",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudaiqp1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi145",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2023・Ⅱ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "春節福袋2023・Ⅱ ",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 49,
		name_display = "春節福袋2023・Ⅱ ",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudaiqp2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi146",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "春節福袋2022(復刻) ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "春節福袋2022(復刻) ",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 50,
		name_display = "春節福袋2022(復刻) ",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi147",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "夏の水着福袋2023",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2023",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 51,
		gem = 0,
		name_display = "夏の水着福袋2023",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihecn6ss_l",
		show_group = "",
		skin_inquire_relation = 69926,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi151",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな夏の水着2023シリーズの着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69926,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[52] = {
		limit_group = 0,
		name = "福袋(夏2023)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "福袋(夏2023)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 52,
		gem = 0,
		name_display = "福袋(夏2023)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihecn6lf_l",
		show_group = "",
		skin_inquire_relation = 69927,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi152",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2023）シリーズの着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69927,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[53] = {
		limit_group = 0,
		name = "福袋(夏2022) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "福袋(夏2022) (復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 53,
		gem = 0,
		name_display = "福袋(夏2022) (復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihe7_l",
		show_group = "",
		skin_inquire_relation = 69919,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi153",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69919,
				1
			},
			{
				1,
				4,
				2022
			}
		}
	},
	[55] = {
		limit_group = 0,
		name = "六周年福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "六周年福袋②",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 55,
		gem = 0,
		name_display = "六周年福袋②",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihejp6lf_l",
		show_group = "",
		skin_inquire_relation = 69929,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi155",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな六周年②の着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69929,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[56] = {
		limit_group = 0,
		name = "五周年福袋(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "五周年福袋(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 56,
		gem = 0,
		name_display = "五周年福袋(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihe8_l",
		show_group = "",
		skin_inquire_relation = 69920,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi156",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69920,
				1
			},
			{
				1,
				4,
				2022
			}
		}
	},
	[57] = {
		limit_group = 0,
		name = "六周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "六周年福袋①",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 57,
		gem = 0,
		name_display = "六周年福袋①",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihejp6ss_l",
		show_group = "",
		skin_inquire_relation = 69928,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi157",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな六周年①の着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69928,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[58] = {
		limit_group = 0,
		name = "選べる迎春福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックスは倉庫で使用でき、指定されたアイテムを入手できます。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べる迎春福袋①",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 58,
		name_display = "選べる迎春福袋①",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_198",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi158",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×1980と、選べるアイテムボックス×1などを入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べる迎春福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックス・Ⅱは倉庫にて使用できます。\n*キャンペーン着せ替え交換チケットは期間終了後に交換対象が変更されてしまいますので、ご注意ください。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べる迎春福袋②",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 59,
		name_display = "選べる迎春福袋②",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_328",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi159",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×3280と、選べるアイテムボックス・Ⅱ×1などを入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "新年福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2024①",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 61,
		gem = 0,
		name_display = "新年福袋2024①",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai9",
		show_group = "",
		skin_inquire_relation = 86200,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi161",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86200,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[62] = {
		limit_group = 0,
		name = "冬の水着福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "冬の水着福袋2023①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 62,
		gem = 0,
		name_display = "冬の水着福袋2023①(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihe10_l",
		show_group = "",
		skin_inquire_relation = 69922,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi162",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69922,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[63] = {
		limit_group = 0,
		name = "新年福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2024②",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 63,
		gem = 0,
		name_display = "新年福袋2024②",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai10",
		show_group = "",
		skin_inquire_relation = 86201,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi163",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86201,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[64] = {
		limit_group = 0,
		name = "冬の水着福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "冬の水着福袋2023②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 64,
		gem = 0,
		name_display = "冬の水着福袋2023②(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihe11_l",
		show_group = "",
		skin_inquire_relation = 69923,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi164",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69923,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[65] = {
		limit_group = 0,
		name = "春節福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2024①",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 65,
		gem = 0,
		name_display = "春節福袋2024①",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai11",
		show_group = "",
		skin_inquire_relation = 86202,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi165",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86202,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[66] = {
		limit_group = 0,
		name = "春節福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2023①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 66,
		gem = 0,
		name_display = "春節福袋2023①(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudaiqp1",
		show_group = "",
		skin_inquire_relation = 69924,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi166",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69924,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[67] = {
		limit_group = 0,
		name = "春節福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2024②",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 67,
		gem = 0,
		name_display = "春節福袋2024②",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai12",
		show_group = "",
		skin_inquire_relation = 86203,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi167",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86203,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[68] = {
		limit_group = 0,
		name = "春節福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2023②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 68,
		gem = 0,
		name_display = "春節福袋2023②(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudaiqp2",
		show_group = "",
		skin_inquire_relation = 69925,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi168",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69925,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[69] = {
		limit_group = 0,
		name = "夏の水着福袋2024",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2024",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 69,
		gem = 0,
		name_display = "夏の水着福袋2024",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai13",
		show_group = "",
		skin_inquire_relation = 86204,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi169",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[70] = {
		limit_group = 0,
		name = "夏の水着福袋2023(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2023(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 70,
		gem = 0,
		name_display = "夏の水着福袋2023(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihecn6ss_l",
		show_group = "",
		skin_inquire_relation = 69926,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi172",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69926,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[71] = {
		limit_group = 0,
		name = "福袋(夏2024)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "福袋(夏2024)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 71,
		gem = 0,
		name_display = "福袋(夏2024)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai14",
		show_group = "",
		skin_inquire_relation = 86205,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi170",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[72] = {
		limit_group = 0,
		name = "福袋(夏2023)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "福袋(夏2023)(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 72,
		gem = 0,
		name_display = "福袋(夏2023)(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihecn6lf_l",
		show_group = "",
		skin_inquire_relation = 69927,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi171",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69927,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[73] = {
		limit_group = 0,
		name = "七周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 3,
		subject = "七周年福袋① ",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 73,
		gem = 0,
		name_display = "七周年福袋① ",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai15",
		show_group = "",
		skin_inquire_relation = 86206,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi173",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[74] = {
		limit_group = 0,
		name = "六周年福袋①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 3,
		subject = "六周年福袋①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 74,
		gem = 0,
		name_display = "六周年福袋①(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihejp6ss_l",
		show_group = "",
		skin_inquire_relation = 69928,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi174",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69928,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[75] = {
		limit_group = 0,
		name = "七周年福袋② ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "七周年福袋② ",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 75,
		gem = 0,
		name_display = "七周年福袋② ",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai16",
		show_group = "",
		skin_inquire_relation = 86207,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi175",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[76] = {
		limit_group = 0,
		name = "六周年福袋②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "六周年福袋②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 76,
		gem = 0,
		name_display = "六周年福袋②(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "lihejp6lf_l",
		show_group = "",
		skin_inquire_relation = 69929,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi176",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				69929,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	},
	[82] = {
		limit_group = 0,
		name = "新年福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 82,
		gem = 0,
		name_display = "新年福袋2025A",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai19",
		show_group = "",
		skin_inquire_relation = 86208,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi182",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[83] = {
		limit_group = 0,
		name = "新年福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2024A(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 83,
		gem = 0,
		name_display = "新年福袋2024A(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai9",
		show_group = "",
		skin_inquire_relation = 86200,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi183",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86200,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[84] = {
		limit_group = 0,
		name = "新年福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 84,
		gem = 0,
		name_display = "新年福袋2025B",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai20",
		show_group = "",
		skin_inquire_relation = 86209,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi184",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[85] = {
		limit_group = 0,
		name = "新年福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2024B(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 85,
		gem = 0,
		name_display = "新年福袋2024B(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai10",
		show_group = "",
		skin_inquire_relation = 86201,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi185",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86201,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[86] = {
		limit_group = 0,
		name = "春節福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 86,
		gem = 0,
		name_display = "春節福袋2025A",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai21",
		show_group = "",
		skin_inquire_relation = 86210,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi186",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[87] = {
		limit_group = 0,
		name = "春節福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 87,
		gem = 0,
		name_display = "春節福袋2025B",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai22",
		show_group = "",
		skin_inquire_relation = 86211,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi187",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[88] = {
		limit_group = 0,
		name = "春節福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2024A(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 88,
		gem = 0,
		name_display = "春節福袋2024A(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai11",
		show_group = "",
		skin_inquire_relation = 86202,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi188",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86202,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[89] = {
		limit_group = 0,
		name = "春節福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "春節福袋2024B(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 89,
		gem = 0,
		name_display = "春節福袋2024B(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai12",
		show_group = "",
		skin_inquire_relation = 86203,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi189",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86203,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	},
	[90] = {
		limit_group = 0,
		name = "着せ替えパック(学園)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "着せ替えパック(学園)",
		first_text = "ランダム着せ替え",
		limit_arg = 2,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		id = 90,
		gem = 0,
		name_display = "着せ替えパック(学園)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai23",
		show_group = "",
		skin_inquire_relation = 86212,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi190",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
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
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81212,
				1
			}
		},
		first_icon = {
			{
				2,
				86212,
				1
			}
		}
	},
	[91] = {
		limit_group = 0,
		name = "夏の水着福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 91,
		gem = 0,
		name_display = "夏の水着福袋2025A",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai24",
		show_group = "",
		skin_inquire_relation = 86213,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi191",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[92] = {
		limit_group = 0,
		name = "夏の水着福袋2024(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2024(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 92,
		gem = 0,
		name_display = "夏の水着福袋2024(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai13",
		show_group = "",
		skin_inquire_relation = 86204,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi192",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[93] = {
		limit_group = 0,
		name = "夏の水着福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "夏の水着福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 93,
		gem = 0,
		name_display = "夏の水着福袋2025B",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai25",
		show_group = "",
		skin_inquire_relation = 86214,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi193",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[94] = {
		limit_group = 0,
		name = "福袋(夏2024)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "福袋(夏2024)(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 94,
		gem = 0,
		name_display = "福袋(夏2024)(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai14",
		show_group = "",
		skin_inquire_relation = 86205,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi194",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
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
		},
		first_icon = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[95] = {
		limit_group = 0,
		name = "着せ替えパック(バニー)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "着せ替えパック(バニー)",
		first_text = "ランダム着せ替え",
		limit_arg = 2,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		id = 95,
		gem = 0,
		name_display = "着せ替えパック(バニー)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai26",
		show_group = "",
		skin_inquire_relation = 86215,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi195",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
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
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81215,
				1
			}
		},
		first_icon = {
			{
				2,
				86215,
				1
			}
		}
	},
	[96] = {
		limit_group = 0,
		name = "八周年福袋A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "八周年福袋A",
		first_text = "ランダム着せ替え",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 96,
		gem = 0,
		name_display = "八周年福袋A",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai27",
		show_group = "",
		skin_inquire_relation = 86217,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi196",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond184",
		extra_service_item = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42076,
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
					2025,
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
				42076,
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
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81217,
				1
			}
		},
		first_icon = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[97] = {
		limit_group = 0,
		name = "七周年福袋A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "七周年福袋A(復刻)",
		first_text = "ランダム着せ替え",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 97,
		gem = 0,
		name_display = "七周年福袋A(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai15",
		show_group = "",
		skin_inquire_relation = 86206,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi197",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond185",
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
					2025,
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
					2025,
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
		},
		first_icon = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[98] = {
		limit_group = 0,
		name = "八周年福袋B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "八周年福袋B",
		first_text = "ランダム着せ替え",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 98,
		gem = 0,
		name_display = "八周年福袋B",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai28",
		show_group = "",
		skin_inquire_relation = 86218,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi198",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond186",
		extra_service_item = {
			{
				2,
				86218,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42076,
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
					2025,
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
				42076,
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
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81218,
				1
			}
		},
		first_icon = {
			{
				2,
				86218,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[99] = {
		limit_group = 0,
		name = "七周年福袋B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "七周年福袋B(復刻)",
		first_text = "ランダム着せ替え",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 99,
		gem = 0,
		name_display = "七周年福袋B(復刻)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai16",
		show_group = "",
		skin_inquire_relation = 86207,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi199",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond187",
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
					2025,
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
					2025,
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
		},
		first_icon = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	},
	[9001] = {
		limit_group = 0,
		name = "着せ替えパック(スポーツ、レースクイーン)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "着せ替えパック(スポーツ、レースクイーン)",
		first_text = "ランダム着せ替え",
		limit_arg = 2,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		id = 9001,
		gem = 0,
		name_display = "着せ替えパック(スポーツ、レースクイーン)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai29",
		show_group = "",
		skin_inquire_relation = 86219,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi200",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		airijp_id = "com.yostarjp.azurlane.diamond188",
		extra_service_item = {
			{
				2,
				86219,
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
					9,
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
					2025,
					10,
					22
				},
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
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81219,
				1
			}
		},
		first_icon = {
			{
				2,
				86219,
				1
			}
		}
	},
	[9007] = {
		limit_group = 0,
		name = "新年福袋2026A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2026A",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 9007,
		gem = 0,
		name_display = "新年福袋2026A",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai30",
		show_group = "",
		skin_inquire_relation = 86222,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi206",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond189",
		extra_service_item = {
			{
				2,
				86222,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
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
					12,
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
					2026,
					1,
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
				42076,
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
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81230,
				1
			}
		},
		first_icon = {
			{
				2,
				86222,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	},
	[9008] = {
		limit_group = 0,
		name = "新年福袋2025A・復刻",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2025A・復刻",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 9008,
		gem = 0,
		name_display = "新年福袋2025A・復刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai19",
		show_group = "",
		skin_inquire_relation = 86208,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi207",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond190",
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
					2025,
					12,
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
					2026,
					1,
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
		},
		first_icon = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[9009] = {
		limit_group = 0,
		name = "新年福袋2026B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2026B",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 9009,
		gem = 0,
		name_display = "新年福袋2026B",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai31",
		show_group = "",
		skin_inquire_relation = 86223,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi208",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond191",
		extra_service_item = {
			{
				2,
				86223,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
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
					12,
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
					2026,
					1,
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
				42076,
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
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81231,
				1
			}
		},
		first_icon = {
			{
				2,
				86223,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	},
	[9010] = {
		limit_group = 0,
		name = "新年福袋2025B・復刻",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		type_order = 2,
		subject = "新年福袋2025B・復刻",
		first_text = "ランダム着せ替えとダイヤ",
		limit_arg = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		id = 9010,
		gem = 0,
		name_display = "新年福袋2025B・復刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai20",
		show_group = "",
		skin_inquire_relation = 86209,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi209",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		airijp_id = "com.yostarjp.azurlane.diamond192",
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
					2025,
					12,
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
					2026,
					1,
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
		},
		first_icon = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	},
	[1000] = {
		limit_group = 0,
		name = "クルーズパス",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "クルーズパス",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1000,
		name_display = "クルーズパス",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(21初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "クルーズパス(21初冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1001,
		name_display = "クルーズパス(21初冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "クルーズパス(22冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1002,
		name_display = "クルーズパス(22冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass3",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "クルーズパス(22春)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1003,
		name_display = "クルーズパス(22春)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass4",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "クルーズパス(22初夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1004,
		name_display = "クルーズパス(22初夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass5",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(22夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1005,
		name_display = "クルーズパス(22夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass6",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(22秋)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1006,
		name_display = "クルーズパス(22秋)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass7",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(22初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(22初冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1007,
		name_display = "クルーズパス(22初冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass8",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1008,
		name_display = "クルーズパス(23冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass9",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23春)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1009,
		name_display = "クルーズパス(23春)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass10",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23初夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1010,
		name_display = "クルーズパス(23初夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass12",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1011,
		name_display = "クルーズパス(23夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass13",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23秋)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1012,
		name_display = "クルーズパス(23秋)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass14",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(23初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(23初冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1013,
		name_display = "クルーズパス(23初冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass15",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(24冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1014,
		name_display = "クルーズパス(24冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass16",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(24春)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1015,
		name_display = "クルーズパス(24春)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass17",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(24初夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1016,
		name_display = "クルーズパス(24初夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass18",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(24夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1017,
		name_display = "クルーズパス(24夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass19",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "クルーズパス(24秋)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1018,
		name_display = "クルーズパス(24秋)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass20",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(24初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "クルーズパス(24初冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1019,
		name_display = "クルーズパス(24初冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass21",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(25冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "クルーズパス(25冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1020,
		name_display = "クルーズパス(25冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass22",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(25春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "クルーズパス(25春)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1021,
		name_display = "クルーズパス(25春)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass23",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(25初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "クルーズパス(25初夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1022,
		name_display = "クルーズパス(25初夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass24",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "クルーズパス(25夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		type_order = 6,
		subject = "クルーズパス(25夏)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1023,
		name_display = "クルーズパス(25夏)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass25",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
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
	[1024] = {
		limit_group = 0,
		name = "クルーズパス(25秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		type_order = 6,
		subject = "クルーズパス(25秋)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1024,
		name_display = "クルーズパス(25秋)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass26",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass25",
		extra_service_item = {
			{
				1,
				4025,
				1500
			},
			{
				8,
				65106,
				1
			}
		},
		time = {
			{
				{
					2025,
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
					2025,
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
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7025,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[1025] = {
		limit_group = 0,
		name = "クルーズパス(25初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		type_order = 6,
		subject = "クルーズパス(25初冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1025,
		name_display = "クルーズパス(25初冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass27",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass26",
		extra_service_item = {
			{
				1,
				4026,
				1500
			},
			{
				8,
				65108,
				1
			}
		},
		time = {
			{
				{
					2025,
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
					2026,
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
			7026,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2001] = {
		limit_group = 1,
		name = "PR特別計画艦パック・Ⅰ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅰ期",
		first_text = "特別計画艦",
		limit_arg = 0,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		id = 2001,
		gem = 0,
		name_display = "PR特別計画艦パック・Ⅰ期",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "特別計画艦・Ⅰ期と交換できるアイテムなどを入手できます",
		package_tag_open = 0,
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
		drop_item = {},
		first_icon = {
			{
				2,
				40124,
				1
			}
		}
	},
	[2002] = {
		limit_group = 1,
		name = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2002,
		name_display = "PR艦船Ⅰ期交換アイテム\n＋強化ユニットセット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 1,
		name = "PR艦船Ⅰ期交換アイテム",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2003,
		name_display = "PR艦船Ⅰ期交換アイテム",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_normal",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 1,
		name = "PR特別計画艦Ⅰ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅰ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 1000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2004,
		name_display = "強化ユニット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan3",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 2,
		name = "PR特別計画艦パック・Ⅱ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅱ期",
		first_text = "特別計画艦",
		limit_arg = 0,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		id = 2005,
		gem = 0,
		name_display = "PR特別計画艦パック・Ⅱ期",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "特別計画艦・Ⅱ期と交換できるアイテムなどを入手できます",
		package_tag_open = 0,
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
		drop_item = {},
		first_icon = {
			{
				2,
				40125,
				1
			}
		}
	},
	[2006] = {
		limit_group = 2,
		name = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2006,
		name_display = "PR艦船Ⅱ期交換アイテム\n＋強化ユニットセット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan4",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 2,
		name = "PR艦船Ⅱ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2007,
		name_display = "PR艦船Ⅱ期交換アイテム",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_normal",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan5",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 2,
		name = "PR特別計画艦Ⅱ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅱ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 1000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2008,
		name_display = "強化ユニット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan6",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "指揮官レベルアップパック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "さらに",
		type_order = 7,
		subject = "指揮官レベルアップパック",
		first_text = "指揮官Lv70に",
		limit_arg = 1,
		tip = "",
		money = 650,
		tip_open = 0,
		tag = 2,
		id = 2009,
		gem = 0,
		name_display = "指揮官レベルアップパック",
		package_sort_id = 1,
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "lv_70",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao104",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると指揮官レベルがLv70に上がり、さらにアイテムを大量に入手可能",
		package_tag_open = 0,
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
		},
		first_icon = {
			{
				2,
				40126,
				1
			}
		}
	},
	[2010] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2010,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 1,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao105",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2011,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 1,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao106",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2014,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao109",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 3,
		name = "PR特別計画艦パック・Ⅲ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅲ期",
		first_text = "特別計画艦",
		limit_arg = 0,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		id = 2015,
		gem = 0,
		name_display = "PR特別計画艦パック・Ⅲ期",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "特別計画艦・Ⅲ期と交換できるアイテムなどを入手できます",
		package_tag_open = 0,
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
		drop_item = {},
		first_icon = {
			{
				2,
				40130,
				1
			}
		}
	},
	[2016] = {
		limit_group = 3,
		name = "PR艦船Ⅲ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2016,
		name_display = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan7",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 3,
		name = "PR艦船Ⅲ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2017,
		name_display = "PR艦船Ⅲ期交換アイテム",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_normal",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan8",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 3,
		name = "PR特別計画艦Ⅲ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅲ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 1000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2018,
		name_display = "強化ユニット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan9",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2019,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao110",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "冬のお得福袋・2024",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "冬のお得福袋・2024",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 5280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2020,
		name_display = "冬のお得福袋・2024",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "dongzhi3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao111",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べるUR着せ替え福袋①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べるUR着せ替え福袋①",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2021,
		name_display = "選べるUR着せ替え福袋①",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "haishangchuanqi",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao112",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "キューブ補給パック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック①",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 250,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2022,
		name_display = "キューブ補給パック①",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "mofangzhiyuan1",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao113",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "キューブ10個を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "キューブ補給パック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック②",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 610,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2023,
		name_display = "キューブ補給パック②",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "mofangzhiyuan2",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao114",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "キューブ20個を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "キューブ補給パック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック③",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1100,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2024,
		name_display = "キューブ補給パック③",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "mofangzhiyuan3",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao115",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "キューブ30個を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得パック(デイリー)",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "お得パック(デイリー)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2025,
		name_display = "お得パック(デイリー)",
		limit_type = 4,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "richang",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao116",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入するとキューブ1個、燃料1200を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "教科書パック ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2026,
		name_display = "教科書パック ",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao118",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 4,
		name = "PR特別計画艦パック·Ⅳ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅳ期",
		first_text = "特別計画艦",
		limit_arg = 0,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		id = 2027,
		gem = 0,
		name_display = "PR特別計画艦パック·Ⅳ期",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "特別計画艦・Ⅳ期と交換できるアイテムなどを入手できます",
		package_tag_open = 0,
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
		drop_item = {},
		first_icon = {
			{
				2,
				40139,
				1
			}
		}
	},
	[2028] = {
		limit_group = 4,
		name = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2028,
		name_display = "PR艦船Ⅳ期交換アイテム\n＋強化ユニットセット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan10",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 4,
		name = "PR艦船Ⅳ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2029,
		name_display = "PR艦船Ⅳ期交換アイテム",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_normal",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan11",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 4,
		name = "PR特別計画艦Ⅳ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅳ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 1000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2030,
		name_display = "強化ユニット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan12",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べるUR着せ替え福袋②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べるUR着せ替え福袋②",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2031,
		name_display = "選べるUR着せ替え福袋②",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "お得 ",
		picture = "daofeng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao119",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 1,
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
		limit_group = 101,
		name = "戦闘UI・レインボー",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・レインボー",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2032,
		name_display = "戦闘UI・レインボー",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		package_tag_open = 0,
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
		limit_group = 101,
		name = "戦闘UI・レインボー（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・レインボー（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2033,
		name_display = "戦闘UI・レインボー（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		package_tag_open = 0,
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
		limit_group = 101,
		name = "戦闘UI・レインボー（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・レインボー（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2034,
		name_display = "戦闘UI・レインボー（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UIテーマ・レインボー,ダイヤ×3060を入手できます",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べるUR着せ替え福袋③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋③",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2035,
		name_display = "選べるUR着せ替え福袋③",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao120",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2036,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao121",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 102,
		name = "戦闘UI・クリスマス",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・クリスマス",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2037,
		name_display = "戦闘UI・クリスマス",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui3",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・クリスマスを入手できます",
		package_tag_open = 0,
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
		limit_group = 102,
		name = "戦闘UI・クリスマス（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・クリスマス（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2038,
		name_display = "戦闘UI・クリスマス（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui4",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・クリスマスを入手できます",
		package_tag_open = 0,
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
		limit_group = 102,
		name = "戦闘UI・クリスマス（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・クリスマス（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2039,
		name_display = "戦闘UI・クリスマス（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui5",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・クリスマス,ダイヤ×3060を入手できます",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "冬のお得福袋・2025",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "冬のお得福袋・2025",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 5280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2040,
		name_display = "冬のお得福袋・2025",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "dongzhi3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao122",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べるUR着せ替え福袋D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋D",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2041,
		name_display = "選べるUR着せ替え福袋D",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "お得 ",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao123",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 1,
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
		limit_group = 103,
		name = "戦闘UI・ファラオ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ファラオ",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2042,
		name_display = "戦闘UI・ファラオ",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui6",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ファラオを入手できます",
		package_tag_open = 0,
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
		limit_group = 103,
		name = "戦闘UI・ファラオ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ファラオ（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2043,
		name_display = "戦闘UI・ファラオ（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui7",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ファラオを入手できます",
		package_tag_open = 0,
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
		limit_group = 103,
		name = "戦闘UI・ファラオ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ファラオ（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2044,
		name_display = "戦闘UI・ファラオ（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui8",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ファラオ,ダイヤ×3060を入手できます",
		package_tag_open = 0,
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
		limit_group = 104,
		name = "戦闘UI・ジーン",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ジーン",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2045,
		name_display = "戦闘UI・ジーン",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui9",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ジーンを入手できます",
		package_tag_open = 0,
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
		limit_group = 104,
		name = "戦闘UI・ジーン（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ジーン（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2046,
		name_display = "戦闘UI・ジーン（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui10",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ジーンを入手できます",
		package_tag_open = 0,
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
		limit_group = 104,
		name = "戦闘UI・ジーン（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・ジーン（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2047,
		name_display = "戦闘UI・ジーン（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui11",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・ジーン,ダイヤ×3060を入手できます",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "選べるUR着せ替え福袋E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋E",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2048,
		name_display = "選べるUR着せ替え福袋E",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "お得 ",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao124",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 1,
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
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2049,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao125",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
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
		limit_group = 105,
		name = "戦闘UI・シーサイド",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シーサイド",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2050,
		name_display = "戦闘UI・シーサイド",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui5",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui12",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シーサイドを入手できます",
		package_tag_open = 0,
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
		limit_group = 105,
		name = "戦闘UI・シーサイド（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シーサイド（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2051,
		name_display = "戦闘UI・シーサイド（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui5",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui13",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シーサイドを入手できます",
		package_tag_open = 0,
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
		limit_group = 105,
		name = "戦闘UI・シーサイド（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シーサイド（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2052,
		name_display = "戦闘UI・シーサイド（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui5",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui14",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シーサイド,ダイヤ×3060を入手できます",
		package_tag_open = 0,
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
		limit_group = 5,
		name = "PR特別計画艦パック·Ⅴ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		type_order = 0,
		subject = "PR特別計画艦パック・Ⅴ期",
		first_text = "特別計画艦",
		limit_arg = 0,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		id = 2053,
		gem = 0,
		name_display = "PR特別計画艦パック·Ⅴ期",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "特別計画艦・Ⅴ期と交換できるアイテムなどを入手できます",
		package_tag_open = 0,
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
		drop_item = {},
		first_icon = {
			{
				2,
				40140,
				1
			}
		}
	},
	[2054] = {
		limit_group = 5,
		name = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2054,
		name_display = "PR艦船Ⅴ期交換アイテム\n＋強化ユニットセット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan13",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 5,
		name = "PR艦船Ⅴ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2055,
		name_display = "PR艦船Ⅴ期交換アイテム",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_normal",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan14",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
		limit_group = 5,
		name = "PR特別計画艦Ⅴ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅴ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 1000,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2056,
		name_display = "強化ユニット",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_promotion",
		package_sort_id = 3,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.keyan15",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "内容",
		show_group = "tech",
		package_tag_open = 0,
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
	[2057] = {
		limit_group = 106,
		name = "戦闘UI・シノビ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シノビ",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2057,
		name_display = "戦闘UI・シノビ",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui15",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シノビを入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui15",
		extra_service_item = {
			{
				31,
				205,
				1
			}
		},
		time = {
			{
				{
					2025,
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
					2025,
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
				205,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2058] = {
		limit_group = 106,
		name = "戦闘UI・シノビ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シノビ（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2058,
		name_display = "戦闘UI・シノビ（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui16",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シノビを入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui16",
		extra_service_item = {
			{
				31,
				205,
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
					2025,
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
				205,
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
				40065,
				1
			}
		}
	},
	[2059] = {
		limit_group = 106,
		name = "戦闘UI・シノビ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・シノビ（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2059,
		name_display = "戦闘UI・シノビ（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui17",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・シノビ,ダイヤ×3060を入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui17",
		extra_service_item = {
			{
				31,
				205,
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
					2025,
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
				205,
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
				40066,
				1
			}
		}
	},
	[2063] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋F",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋F",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2063,
		name_display = "選べるUR着せ替え福袋F",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "お得 ",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao126",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		show_group = "",
		package_tag_open = 1,
		airijp_id = "com.yostarjp.azurlane.package126",
		extra_service_item = {
			{
				2,
				59565,
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
					11,
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
				59565,
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
				40070,
				1
			}
		}
	},
	[2064] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "教科書パック",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2064,
		name_display = "教科書パック",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao127",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "購入すると教科書を大量に入手可能",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package127",
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
					2026,
					4,
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
	[2068] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・メイドカフェ",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2068,
		name_display = "戦闘UI・メイドカフェ",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui18",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・メイドカフェを入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui18",
		extra_service_item = {
			{
				31,
				206,
				1
			}
		},
		time = {
			{
				{
					2025,
					12,
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
					2026,
					1,
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
				31,
				206,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	[2069] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・メイドカフェ（単品）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2069,
		name_display = "戦闘UI・メイドカフェ（単品）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui19",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・メイドカフェを入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui19",
		extra_service_item = {
			{
				31,
				206,
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
					12,
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
					2026,
					1,
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
				31,
				206,
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
				40074,
				1
			}
		}
	},
	[2070] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "戦闘UI・メイドカフェ（セット）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2070,
		name_display = "戦闘UI・メイドカフェ（セット）",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui20",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "戦闘UI・メイドカフェ,ダイヤ×3060を入手できます",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui20",
		extra_service_item = {
			{
				31,
				206,
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
					12,
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
					2026,
					1,
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
				31,
				206,
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
				40075,
				1
			}
		}
	},
	[5001] = {
		limit_group = 0,
		name = "お得デイリーパック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック①",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5001,
		name_display = "お得デイリーパック①",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao201",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・五期目×2を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック②",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5002,
		name_display = "お得デイリーパック②",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao202",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×200を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック③",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5003,
		name_display = "お得デイリーパック③",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao203",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "SSR選択装備箱×1と、指向性強化パーツT4×5を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック④",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック④",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5004,
		name_display = "お得デイリーパック④",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao204",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック⑤",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック⑤",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5005,
		name_display = "お得デイリーパック⑤",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day5",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao205",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "艦船経験値パックT2×60を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック⑥",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック⑥",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5006,
		name_display = "お得デイリーパック⑥",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao206",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック⑦",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "お得デイリーパック⑦",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5007,
		name_display = "お得デイリーパック⑦",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao207",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・六期目×2を入手可能",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025A",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025A",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5011,
		name_display = "お得デイリーパック2025A",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day1",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao211",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅵ期目×2を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025B",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025B",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5012,
		name_display = "お得デイリーパック2025B",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day2",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao212",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×200を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025C",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025C",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5013,
		name_display = "お得デイリーパック2025C",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day3",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao213",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "指向性強化パーツT4×5、メンタルユニット×200を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025D",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5014,
		name_display = "お得デイリーパック2025D",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day4",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao214",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025E",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5015,
		name_display = "お得デイリーパック2025E",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day5",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao215",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "艦船経験値パックT2×60を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025F",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025F",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5016,
		name_display = "お得デイリーパック2025F",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day6",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao216",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		show_group = "",
		package_tag_open = 0,
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
		limit_group = 0,
		name = "お得デイリーパック2025G",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025G",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5017,
		name_display = "お得デイリーパック2025G",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day7",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao217",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅶ期目×2を入手可能",
		show_group = "",
		package_tag_open = 0,
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
