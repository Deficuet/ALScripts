pg = pg or {}
pg.pay_data_display = rawget(pg, "pay_data_display") or setmetatable({
	__name = "pay_data_display"
}, confNEO)
pg.pay_data_display.__namecode__ = true
pg.pay_data_display.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
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
	60,
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
	80,
	81,
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
	9002,
	9003,
	9004,
	9005,
	9006,
	9007,
	9008,
	9009,
	9010,
	9011,
	9012,
	9013,
	9014,
	9015,
	9016,
	9017,
	9018,
	9019,
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
	1026,
	1027,
	1028,
	1302,
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
	2071,
	2074,
	2075,
	2076,
	2077,
	2078,
	2079,
	2080,
	2081,
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
pg.base = pg.base or {}
pg.base.pay_data_display = {}

;(function()
	pg.base.pay_data_display[1] = {
		limit_group = 0,
		name = "贸易许可证（30日）",
		descrip_extra = "",
		type = 0,
		second_text = "30日内每日可获得",
		type_order = 0,
		subject = "贸易许可证",
		first_text = "立即获得",
		limit_arg = 7,
		tip = "",
		money = 30,
		tip_open = 0,
		tag = 2,
		id = 1,
		gem = 500,
		name_display = "贸易许可证（30日）",
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
		extra_gem = 0,
		descrip = "购买后立即获得$1钻,30日内每天获得资源",
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
	}
	pg.base.pay_data_display[2] = {
		limit_group = 0,
		name = "新手启航补给",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "新手起航补给",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 1,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 30,
		id = 2,
		name_display = "新手启航补给",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "新手\n推荐",
		picture = "boxNewplayer",
		package_sort_id = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi101",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得建造及钻石资源",
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
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			},
			{
				1,
				4,
				30
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
	}
	pg.base.pay_data_display[3] = {
		limit_group = 0,
		name = "几个钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*60",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 3,
		name_display = "几个钻石",
		extra_service_item = "0",
		gem = 60,
		show_group = "",
		limit_type = 99,
		package_tag = "",
		picture = "1",
		id_str = "com.bilibili.blhx.zuanshi1",
		extra_gem = 0,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[4] = {
		limit_group = 0,
		name = "一小堆钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*300",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 30,
		id = 4,
		name_display = "一小堆钻石",
		extra_service_item = "0",
		gem = 300,
		show_group = "",
		limit_type = 99,
		package_tag = "",
		picture = "2",
		id_str = "com.bilibili.blhx.zuanshi2",
		extra_gem = 30,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[5] = {
		limit_group = 0,
		name = "一大袋钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*980",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 98,
		id = 5,
		name_display = "一大袋钻石",
		extra_service_item = "0",
		gem = 980,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "3",
		id_str = "com.bilibili.blhx.zuanshi3",
		extra_gem = 120,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[6] = {
		limit_group = 0,
		name = "一小箱钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*1980",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 198,
		id = 6,
		name_display = "一小箱钻石",
		extra_service_item = "0",
		gem = 1980,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "4",
		id_str = "com.bilibili.blhx.zuanshi4",
		extra_gem = 300,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[7] = {
		limit_group = 0,
		name = "一大箱钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*3280",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 328,
		id = 7,
		name_display = "一大箱钻石",
		extra_service_item = "0",
		gem = 3280,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "5",
		id_str = "com.bilibili.blhx.zuanshi5",
		extra_gem = 720,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[8] = {
		limit_group = 0,
		name = "一整船钻石",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "钻石*6480",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 648,
		id = 8,
		name_display = "一整船钻石",
		extra_service_item = "0",
		gem = 6480,
		show_group = "",
		limit_type = 0,
		package_tag = "",
		picture = "6",
		id_str = "com.bilibili.blhx.zuanshi6",
		extra_gem = 2400,
		descrip = "额外赠送$1钻",
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
	}
	pg.base.pay_data_display[9] = {
		limit_group = 0,
		name = "新年福袋",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。已获得的衣装将自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 9,
		name_display = "新年福袋",
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
		descrip = "可获得一件角色新年换装，3个外观装备箱，和大量其他奖励",
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
	}
	pg.base.pay_data_display[11] = {
		limit_group = 0,
		name = "国庆福袋",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则会转化为对应原价9折的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "国庆福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 11,
		name_display = "国庆福袋",
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
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[12] = {
		limit_group = 0,
		name = "2019新年福袋",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "2019新年福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 12,
		name_display = "2019新年福袋",
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
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[13] = {
		limit_group = 0,
		name = "2019春节福袋",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "2019春节福袋",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 13,
		name_display = "2019春节福袋",
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
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[14] = {
		limit_group = 0,
		name = "二周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "二周年礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 14,
		name_display = "二周年礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe2_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi111",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[15] = {
		limit_group = 0,
		name = "2019国庆礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "2019国庆礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 15,
		name_display = "2019国庆礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe1_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi113",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond109",
		extra_service_item = {
			{
				2,
				69906,
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
				69906,
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
				40906,
				1
			}
		}
	}
	pg.base.pay_data_display[16] = {
		limit_group = 0,
		name = "新年福袋2020",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2020",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
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
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[17] = {
		limit_group = 0,
		name = "新年福袋复刻(2019)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋复刻(2019)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 17,
		name_display = "新年福袋复刻(2019)",
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
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[18] = {
		limit_group = 0,
		name = "春节福袋2020",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋2020",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 18,
		name_display = "春节福袋2020",
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
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[19] = {
		limit_group = 0,
		name = "春节福袋复刻(2019)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋复刻(2019)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		id = 19,
		name_display = "春节福袋复刻(2019)",
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
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[20] = {
		limit_group = 0,
		name = "新晋指挥官支援包·I",
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "+更多资源",
		type_order = 0,
		subject = "新晋指挥官支援包·I ",
		first_text = "包含钻石",
		limit_arg = 1,
		tip = "",
		money = 18,
		tip_open = 0,
		tag = 1,
		id = 20,
		gem = 0,
		name_display = "新晋指挥官支援包·I",
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
		descrip = "可获得180钻，石油储备箱(1000)x2和其他奖励",
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
	}
	pg.base.pay_data_display[21] = {
		limit_group = 0,
		name = "新晋指挥官支援包·II",
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "+更多资源",
		type_order = 0,
		subject = "新晋指挥官支援包·II ",
		first_text = "包含钻石",
		limit_arg = 1,
		tip = "",
		money = 78,
		tip_open = 0,
		tag = 1,
		id = 21,
		gem = 0,
		name_display = "新晋指挥官支援包·II",
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
		descrip = "可获得780钻，定向装备箱·超稀有x2，石油储备箱(1000)x4和其他奖励",
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
	}
	pg.base.pay_data_display[22] = {
		limit_group = 0,
		name = "新晋指挥官支援包·III",
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "+更多资源",
		type_order = 0,
		subject = "新晋指挥官支援包·III ",
		first_text = "包含钻石",
		limit_arg = 1,
		tip = "",
		money = 168,
		tip_open = 0,
		tag = 1,
		id = 22,
		gem = 0,
		name_display = "新晋指挥官支援包·III",
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
		descrip = "可获得1680钻，定向装备箱·超稀有x4，石油储备箱(1000)x8和其他奖励",
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
	}
	pg.base.pay_data_display[23] = {
		limit_group = 0,
		name = "三周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "三周年礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 23,
		name_display = "三周年礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe4_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi122",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[24] = {
		limit_group = 0,
		name = "2020国庆礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "2020国庆礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 24,
		name_display = "2020国庆礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe3_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi123",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[25] = {
		limit_group = 0,
		name = "新年福袋2021",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2021",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[26] = {
		limit_group = 0,
		name = "新年福袋复刻(2020)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋复刻(2020)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 26,
		name_display = "新年福袋复刻(2020)",
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
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[27] = {
		limit_group = 0,
		name = "春节福袋2021",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋2021",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 27,
		name_display = "春节福袋2021",
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[28] = {
		limit_group = 0,
		name = "春节福袋复刻(2020)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋复刻(2020)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 28,
		name_display = "春节福袋复刻(2020)",
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
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[29] = {
		limit_group = 0,
		name = "四周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "四周年礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 29,
		name_display = "四周年礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe5_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi128",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[30] = {
		limit_group = 0,
		name = "三周年礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "三周年礼盒复刻",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 30,
		name_display = "三周年礼盒复刻",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe4_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi129",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[31] = {
		limit_group = 0,
		name = "大型作战攻略支援包",
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 1,
		second_text = "+更多资源",
		type_order = 0,
		subject = "大型作战攻略支援包",
		first_text = "包含钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 1,
		id = 31,
		gem = 0,
		name_display = "大型作战攻略支援包",
		package_sort_id = 0,
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
		descrip = "可获得1980钻，定向部件T4x35，定向装备箱·研发装备①x1和其他奖励",
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
	}
	pg.base.pay_data_display[32] = {
		limit_group = 0,
		name = "2021国庆礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "2021国庆礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 32,
		name_display = "2021国庆礼盒",
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[33] = {
		limit_group = 0,
		name = "国庆礼盒复刻（2020）",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "国庆礼盒复刻(2020)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 33,
		name_display = "国庆礼盒复刻（2020）",
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
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[34] = {
		limit_group = 0,
		name = "新年福袋2022",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[35] = {
		limit_group = 0,
		name = "新年福袋复刻(2021)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "新年福袋复刻(2021)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 35,
		name_display = "新年福袋复刻(2021)",
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[36] = {
		limit_group = 0,
		name = "春节福袋2022",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 36,
		name_display = "春节福袋2022",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[37] = {
		limit_group = 0,
		name = "春节福袋复刻(2021)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "春节福袋复刻(2021)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 37,
		name_display = "春节福袋复刻(2021)",
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[38] = {
		limit_group = 0,
		name = "五周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "五周年礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 38,
		name_display = "五周年礼盒",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[39] = {
		limit_group = 0,
		name = "四周年礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 0,
		subject = "四周年礼盒复刻",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 39,
		name_display = "四周年礼盒复刻",
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
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[40] = {
		limit_group = 0,
		name = "金秋庆典礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "金秋庆典礼盒",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 40,
		name_display = "金秋庆典礼盒",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe8_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi139",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[41] = {
		limit_group = 0,
		name = "金秋庆典礼盒（2021）",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "金秋庆典礼盒（2021）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 41,
		name_display = "金秋庆典礼盒（2021）",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe6_l",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi140",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[44] = {
		limit_group = 0,
		name = "回归礼包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "回归礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 44,
		name_display = "回归礼包",
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
		descrip = "可获得大量材料奖励",
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
	}
	pg.base.pay_data_display[45] = {
		limit_group = 0,
		name = "2023泳装礼盒·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "2023泳装礼盒·I",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 45,
		name_display = "2023泳装礼盒·I",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[46] = {
		limit_group = 0,
		name = "2023泳装礼盒·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "2023泳装礼盒·II",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 46,
		name_display = "2023泳装礼盒·II",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[47] = {
		limit_group = 0,
		name = "新年福袋复刻(2022)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "新年福袋2022",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 47,
		name_display = "新年福袋复刻(2022)",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[48] = {
		limit_group = 0,
		name = "2023年春节福袋·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "2023年春节福袋·I",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 48,
		name_display = "2023年春节福袋·I",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[49] = {
		limit_group = 0,
		name = "2023年春节福袋·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "2023年春节福袋·II",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 49,
		name_display = "2023年春节福袋·II",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[50] = {
		limit_group = 0,
		name = "春节福袋复刻(2022)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "",
		type_order = 2,
		subject = "春节福袋复刻(2022)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 50,
		name_display = "春节福袋复刻(2022)",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[51] = {
		limit_group = 0,
		name = "六周年泳装礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "六周年泳装礼盒",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 51,
		gem = 0,
		name_display = "六周年泳装礼盒",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[52] = {
		limit_group = 0,
		name = "六周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "六周年礼盒",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 52,
		gem = 0,
		name_display = "六周年礼盒",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[53] = {
		limit_group = 0,
		name = "五周年礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "五周年礼盒复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 53,
		gem = 0,
		name_display = "五周年礼盒复刻",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[55] = {
		limit_group = 0,
		name = "金秋庆典礼盒(2023)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "金秋庆典礼盒(2023)",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 55,
		gem = 0,
		name_display = "金秋庆典礼盒(2023)",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[56] = {
		limit_group = 0,
		name = "金秋庆典礼盒复刻(2022)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "金秋庆典礼盒复刻(2022)",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 56,
		gem = 0,
		name_display = "金秋庆典礼盒复刻(2022)",
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
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[57] = {
		limit_group = 0,
		name = "金秋礼盒2023",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "金秋礼盒2023",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 57,
		gem = 0,
		name_display = "金秋礼盒2023",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[58] = {
		limit_group = 0,
		name = "茗的促销大礼包",
		descrip_extra = "礼盒将发送到邮箱，请注意查收。\n*自选促销礼物盒需要在仓库中使用",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "茗的促销大礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 58,
		name_display = "茗的促销大礼包",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_198",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi158",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1980钻，自选促销礼物盒*1，和大量其他奖励",
		show_group = "",
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
	}
	pg.base.pay_data_display[59] = {
		limit_group = 0,
		name = "茗的豪华促销大礼包",
		descrip_extra = "礼盒将发送到邮箱，请注意查收。\n*豪华自选促销礼物盒中的促销换装兑换券（限时）具有时限，请即时使用。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "茗的豪华促销大礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 328,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 59,
		name_display = "茗的豪华促销大礼包",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_328",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi159",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3280钻，豪华自选促销礼物盒*1，和大量其他奖励",
		show_group = "",
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
	}
	pg.base.pay_data_display[60] = {
		limit_group = 0,
		name = "促销心动福袋",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "促销心动福袋",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 60,
		gem = 0,
		name_display = "促销心动福袋",
		package_sort_id = 0,
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai8",
		extra_service = 3,
		skin_inquire_relation = 69984,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi160",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond146",
		extra_service_item = {
			{
				2,
				69984,
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
				35
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40998,
				1
			}
		},
		first_icon = {
			{
				2,
				69984,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[61] = {
		limit_group = 0,
		name = "绚烂缤纷夜福袋·I",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "绚烂缤纷夜福袋·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 61,
		gem = 0,
		name_display = "绚烂缤纷夜福袋·I",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[62] = {
		limit_group = 0,
		name = "2023泳装礼盒·I复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2023泳装礼盒·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 62,
		gem = 0,
		name_display = "2023泳装礼盒·I复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[63] = {
		limit_group = 0,
		name = "绚烂缤纷夜福袋·Ⅱ",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "绚烂缤纷夜福袋·Ⅱ",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 63,
		gem = 0,
		name_display = "绚烂缤纷夜福袋·Ⅱ",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[64] = {
		limit_group = 0,
		name = "2023泳装礼盒·Ⅱ复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2023泳装礼盒·Ⅱ复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 64,
		gem = 0,
		name_display = "2023泳装礼盒·Ⅱ复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[65] = {
		limit_group = 0,
		name = "2024年春节福袋·I",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2024年春节福袋·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 65,
		gem = 0,
		name_display = "2024年春节福袋·I",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[66] = {
		limit_group = 0,
		name = "2023年春节福袋·I复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2023年春节福袋·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 66,
		gem = 0,
		name_display = "2023年春节福袋·I复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[67] = {
		limit_group = 0,
		name = "2024年春节福袋·II",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2024年春节福袋·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 67,
		gem = 0,
		name_display = "2024年春节福袋·II",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[68] = {
		limit_group = 0,
		name = "2023年春节福袋·II复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2023年春节福袋·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 68,
		gem = 0,
		name_display = "2023年春节福袋·II复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[69] = {
		limit_group = 0,
		name = "七周年泳装礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "七周年泳装礼盒",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 69,
		gem = 0,
		name_display = "七周年泳装礼盒",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[70] = {
		limit_group = 0,
		name = "六周年泳装礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "六周年泳装礼盒复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 70,
		gem = 0,
		name_display = "六周年泳装礼盒复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[71] = {
		limit_group = 0,
		name = "七周年礼盒",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "七周年礼盒",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 71,
		gem = 0,
		name_display = "七周年礼盒",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[72] = {
		limit_group = 0,
		name = "六周年礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "六周年礼盒复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 72,
		gem = 0,
		name_display = "六周年礼盒复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[73] = {
		limit_group = 0,
		name = "梦幻乐园换装礼盒I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 3,
		subject = "梦幻乐园换装礼盒I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 73,
		gem = 0,
		name_display = "梦幻乐园换装礼盒I",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[74] = {
		limit_group = 0,
		name = "金秋礼盒2023复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 3,
		subject = "金秋礼盒2023复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 74,
		gem = 0,
		name_display = "金秋礼盒2023复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[75] = {
		limit_group = 0,
		name = "梦幻乐园换装礼盒II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "梦幻乐园换装礼盒II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 75,
		gem = 0,
		name_display = "梦幻乐园换装礼盒II",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[76] = {
		limit_group = 0,
		name = "金秋庆典礼盒(2023)复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "金秋庆典礼盒(2023)复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 76,
		gem = 0,
		name_display = "金秋庆典礼盒(2023)复刻",
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
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[77] = {
		limit_group = 0,
		name = "冬日自选礼包1",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包1",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 98,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 77,
		name_display = "冬日自选礼包1",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_98",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi177",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得980钻，冬日自选礼物盒1*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond165",
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
	}
	pg.base.pay_data_display[78] = {
		limit_group = 0,
		name = "冬日自选礼包2",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包2",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 78,
		name_display = "冬日自选礼包2",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_198",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi178",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1980钻，冬日自选礼物盒2*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond166",
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
	}
	pg.base.pay_data_display[79] = {
		limit_group = 0,
		name = "冬日自选礼包3",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包3",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 328,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 79,
		name_display = "冬日自选礼包3",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_328",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi179",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3280钻，冬日自选礼物盒3*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond167",
		extra_service_item = {
			{
				2,
				59563,
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
				59563,
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
				81421,
				1
			}
		}
	}
	pg.base.pay_data_display[80] = {
		limit_group = 0,
		name = "豪华冬至促销礼盒(2024)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "豪华冬至促销礼盒(2024)",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 80,
		gem = 0,
		name_display = "豪华冬至促销礼盒(2024)",
		package_sort_id = 0,
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai17",
		extra_service = 3,
		skin_inquire_relation = 86411,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi180",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond168",
		extra_service_item = {
			{
				2,
				86411,
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
				35
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81419,
				1
			}
		},
		first_icon = {
			{
				2,
				86411,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[81] = {
		limit_group = 0,
		name = "冬至促销礼盒(2024)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得1080钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "冬至促销礼盒(2024)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 68,
		tip_open = 0,
		tag = 2,
		id = 81,
		gem = 0,
		name_display = "冬至促销礼盒(2024)",
		package_sort_id = 0,
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai18",
		extra_service = 3,
		skin_inquire_relation = 86412,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi181",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得列表中未拥有的L2D换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond169",
		extra_service_item = {
			{
				2,
				86412,
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
				81420,
				1
			}
		},
		first_icon = {
			{
				2,
				86412,
				1
			}
		}
	}
	pg.base.pay_data_display[82] = {
		limit_group = 0,
		name = "港区游戏之夜礼盒·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "港区游戏之夜礼盒·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 82,
		gem = 0,
		name_display = "港区游戏之夜礼盒·I",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[83] = {
		limit_group = 0,
		name = "绚烂缤纷夜福袋·I复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "绚烂缤纷夜福袋·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 83,
		gem = 0,
		name_display = "绚烂缤纷夜福袋·I复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[84] = {
		limit_group = 0,
		name = "港区游戏之夜礼盒·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "港区游戏之夜礼盒·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 84,
		gem = 0,
		name_display = "港区游戏之夜礼盒·II",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[85] = {
		limit_group = 0,
		name = "绚烂缤纷夜福袋·II复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "绚烂缤纷夜福袋·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 85,
		gem = 0,
		name_display = "绚烂缤纷夜福袋·II复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[86] = {
		limit_group = 0,
		name = "2025年春节福袋一",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2025年春节福袋一",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 86,
		gem = 0,
		name_display = "2025年春节福袋一",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[87] = {
		limit_group = 0,
		name = "2025年春节福袋·II",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2025年春节福袋·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 87,
		gem = 0,
		name_display = "2025年春节福袋二",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[88] = {
		limit_group = 0,
		name = "2024年春节福袋·I复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2024年春节福袋·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 88,
		gem = 0,
		name_display = "2024年春节福袋·I复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[89] = {
		limit_group = 0,
		name = "2024年春节福袋·II复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2024年春节福袋·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 89,
		gem = 0,
		name_display = "2024年春节福袋·II复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[90] = {
		limit_group = 0,
		name = "换装礼盒(校园生活)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得680钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "换装礼盒(校园生活)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 48,
		tip_open = 0,
		tag = 2,
		id = 90,
		gem = 0,
		name_display = "换装礼盒(校园生活)",
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
		descrip = "可获得列表中未拥有的换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
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
	}
	pg.base.pay_data_display[91] = {
		limit_group = 0,
		name = "八周年泳装礼盒·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "八周年泳装礼盒·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 91,
		gem = 0,
		name_display = "八周年泳装礼盒·I",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[92] = {
		limit_group = 0,
		name = "七周年泳装礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "七周年泳装礼盒复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 92,
		gem = 0,
		name_display = "七周年泳装礼盒复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[93] = {
		limit_group = 0,
		name = "八周年泳装礼盒·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "八周年泳装礼盒·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 93,
		gem = 0,
		name_display = "八周年泳装礼盒·II",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[94] = {
		limit_group = 0,
		name = "七周年礼盒复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "七周年礼盒复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 94,
		gem = 0,
		name_display = "七周年礼盒复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[95] = {
		limit_group = 0,
		name = "换装礼盒(嘉年华)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得680钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "换装礼盒(嘉年华)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 48,
		tip_open = 0,
		tag = 2,
		id = 95,
		gem = 0,
		name_display = "换装礼盒(嘉年华)",
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
		descrip = "可获得列表中未拥有的换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
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
	}
	pg.base.pay_data_display[96] = {
		limit_group = 0,
		name = "忍者之城换装礼盒I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "忍者之城换装礼盒I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 96,
		gem = 0,
		name_display = "忍者之城换装礼盒I",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[97] = {
		limit_group = 0,
		name = "梦幻乐园换装礼盒I复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "梦幻乐园换装礼盒I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 97,
		gem = 0,
		name_display = "梦幻乐园换装礼盒I复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[98] = {
		limit_group = 0,
		name = "忍者之城换装礼盒II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "忍者之城换装礼盒II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 98,
		gem = 0,
		name_display = "忍者之城换装礼盒II",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[99] = {
		limit_group = 0,
		name = "梦幻乐园换装礼盒II复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "梦幻乐园换装礼盒II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 99,
		gem = 0,
		name_display = "梦幻乐园换装礼盒II复刻",
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
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[9001] = {
		limit_group = 0,
		name = "换装礼盒(疾速狂热)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得680钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "换装礼盒(疾速狂热)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 48,
		tip_open = 0,
		tag = 2,
		id = 9001,
		gem = 0,
		name_display = "换装礼盒(疾速狂热)",
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
		descrip = "可获得列表中未拥有的换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
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
	}
	pg.base.pay_data_display[9002] = {
		limit_group = 0,
		name = "冬日自选礼包1(2025)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包1(2025)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 98,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 9002,
		name_display = "冬日自选礼包1(2025)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_98",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi201",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得980钻，冬日自选礼物盒1*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond197",
		extra_service_item = {
			{
				2,
				81221,
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
					2025,
					12,
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
					2025,
					12,
					18
				},
				{
					12,
					0,
					0
				}
			}
		},
		display = {
			{
				2,
				81221,
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
				81225,
				1
			}
		}
	}
	pg.base.pay_data_display[9003] = {
		limit_group = 0,
		name = "冬日自选礼包2(2025)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包2(2025)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 198,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 9003,
		name_display = "冬日自选礼包2(2025)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_198",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi202",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1980钻，冬日自选礼物盒2*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond198",
		extra_service_item = {
			{
				2,
				81222,
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
					2025,
					12,
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
					2025,
					12,
					18
				},
				{
					12,
					0,
					0
				}
			}
		},
		display = {
			{
				2,
				81222,
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
				81226,
				1
			}
		}
	}
	pg.base.pay_data_display[9004] = {
		limit_group = 0,
		name = "冬日自选礼包3(2025)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 2,
		subject = "冬日自选礼包3(2025)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 328,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 9004,
		name_display = "冬日自选礼包3(2025)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_2024_328",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.zuanshi203",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3280钻，冬日自选礼物盒3*1，和大量其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond199",
		extra_service_item = {
			{
				2,
				81223,
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
					2025,
					12,
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
					2025,
					12,
					18
				},
				{
					12,
					0,
					0
				}
			}
		},
		display = {
			{
				2,
				81223,
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
				81227,
				1
			}
		}
	}
	pg.base.pay_data_display[9005] = {
		limit_group = 0,
		name = "豪华冬日促销礼盒(2025)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "豪华冬日促销礼盒(2025)",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9005,
		gem = 0,
		name_display = "豪华冬日促销礼盒(2025)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai99",
		show_group = "",
		skin_inquire_relation = 86220,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi204",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond200",
		extra_service_item = {
			{
				2,
				86220,
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
					2025,
					12,
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
					2025,
					12,
					18
				},
				{
					12,
					0,
					0
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
				35
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81228,
				1
			}
		},
		first_icon = {
			{
				2,
				86220,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
end)()
;(function()
	pg.base.pay_data_display[9006] = {
		limit_group = 0,
		name = "冬日促销礼盒(2025)",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得1080钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "冬日促销礼盒(2025)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 68,
		tip_open = 0,
		tag = 2,
		id = 9006,
		gem = 0,
		name_display = "冬日促销礼盒(2025)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai_L2d_new",
		show_group = "",
		skin_inquire_relation = 86221,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi205",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得列表中未拥有的L2D换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond201",
		extra_service_item = {
			{
				2,
				86221,
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
					12,
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
					2025,
					12,
					18
				},
				{
					12,
					0,
					0
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
				81229,
				1
			}
		},
		first_icon = {
			{
				2,
				86221,
				1
			}
		}
	}
	pg.base.pay_data_display[9007] = {
		limit_group = 0,
		name = "庆典狂欢夜礼盒·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "庆典狂欢夜礼盒·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9007,
		gem = 0,
		name_display = "庆典狂欢夜礼盒·I",
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
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[9008] = {
		limit_group = 0,
		name = "港区游戏之夜礼盒·I复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "港区游戏之夜礼盒·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9008,
		gem = 0,
		name_display = "港区游戏之夜礼盒·I复刻",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[9009] = {
		limit_group = 0,
		name = "庆典狂欢夜礼盒·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "庆典狂欢夜礼盒·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9009,
		gem = 0,
		name_display = "庆典狂欢夜礼盒·II",
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
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[9010] = {
		limit_group = 0,
		name = "港区游戏之夜礼盒·II复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "港区游戏之夜礼盒·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9010,
		gem = 0,
		name_display = "港区游戏之夜礼盒·II复刻",
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
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
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
	}
	pg.base.pay_data_display[9011] = {
		limit_group = 0,
		name = "2026年春节福袋·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2026年春节福袋·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9011,
		gem = 0,
		name_display = "2026年春节福袋·I",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai32",
		show_group = "",
		skin_inquire_relation = 86224,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi210",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond193",
		extra_service_item = {
			{
				2,
				86224,
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
					2026,
					2,
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
					2026,
					3,
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
				81232,
				1
			}
		},
		first_icon = {
			{
				2,
				86224,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9012] = {
		limit_group = 0,
		name = "2025年春节福袋·I复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2025年春节福袋·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9012,
		gem = 0,
		name_display = "2025年春节福袋·I复刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai21",
		show_group = "",
		skin_inquire_relation = 86210,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi211",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond194",
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
					2026,
					2,
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
					2026,
					3,
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
	}
	pg.base.pay_data_display[9013] = {
		limit_group = 0,
		name = "2026年春节福袋·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2026年春节福袋·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9013,
		gem = 0,
		name_display = "2026年春节福袋·II",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai33",
		show_group = "",
		skin_inquire_relation = 86225,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi212",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond195",
		extra_service_item = {
			{
				2,
				86225,
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
					2026,
					2,
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
					2026,
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
				81233,
				1
			}
		},
		first_icon = {
			{
				2,
				86225,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9014] = {
		limit_group = 0,
		name = "2025年春节福袋·II复刻",
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "2025年春节福袋·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9014,
		gem = 0,
		name_display = "2025年春节福袋·II复刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai22",
		show_group = "",
		skin_inquire_relation = 86211,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi213",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond196",
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
					2026,
					2,
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
					2026,
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
	}
	pg.base.pay_data_display[9015] = {
		limit_group = 0,
		name = "换装礼盒(宴会礼服)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得680钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "换装礼盒(宴会礼服)",
		first_text = "随机换装",
		limit_arg = 2,
		tip = "",
		money = 48,
		tip_open = 0,
		tag = 2,
		id = 9015,
		gem = 0,
		name_display = "换装礼盒(宴会礼服)",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai34",
		show_group = "",
		skin_inquire_relation = 86226,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi214",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得列表中未拥有的换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond202",
		extra_service_item = {
			{
				2,
				86226,
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
					2026,
					3,
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
					2026,
					4,
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
				81234,
				1
			}
		},
		first_icon = {
			{
				2,
				86226,
				1
			}
		}
	}
	pg.base.pay_data_display[9016] = {
		limit_group = 0,
		name = "九周年泳装礼盒·I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "九周年泳装礼盒·I",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9016,
		gem = 0,
		name_display = "九周年泳装礼盒·I",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai35",
		show_group = "",
		skin_inquire_relation = 86227,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi215",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond203",
		extra_service_item = {
			{
				2,
				86227,
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
					2026,
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
					2026,
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
				81235,
				1
			}
		},
		first_icon = {
			{
				2,
				86227,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9017] = {
		limit_group = 0,
		name = "八周年泳装礼盒·I复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "八周年泳装礼盒·I复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9017,
		gem = 0,
		name_display = "八周年泳装礼盒·I复刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai24",
		show_group = "",
		skin_inquire_relation = 86213,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi216",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond204",
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
					2026,
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
					2026,
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
	}
	pg.base.pay_data_display[9018] = {
		limit_group = 0,
		name = "九周年泳装礼盒·II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "九周年泳装礼盒·II",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9018,
		gem = 0,
		name_display = "九周年泳装礼盒·II",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai36",
		show_group = "",
		skin_inquire_relation = 86228,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi217",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2026钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond205",
		extra_service_item = {
			{
				2,
				86228,
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
					2026,
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
					2026,
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
				81236,
				1
			}
		},
		first_icon = {
			{
				2,
				86228,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9019] = {
		limit_group = 0,
		name = "八周年泳装礼盒·II复刻",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		second_text = "大量奖励",
		type_order = 2,
		subject = "八周年泳装礼盒·II复刻",
		first_text = "随机换装和大量钻石",
		limit_arg = 1,
		tip = "",
		money = 198,
		tip_open = 0,
		tag = 2,
		id = 9019,
		gem = 0,
		name_display = "八周年泳装礼盒·II复刻",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "fudai25",
		show_group = "",
		skin_inquire_relation = 86214,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.zuanshi218",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2025钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond206",
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
					2026,
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
					2026,
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
	}
	pg.base.pay_data_display[1000] = {
		limit_group = 0,
		name = "特许巡游凭证",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1000,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:约克城限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1001] = {
		limit_group = 0,
		name = "特许巡游凭证(2021.12.1-1.31)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1001,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:科罗拉多限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1002] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.2)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1002,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:哥伦比亚限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1003] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.4)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1003,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·企业限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1004] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.6)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1004,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·枫限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1005] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.8)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1005,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·苝限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1006] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.10)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1006,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·水星纪念限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1007] = {
		limit_group = 0,
		name = "特许巡游凭证(2022.12)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1007,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·克利夫兰限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1008] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.2)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1008,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·棭限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1009] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.4)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1009,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·沃克兰限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1010] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.6)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1010,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·鸾限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1011] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.8)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1011,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·福煦限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1012] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.10)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1012,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·优斯伊丽限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1013] = {
		limit_group = 0,
		name = "特许巡游凭证(2023.12)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1013,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·梅限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1014] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.2)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1014,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·梧限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1015] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.4)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1015,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·柏限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1016] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.6)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1016,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·阿蒂利奥·雷戈洛限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1017] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.8)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1017,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·罗马限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1018] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.10)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1018,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·絮弗伦限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1019] = {
		limit_group = 0,
		name = "特许巡游凭证(2024.12)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1019,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·威悉限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1020] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.2)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1020,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·反击限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1021] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.4)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1021,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·神速限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1022] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.6)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1022,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·檚限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1023] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.8)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "解锁特许奖励",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1023,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·蒙彼利埃限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1024] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.10)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1024,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·茳限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1025] = {
		limit_group = 0,
		name = "特许巡游凭证(2025.12)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "解锁特许奖励",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1025,
		name_display = "特许巡游凭证",
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
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·十纱限定换装和其他奖励",
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
	}
	pg.base.pay_data_display[1026] = {
		limit_group = 0,
		name = "特许巡游凭证(2026.2)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "解锁特许奖励",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1026,
		name_display = "特许巡游凭证",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass28",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·希娜限定换装和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass27",
		extra_service_item = {
			{
				1,
				4027,
				1500
			},
			{
				8,
				65113,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
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
			7027,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1027] = {
		limit_group = 0,
		name = "特许巡游凭证(2026.4)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "解锁特许奖励",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1027,
		name_display = "特许巡游凭证",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass29",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·阿芙乐尔限定换装和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass28",
		extra_service_item = {
			{
				1,
				4028,
				1500
			},
			{
				8,
				65116,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
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
			7028,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1028] = {
		limit_group = 0,
		name = "特许巡游凭证(2026.6)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "特许巡游凭证",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1028,
		name_display = "特许巡游凭证",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass30",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·梧限定换装和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass29",
		extra_service_item = {
			{
				1,
				4029,
				1500
			},
			{
				8,
				65117,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
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
			7029,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1302] = {
		limit_group = 0,
		name = "冬日特许巡游凭证(2025.12)",
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "冬日特许巡游凭证(2025.12)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 50,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 1302,
		name_display = "冬日特许巡游凭证(2025.12)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "battlepass_winter_1",
		extra_service = 4,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.battlepass302",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得200巡游点数，同时解锁特许巡游奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass301",
		extra_service_item = {
			{
				1,
				4102,
				200
			},
			{
				8,
				65112,
				1
			}
		},
		time = {
			{
				{
					2025,
					12,
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
					2025,
					12,
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
				65112,
				200
			}
		},
		sub_display = {
			7302,
			200
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2001] = {
		limit_group = 1,
		name = "最高方案研发礼包(一期)",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+大量蓝图",
		type_order = 0,
		subject = "最高方案研发礼包(一期)",
		first_text = "快速研发",
		limit_arg = 0,
		tip = "",
		money = 108,
		tip_open = 0,
		tag = 2,
		id = 2001,
		gem = 0,
		name_display = "最高方案研发礼包(一期)",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·一期*1、定向蓝图·一期*343",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2002] = {
		limit_group = 1,
		name = "最高方案研发礼包(一期)高级版",
		descrip_extra = "*最高方案快速研发券·一期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(一期)高级版",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 108,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2002,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2003] = {
		limit_group = 1,
		name = "最高方案研发礼包(一期)标准版",
		descrip_extra = "*最高方案快速研发券·一期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(一期)标准版",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2003,
		name_display = "标准版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2004] = {
		limit_group = 1,
		name = "最高方案研发礼包(一期)升级版",
		descrip_extra = "升级为高级版后可获得定向蓝图·一期x343",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(一期)升级版",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 40,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2004,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2005] = {
		limit_group = 2,
		name = "最高方案研发礼包(二期)",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+大量蓝图",
		type_order = 0,
		subject = "最高方案研发礼包(二期)",
		first_text = "快速研发",
		limit_arg = 0,
		tip = "",
		money = 108,
		tip_open = 0,
		tag = 2,
		id = 2005,
		gem = 0,
		name_display = "最高方案研发礼包(二期)",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·二期*1、定向蓝图·二期*343",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2006] = {
		limit_group = 2,
		name = "最高方案研发礼包(二期)高级版",
		descrip_extra = "*最高方案快速研发券·二期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(二期)高级版",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 108,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2006,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2007] = {
		limit_group = 2,
		name = "最高方案研发礼包(二期)标准版",
		descrip_extra = "*最高方案快速研发券·二期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(二期)标准版",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2007,
		name_display = "标准版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2008] = {
		limit_group = 2,
		name = "最高方案研发礼包(二期)升级版",
		descrip_extra = "升级为高级版后可获得定向蓝图·二期x343",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(二期)升级版",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 40,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2008,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2009] = {
		limit_group = 0,
		name = "即刻出战礼包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "还可获得",
		type_order = 7,
		subject = "即刻出战礼包",
		first_text = "直升至70级",
		limit_arg = 1,
		tip = "",
		money = 30,
		tip_open = 0,
		tag = 2,
		id = 2009,
		gem = 0,
		name_display = "即刻出战礼包",
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
		descrip = "购买后指挥官等级将提升至70级和大量其他奖励",
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
	}
	pg.base.pay_data_display[2010] = {
		limit_group = 0,
		name = "舰艇教材礼包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2010,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2011] = {
		limit_group = 0,
		name = "舰艇教材礼包(2022秋)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2011,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2012] = {
		limit_group = 0,
		name = "冬至礼包1",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "冬至礼包1",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 88,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2012,
		name_display = "冬至礼包1",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "dongzhi1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao107",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1280钻，定向部件T4x15和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package107",
		extra_service_item = {
			{
				1,
				14,
				1280
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				17003,
				10
			},
			{
				2,
				17013,
				10
			},
			{
				2,
				17023,
				10
			},
			{
				2,
				17033,
				10
			},
			{
				2,
				17043,
				10
			}
		},
		time = {
			{
				{
					2022,
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
				1,
				14,
				1280
			},
			{
				2,
				30114,
				15
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40981,
				1
			}
		}
	}
	pg.base.pay_data_display[2013] = {
		limit_group = 0,
		name = "冬至礼包2",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "冬至礼包2",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 168,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2013,
		name_display = "冬至礼包2",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "dongzhi2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao108",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得2480钻，定向外观装备箱(星辰无垠)x2和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package108",
		extra_service_item = {
			{
				1,
				14,
				2480
			},
			{
				2,
				30515,
				2
			},
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			},
			{
				2,
				15001,
				60
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
				1,
				14,
				2480
			},
			{
				2,
				30515,
				2
			},
			{
				2,
				20001,
				10
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40983,
				1
			}
		}
	}
	pg.base.pay_data_display[2014] = {
		limit_group = 0,
		name = "舰艇教材礼包(2023春)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2014,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2015] = {
		limit_group = 3,
		name = "最高方案研发礼包(三期)",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+大量蓝图",
		type_order = 0,
		subject = "最高方案研发礼包(三期)",
		first_text = "快速研发",
		limit_arg = 0,
		tip = "",
		money = 108,
		tip_open = 0,
		tag = 2,
		id = 2015,
		gem = 0,
		name_display = "最高方案研发礼包(三期)",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·三期*1、定向蓝图·三期*343",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2016] = {
		limit_group = 3,
		name = "最高方案研发礼包(三期)高级版",
		descrip_extra = "*最高方案快速研发券·三期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(三期)高级版",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 108,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2016,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2017] = {
		limit_group = 3,
		name = "最高方案研发礼包(三期)标准版",
		descrip_extra = "*最高方案快速研发券·三期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(三期)标准版",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2017,
		name_display = "标准版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2018] = {
		limit_group = 3,
		name = "最高方案研发礼包(三期)升级版",
		descrip_extra = "升级为高级版后可获得定向蓝图·三期x343",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(三期)升级版",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 40,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2018,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2019] = {
		limit_group = 0,
		name = "舰艇教材礼包(2023秋)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2019,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2020] = {
		limit_group = 0,
		name = "冬至礼包(2023冬)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "冬至礼包(2023冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2020,
		name_display = "冬至礼包(2023冬)",
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
		descrip = "可获得3880钻，和特装型布里MKIII*1和其他奖励",
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
	}
	pg.base.pay_data_display[2021] = {
		limit_group = 0,
		name = "海上传奇支援组合包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "海上传奇支援组合包",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2021,
		name_display = "海上传奇支援组合包",
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
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2022] = {
		limit_group = 0,
		name = "魔方支援礼包1",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "魔方支援礼包1",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 12,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2022,
		name_display = "魔方支援礼包1",
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
		descrip = "可获得心智魔方*10",
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
	}
	pg.base.pay_data_display[2023] = {
		limit_group = 0,
		name = "魔方支援礼包2",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "魔方支援礼包2",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 30,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2023,
		name_display = "魔方支援礼包2",
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
		descrip = "可获得心智魔方*20",
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
	}
	pg.base.pay_data_display[2024] = {
		limit_group = 0,
		name = "魔方支援礼包3",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "魔方支援礼包3",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 56,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2024,
		name_display = "魔方支援礼包3",
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
		descrip = "可获得心智魔方*30",
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
	}
	pg.base.pay_data_display[2025] = {
		limit_group = 0,
		name = "日常补给礼包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "每日可购",
		type_order = 6,
		subject = "日常补给礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2025,
		name_display = "日常补给礼包",
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
		descrip = "购买礼包可获得心智魔方*1和石油*1200",
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
	}
	pg.base.pay_data_display[2026] = {
		limit_group = 0,
		name = "舰艇教材礼包(2024春)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2026,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2027] = {
		limit_group = 4,
		name = "最高方案研发礼包(四期)",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+大量蓝图",
		type_order = 0,
		subject = "最高方案研发礼包(四期)",
		first_text = "快速研发",
		limit_arg = 0,
		tip = "",
		money = 108,
		tip_open = 0,
		tag = 2,
		id = 2027,
		gem = 0,
		name_display = "最高方案研发礼包(四期)",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·四期*1、定向蓝图·四期*343",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2028] = {
		limit_group = 4,
		name = "最高方案研发礼包(四期)高级版",
		descrip_extra = "*最高方案快速研发券·四期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(四期)高级版",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 108,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2028,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2029] = {
		limit_group = 4,
		name = "最高方案研发礼包(四期)标准版",
		descrip_extra = "*最高方案快速研发券·四期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(四期)标准版",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2029,
		name_display = "标准版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2030] = {
		limit_group = 4,
		name = "最高方案研发礼包(四期)升级版",
		descrip_extra = "升级为高级版后可获得定向蓝图·四期x343",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(四期)升级版",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 40,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2030,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2031] = {
		limit_group = 0,
		name = "海上传奇支援组合包(240718)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "海上传奇支援组合包(240718)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2031,
		name_display = "海上传奇支援组合包(240718)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "超值\n推荐",
		picture = "daofeng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao119",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2032] = {
		limit_group = 101,
		name = "梦幻霓虹主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "梦幻霓虹主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2032,
		name_display = "梦幻霓虹主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui1",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 梦幻霓虹*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2033] = {
		limit_group = 101,
		name = "梦幻霓虹主题礼包（基础版）",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "梦幻霓虹主题礼包（基础版）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2033,
		name_display = "梦幻霓虹主题礼包（基础版）",
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
		descrip = "可获得战斗界面主题 梦幻霓虹*1",
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
	}
	pg.base.pay_data_display[2034] = {
		limit_group = 101,
		name = "梦幻霓虹主题礼包（豪华版）",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "梦幻霓虹主题礼包（豪华版）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2034,
		name_display = "梦幻霓虹主题礼包（豪华版）",
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
		descrip = "可获得战斗界面主题 梦幻霓虹*1,3060钻石",
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
	}
	pg.base.pay_data_display[2035] = {
		limit_group = 0,
		name = "海上传奇支援组合包(241017)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "海上传奇支援组合包(241017)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2035,
		name_display = "海上传奇支援组合包",
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
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2036] = {
		limit_group = 0,
		name = "舰艇教材礼包(2024冬)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2036,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2037] = {
		limit_group = 102,
		name = "圣诞雪境主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣诞雪境主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2037,
		name_display = "圣诞雪境主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui2",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 圣诞雪境*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2038] = {
		limit_group = 102,
		name = "圣诞雪境主题礼包（基础版）",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣诞雪境主题礼包（基础版）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2038,
		name_display = "圣诞雪境主题礼包（基础版）",
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
		descrip = "可获得战斗界面主题 圣诞雪境*1",
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
	}
	pg.base.pay_data_display[2039] = {
		limit_group = 102,
		name = "圣诞雪境主题礼包（豪华版）",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣诞雪境主题礼包（豪华版）",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2039,
		name_display = "圣诞雪境主题礼包（豪华版）",
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
		descrip = "可获得战斗界面主题 圣诞雪境*1,3060钻石",
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
	}
	pg.base.pay_data_display[2040] = {
		limit_group = 0,
		name = "冬至礼包(2024冬)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "冬至礼包(2024冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2040,
		name_display = "冬至礼包(2024冬)",
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
		descrip = "可获得3880钻，和特装型布里MKIII*1和其他奖励",
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
	}
	pg.base.pay_data_display[2041] = {
		limit_group = 0,
		name = "海上传奇支援组合包(250109)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "海上传奇支援组合包(250109)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2041,
		name_display = "海上传奇支援组合包",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "超值\n推荐",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao123",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2042] = {
		limit_group = 103,
		name = "圣砂之约主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣砂之约主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2042,
		name_display = "圣砂之约主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 圣砂之约*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2043] = {
		limit_group = 103,
		name = "圣砂之约主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣砂之约主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2043,
		name_display = "圣砂之约主题礼包(基础版)",
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
		descrip = "可获得战斗界面主题 圣砂之约*1",
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
	}
	pg.base.pay_data_display[2044] = {
		limit_group = 103,
		name = "圣砂之约主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "圣砂之约主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2044,
		name_display = "圣砂之约主题礼包(豪华版)",
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
		descrip = "可获得战斗界面主题 圣砂之约*1,3060钻石",
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
	}
	pg.base.pay_data_display[2045] = {
		limit_group = 104,
		name = "基因之源主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "基因之源主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2045,
		name_display = "基因之源主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui4",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 基因之源*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2046] = {
		limit_group = 104,
		name = "基因之源主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "基因之源主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2046,
		name_display = "基因之源主题礼包(基础版)",
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
		descrip = "可获得战斗界面主题 基因之源*1",
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
	}
	pg.base.pay_data_display[2047] = {
		limit_group = 104,
		name = "基因之源主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "基因之源主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2047,
		name_display = "基因之源主题礼包(豪华版)",
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
		descrip = "可获得战斗界面主题 基因之源*1,3060钻石",
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
	}
	pg.base.pay_data_display[2048] = {
		limit_group = 0,
		name = "海上传奇支援组合包(250417)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "海上传奇支援组合包(250417)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2048,
		name_display = "海上传奇支援组合包",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "超值\n推荐",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao124",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2049] = {
		limit_group = 0,
		name = "舰艇教材礼包(2025春)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "大量教材",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2049,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2050] = {
		limit_group = 105,
		name = "海滨假日主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "海滨假日主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2050,
		name_display = "海滨假日主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui5",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 海滨假日*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2051] = {
		limit_group = 105,
		name = "海滨假日主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "海滨假日主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2051,
		name_display = "海滨假日主题礼包(基础版)",
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
		descrip = "可获得战斗界面主题 海滨假日*1,1000物资",
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
	}
	pg.base.pay_data_display[2052] = {
		limit_group = 105,
		name = "海滨假日主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "海滨假日主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2052,
		name_display = "海滨假日主题礼包(豪华版)",
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
		descrip = "可获得战斗界面主题 海滨假日*1,3060钻石",
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
	}
	pg.base.pay_data_display[2053] = {
		limit_group = 5,
		name = "最高方案研发礼包(五期)",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+大量蓝图",
		type_order = 0,
		subject = "最高方案研发礼包(五期)",
		first_text = "快速研发",
		limit_arg = 0,
		tip = "",
		money = 108,
		tip_open = 0,
		tag = 2,
		id = 2053,
		gem = 0,
		name_display = "最高方案研发礼包(五期)",
		package_sort_id = 3,
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_display",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "tech",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·五期*1、定向蓝图·五期*343",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2054] = {
		limit_group = 5,
		name = "最高方案研发礼包(五期)高级版",
		descrip_extra = "*最高方案快速研发券·五期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(五期)高级版",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 108,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2054,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2055] = {
		limit_group = 5,
		name = "最高方案研发礼包(五期)标准版",
		descrip_extra = "*最高方案快速研发券·五期奖励可能发生变化，点击道具查看详情",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(五期)标准版",
		first_text = "",
		first_icon = "",
		limit_arg = 2,
		money = 68,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2055,
		name_display = "标准版",
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
		descrip = "礼包内容",
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
	}
	pg.base.pay_data_display[2056] = {
		limit_group = 5,
		name = "最高方案研发礼包(五期)升级版",
		descrip_extra = "升级为高级版后可获得定向蓝图·五期x343",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "最高方案研发礼包(五期)升级版",
		first_text = "",
		first_icon = "",
		limit_arg = 3,
		money = 40,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2056,
		name_display = "高级版",
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
		descrip = "礼包内容",
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
	}
end)()
;(function()
	pg.base.pay_data_display[2057] = {
		limit_group = 106,
		name = "忍者之城主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "忍者之城主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2057,
		name_display = "忍者之城主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui6",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 忍者之城*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2058] = {
		limit_group = 106,
		name = "忍者之城主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "忍者之城主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2058,
		name_display = "忍者之城主题礼包(基础版)",
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
		descrip = "可获得战斗界面主题 忍者之城*1,1000物资",
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
	}
	pg.base.pay_data_display[2059] = {
		limit_group = 106,
		name = "忍者之城主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "忍者之城主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2059,
		name_display = "忍者之城主题礼包(豪华版)",
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
		descrip = "可获得战斗界面主题 忍者之城*1,3060钻石",
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
	}
	pg.base.pay_data_display[2063] = {
		limit_group = 0,
		name = "海上传奇支援组合包(251106)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "海上传奇支援组合包(251106)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 128,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2063,
		name_display = "海上传奇支援组合包",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "超值\n推荐",
		picture = "huteng_package",
		sub_display = "",
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao126",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
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
	}
	pg.base.pay_data_display[2064] = {
		limit_group = 0,
		name = "舰艇教材礼包(2025秋)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2064,
		name_display = "舰艇教材礼包",
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
		descrip = "可获得大量教材奖励",
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
	}
	pg.base.pay_data_display[2068] = {
		limit_group = 107,
		name = "甜点女仆屋主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "甜点女仆屋主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2068,
		name_display = "甜点女仆屋主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui7",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 甜点女仆屋*1",
		package_tag_open = 0,
		airijp_id = "",
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
	}
	pg.base.pay_data_display[2069] = {
		limit_group = 107,
		name = "甜点女仆屋主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "甜点女仆屋主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2069,
		name_display = "甜点女仆屋主题礼包(基础版)",
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
		descrip = "可获得战斗界面主题 甜点女仆屋*1,1000物资",
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
	}
	pg.base.pay_data_display[2070] = {
		limit_group = 107,
		name = "甜点女仆屋主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "甜点女仆屋主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2070,
		name_display = "甜点女仆屋主题礼包(豪华版)",
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
		descrip = "可获得战斗界面主题 甜点女仆屋*1,3060钻石",
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
	}
	pg.base.pay_data_display[2071] = {
		limit_group = 0,
		name = "冬至礼包(2025冬)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "冬至礼包(2025冬)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2071,
		name_display = "冬至礼包(2025冬)",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "dongzhi3",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao128",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3880钻，和特装型布里MKIII*1和其他奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package128",
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
				40076,
				1
			}
		}
	}
	pg.base.pay_data_display[2074] = {
		limit_group = 108,
		name = "春满客栈主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "春满客栈主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2074,
		name_display = "春满客栈主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui8",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 春满客栈*1",
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				207,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
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
				31,
				207,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2075] = {
		limit_group = 108,
		name = "春满客栈主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "春满客栈主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2075,
		name_display = "春满客栈主题礼包(基础版)",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui8",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui22",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 春满客栈*1,1000物资",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui22",
		extra_service_item = {
			{
				31,
				207,
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
					2026,
					2,
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
					2026,
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
				31,
				207,
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
				40077,
				1
			}
		}
	}
	pg.base.pay_data_display[2076] = {
		limit_group = 108,
		name = "春满客栈主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "春满客栈主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2076,
		name_display = "春满客栈主题礼包(豪华版)",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui8",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui23",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 春满客栈*1,3060钻石",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui23",
		extra_service_item = {
			{
				31,
				207,
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
					2026,
					2,
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
					2026,
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
				31,
				207,
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
				40078,
				1
			}
		}
	}
	pg.base.pay_data_display[2077] = {
		limit_group = 0,
		name = "战略统合补给包",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "其他丰富奖励",
		type_order = 4,
		subject = "战略统合补给包",
		first_text = "钻石和魔方",
		limit_arg = 1,
		tip = "",
		money = 328,
		tip_open = 0,
		tag = 2,
		id = 2077,
		gem = 0,
		name_display = "战略统合补给包",
		package_sort_id = 0,
		limit_type = 2,
		akashi_pick = 1,
		extra_service = 3,
		package_tag = "",
		picture = "libao260212",
		show_group = "",
		skin_inquire_relation = 0,
		package_tag_open = 0,
		id_str = "com.bilibili.blhx.libao129",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得4000钻，心智魔方*40，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.package129",
		extra_service_item = {
			{
				1,
				14,
				4000
			},
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
				30113,
				50
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
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
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
				40079,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				4000
			},
			{
				2,
				20001,
				40
			}
		}
	}
	pg.base.pay_data_display[2078] = {
		limit_group = 0,
		name = "舰艇教材礼包(2026春)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "舰艇教材礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 4,
		money = 18,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2078,
		name_display = "舰艇教材礼包",
		limit_type = 2,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "boxSkill",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "",
		id_str = "com.bilibili.blhx.libao130",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package130",
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
					2026,
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
					2026,
					11,
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
	}
	pg.base.pay_data_display[2079] = {
		limit_group = 109,
		name = "奢梦浮金主题礼包",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "奢梦浮金主题礼包",
		first_text = "",
		first_icon = "",
		limit_arg = 0,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2079,
		name_display = "奢梦浮金主题礼包",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui9",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 奢梦浮金*1",
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				208,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
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
				208,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2080] = {
		limit_group = 109,
		name = "奢梦浮金主题礼包(基础版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "奢梦浮金主题礼包(基础版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 78,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2080,
		name_display = "奢梦浮金主题礼包(基础版)",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui9",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui25",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 奢梦浮金*1,1000物资",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui25",
		extra_service_item = {
			{
				31,
				208,
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
					2026,
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
					2026,
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
				208,
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
				40080,
				1
			}
		}
	}
	pg.base.pay_data_display[2081] = {
		limit_group = 109,
		name = "奢梦浮金主题礼包(豪华版)",
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 4,
		subject = "奢梦浮金主题礼包(豪华版)",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 258,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 2081,
		name_display = "奢梦浮金主题礼包(豪华版)",
		limit_type = 5,
		package_sort_id = 0,
		akashi_pick = 1,
		package_tag = "",
		picture = "ui9",
		extra_service = 3,
		skin_inquire_relation = 0,
		show_group = "uigift",
		id_str = "com.bilibili.blhx.ui26",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 奢梦浮金*1,3060钻石",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui26",
		extra_service_item = {
			{
				31,
				208,
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
					2026,
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
					2026,
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
				208,
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
				40081,
				1
			}
		}
	}
	pg.base.pay_data_display[5001] = {
		limit_group = 0,
		name = "促销礼包I",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包I",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5001,
		name_display = "促销礼包I",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day1",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao201",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，高级定向蓝图·五期*2",
		show_group = "",
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
	}
	pg.base.pay_data_display[5002] = {
		limit_group = 0,
		name = "促销礼包II",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包II",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5002,
		name_display = "促销礼包II",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day2",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao202",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得200钻",
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package202",
		extra_service_item = {
			{
				1,
				14,
				200
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
	}
	pg.base.pay_data_display[5003] = {
		limit_group = 0,
		name = "促销礼包III",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包III",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5003,
		name_display = "促销礼包III",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day3",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao203",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得定向装备箱·超稀有*1，定向部件T4*5",
		show_group = "",
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
	}
	pg.base.pay_data_display[5004] = {
		limit_group = 0,
		name = "促销礼包IV",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包IV",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5004,
		name_display = "促销礼包IV",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day4",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao204",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，试作型布里MKII*1",
		show_group = "",
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
	}
	pg.base.pay_data_display[5005] = {
		limit_group = 0,
		name = "促销礼包V",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包V",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5005,
		name_display = "促销礼包V",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day5",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao205",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得舰艇演习数据T2*60",
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package205",
		extra_service_item = {
			{
				2,
				16502,
				60
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
	}
	pg.base.pay_data_display[5006] = {
		limit_group = 0,
		name = "促销礼包VI",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包VI",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5006,
		name_display = "促销礼包VI",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day6",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao206",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得心智魔方*10，快速完成工具*5",
		show_group = "",
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
	}
	pg.base.pay_data_display[5007] = {
		limit_group = 0,
		name = "促销礼包VII",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "促销礼包VII",
		first_text = "",
		first_icon = "",
		limit_arg = 1,
		money = 6,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		id = 5007,
		name_display = "促销礼包VII",
		limit_type = 2,
		time = "stop",
		akashi_pick = 1,
		package_tag = "",
		picture = "pack_day7",
		package_sort_id = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao207",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，高级定向蓝图·六期*2",
		show_group = "",
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
	}
	pg.base.pay_data_display[5011] = {
		limit_group = 0,
		name = "促销礼包I(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包I",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5011,
		name_display = "促销礼包I",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day1",
		id_str = "com.bilibili.blhx.libao211",
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，高级定向蓝图·六期*2",
		airijp_id = "com.yostarjp.azurlane.package211",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
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
	}
	pg.base.pay_data_display[5012] = {
		limit_group = 0,
		name = "促销礼包II(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包II",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5012,
		name_display = "促销礼包II",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day2",
		id_str = "com.bilibili.blhx.libao212",
		extra_gem = 0,
		descrip = "购买礼包可获得200钻",
		airijp_id = "com.yostarjp.azurlane.package212",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
		extra_service_item = {
			{
				1,
				14,
				200
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
	}
	pg.base.pay_data_display[5013] = {
		limit_group = 0,
		name = "促销礼包III(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包III",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5013,
		name_display = "促销礼包III",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day3",
		id_str = "com.bilibili.blhx.libao213",
		extra_gem = 0,
		descrip = "购买礼包可获得定向部件T4*5，心智单元*200",
		airijp_id = "com.yostarjp.azurlane.package213",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
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
	}
	pg.base.pay_data_display[5014] = {
		limit_group = 0,
		name = "促销礼包IV(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包IV",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5014,
		name_display = "促销礼包IV",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day4",
		id_str = "com.bilibili.blhx.libao214",
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，试作型布里MKII*1",
		airijp_id = "com.yostarjp.azurlane.package214",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
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
	}
	pg.base.pay_data_display[5015] = {
		limit_group = 0,
		name = "促销礼包V(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包V",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5015,
		name_display = "促销礼包V",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day5",
		id_str = "com.bilibili.blhx.libao215",
		extra_gem = 0,
		descrip = "购买礼包可获得舰艇演习数据T2*60",
		airijp_id = "com.yostarjp.azurlane.package215",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				16502,
				60
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
	}
	pg.base.pay_data_display[5016] = {
		limit_group = 0,
		name = "促销礼包VI(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包VI",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5016,
		name_display = "促销礼包VI",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day6",
		id_str = "com.bilibili.blhx.libao216",
		extra_gem = 0,
		descrip = "购买礼包可获得心智魔方*10，快速完成工具*5",
		airijp_id = "com.yostarjp.azurlane.package216",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
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
	}
	pg.base.pay_data_display[5017] = {
		limit_group = 0,
		name = "促销礼包VII(2024)",
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "促销礼包VII",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 6,
		id = 5017,
		name_display = "促销礼包VII",
		show_group = "",
		gem = 0,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day7",
		id_str = "com.bilibili.blhx.libao217",
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，高级定向蓝图·七期*2",
		airijp_id = "com.yostarjp.azurlane.package217",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "stop",
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		limit_arg = 1,
		package_tag_open = 0,
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
end)()
