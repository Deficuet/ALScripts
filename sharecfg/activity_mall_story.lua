pg = pg or {}
pg.activity_mall_story = rawget(pg, "activity_mall_story") or setmetatable({
	__name = "activity_mall_story"
}, confNEO)
pg.activity_mall_story.all = {
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
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	301,
	302,
	303,
	304,
	305,
	306,
	401,
	402,
	403,
	404,
	405,
	406,
	407,
	408,
	409,
	410
}
pg.base = pg.base or {}
pg.base.activity_mall_story = {}

;(function()
	pg.base.activity_mall_story[101] = {
		lua = "",
		name = "黄金海岸",
		type = 1,
		id = 101,
		icon = "huangjinhaian",
		desc = "阳光、海浪与绵长沙滩交织而成的天然游乐场，是夏日最惬意的踏浪之地。",
		posion = {
			653,
			-269,
			0
		}
	}
	pg.base.activity_mall_story[102] = {
		lua = "",
		name = "港口",
		type = 1,
		id = 102,
		icon = "gangkou",
		desc = "海上往来的枢纽，各色船只在此停靠，送来各色的奢华珍宝。",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[103] = {
		lua = "",
		name = "人工群岛",
		type = 1,
		id = 103,
		icon = "rengongqundao",
		desc = "由“船锚”造型串联而起的海上空间，漫步其上，仿佛行走于潮汐之间。",
		posion = {
			1005,
			-78,
			0
		}
	}
	pg.base.activity_mall_story[104] = {
		lua = "",
		name = "穹顶酒店",
		type = 1,
		id = 104,
		icon = "qiongdingjiudian",
		desc = "以独树一帜的外观引人注目的高端酒店，其屋顶泳池深受游客喜爱。",
		posion = {
			-341,
			-20,
			0
		}
	}
	pg.base.activity_mall_story[105] = {
		lua = "",
		name = "浮金大厦",
		type = 1,
		id = 105,
		icon = "fujindasha",
		desc = "象征着品味和格调的城市地标建筑，也是位于浮金湾核心地段的顶级商业中心。",
		posion = {
			-40,
			62,
			0
		}
	}
	pg.base.activity_mall_story[106] = {
		lua = "",
		name = "天方宴会厅",
		type = 1,
		id = 106,
		icon = "tianfangyanhuiting",
		desc = "专为盛大活动打造的奢华空间，弥漫着华美与梦幻的气息。",
		posion = {
			155,
			35,
			0
		}
	}
	pg.base.activity_mall_story[107] = {
		lua = "",
		name = "海风酒店",
		type = 1,
		id = 107,
		icon = "haifengjiudian",
		desc = "紧邻海岸的居停之所，是放松身心、享受假日时光的理想选择。",
		posion = {
			172,
			-331,
			0
		}
	}
	pg.base.activity_mall_story[108] = {
		lua = "",
		name = "科技馆",
		type = 1,
		id = 108,
		icon = "kejiguan",
		desc = "将奇想和现实完美融合的科技馆，置身其中便可穿越虚实边界，开启奇妙的探索之旅。",
		posion = {
			-252,
			-242,
			0
		}
	}
	pg.base.activity_mall_story[109] = {
		lua = "",
		name = "游乐园",
		type = 1,
		id = 109,
		icon = "youleyuan",
		desc = "欢笑与尖叫交织的梦幻王国，踏入此地便可尽情享受纯粹的快乐。",
		posion = {
			-546,
			-224,
			0
		}
	}
	pg.base.activity_mall_story[110] = {
		lua = "",
		name = "香料市场",
		type = 1,
		id = 110,
		icon = "xiangliaoshichang",
		desc = "空气中弥漫着馥郁香气，琳琅满目的摊位间汇集了来自世界各地的香料。",
		posion = {
			-700,
			476,
			0
		}
	}
	pg.base.activity_mall_story[111] = {
		lua = "",
		name = "风情街",
		type = 1,
		id = 111,
		icon = "fengqingjie",
		desc = "店铺林立的蜿蜒街巷，从精美的手工艺品到地道的小吃饮品应有尽有。",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[112] = {
		lua = "",
		name = "水族馆",
		type = 1,
		id = 112,
		icon = "shuizuguan",
		desc = "一座巨大的海洋场馆，步入其中可与众多海洋生物们来一场近距离邂逅。",
		posion = {
			-680,
			254,
			0
		}
	}
	pg.base.activity_mall_story[113] = {
		lua = "",
		name = "浅沙",
		type = 1,
		id = 113,
		icon = "qiansha",
		desc = "一片开阔的黄沙，是体验沙漠旅行，举办活动露营的绝佳之地。",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[114] = {
		lua = "",
		name = "奇迹花园",
		type = 1,
		id = 114,
		icon = "qijihuayuan",
		desc = "对称分割的花田簇拥着中央亭台，芬芳四溢中构成一幅生机勃勃的画卷。",
		posion = {
			-164,
			401,
			0
		}
	}
	pg.base.activity_mall_story[115] = {
		lua = "",
		name = "人工湖",
		type = 1,
		id = 115,
		icon = "rengonghu",
		desc = "镶嵌于沙漠和繁华都市之间的静谧水域，每一寸绿化都是财富的象征。",
		posion = {
			472,
			517,
			0
		}
	}
	pg.base.activity_mall_story[201] = {
		lua = "SHEHUAXIANGMENGFUJINWAN1",
		name = "阁下，该醒咯~",
		type = 2,
		id = 201,
		icon = "icon_1",
		desc = "购物中心达到1级解锁",
		posion = {
			327,
			198,
			0
		}
	}
	pg.base.activity_mall_story[202] = {
		lua = "SHEHUAXIANGMENGFUJINWAN19",
		name = "昙花一现的宝石",
		type = 2,
		id = 202,
		icon = "icon_1",
		desc = "购物中心达到2级解锁",
		posion = {
			-341,
			-20,
			0
		}
	}
	pg.base.activity_mall_story[203] = {
		lua = "SHEHUAXIANGMENGFUJINWAN20",
		name = "海鸥的踪迹",
		type = 2,
		id = 203,
		icon = "icon_1",
		desc = "购物中心达到3级解锁",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[204] = {
		lua = "SHEHUAXIANGMENGFUJINWAN21",
		name = "屋顶上的“海盗”",
		type = 2,
		id = 204,
		icon = "icon_1",
		desc = "购物中心达到4级解锁",
		posion = {
			172,
			-331,
			0
		}
	}
	pg.base.activity_mall_story[205] = {
		lua = "SHEHUAXIANGMENGFUJINWAN22",
		name = "神·灯·小·姐",
		type = 2,
		id = 205,
		icon = "icon_1",
		desc = "购物中心达到5级解锁",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[206] = {
		lua = "SHEHUAXIANGMENGFUJINWAN23",
		name = "“魔法”花园的晚宴",
		type = 2,
		id = 206,
		icon = "icon_1",
		desc = "购物中心达到6级解锁",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[207] = {
		lua = "SHEHUAXIANGMENGFUJINWAN24",
		name = "奇迹之光",
		type = 2,
		id = 207,
		icon = "icon_1",
		desc = "购物中心达到7级解锁",
		posion = {
			-164,
			401,
			0
		}
	}
	pg.base.activity_mall_story[208] = {
		lua = "SHEHUAXIANGMENGFUJINWAN2",
		name = "为你献上的礼物",
		type = 2,
		id = 208,
		icon = "icon_1",
		desc = "购物中心达到8级解锁",
		posion = {
			653,
			-269,
			0
		}
	}
	pg.base.activity_mall_story[301] = {
		lua = "SHEHUAXIANGMENGFUJINWAN13",
		name = "意外被困的捉迷藏游戏",
		type = 3,
		id = 301,
		icon = "gangkou",
		desc = "",
		posion = {
			1019,
			168,
			0
		}
	}
	pg.base.activity_mall_story[302] = {
		lua = "SHEHUAXIANGMENGFUJINWAN14",
		name = "沙滩雕塑大赛进行中！",
		type = 3,
		id = 302,
		icon = "rengongqundao",
		desc = "",
		posion = {
			1005,
			-78,
			0
		}
	}
	pg.base.activity_mall_story[303] = {
		lua = "SHEHUAXIANGMENGFUJINWAN15",
		name = "此刻，与谁共赴？",
		type = 3,
		id = 303,
		icon = "youleyuan",
		desc = "",
		posion = {
			-546,
			-224,
			0
		}
	}
	pg.base.activity_mall_story[304] = {
		lua = "SHEHUAXIANGMENGFUJINWAN16",
		name = "特别拍摄计划",
		type = 3,
		id = 304,
		icon = "xiangliaoshichang",
		desc = "",
		posion = {
			-700,
			476,
			0
		}
	}
	pg.base.activity_mall_story[305] = {
		lua = "SHEHUAXIANGMENGFUJINWAN17",
		name = "氤氲之中",
		type = 3,
		id = 305,
		icon = "fengqingjie",
		desc = "",
		posion = {
			-478,
			408,
			0
		}
	}
	pg.base.activity_mall_story[306] = {
		lua = "SHEHUAXIANGMENGFUJINWAN18",
		name = "沙洲越野赛！",
		type = 3,
		id = 306,
		icon = "qiansha",
		desc = "",
		posion = {
			140,
			531,
			0
		}
	}
	pg.base.activity_mall_story[401] = {
		lua = "SHEHUAXIANGMENGFUJINWAN3",
		name = "云端的水光",
		type = 4,
		id = 401,
		icon = "yanusi",
		desc = "1",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[402] = {
		lua = "SHEHUAXIANGMENGFUJINWAN4",
		name = "直至心跳相融",
		type = 4,
		id = 402,
		icon = "mojiaduoer",
		desc = "2",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[403] = {
		lua = "SHEHUAXIANGMENGFUJINWAN5",
		name = "蜜渍余甘",
		type = 4,
		id = 403,
		icon = "luyijiushi",
		desc = "3",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[404] = {
		lua = "SHEHUAXIANGMENGFUJINWAN6",
		name = "水幕画心",
		type = 4,
		id = 404,
		icon = "u2501",
		desc = "4",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[405] = {
		lua = "SHEHUAXIANGMENGFUJINWAN7",
		name = "水畔的夕暮私语",
		type = 4,
		id = 405,
		icon = "aimudeng",
		desc = "5",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[406] = {
		lua = "SHEHUAXIANGMENGFUJINWAN8",
		name = "赤红之月的幻想",
		type = 4,
		id = 406,
		icon = "gezi",
		desc = "6",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[407] = {
		lua = "SHEHUAXIANGMENGFUJINWAN9",
		name = "碧波绮尾",
		type = 4,
		id = 407,
		icon = "tianchengcv",
		desc = "7",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[408] = {
		lua = "SHEHUAXIANGMENGFUJINWAN10",
		name = "神灯小姐的愿望游戏",
		type = 4,
		id = 408,
		icon = "moliciqinwang",
		desc = "8",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[409] = {
		lua = "SHEHUAXIANGMENGFUJINWAN11",
		name = "与“魔女”的星夜之约",
		type = 4,
		id = 409,
		icon = "aogusite",
		desc = "9",
		posion = {
			960,
			540,
			0
		}
	}
	pg.base.activity_mall_story[410] = {
		lua = "SHEHUAXIANGMENGFUJINWAN12",
		name = "水上的心跳“意外”",
		type = 4,
		id = 410,
		icon = "z15",
		desc = "10",
		posion = {
			960,
			540,
			0
		}
	}
end)()
