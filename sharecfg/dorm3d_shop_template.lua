pg = pg or {}
pg.dorm3d_shop_template = rawget(pg, "dorm3d_shop_template") or setmetatable({
	__name = "dorm3d_shop_template"
}, confNEO)
pg.dorm3d_shop_template.__namecode__ = true
pg.dorm3d_shop_template.all = {
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
	42,
	43,
	44,
	45,
	46,
	47
}
pg.base = pg.base or {}
pg.base.dorm3d_shop_template = {}

;(function()
	pg.base.dorm3d_shop_template[1] = {
		name = "甜蜜心事",
		rarity = 4,
		type = 1,
		room_id = 20220,
		unlock = "",
		item_id = 121,
		id = 1,
		realroom_id = 0,
		order = "8",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			270101
		},
		banners = {
			"banner_furniture121"
		}
	}
	pg.base.dorm3d_shop_template[2] = {
		name = "午后遐乡",
		rarity = 4,
		type = 1,
		room_id = 20220,
		unlock = "",
		item_id = 122,
		id = 2,
		realroom_id = 0,
		order = "11",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			270103
		},
		banners = {
			"banner_furniture122"
		}
	}
	pg.base.dorm3d_shop_template[3] = {
		name = "柔软怀抱",
		rarity = 4,
		type = 1,
		room_id = 30221,
		unlock = "",
		item_id = 221,
		id = 3,
		realroom_id = 0,
		order = "9",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270201
		},
		banners = {
			"banner_furniture221"
		}
	}
	pg.base.dorm3d_shop_template[4] = {
		name = "对坐之谈",
		rarity = 4,
		type = 1,
		room_id = 30221,
		unlock = "",
		item_id = 222,
		id = 4,
		realroom_id = 0,
		order = "14",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270202
		},
		banners = {
			"banner_furniture222"
		}
	}
	pg.base.dorm3d_shop_template[5] = {
		name = "圣诞雪橇沙发套组",
		rarity = 5,
		type = 1,
		room_id = 20220,
		unlock = "",
		item_id = 151,
		id = 5,
		realroom_id = 0,
		order = "1",
		panel = {
			1
		},
		shop_id = {
			270104
		},
		banners = {
			"banner_furniture151"
		}
	}
	pg.base.dorm3d_shop_template[6] = {
		name = "暖意入梦",
		rarity = 5,
		type = 1,
		room_id = 30221,
		unlock = "",
		item_id = 251,
		id = 6,
		realroom_id = 0,
		order = "2",
		panel = {
			1
		},
		shop_id = {
			270105
		},
		banners = {
			"banner_furniture251"
		}
	}
	pg.base.dorm3d_shop_template[7] = {
		name = "童心下午茶",
		rarity = 4,
		type = 1,
		room_id = 19903,
		unlock = "",
		item_id = 321,
		id = 7,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270301
		},
		banners = {
			"banner_furniture321"
		}
	}
	pg.base.dorm3d_shop_template[8] = {
		name = "星河满船",
		rarity = 4,
		type = 1,
		room_id = 19903,
		unlock = "",
		item_id = 322,
		id = 8,
		realroom_id = 0,
		order = "13",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270302
		},
		banners = {
			"banner_furniture322"
		}
	}
	pg.base.dorm3d_shop_template[9] = {
		name = "清扫工具箱",
		rarity = 4,
		type = 2,
		room_id = 20220,
		unlock = "",
		item_id = 2022001,
		id = 9,
		realroom_id = 0,
		order = "16",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260301
		},
		banners = {
			"banner_gift2022001"
		}
	}
	pg.base.dorm3d_shop_template[10] = {
		name = "茶享套装",
		rarity = 4,
		type = 2,
		room_id = 20220,
		unlock = "",
		item_id = 2022002,
		id = 10,
		realroom_id = 0,
		order = "19",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260302
		},
		banners = {
			"banner_gift2022002"
		}
	}
	pg.base.dorm3d_shop_template[11] = {
		name = "素色物语 ",
		rarity = 4,
		type = 2,
		room_id = 30221,
		unlock = "",
		item_id = 3022101,
		id = 11,
		realroom_id = 0,
		order = "17",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260321
		},
		banners = {
			"banner_gift3022101"
		}
	}
	pg.base.dorm3d_shop_template[12] = {
		name = "彩虹心语",
		rarity = 4,
		type = 2,
		room_id = 19903,
		unlock = "",
		item_id = 1990301,
		id = 12,
		realroom_id = 0,
		order = "18",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260331
		},
		banners = {
			"banner_gift1990301"
		}
	}
	pg.base.dorm3d_shop_template[13] = {
		name = "浪漫满分",
		rarity = 3,
		type = 2,
		room_id = 0,
		unlock = "",
		item_id = 1021002,
		id = 13,
		realroom_id = 0,
		order = "998",
		panel = {
			5
		},
		shop_id = {
			260101,
			260102,
			260103,
			260104,
			260105
		},
		banners = {
			"banner_test"
		}
	}
	pg.base.dorm3d_shop_template[14] = {
		name = "蛋糕礼盒",
		rarity = 3,
		type = 2,
		room_id = 0,
		unlock = "",
		item_id = 1021003,
		id = 14,
		realroom_id = 0,
		order = "999",
		panel = {
			5
		},
		shop_id = {
			260201,
			260202
		},
		banners = {
			"banner_test"
		}
	}
	pg.base.dorm3d_shop_template[15] = {
		name = "天狼星沙滩邀请函",
		rarity = 4,
		type = 3,
		room_id = 20220,
		unlock = "",
		item_id = 4,
		id = 15,
		realroom_id = 0,
		order = "11",
		panel = {
			2
		},
		shop_id = {
			270110
		},
		banners = {
			"banner_beach1",
			"banner_beach2"
		}
	}
	pg.base.dorm3d_shop_template[16] = {
		name = "{namecode:50}沙滩邀请函",
		rarity = 4,
		type = 3,
		room_id = 30221,
		unlock = "",
		item_id = 4,
		id = 16,
		realroom_id = 0,
		order = "12",
		panel = {
			2
		},
		shop_id = {
			270111
		},
		banners = {
			"banner_beach3"
		}
	}
	pg.base.dorm3d_shop_template[17] = {
		name = "安克雷奇沙滩邀请函",
		rarity = 4,
		type = 3,
		room_id = 19903,
		unlock = "",
		item_id = 4,
		id = 17,
		realroom_id = 0,
		order = "11",
		panel = {
			2
		},
		shop_id = {
			270112
		},
		banners = {
			"banner_beach4"
		}
	}
	pg.base.dorm3d_shop_template[18] = {
		name = "能量修复仪",
		rarity = 4,
		type = 2,
		room_id = 30221,
		unlock = "",
		item_id = 3022102,
		id = 18,
		realroom_id = 0,
		order = "12",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260322
		},
		banners = {
			"banner_gift3022102"
		}
	}
	pg.base.dorm3d_shop_template[19] = {
		name = "星球一隅",
		rarity = 4,
		type = 1,
		room_id = 10517,
		unlock = "",
		item_id = 1151,
		id = 19,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			271101
		},
		banners = {
			"banner_furniture1151"
		}
	}
	pg.base.dorm3d_shop_template[20] = {
		name = "水晶糖",
		rarity = 4,
		type = 2,
		room_id = 10517,
		unlock = "",
		item_id = 1051701,
		id = 20,
		realroom_id = 0,
		order = "15",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260401
		},
		banners = {
			"banner_gift1051701"
		}
	}
	pg.base.dorm3d_shop_template[21] = {
		name = "{namecode:199}咖啡馆邀请函",
		rarity = 4,
		type = 3,
		room_id = 10517,
		unlock = "",
		item_id = 16,
		id = 21,
		realroom_id = 0,
		order = "11",
		panel = {
			2
		},
		shop_id = {
			270113
		},
		banners = {
			"banner_cafe1"
		}
	}
	pg.base.dorm3d_shop_template[22] = {
		name = "安逸时光",
		rarity = 4,
		type = 1,
		room_id = 30221,
		unlock = "",
		item_id = 223,
		id = 22,
		realroom_id = 0,
		order = "12",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270203
		},
		banners = {
			"banner_furniture223"
		}
	}
	pg.base.dorm3d_shop_template[23] = {
		name = "动感飞轮",
		rarity = 4,
		type = 1,
		room_id = 10517,
		unlock = "",
		item_id = 1152,
		id = 23,
		realroom_id = 0,
		order = "13",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270204
		},
		banners = {
			"banner_furniture1152"
		}
	}
	pg.base.dorm3d_shop_template[24] = {
		name = "精致画框 ",
		rarity = 4,
		type = 2,
		room_id = 19903,
		unlock = "",
		item_id = 1990302,
		id = 24,
		realroom_id = 0,
		order = "10",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260332
		},
		banners = {
			"banner_gift1990302"
		}
	}
	pg.base.dorm3d_shop_template[25] = {
		name = "滨海欢愉",
		rarity = 5,
		type = 1,
		room_id = 0,
		unlock = "",
		item_id = 401,
		id = 25,
		realroom_id = 4,
		order = "10",
		panel = {
			1
		},
		shop_id = {
			270401
		},
		banners = {
			"banner_furniture401"
		}
	}
	pg.base.dorm3d_shop_template[26] = {
		name = "云中甜梦",
		rarity = 4,
		type = 1,
		room_id = 19903,
		unlock = "",
		item_id = 323,
		id = 26,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270303
		},
		banners = {
			"banner_furniture323"
		}
	}
	pg.base.dorm3d_shop_template[27] = {
		name = "爱之巢 ",
		rarity = 4,
		type = 1,
		room_id = 30707,
		unlock = "",
		item_id = 1221,
		id = 27,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270501
		},
		banners = {
			"banner_furniture1221"
		}
	}
	pg.base.dorm3d_shop_template[28] = {
		name = "相连的爱意 ",
		rarity = 4,
		type = 2,
		room_id = 30707,
		unlock = "",
		item_id = 3070701,
		id = 28,
		realroom_id = 0,
		order = "10",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260501
		},
		banners = {
			"banner_gift3070701"
		}
	}
	pg.base.dorm3d_shop_template[29] = {
		name = "{namecode:97}咖啡馆邀请函",
		rarity = 4,
		type = 3,
		room_id = 30707,
		unlock = "",
		item_id = 16,
		id = 29,
		realroom_id = 0,
		order = "10",
		panel = {
			2
		},
		shop_id = {
			270114
		},
		banners = {
			"banner_cafe2"
		}
	}
	pg.base.dorm3d_shop_template[30] = {
		name = "天外庇所",
		rarity = 4,
		type = 1,
		room_id = 10517,
		unlock = "",
		item_id = 1153,
		id = 30,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270205
		},
		banners = {
			"banner_furniture1153"
		}
	}
	pg.base.dorm3d_shop_template[31] = {
		name = "花乐留韵 ",
		rarity = 5,
		type = 1,
		room_id = 30707,
		unlock = "",
		item_id = 1222,
		id = 31,
		realroom_id = 0,
		order = "10",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270502
		},
		banners = {
			"banner_furniture1222"
		}
	}
	pg.base.dorm3d_shop_template[32] = {
		name = "《完美女仆守则》 ",
		rarity = 4,
		type = 2,
		room_id = 20220,
		unlock = "",
		item_id = 2022003,
		id = 32,
		realroom_id = 0,
		order = "10",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260303
		},
		banners = {
			"banner_gift2022003"
		}
	}
	pg.base.dorm3d_shop_template[33] = {
		name = "真红谧影 ",
		rarity = 4,
		type = 1,
		room_id = 49905,
		unlock = "",
		item_id = 1461,
		id = 33,
		realroom_id = 0,
		order = "9",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270601
		},
		banners = {
			"banner_furniture1461"
		}
	}
	pg.base.dorm3d_shop_template[34] = {
		name = "郁金香杯 ",
		rarity = 4,
		type = 2,
		room_id = 49905,
		unlock = "",
		item_id = 4990501,
		id = 34,
		realroom_id = 0,
		order = "9",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260601
		},
		banners = {
			"banner_gift4990501"
		}
	}
	pg.base.dorm3d_shop_template[35] = {
		name = "{namecode:480}咖啡馆邀请函",
		rarity = 4,
		type = 3,
		room_id = 49905,
		unlock = "",
		item_id = 16,
		id = 35,
		realroom_id = 0,
		order = "2",
		panel = {
			2
		},
		shop_id = {
			270115
		},
		banners = {
			"banner_cafe3"
		}
	}
	pg.base.dorm3d_shop_template[36] = {
		name = "天狼星咖啡馆邀请函",
		rarity = 4,
		type = 3,
		room_id = 20220,
		unlock = "",
		item_id = 16,
		id = 36,
		realroom_id = 0,
		order = "9",
		panel = {
			2
		},
		shop_id = {
			270116
		},
		banners = {
			"banner_cafe4"
		}
	}
	pg.base.dorm3d_shop_template[37] = {
		name = "智能冰箱IB-7",
		rarity = 4,
		type = 1,
		room_id = 10517,
		unlock = "",
		item_id = 1154,
		id = 37,
		realroom_id = 0,
		order = "9",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270206
		},
		banners = {
			"banner_furniture1154"
		}
	}
	pg.base.dorm3d_shop_template[38] = {
		name = "绯樱雅席",
		rarity = 4,
		type = 1,
		room_id = 30707,
		unlock = "",
		item_id = 1223,
		id = 38,
		realroom_id = 0,
		order = "8",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270503
		},
		banners = {
			"banner_furniture1223"
		}
	}
	pg.base.dorm3d_shop_template[39] = {
		name = "童心乐园 ",
		rarity = 4,
		type = 1,
		room_id = 19903,
		unlock = "",
		item_id = 324,
		id = 39,
		realroom_id = 0,
		order = "8",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270304
		},
		banners = {
			"banner_furniture324"
		}
	}
	pg.base.dorm3d_shop_template[40] = {
		name = "知韵沉思 ",
		rarity = 4,
		type = 1,
		room_id = 49905,
		unlock = "",
		item_id = 1462,
		id = 40,
		realroom_id = 0,
		order = "8",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270602
		},
		banners = {
			"banner_furniture1462"
		}
	}
	pg.base.dorm3d_shop_template[41] = {
		name = "炫彩游戏手柄 ",
		rarity = 4,
		type = 2,
		room_id = 10517,
		unlock = "",
		item_id = 1051702,
		id = 41,
		realroom_id = 0,
		order = "8",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260402
		},
		banners = {
			"banner_gift1051702"
		}
	}
	pg.base.dorm3d_shop_template[42] = {
		name = "绯红邀约",
		rarity = 4,
		type = 2,
		room_id = 30707,
		unlock = "",
		item_id = 3070702,
		id = 42,
		realroom_id = 0,
		order = "7",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260502
		},
		banners = {
			"banner_gift3070702"
		}
	}
	pg.base.dorm3d_shop_template[43] = {
		name = "魔方检测仪",
		rarity = 4,
		type = 1,
		room_id = 79902,
		unlock = "",
		item_id = 2161,
		id = 43,
		realroom_id = 0,
		order = "7",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270701
		},
		banners = {
			"banner_furniture2161"
		}
	}
	pg.base.dorm3d_shop_template[44] = {
		name = "本能训练器",
		rarity = 4,
		type = 2,
		room_id = 79902,
		unlock = "",
		item_id = 7990201,
		id = 44,
		realroom_id = 0,
		order = "7",
		panel = {
			2,
			3,
			4
		},
		shop_id = {
			260701
		},
		banners = {
			"banner_gift7990201"
		}
	}
	pg.base.dorm3d_shop_template[45] = {
		name = "纳希莫夫海军上将维修区工作站邀请函",
		rarity = 4,
		type = 3,
		room_id = 79902,
		unlock = "",
		item_id = 26,
		id = 45,
		realroom_id = 0,
		order = "6",
		panel = {
			2
		},
		shop_id = {
			270121
		},
		banners = {
			"banner_carwash1"
		}
	}
	pg.base.dorm3d_shop_template[46] = {
		name = "深红逸趣",
		rarity = 4,
		type = 1,
		room_id = 49905,
		unlock = "",
		item_id = 1463,
		id = 46,
		realroom_id = 0,
		order = "6",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270603
		},
		banners = {
			"banner_furniture1463"
		}
	}
	pg.base.dorm3d_shop_template[47] = {
		name = "悸动一刻",
		rarity = 5,
		type = 1,
		room_id = 49905,
		unlock = "",
		item_id = 1468,
		id = 47,
		realroom_id = 0,
		order = "2",
		panel = {
			1,
			2,
			3,
			4
		},
		shop_id = {
			270604
		},
		banners = {
			"banner_furniture1468"
		}
	}
end)()
