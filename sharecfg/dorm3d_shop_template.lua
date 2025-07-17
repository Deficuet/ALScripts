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
		22
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_shop_template = {
	{
		name = "甜蜜心事",
		rarity = 4,
		item_id = 121,
		type = 1,
		id = 1,
		room_id = 20220,
		order = "8",
		unlock = "",
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
		item_id = 122,
		type = 1,
		id = 2,
		room_id = 20220,
		order = "11",
		unlock = "",
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
		item_id = 221,
		type = 1,
		id = 3,
		room_id = 30221,
		order = "9",
		unlock = "",
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
		item_id = 222,
		type = 1,
		id = 4,
		room_id = 30221,
		order = "14",
		unlock = "",
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
		item_id = 151,
		type = 1,
		id = 5,
		room_id = 20220,
		order = "1",
		unlock = "",
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
		item_id = 251,
		type = 1,
		id = 6,
		room_id = 30221,
		order = "2",
		unlock = "",
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
		item_id = 321,
		type = 1,
		id = 7,
		room_id = 19903,
		order = "10",
		unlock = "",
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
		item_id = 322,
		type = 1,
		id = 8,
		room_id = 19903,
		order = "13",
		unlock = "",
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
		item_id = 2022001,
		type = 2,
		id = 9,
		room_id = 20220,
		order = "16",
		unlock = "",
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
		item_id = 2022002,
		type = 2,
		id = 10,
		room_id = 20220,
		order = "19",
		unlock = "",
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
		item_id = 3022101,
		type = 2,
		id = 11,
		room_id = 30221,
		order = "17",
		unlock = "",
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
		item_id = 1990301,
		type = 2,
		id = 12,
		room_id = 19903,
		order = "18",
		unlock = "",
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
		item_id = 1021002,
		type = 2,
		id = 13,
		room_id = 0,
		order = "998",
		unlock = "",
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
		item_id = 1021003,
		type = 2,
		id = 14,
		room_id = 0,
		order = "999",
		unlock = "",
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
		item_id = 4,
		type = 3,
		id = 15,
		room_id = 20220,
		order = "4",
		unlock = "",
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
		item_id = 4,
		type = 3,
		id = 16,
		room_id = 30221,
		order = "5",
		unlock = "",
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
		item_id = 4,
		type = 3,
		id = 17,
		room_id = 19903,
		order = "6",
		unlock = "",
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
		item_id = 3022102,
		type = 2,
		id = 18,
		room_id = 30221,
		order = "12",
		unlock = "",
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
		item_id = 1151,
		type = 1,
		id = 19,
		room_id = 10517,
		order = "7",
		unlock = "",
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
		item_id = 1051701,
		type = 2,
		id = 20,
		room_id = 10517,
		order = "15",
		unlock = "",
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
		item_id = 16,
		type = 3,
		id = 21,
		room_id = 10517,
		order = "3",
		unlock = "",
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
		item_id = 223,
		type = 1,
		id = 22,
		room_id = 30221,
		order = "8",
		unlock = "",
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
}
