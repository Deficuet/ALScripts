pg = pg or {}
pg.island_shop_goods = rawget(pg, "island_shop_goods") or setmetatable({
	__name = "island_shop_goods"
}, confNEO)
pg.island_shop_goods.__namecode__ = true
pg.island_shop_goods.all = {
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
	10301,
	10302,
	10303,
	10304,
	10305,
	10306,
	10307,
	10308,
	10309,
	10310,
	10311,
	10312,
	10313,
	10314,
	10315,
	10316,
	10317,
	10318,
	10319,
	10320,
	10321,
	10322,
	10323,
	10324,
	10325,
	10326,
	10327,
	10328,
	10329,
	10330,
	10331,
	10332,
	10333,
	10334,
	10335,
	10336,
	10337,
	10338,
	10339,
	10340,
	10341,
	10342,
	10343,
	10344,
	10345,
	10346,
	10347,
	10348,
	10349,
	10350,
	10351,
	10352,
	10353,
	10354,
	10355,
	10356,
	10357,
	10358,
	10359,
	10360,
	10361,
	10362,
	10363,
	10364,
	10365,
	10366,
	10367,
	10368,
	10369,
	10401,
	10402,
	10403,
	10404,
	10405,
	10406,
	10407,
	10408,
	10409,
	10410,
	10411,
	10412,
	10413,
	10414,
	10415,
	10416,
	10417,
	10418,
	10419,
	10420,
	10421,
	10422,
	10423,
	10424,
	10425,
	10426,
	10427,
	10428,
	10429,
	10430,
	10431,
	10432,
	10433,
	10434,
	10435,
	10436,
	10437,
	10438,
	10439,
	10440,
	10441,
	10442,
	10443,
	10444,
	10445,
	10446,
	10447,
	10448,
	10449,
	10450,
	10451,
	10452,
	10453,
	10454,
	10455,
	10456,
	10457,
	10458,
	10459,
	10460,
	10461,
	10462,
	10463,
	10464,
	10465,
	10466,
	10467,
	10468,
	10469,
	10470,
	10471,
	10472,
	10473,
	10474,
	10475,
	103000,
	103001,
	103002,
	103003,
	103004,
	111500,
	111502,
	111503,
	111101,
	111102,
	111103,
	111104,
	111105,
	111106,
	111107,
	111108,
	111201,
	111202,
	111203,
	111204,
	111205,
	111206,
	111207,
	111208,
	411000,
	411001,
	411002,
	411003,
	411004,
	411005,
	411006,
	411007,
	411008,
	411009,
	411010,
	411011,
	411012,
	411014,
	411015,
	411016,
	411017,
	411018,
	411019,
	411020,
	411021,
	411022,
	411023,
	411024,
	411025,
	411026,
	411027,
	411028,
	412000,
	412001,
	412002,
	412003,
	4600001,
	4600002,
	4600003,
	4620004,
	4630005,
	4610003,
	4620007,
	4630008,
	4610006,
	4620008,
	4630009,
	4610008,
	5010001,
	5020001,
	5030001,
	5010002,
	5020002,
	5030002,
	5010003,
	5020003,
	5030003,
	5010004,
	5020004,
	5030004,
	471070301,
	473120101,
	471051701,
	471011001,
	475060101,
	474030301,
	471011701,
	472012101,
	473031101,
	472021201,
	479600011,
	99000101,
	99000102,
	99000201,
	99000202,
	99000301,
	99000302,
	461060015
}
pg.base = pg.base or {}
pg.base.island_shop_goods = {}

;(function()
	pg.base.island_shop_goods[10000] = {
		desc = "购买可获得指挥官“浮游炮”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "浮游炮",
		icon = "IslandDressIcon/dress_1020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1020001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10001] = {
		desc = "一次友好的握手，是信任与合作的开始。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "握手",
		icon = "IslandActionIcon/handshake",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				2001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10002] = {
		desc = "激昂的起跳，是为胜利献上的最高欢呼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "胜利起跳",
		icon = "IslandActionIcon/vjump",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10003] = {
		desc = "以汗水浇铸的成就，值得向每一个人展示。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "展示肌肉",
		icon = "IslandActionIcon/muscle",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10004] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10005] = {
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10006] = {
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "玉米",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10007] = {
		desc = "高品质牧草，让牧场充满生机！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10008] = {
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10009] = {
		desc = "清脆可口的白菜，新鲜直采！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10010] = {
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10011] = {
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "土豆",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10012] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10013] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10013,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10014] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10015] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10016] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10017] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10018] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10019] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10020] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10021] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10022] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10023] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10024] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10025] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10025,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10026] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10026,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10027] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10027,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10028] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10028,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10029] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10029,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10030] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10030,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10031] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10031,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10032] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10032,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10033] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10033,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10034] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10034,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10035] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10035,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10036] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10036,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10037] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10037,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10038] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10038,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10039] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10039,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10040] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10040,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10041] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10041,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10042] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10042,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10043] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10043,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10044] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10044,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10045] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10045,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10046] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10046,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10047] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10047,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10048] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10048,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10049] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10049,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10050] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10050,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10051] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10051,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10052] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10052,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10053] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10053,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10054] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10054,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10055] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10055,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10056] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10056,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10057] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10057,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10058] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10058,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10102] = {
		desc = "购买可获得指挥官“草编逸影”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "草编逸影",
		icon = "IslandDressIcon/dress_1010007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1010007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10103] = {
		desc = "自然流畅的英雄登场，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "英雄登场",
		icon = "IslandActionIcon/herocoming",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10103,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1013,
				1
			}
		}
	}
	pg.base.island_shop_goods[10104] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10104,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10105] = {
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10105,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10106] = {
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "玉米",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10106,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10107] = {
		desc = "高品质牧草，让牧场充满生机！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10107,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10108] = {
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10108,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10109] = {
		desc = "清脆可口的白菜，新鲜直采！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10109,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10110] = {
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10110,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10111] = {
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "土豆",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10111,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10112] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10112,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10113] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10113,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10114] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10114,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10115] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10115,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10116] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10116,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10117] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10117,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10118] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10118,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10119] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10119,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10120] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10120,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10121] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10121,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10122] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10122,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10123] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10123,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10124] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10124,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10125] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10125,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10126] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10126,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10127] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10127,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10128] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10128,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10129] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10129,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10130] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10130,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10131] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10131,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10132] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10132,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10133] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10133,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10134] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10134,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10135] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10135,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10136] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10136,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10137] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10137,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10138] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10138,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10139] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10139,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10140] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10140,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10141] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10141,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10142] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10142,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10143] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10143,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	}
	pg.base.island_shop_goods[10144] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10144,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10145] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10145,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10146] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10146,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10147] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10147,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10148] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10148,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10149] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10149,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10150] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10150,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10151] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10151,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10152] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10152,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10153] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10153,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10154] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10154,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10155] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10155,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10156] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10156,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10157] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10157,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10158] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10158,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10201] = {
		desc = "购买可获得角色“纯白结翼”背部装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "纯白结翼",
		icon = "IslandDressIcon/dress_2010004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10202] = {
		desc = "购买可获得角色“清尘掸子”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "清尘掸子",
		icon = "IslandDressIcon/dress_2020005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10203] = {
		desc = "购买可获得角色“蕾丝印象”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "蕾丝印象",
		icon = "IslandDressIcon/dress_2030006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10203,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10204] = {
		desc = "自然流畅的伸懒腰，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "伸懒腰",
		icon = "IslandActionIcon/stretch",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10204,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1014,
				1
			}
		}
	}
	pg.base.island_shop_goods[10205] = {
		desc = "自然流畅的害怕，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "害怕",
		icon = "IslandActionIcon/fearshake",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10205,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1015,
				1
			}
		}
	}
	pg.base.island_shop_goods[10206] = {
		desc = "自然流畅的抱拳，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "抱拳",
		icon = "IslandActionIcon/holdfist",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10206,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1016,
				1
			}
		}
	}
	pg.base.island_shop_goods[10207] = {
		desc = "自然流畅的自夸，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "自夸",
		icon = "IslandActionIcon/vouch",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10207,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1017,
				1
			}
		}
	}
	pg.base.island_shop_goods[10208] = {
		desc = "威廉·D·波特的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "威廉·D·波特岛屿权限认证函",
		icon = "IslandProps/item_200016",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10208,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				10110,
				1
			}
		}
	}
	pg.base.island_shop_goods[10209] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10209,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10210] = {
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10210,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10211] = {
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "玉米",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10211,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10212] = {
		desc = "高品质牧草，让牧场充满生机！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10212,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10213] = {
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10213,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10214] = {
		desc = "清脆可口的白菜，新鲜直采！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10214,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10215] = {
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10215,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10216] = {
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "土豆",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10216,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10217] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10217,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10218] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10218,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10219] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10219,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10220] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10220,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10221] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10221,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10222] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10222,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10223] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10223,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10224] = {
		desc = "一本内容基础的经营技巧指南。使用后，角色的经营能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "经营指南T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10224,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10225] = {
		desc = "一本内容基础的种植技巧指南。使用后，角色的种植能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "种植指南T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10225,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10226] = {
		desc = "一本内容基础的制造技巧指南。使用后，角色的制造能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "制造指南T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10226,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10227] = {
		desc = "一本内容基础的采集技巧指南。使用后，角色的采集能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "采集指南T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10227,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10228] = {
		desc = "一本内容基础的养护技巧指南。使用后，角色的养护能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "养护指南T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10228,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10229] = {
		desc = "一本内容基础的烹调技巧指南。使用后，角色的烹调能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "烹调指南T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10229,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10230] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10230,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10231] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10231,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10232] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10232,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10233] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10233,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10234] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10234,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10235] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10235,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10236] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10236,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10237] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10237,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10238] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10238,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10239] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10239,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10240] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10240,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10241] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10241,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10242] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10242,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10243] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10243,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10244] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10244,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10245] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10245,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10246] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10246,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10247] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10247,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10248] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10248,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10249] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10249,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10250] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10250,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10251] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10251,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10252] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10252,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10253] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10253,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10254] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10254,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10255] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10255,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10256] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10256,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10257] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10257,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10258] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10258,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10259] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10259,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10260] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10260,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10261] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10261,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10262] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10262,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10263] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10263,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10264] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10264,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10265] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10265,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10266] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10266,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10267] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10267,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10268] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10268,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10269] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10269,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10301] = {
		desc = "购买可获得角色“月亮小夜灯”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "月亮小夜灯",
		icon = "IslandDressIcon/dress_2020006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10302] = {
		desc = "购买可获得角色“星尘足迹”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "星尘足迹",
		icon = "IslandDressIcon/dress_2030007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10302,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10303] = {
		desc = "购买可获得角色“神秘捕梦网”背部装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "神秘捕梦网",
		icon = "IslandDressIcon/dress_2010005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10303,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10304] = {
		desc = "自然流畅的拒绝，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "拒绝",
		icon = "IslandActionIcon/refuse",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10304,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1019,
				1
			}
		}
	}
	pg.base.island_shop_goods[10305] = {
		desc = "自然流畅的打哈欠，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "打哈欠",
		icon = "IslandActionIcon/yawn",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10305,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1020,
				1
			}
		}
	}
	pg.base.island_shop_goods[10306] = {
		desc = "自然流畅的擦汗，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "擦汗",
		icon = "IslandActionIcon/wipingsweat",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10306,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10307] = {
		desc = "自然流畅的挠头，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "挠头",
		icon = "IslandActionIcon/scratchinghead",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10307,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1022,
				1
			}
		}
	}
	pg.base.island_shop_goods[10308] = {
		desc = "标枪的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "标枪岛屿权限认证函",
		icon = "IslandProps/item_200024",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10308,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				20121,
				1
			}
		}
	}
	pg.base.island_shop_goods[10309] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10309,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10310] = {
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10310,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10311] = {
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "玉米",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10311,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10312] = {
		desc = "高品质牧草，让牧场充满生机！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10312,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10313] = {
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10313,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10314] = {
		desc = "清脆可口的白菜，新鲜直采！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10314,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10315] = {
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10315,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10316] = {
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "土豆",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10316,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10317] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10317,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10318] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10318,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10319] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10319,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10320] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10320,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10321] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10321,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10322] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10322,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10323] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10323,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10324] = {
		desc = "一本内容基础的经营技巧指南。使用后，角色的经营能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "经营指南T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10324,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10325] = {
		desc = "一本内容基础的种植技巧指南。使用后，角色的种植能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "种植指南T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10325,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10326] = {
		desc = "一本内容基础的制造技巧指南。使用后，角色的制造能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "制造指南T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10326,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10327] = {
		desc = "一本内容基础的采集技巧指南。使用后，角色的采集能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "采集指南T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10327,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10328] = {
		desc = "一本内容基础的养护技巧指南。使用后，角色的养护能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "养护指南T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10328,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10329] = {
		desc = "一本内容基础的烹调技巧指南。使用后，角色的烹调能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "烹调指南T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10329,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10330] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10330,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10331] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10331,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10332] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10332,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10333] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10333,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10334] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10334,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10335] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10335,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10336] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10336,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10337] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10337,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10338] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10338,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10339] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10339,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10340] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10340,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10341] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10341,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10342] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10342,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10343] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10343,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10344] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10344,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10345] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10345,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10346] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10346,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10347] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10347,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10348] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10348,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10349] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10349,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10350] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10350,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10351] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10351,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10352] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10352,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10353] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10353,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10354] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10354,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10355] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10355,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10356] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10356,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10357] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10357,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10358] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10358,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10359] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10359,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10360] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10360,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10361] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10361,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10362] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10362,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10363] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10363,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10364] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10364,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10365] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10365,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10366] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10366,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10367] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10367,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10368] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10368,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10369] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10369,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10401] = {
		desc = "购买可获得角色“喵语随身镜”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "喵语随身镜",
		icon = "IslandDressIcon/dress_2020009",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10401,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2020009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10402] = {
		desc = "购买可获得角色“猫爪唇膏”背部装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "猫爪唇膏",
		icon = "IslandDressIcon/dress_2010007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10402,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2010007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10403] = {
		desc = "购买可获得角色“心动唇印”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "心动唇印",
		icon = "IslandDressIcon/dress_2030010",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10403,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				2030010,
				1
			}
		}
	}
	pg.base.island_shop_goods[10404] = {
		desc = "自然流畅的前指，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "前指",
		icon = "IslandActionIcon/point",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10404,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1025,
				1
			}
		}
	}
	pg.base.island_shop_goods[10405] = {
		desc = "自然流畅的迎宾，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "迎宾",
		icon = "IslandActionIcon/welcome",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10405,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1026,
				1
			}
		}
	}
	pg.base.island_shop_goods[10406] = {
		desc = "自然流畅的审视，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "审视",
		icon = "IslandActionIcon/lookover",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10406,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1027,
				1
			}
		}
	}
	pg.base.island_shop_goods[10407] = {
		desc = "自然流畅的拍肚皮，生动形象地表达情感与态度。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "拍肚皮",
		icon = "IslandActionIcon/slapbelly",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10407,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1028,
				1
			}
		}
	}
	pg.base.island_shop_goods[10408] = {
		desc = "贝尔法斯特的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "贝尔法斯特岛屿权限认证函",
		icon = "IslandProps/item_200034",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20000,
		discount = 0,
		groups_detail_type = "",
		id = 10408,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200000
		},
		items = {
			{
				44,
				20212,
				1
			}
		}
	}
	pg.base.island_shop_goods[10409] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10409,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10410] = {
		desc = "刚收获不久的新鲜小麦，制作面粉的重要原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10410,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	}
	pg.base.island_shop_goods[10411] = {
		desc = "金黄饱满的玉米，散发着田野的清甜气息。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "玉米",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10411,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	}
	pg.base.island_shop_goods[10412] = {
		desc = "高品质牧草，让牧场充满生机！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10412,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	}
	pg.base.island_shop_goods[10413] = {
		desc = "清白色的优质大米，含有丰富的淀粉和谷物蛋白。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10413,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	}
	pg.base.island_shop_goods[10414] = {
		desc = "清脆可口的白菜，新鲜直采！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10414,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	}
	pg.base.island_shop_goods[10415] = {
		desc = "圆润饱满，富含蛋白质，除了制作美食之外，也有丰富的工业用途。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10415,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	}
	pg.base.island_shop_goods[10416] = {
		desc = "蔬菜中的淀粉代表，可以被做成千变万化的形态。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "土豆",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10416,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	}
	pg.base.island_shop_goods[10417] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10417,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10418] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10418,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10419] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10419,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10420] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10420,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10421] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10421,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10422] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10422,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10423] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10423,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10424] = {
		desc = "一本内容基础的经营技巧指南。使用后，角色的经营能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "经营指南T1",
		icon = "IslandProps/item_100011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10424,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100011,
				1
			}
		}
	}
	pg.base.island_shop_goods[10425] = {
		desc = "一本内容基础的种植技巧指南。使用后，角色的种植能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "种植指南T1",
		icon = "IslandProps/item_100021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10425,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100021,
				1
			}
		}
	}
	pg.base.island_shop_goods[10426] = {
		desc = "一本内容基础的制造技巧指南。使用后，角色的制造能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "制造指南T1",
		icon = "IslandProps/item_100031",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10426,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100031,
				1
			}
		}
	}
	pg.base.island_shop_goods[10427] = {
		desc = "一本内容基础的采集技巧指南。使用后，角色的采集能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "采集指南T1",
		icon = "IslandProps/item_100041",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10427,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100041,
				1
			}
		}
	}
	pg.base.island_shop_goods[10428] = {
		desc = "一本内容基础的养护技巧指南。使用后，角色的养护能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "养护指南T1",
		icon = "IslandProps/item_100051",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10428,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100051,
				1
			}
		}
	}
	pg.base.island_shop_goods[10429] = {
		desc = "一本内容基础的烹调技巧指南。使用后，角色的烹调能力将少量提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "烹调指南T1",
		icon = "IslandProps/item_100061",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10429,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				100061,
				1
			}
		}
	}
	pg.base.island_shop_goods[10430] = {
		desc = "一本内容详细的经营技巧指南。使用后，角色的经营能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "经营指南T2",
		icon = "IslandProps/item_100012",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10430,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100012,
				1
			}
		}
	}
	pg.base.island_shop_goods[10431] = {
		desc = "一本内容详细的种植技巧指南。使用后，角色的种植能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "种植指南T2",
		icon = "IslandProps/item_100022",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10431,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100022,
				1
			}
		}
	}
	pg.base.island_shop_goods[10432] = {
		desc = "一本内容详细的制造技巧指南。使用后，角色的制造能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "制造指南T2",
		icon = "IslandProps/item_100032",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10432,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100032,
				1
			}
		}
	}
	pg.base.island_shop_goods[10433] = {
		desc = "一本内容详细的采集技巧指南。使用后，角色的采集能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "采集指南T2",
		icon = "IslandProps/item_100042",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10433,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100042,
				1
			}
		}
	}
	pg.base.island_shop_goods[10434] = {
		desc = "一本内容详细的养护技巧指南。使用后，角色的养护能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "养护指南T2",
		icon = "IslandProps/item_100052",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10434,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100052,
				1
			}
		}
	}
	pg.base.island_shop_goods[10435] = {
		desc = "一本内容详细的烹调技巧指南。使用后，角色的烹调能力将中幅提升。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "烹调指南T2",
		icon = "IslandProps/item_100062",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 4000,
		discount = 0,
		groups_detail_type = "",
		id = 10435,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40000
		},
		items = {
			{
				41,
				100062,
				1
			}
		}
	}
	pg.base.island_shop_goods[10436] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10436,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10437] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10437,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10438] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10438,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10439] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10439,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10440] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10440,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10441] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10441,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10442] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10442,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10443] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10443,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10444] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10444,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10445] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10445,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10446] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10446,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[10447] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10447,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10448] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10448,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10449] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10449,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10450] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10450,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10451] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10451,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10452] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10452,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10453] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10453,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10454] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10454,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10455] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10455,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10456] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10456,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10457] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10457,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10458] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10458,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10459] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10459,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[10460] = {
		desc = "闪烁着星辉的抽奖券。使用后，可在星彩奖中抽取各种珍贵奖励。 ",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩券",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10460,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10461] = {
		desc = "一本内容基础的开发区生活指南。使用后，能少量增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10461,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	}
	pg.base.island_shop_goods[10462] = {
		desc = "一本内容详细的开发区生活指南。使用后，能中幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10462,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10463] = {
		desc = "一本内容丰富的开发区生活指南。使用后，能大幅增加角色的开发区生活经验。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生活经验指南T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10463,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10464] = {
		desc = "一本内容基础的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10464,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	}
	pg.base.island_shop_goods[10465] = {
		desc = "一本内容详细的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10465,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	}
	pg.base.island_shop_goods[10466] = {
		desc = "一本内容丰富的生产技能指南。用于提升角色的开发区生产技能等级。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生产技能指南T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10466,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	}
	pg.base.island_shop_goods[10467] = {
		desc = "岛屿开发经验的结晶。角色突破所需的必要材料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "岛屿开发结晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10467,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	}
	pg.base.island_shop_goods[10468] = {
		desc = "散发着油墨与时光的沉稳香气，一套值得置于案头反复品读的雅致礼物。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精装书",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10468,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	}
	pg.base.island_shop_goods[10469] = {
		desc = "一束新鲜采摘的缤纷花礼，洋溢着的自然生机能带去一整日的美好。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "鲜花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10469,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	}
	pg.base.island_shop_goods[10470] = {
		desc = "利落的线条流转着金属的冷辉，这柄礼仪佩剑无声地诉说着秩序与庄严。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "仪式剑",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10470,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	}
	pg.base.island_shop_goods[10471] = {
		desc = "一个蓬松柔软的可爱玩偶。拥抱它，就能收获一份毛茸茸的温暖。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "绒绒玩偶",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10471,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	}
	pg.base.island_shop_goods[10472] = {
		desc = "时光在此沉淀，化作一件雅致的摆设，无声地为空间增添一抹宁静隽永的韵味。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "古董摆件",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10472,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	}
	pg.base.island_shop_goods[10473] = {
		desc = "闪耀却不张扬，以细腻工艺承载心意，点亮日常的每一个微小瞬间。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精致首饰",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10473,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	}
	pg.base.island_shop_goods[10474] = {
		desc = "简约瓶身内蕴藏着清新怡人的气息，别致的香氛是品味与格调的优雅注解。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高档香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10474,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	}
	pg.base.island_shop_goods[10475] = {
		desc = "一套完备的休闲娱乐组合。包含了享受简单乐趣所需的大部分内容，是一份体贴的闲暇赠礼。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "游戏机套组",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10475,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	}
	pg.base.island_shop_goods[103000] = {
		desc = "用小麦加工而成的咯咯鸡饲料",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "咯咯鸡饲料",
		icon = "IslandProps/item_3000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			30
		},
		items = {
			{
				41,
				3000,
				10
			}
		}
	}
	pg.base.island_shop_goods[103001] = {
		desc = "用玉米加工而成的哼哼猪饲料",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "哼哼猪饲料",
		icon = "IslandProps/item_3001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2001,
			30
		},
		items = {
			{
				41,
				3001,
				10
			}
		}
	}
	pg.base.island_shop_goods[103002] = {
		desc = "用牧草加工而成的哞哞牛饲料",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "哞哞牛饲料",
		icon = "IslandProps/item_3002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3002,
				10
			}
		}
	}
	pg.base.island_shop_goods[103003] = {
		desc = "用牧草加工而成的咩咩羊饲料",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "咩咩羊饲料",
		icon = "IslandProps/item_3003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3003,
				10
			}
		}
	}
	pg.base.island_shop_goods[103004] = {
		desc = "用小麦加工而成的面粉",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "面粉",
		icon = "IslandProps/item_3004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			6
		},
		items = {
			{
				41,
				3004,
				1
			}
		}
	}
	pg.base.island_shop_goods[111500] = {
		desc = "模拟蚯蚓的假饵，其逼真的造型容易吸引鱼类上钩。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "蚯蚓",
		icon = "IslandProps/item_1500",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111500,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				41,
				1500,
				1
			}
		}
	}
	pg.base.island_shop_goods[111502] = {
		desc = "精心制作的模拟虾仁假饵。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "虾仁",
		icon = "IslandProps/item_1502",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111502,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			25000
		},
		items = {
			{
				41,
				1502,
				1
			}
		}
	}
	pg.base.island_shop_goods[111503] = {
		desc = "造型独特的仿真章鱼须假饵。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "章鱼须",
		icon = "IslandProps/item_1503",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111503,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			25000
		},
		items = {
			{
				41,
				1503,
				1
			}
		}
	}
	pg.base.island_shop_goods[111101] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "双壳类生物幼苗，成长稳定，培育技术成熟。",
		goods_name = "贝苗",
		icon = "IslandProps/item_1101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1101,
				1
			}
		},
		unlock = {
			3201003
		}
	}
	pg.base.island_shop_goods[111102] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "底栖淡水鱼苗，耐低氧环境，适宜在静水泥底池中高密度养殖。",
		goods_name = "鲶鱼苗",
		icon = "IslandProps/item_1102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1102,
				1
			}
		},
		unlock = {
			3201012
		}
	}
	pg.base.island_shop_goods[111103] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "淡水杂食性鱼苗，适应性强，可在多种水质条件下稳定生长。",
		goods_name = "鲤鱼苗",
		icon = "IslandProps/item_1103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111103,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1103,
				1
			}
		},
		unlock = {
			3201002
		}
	}
	pg.base.island_shop_goods[111104] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "小型淡水鱼苗，主食藻类和有机碎屑，有助于维持水体生态平衡。",
		goods_name = "鲫鱼苗",
		icon = "IslandProps/item_1104",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111104,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1104,
				1
			}
		},
		unlock = {
			3201013
		}
	}
	pg.base.island_shop_goods[111105] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "淡水虾类幼体，可作为水体清洁者，喜食残饵与部分藻类。",
		goods_name = "小河虾苗",
		icon = "IslandProps/item_1105",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111105,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1105,
				1
			}
		},
		unlock = {
			3201001
		}
	}
	pg.base.island_shop_goods[111106] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "甲壳类幼体，生长过程中甲壳会逐渐变红变硬，其成体是热门水产品。",
		goods_name = "小龙虾苗",
		icon = "IslandProps/item_1106",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111106,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1106,
				1
			}
		},
		unlock = {
			3201004
		}
	}
	pg.base.island_shop_goods[111107] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "肉食性鱼苗，肉质鲜嫩，经培育后可获得上乘的食用鱼类。",
		goods_name = "鲈鱼苗",
		icon = "IslandProps/item_1107",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111107,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				1107,
				1
			}
		},
		unlock = {
			3201014
		}
	}
	pg.base.island_shop_goods[111108] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "蜕壳频繁的蟹幼体，需在水质清新的环境中培育。",
		goods_name = "蟹苗",
		icon = "IslandProps/item_1108",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111108,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			300
		},
		items = {
			{
				41,
				1108,
				1
			}
		},
		unlock = {
			3201008
		}
	}
	pg.base.island_shop_goods[111201] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "头足类幼体，成长过程需多次形态变化，最终产出弹滑的肉质。",
		goods_name = "鱿鱼苗",
		icon = "IslandProps/item_1201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1201,
				1
			}
		},
		unlock = {
			3201007
		}
	}
	pg.base.island_shop_goods[111202] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "肉食性鱼苗，活跃于中上层水域，具有良好成长性。",
		goods_name = "马鲛鱼苗",
		icon = "IslandProps/item_1202",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1202,
				1
			}
		},
		unlock = {
			3201009
		}
	}
	pg.base.island_shop_goods[111203] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "大型远洋鱼类幼苗，体型增长明显，需要在持续供氧的水域生长。",
		goods_name = "金枪鱼苗",
		icon = "IslandProps/item_1203",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111203,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1203,
				1
			}
		},
		unlock = {
			3201010
		}
	}
	pg.base.island_shop_goods[111204] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "洄游性鱼类幼体，适宜水温较低的水域，需要耐心照料方能收获丰美鱼肉。",
		goods_name = "三文鱼苗",
		icon = "IslandProps/item_1204",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111204,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1204,
				1
			}
		},
		unlock = {
			3201005
		}
	}
	pg.base.island_shop_goods[111205] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "暖水性海水鱼苗，成长后体色鲜艳，具有较高观赏性。",
		goods_name = "红鲷鱼苗",
		icon = "IslandProps/item_1205",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111205,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1205,
				1
			}
		},
		unlock = {
			3201015
		}
	}
	pg.base.island_shop_goods[111206] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "礁区鱼类幼苗，体质强健，培育成功率较高。",
		goods_name = "黑鲷鱼苗",
		icon = "IslandProps/item_1206",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111206,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1206,
				1
			}
		},
		unlock = {
			3201016
		}
	}
	pg.base.island_shop_goods[111207] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "高价值品种鱼苗，水下游动速度快，对水体溶氧量要求严苛。",
		goods_name = "黄鳍金枪鱼苗",
		icon = "IslandProps/item_1207",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111207,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			360
		},
		items = {
			{
				41,
				1207,
				1
			}
		},
		unlock = {
			3201011
		}
	}
	pg.base.island_shop_goods[111208] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "底栖棘皮动物幼体，以沉积有机物为食，能有效净化养殖池底层。",
		goods_name = "海参苗",
		icon = "IslandProps/item_1208",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 111208,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			360
		},
		items = {
			{
				41,
				1208,
				1
			}
		},
		unlock = {
			3201006
		}
	}
	pg.base.island_shop_goods[411000] = {
		desc = "购买可获得小麦种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "小麦种子",
		icon = "IslandProps/item_1000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1000,
				1
			}
		}
	}
	pg.base.island_shop_goods[411001] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得玉米种子",
		goods_name = "玉米种子",
		icon = "IslandProps/item_1001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1001,
				1
			}
		},
		unlock = {
			3101002
		}
	}
	pg.base.island_shop_goods[411002] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得旱稻种子",
		goods_name = "旱稻种子",
		icon = "IslandProps/item_1002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1002,
				1
			}
		},
		unlock = {
			3101005
		}
	}
	pg.base.island_shop_goods[411003] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得白菜种子",
		goods_name = "白菜种子",
		icon = "IslandProps/item_1003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1003,
				1
			}
		},
		unlock = {
			3101006
		}
	}
	pg.base.island_shop_goods[411004] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得胡萝卜种子",
		goods_name = "胡萝卜种子",
		icon = "IslandProps/item_1004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1004,
				1
			}
		},
		unlock = {
			3502006
		}
	}
	pg.base.island_shop_goods[411005] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得土豆种子",
		goods_name = "土豆种子",
		icon = "IslandProps/item_1005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1005,
				1
			}
		},
		unlock = {
			3101008
		}
	}
	pg.base.island_shop_goods[411006] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得大豆种子",
		goods_name = "大豆种子",
		icon = "IslandProps/item_1006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1006,
				1
			}
		},
		unlock = {
			3101007
		}
	}
	pg.base.island_shop_goods[411007] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得洋葱种子",
		goods_name = "洋葱种子",
		icon = "IslandProps/item_1007",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1007,
				1
			}
		},
		unlock = {
			3502007
		}
	}
	pg.base.island_shop_goods[411008] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得牧草种子",
		goods_name = "牧草种子",
		icon = "IslandProps/item_1008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1008,
				1
			}
		},
		unlock = {
			3101003
		}
	}
	pg.base.island_shop_goods[411009] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得咖啡树种",
		goods_name = "咖啡树种",
		icon = "IslandProps/item_1009",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1009,
				1
			}
		},
		unlock = {
			3101004
		}
	}
	pg.base.island_shop_goods[411010] = {
		desc = "购买可获得亚麻种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "亚麻种子",
		icon = "IslandProps/item_1010",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1010,
				1
			}
		}
	}
	pg.base.island_shop_goods[411011] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得草莓种子",
		goods_name = "草莓种子",
		icon = "IslandProps/item_1011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1011,
				1
			}
		},
		unlock = {
			3502002
		}
	}
	pg.base.island_shop_goods[411012] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得棉花种子",
		goods_name = "棉花种子",
		icon = "IslandProps/item_1012",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1012,
				1
			}
		},
		unlock = {
			3502003
		}
	}
	pg.base.island_shop_goods[411014] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得茶树种子",
		goods_name = "茶树种子",
		icon = "IslandProps/item_1014",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1014,
				1
			}
		},
		unlock = {
			3502004
		}
	}
	pg.base.island_shop_goods[411015] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得薰衣草种子",
		goods_name = "薰衣草种子",
		icon = "IslandProps/item_1015",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			160
		},
		items = {
			{
				41,
				1015,
				1
			}
		},
		unlock = {
			3502005
		}
	}
	pg.base.island_shop_goods[411016] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得苹果树种",
		goods_name = "苹果树种",
		icon = "IslandProps/item_1016",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1016,
				1
			}
		},
		unlock = {
			3501001
		}
	}
	pg.base.island_shop_goods[411017] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得柑橘树种",
		goods_name = "柑橘树种",
		icon = "IslandProps/item_1017",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1017,
				1
			}
		},
		unlock = {
			3501002
		}
	}
	pg.base.island_shop_goods[411018] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得香蕉树种",
		goods_name = "香蕉树种",
		icon = "IslandProps/item_1018",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			140
		},
		items = {
			{
				41,
				1018,
				1
			}
		},
		unlock = {
			3501003
		}
	}
	pg.base.island_shop_goods[411019] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得芒果树种",
		goods_name = "芒果树种",
		icon = "IslandProps/item_1019",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1019,
				1
			}
		},
		unlock = {
			3501004
		}
	}
	pg.base.island_shop_goods[411020] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得柠檬树种",
		goods_name = "柠檬树种",
		icon = "IslandProps/item_1020",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1020,
				1
			}
		},
		unlock = {
			3501005
		}
	}
	pg.base.island_shop_goods[411021] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得牛油果树种",
		goods_name = "牛油果树种",
		icon = "IslandProps/item_1021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1021,
				1
			}
		},
		unlock = {
			3501006
		}
	}
	pg.base.island_shop_goods[411022] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "购买可获得橡胶树种",
		goods_name = "橡胶树种",
		icon = "IslandProps/item_1022",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			280
		},
		items = {
			{
				41,
				1022,
				1
			}
		},
		unlock = {
			3501007
		}
	}
	pg.base.island_shop_goods[411023] = {
		desc = "购买可获得秋月梨树种",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "秋月梨树种",
		icon = "IslandProps/item_4006",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4006,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					12,
					0,
					1
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411024] = {
		desc = "购买可获得柿子树种",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "柿子树种",
		icon = "IslandProps/item_4008",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				4008,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					6
				},
				{
					12,
					0,
					1
				}
			},
			{
				{
					2026,
					11,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411025] = {
		desc = "购买可获得芦笋种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "芦笋种子",
		icon = "IslandProps/item_4020",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411025,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4020,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411026] = {
		desc = "购买可获得凤梨种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "凤梨种子",
		icon = "IslandProps/item_4022",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411026,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				4022,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411027] = {
		desc = "购买可获得番茄种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "番茄种子",
		icon = "IslandProps/item_4034",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411027,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4034,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					12,
					0,
					1
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[411028] = {
		desc = "购买可获得黄瓜种子",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "黄瓜种子",
		icon = "IslandProps/item_4036",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411028,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				4036,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
				},
				{
					12,
					0,
					1
				}
			},
			{
				{
					2026,
					8,
					6
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[412000] = {
		desc = "购买可获得装扮染色盘",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "装扮染色盘",
		icon = "IslandGoodsIcon/3",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			100
		},
		items = {
			{
				41,
				3,
				1
			}
		}
	}
	pg.base.island_shop_goods[412001] = {
		desc = "镇海的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "镇海岛屿权限认证函",
		icon = "IslandProps/item_200017",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				50601,
				1
			}
		}
	}
	pg.base.island_shop_goods[412002] = {
		desc = "拉菲的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "拉菲岛屿权限认证函",
		icon = "IslandProps/item_200025",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				10117,
				1
			}
		}
	}
	pg.base.island_shop_goods[412003] = {
		desc = "皇家财富号的岛屿权限认证函。通过岛屿权限认证装置，可获得角色奇异点岛屿出入权限。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "皇家财富号岛屿权限认证函",
		icon = "IslandProps/item_200033",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			500000
		},
		items = {
			{
				44,
				960001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600001] = {
		desc = "购买可获得角色“棉花糖云”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "棉花糖云",
		icon = "IslandDressIcon/dress_2020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600002] = {
		desc = "购买可获得角色“风见落樱”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "风见落樱",
		icon = "IslandDressIcon/dress_2030004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030004,
				1
			}
		}
	}
	pg.base.island_shop_goods[4600003] = {
		desc = "购买可获得角色“火箭造型包”背饰装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "火箭造型包",
		icon = "IslandDressIcon/dress_2010001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010001,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620004] = {
		desc = "购买可获得角色“梦幻泡影”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "梦幻泡影",
		icon = "IslandDressIcon/dress_2020004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020004,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630005] = {
		desc = "购买可获得角色“游鱼踪影”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "游鱼踪影",
		icon = "IslandDressIcon/dress_2030005",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030005,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610003] = {
		desc = "购买可获得角色“渔趣满载”背饰装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "渔趣满载",
		icon = "IslandDressIcon/dress_2010003",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010003,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620007] = {
		desc = "购买可获得角色“夏日冰棒”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "夏日冰棒",
		icon = "IslandDressIcon/dress_2020007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020007,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630008] = {
		desc = "购买可获得角色“水果气泡”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "水果气泡",
		icon = "IslandDressIcon/dress_2030008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030008,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610006] = {
		desc = "购买可获得角色“清凉刨冰碗”背饰装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "清凉刨冰碗",
		icon = "IslandDressIcon/dress_2010006",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010006,
				1
			}
		}
	}
	pg.base.island_shop_goods[4620008] = {
		desc = "购买可获得角色“绒羽逗猫棒”漂浮物装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "绒羽逗猫棒",
		icon = "IslandDressIcon/dress_2020008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4620008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020008,
				1
			}
		}
	}
	pg.base.island_shop_goods[4630009] = {
		desc = "购买可获得角色“萌萌猫爪”脚印装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "萌萌猫爪",
		icon = "IslandDressIcon/dress_2030009",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4630009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030009,
				1
			}
		}
	}
	pg.base.island_shop_goods[4610008] = {
		desc = "购买可获得角色“蓬松猫尾”背饰装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "蓬松猫尾",
		icon = "IslandDressIcon/dress_2010008",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4610008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010008,
				1
			}
		}
	}
	pg.base.island_shop_goods[5010001] = {
		desc = "使用后，能加速1分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10001,
				1
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
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020001] = {
		desc = "使用后，能加速10分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20001,
				1
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
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030001] = {
		desc = "使用后，能加速60分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30001,
				1
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
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
end)()
;(function()
	pg.base.island_shop_goods[5010002] = {
		desc = "使用后，能加速1分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020002] = {
		desc = "使用后，能加速10分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030002] = {
		desc = "使用后，能加速60分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30005,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
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
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5010003] = {
		desc = "使用后，能加速1分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
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
					8,
					6
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020003] = {
		desc = "使用后，能加速10分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
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
					8,
					6
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030003] = {
		desc = "使用后，能加速60分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30006,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					7
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
					8,
					6
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5010004] = {
		desc = "使用后，能加速1分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10007,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
					11,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5020004] = {
		desc = "使用后，能加速10分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20007,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
					11,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[5030004] = {
		desc = "使用后，能加速60分钟的时间，让发展快人一步。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分钟加速券（开发季）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30007,
				1
			}
		},
		time = {
			{
				{
					2026,
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
					2026,
					11,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_goods[471070301] = {
		desc = "购买可获得萨拉托加“纯真游学日”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "纯真游学日",
		icon = "IslandGoodsIcon/skin_1070301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471070301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1070301,
				1
			}
		}
	}
	pg.base.island_shop_goods[473120101] = {
		desc = "购买可获得{namecode:98}“空铃夜褶”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "空铃夜褶",
		icon = "IslandGoodsIcon/skin_3120101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 473120101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				3120101,
				1
			}
		}
	}
	pg.base.island_shop_goods[471051701] = {
		desc = "购买可获得{namecode:199}“轻跃日常”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "轻跃日常",
		icon = "IslandGoodsIcon/skin_1051701",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471051701,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1051701,
				1
			}
		}
	}
	pg.base.island_shop_goods[471011001] = {
		desc = "购买可获得威廉·D·波特“元气满载！”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "元气满载！",
		icon = "IslandGoodsIcon/skin_1011001",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471011001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1011001,
				1
			}
		}
	}
	pg.base.island_shop_goods[475060101] = {
		desc = "购买可获得镇海“运筹之暇”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "运筹之暇",
		icon = "IslandGoodsIcon/skin_5060101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 475060101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				5060101,
				1
			}
		}
	}
	pg.base.island_shop_goods[474030301] = {
		desc = "购买可获得{namecode:427}“慵懒献纳”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "慵懒献纳",
		icon = "IslandGoodsIcon/skin_4030301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 474030301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				4030301,
				1
			}
		}
	}
	pg.base.island_shop_goods[471011701] = {
		desc = "购买可获得拉菲“兔兔晚安”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "兔兔晚安",
		icon = "IslandGoodsIcon/skin_1011701",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471011701,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1011701,
				1
			}
		}
	}
	pg.base.island_shop_goods[472012101] = {
		desc = "购买可获得标枪“枕头大战”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "枕头大战",
		icon = "IslandGoodsIcon/skin_2012101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 472012101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				2012101,
				1
			}
		}
	}
	pg.base.island_shop_goods[473031101] = {
		desc = "购买可获得{namecode:66}“素心夜话”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "素心夜话",
		icon = "IslandGoodsIcon/skin_3031101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 473031101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				3031101,
				1
			}
		}
	}
	pg.base.island_shop_goods[472021201] = {
		desc = "购买可获得贝尔法斯特“午后书页”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "午后书页",
		icon = "IslandGoodsIcon/skin_2021201",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 472021201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				2021201,
				1
			}
		}
	}
	pg.base.island_shop_goods[479600011] = {
		desc = "购买可获得皇家财富号“学院序曲”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "学院序曲",
		icon = "IslandGoodsIcon/skin_96000101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 479600011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				96000101,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000101] = {
		desc = "购买可获得领洋者-娜比娅“元气上学路”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "元气上学路",
		icon = "IslandGoodsIcon/skin_99000101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000101,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000102] = {
		desc = "购买可获得领洋者-娜比娅“优等生气场”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "优等生气场",
		icon = "IslandGoodsIcon/skin_99000102",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000102,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000201] = {
		desc = "购买可获得领航员-TB“懵懂时光”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "懵懂时光",
		icon = "IslandGoodsIcon/skin_99000201",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000201,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000201,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000202] = {
		desc = "购买可获得领航员-TB“见习观察员”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "见习观察员",
		icon = "IslandGoodsIcon/skin_99000202",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000202,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000202,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000301] = {
		desc = "购买可获得探索者-艾普洛“纯白低语”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "纯白低语",
		icon = "IslandGoodsIcon/skin_99000301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000301,
				1
			}
		}
	}
	pg.base.island_shop_goods[99000302] = {
		desc = "购买可获得探索者-艾普洛“沉静礼装”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "沉静礼装",
		icon = "IslandGoodsIcon/skin_99000302",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 99000302,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			2000000
		},
		items = {
			{
				47,
				99000302,
				1
			}
		}
	}
	pg.base.island_shop_goods[461060015] = {
		desc = "购买可获得指挥官“动力装甲”皮肤装扮",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "动力装甲",
		icon = "IslandDressIcon/dress_1060015",
		goods_detail_type = 2,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 461060015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			1100
		},
		items = {
			{
				46,
				1060015,
				1
			},
			{
				46,
				1060014,
				1
			},
			{
				46,
				1070015,
				1
			}
		},
		time = {
			{
				{
					2026,
					6,
					5
				},
				{
					12,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					18
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
end)()
