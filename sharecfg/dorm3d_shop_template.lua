pg = pg or {}
pg.dorm3d_shop_template = setmetatable({
	__name = "dorm3d_shop_template",
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
		32
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_shop_template = {
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
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
	},
	{
		name = "云中甜梦",
		rarity = 4,
		type = 1,
		room_id = 19903,
		unlock = "",
		item_id = 323,
		id = 26,
		realroom_id = 0,
		order = "8",
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
	},
	{
		name = "爱之巢 ",
		rarity = 4,
		type = 1,
		room_id = 30707,
		unlock = "",
		item_id = 1221,
		id = 27,
		realroom_id = 0,
		order = "7",
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
	},
	{
		name = "相连的爱意 ",
		rarity = 4,
		type = 2,
		room_id = 30707,
		unlock = "",
		item_id = 3070701,
		id = 28,
		realroom_id = 0,
		order = "7",
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
	},
	{
		name = "{namecode:97}咖啡馆邀请函",
		rarity = 4,
		type = 3,
		room_id = 30707,
		unlock = "",
		item_id = 16,
		id = 29,
		realroom_id = 0,
		order = "6",
		panel = {
			2
		},
		shop_id = {
			270114
		},
		banners = {
			"banner_cafe2"
		}
	},
	{
		name = "天外庇所",
		rarity = 4,
		type = 1,
		room_id = 10517,
		unlock = "",
		item_id = 1153,
		id = 30,
		realroom_id = 0,
		order = "6",
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
	},
	{
		name = "花乐留韵 ",
		rarity = 5,
		type = 1,
		room_id = 30707,
		unlock = "",
		item_id = 1222,
		id = 31,
		realroom_id = 0,
		order = "1",
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
	},
	{
		name = "《完美女仆守则》 ",
		rarity = 4,
		type = 2,
		room_id = 20220,
		unlock = "",
		item_id = 2022003,
		id = 32,
		realroom_id = 0,
		order = "3",
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
}
