pg = pg or {}
pg.honormedal_goods_list = rawget(pg, "honormedal_goods_list") or setmetatable({
	__name = "honormedal_goods_list"
}, confNEO)
pg.honormedal_goods_list.all = {
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
	41,
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
	54,
	55
}
pg.base = pg.base or {}
pg.base.honormedal_goods_list = {}

;(function()
	pg.base.honormedal_goods_list[1] = {
		price = 2,
		goods_purchase_limit = 30,
		goods_icon = "Props/54011",
		type = 2,
		group = 10000,
		num = 10,
		goods_name = "强化部件T1",
		goods_type = 2,
		id = 1,
		is_ship = 0,
		goods_rarity = 1,
		order = 31,
		goods = {
			17001,
			17011,
			17021,
			17031,
			17041
		}
	}
	pg.base.honormedal_goods_list[2] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/17002",
		type = 2,
		group = 10001,
		num = 10,
		goods_name = "通用部件T2",
		goods_type = 1,
		id = 2,
		is_ship = 0,
		goods_rarity = 2,
		order = 30,
		goods = {
			17002
		}
	}
	pg.base.honormedal_goods_list[3] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/17012",
		type = 2,
		group = 10002,
		num = 10,
		goods_name = "主炮部件T2",
		goods_type = 1,
		id = 3,
		is_ship = 0,
		goods_rarity = 2,
		order = 26,
		goods = {
			17012
		}
	}
	pg.base.honormedal_goods_list[4] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/17022",
		type = 2,
		group = 10003,
		num = 10,
		goods_name = "鱼雷部件T2",
		goods_type = 1,
		id = 4,
		is_ship = 0,
		goods_rarity = 2,
		order = 27,
		goods = {
			17022
		}
	}
	pg.base.honormedal_goods_list[5] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/17032",
		type = 2,
		group = 10004,
		num = 10,
		goods_name = "防空炮部件T2",
		goods_type = 1,
		id = 5,
		is_ship = 0,
		goods_rarity = 2,
		order = 28,
		goods = {
			17032
		}
	}
	pg.base.honormedal_goods_list[6] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/17042",
		type = 2,
		group = 10005,
		num = 10,
		goods_name = "舰载机部件T2",
		goods_type = 1,
		id = 6,
		is_ship = 0,
		goods_rarity = 2,
		order = 29,
		goods = {
			17042
		}
	}
	pg.base.honormedal_goods_list[7] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/54012",
		type = 2,
		group = 10006,
		num = 10,
		goods_name = "强化部件T2",
		goods_type = 2,
		id = 7,
		is_ship = 0,
		goods_rarity = 2,
		order = 25,
		goods = {
			17002,
			17012,
			17022,
			17032,
			17042
		}
	}
	pg.base.honormedal_goods_list[8] = {
		price = 30,
		goods_purchase_limit = 4,
		goods_icon = "Props/17003",
		type = 2,
		group = 10007,
		num = 5,
		goods_name = "通用部件T3",
		goods_type = 1,
		id = 8,
		is_ship = 0,
		goods_rarity = 3,
		order = 24,
		goods = {
			17003
		}
	}
	pg.base.honormedal_goods_list[9] = {
		price = 30,
		goods_purchase_limit = 4,
		goods_icon = "Props/17013",
		type = 2,
		group = 10008,
		num = 5,
		goods_name = "主炮部件T3",
		goods_type = 1,
		id = 9,
		is_ship = 0,
		goods_rarity = 3,
		order = 20,
		goods = {
			17013
		}
	}
	pg.base.honormedal_goods_list[10] = {
		price = 30,
		goods_purchase_limit = 4,
		goods_icon = "Props/17023",
		type = 2,
		group = 10009,
		num = 5,
		goods_name = "鱼雷部件T3",
		goods_type = 1,
		id = 10,
		is_ship = 0,
		goods_rarity = 3,
		order = 21,
		goods = {
			17023
		}
	}
	pg.base.honormedal_goods_list[11] = {
		price = 30,
		goods_purchase_limit = 4,
		goods_icon = "Props/17033",
		type = 2,
		group = 10010,
		num = 5,
		goods_name = "防空炮部件T3",
		goods_type = 1,
		id = 11,
		is_ship = 0,
		goods_rarity = 3,
		order = 22,
		goods = {
			17033
		}
	}
	pg.base.honormedal_goods_list[12] = {
		price = 30,
		goods_purchase_limit = 4,
		goods_icon = "Props/17043",
		type = 2,
		group = 10011,
		num = 5,
		goods_name = "舰载机部件T3",
		goods_type = 1,
		id = 12,
		is_ship = 0,
		goods_rarity = 3,
		order = 23,
		goods = {
			17043
		}
	}
	pg.base.honormedal_goods_list[13] = {
		price = 30,
		goods_purchase_limit = 5,
		goods_icon = "Props/54013",
		type = 2,
		group = 10012,
		num = 5,
		goods_name = "强化部件T3",
		goods_type = 2,
		id = 13,
		is_ship = 0,
		goods_rarity = 3,
		order = 19,
		goods = {
			17003,
			17013,
			17023,
			17033,
			17043
		}
	}
	pg.base.honormedal_goods_list[14] = {
		price = 30,
		goods_purchase_limit = 24,
		goods_icon = "Props/54031",
		type = 2,
		group = 10013,
		num = 1,
		goods_name = "改造图纸T1",
		goods_type = 2,
		id = 14,
		is_ship = 0,
		goods_rarity = 2,
		order = 18,
		goods = {
			18001,
			18011,
			18021,
			18031
		}
	}
	pg.base.honormedal_goods_list[15] = {
		price = 60,
		goods_purchase_limit = 12,
		goods_icon = "Props/54032",
		type = 2,
		group = 10014,
		num = 1,
		goods_name = "改造图纸T2",
		goods_type = 2,
		id = 15,
		is_ship = 0,
		goods_rarity = 3,
		order = 17,
		goods = {
			18002,
			18012,
			18022,
			18032
		}
	}
	pg.base.honormedal_goods_list[16] = {
		price = 100,
		goods_purchase_limit = 4,
		goods_icon = "Props/54033",
		type = 2,
		group = 10015,
		num = 1,
		goods_name = "改造图纸T3",
		goods_type = 2,
		id = 16,
		is_ship = 0,
		goods_rarity = 4,
		order = 16,
		goods = {
			18003,
			18013,
			18023,
			18033
		}
	}
	pg.base.honormedal_goods_list[17] = {
		price = 6,
		goods_purchase_limit = 6,
		goods_icon = "Props/16002",
		type = 2,
		group = 10016,
		num = 1,
		goods_name = "舰艇攻击教材T2",
		goods_type = 1,
		id = 17,
		is_ship = 0,
		goods_rarity = 3,
		order = 13,
		goods = {
			16002
		}
	}
	pg.base.honormedal_goods_list[18] = {
		price = 6,
		goods_purchase_limit = 6,
		goods_icon = "Props/16012",
		type = 2,
		group = 10017,
		num = 1,
		goods_name = "舰艇防御教材T2",
		goods_type = 1,
		id = 18,
		is_ship = 0,
		goods_rarity = 3,
		order = 14,
		goods = {
			16012
		}
	}
	pg.base.honormedal_goods_list[19] = {
		price = 6,
		goods_purchase_limit = 6,
		goods_icon = "Props/16022",
		type = 2,
		group = 10018,
		num = 1,
		goods_name = "舰艇辅助教材T2",
		goods_type = 1,
		id = 19,
		is_ship = 0,
		goods_rarity = 3,
		order = 15,
		goods = {
			16022
		}
	}
	pg.base.honormedal_goods_list[20] = {
		price = 6,
		goods_purchase_limit = 2,
		goods_icon = "Props/16003",
		type = 2,
		group = 10019,
		num = 1,
		goods_name = "舰艇攻击教材T3",
		goods_type = 1,
		id = 20,
		is_ship = 0,
		goods_rarity = 4,
		order = 10,
		goods = {
			16003
		}
	}
	pg.base.honormedal_goods_list[21] = {
		price = 6,
		goods_purchase_limit = 2,
		goods_icon = "Props/16013",
		type = 2,
		group = 10020,
		num = 1,
		goods_name = "舰艇防御教材T3",
		goods_type = 1,
		id = 21,
		is_ship = 0,
		goods_rarity = 4,
		order = 11,
		goods = {
			16013
		}
	}
	pg.base.honormedal_goods_list[22] = {
		price = 6,
		goods_purchase_limit = 2,
		goods_icon = "Props/16023",
		type = 2,
		group = 10021,
		num = 1,
		goods_name = "舰艇辅助教材T3",
		goods_type = 1,
		id = 22,
		is_ship = 0,
		goods_rarity = 4,
		order = 12,
		goods = {
			16023
		}
	}
	pg.base.honormedal_goods_list[23] = {
		price = 20,
		goods_purchase_limit = 15,
		goods_icon = "Props/42030",
		type = 2,
		group = 10022,
		num = 1,
		goods_name = "定向蓝图・四期",
		goods_type = 1,
		id = 23,
		is_ship = 0,
		goods_rarity = 4,
		order = 7,
		goods = {
			42030
		}
	}
	pg.base.honormedal_goods_list[24] = {
		price = 20,
		goods_purchase_limit = 5,
		goods_icon = "Props/42036",
		type = 2,
		group = 10023,
		num = 1,
		goods_name = "高级定向蓝图・四期",
		goods_type = 1,
		id = 24,
		is_ship = 0,
		goods_rarity = 5,
		order = 6,
		goods = {
			42036
		}
	}
	pg.base.honormedal_goods_list[25] = {
		price = 6,
		goods_purchase_limit = 24,
		goods_icon = "Props/huangjialiaoli",
		type = 2,
		group = 10024,
		num = 1,
		goods_name = "皇家料理",
		goods_type = 1,
		id = 25,
		is_ship = 0,
		goods_rarity = 3,
		order = 9,
		goods = {
			50005
		}
	}
	pg.base.honormedal_goods_list[26] = {
		price = 10,
		goods_purchase_limit = 12,
		goods_icon = "Props/manhanquanxi",
		type = 2,
		group = 10025,
		num = 1,
		goods_name = "满汉全席",
		goods_type = 1,
		id = 26,
		is_ship = 0,
		goods_rarity = 3,
		order = 8,
		goods = {
			50006
		}
	}
	pg.base.honormedal_goods_list[27] = {
		price = 80,
		goods_purchase_limit = 2,
		goods_icon = "squareIcon/kin",
		type = 4,
		group = 20001,
		num = 1,
		goods_name = "试作型布里MKII",
		goods_type = 1,
		id = 27,
		is_ship = 1,
		goods_rarity = 4,
		order = 2,
		goods = {
			100011
		}
	}
	pg.base.honormedal_goods_list[28] = {
		price = 30,
		goods_purchase_limit = 10,
		goods_icon = "squareIcon/gin",
		type = 4,
		group = 20002,
		num = 1,
		goods_name = "泛用型布里",
		goods_type = 1,
		id = 28,
		is_ship = 1,
		goods_rarity = 3,
		order = 3,
		goods = {
			100001
		}
	}
	pg.base.honormedal_goods_list[29] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR驱逐",
		goods_type = 2,
		id = 29,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			301161,
			401461,
			801011,
			901111,
			101451,
			301861,
			701051
		}
	}
	pg.base.honormedal_goods_list[30] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR轻巡",
		goods_type = 2,
		id = 30,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			102081,
			202041,
			202281
		}
	}
	pg.base.honormedal_goods_list[31] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR重巡",
		goods_type = 2,
		id = 31,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			303111,
			303121,
			403031,
			103131,
			103161,
			603021,
			603031
		}
	}
	pg.base.honormedal_goods_list[32] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR战列",
		goods_type = 2,
		id = 32,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			204031,
			205021,
			205061,
			305111,
			405021,
			105121,
			105131,
			305051,
			105191,
			905011,
			304051,
			305081,
			405011,
			105201,
			305141,
			905031
		}
	}
	pg.base.honormedal_goods_list[33] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR航母",
		goods_type = 2,
		id = 33,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			107061,
			307051,
			307061,
			207051,
			306071,
			307101,
			307111
		}
	}
	pg.base.honormedal_goods_list[34] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR驱逐",
		goods_type = 2,
		id = 34,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			301161,
			401461,
			801011,
			901111,
			101451,
			301861,
			701051
		}
	}
	pg.base.honormedal_goods_list[35] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR轻巡",
		goods_type = 2,
		id = 35,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			102081,
			202041,
			202281
		}
	}
	pg.base.honormedal_goods_list[36] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR重巡",
		goods_type = 2,
		id = 36,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			303111,
			303121,
			403031,
			103131,
			103161,
			603021,
			603031
		}
	}
	pg.base.honormedal_goods_list[37] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR战列",
		goods_type = 2,
		id = 37,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			204031,
			205021,
			205061,
			305111,
			405021,
			105121,
			105131,
			305051,
			105191,
			905011,
			304051,
			305081,
			405011,
			105201,
			305141,
			905031
		}
	}
	pg.base.honormedal_goods_list[38] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR航母",
		goods_type = 2,
		id = 38,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			107061,
			307051,
			307061,
			207051,
			306071,
			307101,
			307111
		}
	}
	pg.base.honormedal_goods_list[41] = {
		price = 15,
		goods_purchase_limit = 20,
		goods_icon = "Props/30205",
		type = 2,
		group = 10028,
		num = 1,
		goods_name = "鸢尾装备研发支援箱",
		goods_type = 1,
		id = 41,
		is_ship = 0,
		goods_rarity = 2,
		order = 32,
		goods = {
			30205
		}
	}
	pg.base.honormedal_goods_list[42] = {
		price = 20,
		goods_purchase_limit = 15,
		goods_icon = "Props/42040",
		type = 2,
		group = 10029,
		num = 1,
		goods_name = "定向蓝图・五期",
		goods_type = 1,
		id = 42,
		is_ship = 0,
		goods_rarity = 4,
		order = 7,
		goods = {
			42040
		}
	}
	pg.base.honormedal_goods_list[43] = {
		price = 20,
		goods_purchase_limit = 5,
		goods_icon = "Props/42046",
		type = 2,
		group = 10030,
		num = 1,
		goods_name = "高级定向蓝图・五期",
		goods_type = 1,
		id = 43,
		is_ship = 0,
		goods_rarity = 5,
		order = 6,
		goods = {
			42046
		}
	}
	pg.base.honormedal_goods_list[44] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20003,
		num = 1,
		goods_name = "SSR潜艇",
		goods_type = 2,
		id = 44,
		is_ship = 0,
		goods_rarity = 4,
		order = 0,
		goods = {
			408091
		}
	}
	pg.base.honormedal_goods_list[45] = {
		price = 80,
		goods_purchase_limit = 1,
		goods_icon = "Props/54000",
		type = 4,
		group = 20004,
		num = 1,
		goods_name = "SSR潜艇",
		goods_type = 2,
		id = 45,
		is_ship = 0,
		goods_rarity = 4,
		order = 1,
		goods = {
			408091
		}
	}
	pg.base.honormedal_goods_list[46] = {
		price = 20,
		goods_purchase_limit = 15,
		goods_icon = "Props/42050",
		type = 2,
		group = 10031,
		num = 1,
		goods_name = "定向蓝图・六期",
		goods_type = 1,
		id = 46,
		is_ship = 0,
		goods_rarity = 4,
		order = 7,
		goods = {
			42050
		}
	}
	pg.base.honormedal_goods_list[47] = {
		price = 20,
		goods_purchase_limit = 5,
		goods_icon = "Props/42056",
		type = 2,
		group = 10032,
		num = 1,
		goods_name = "高级定向蓝图・六期",
		goods_type = 1,
		id = 47,
		is_ship = 0,
		goods_rarity = 5,
		order = 6,
		goods = {
			42056
		}
	}
	pg.base.honormedal_goods_list[48] = {
		price = 6,
		goods_purchase_limit = 10,
		goods_icon = "Props/specialarmor_prt",
		type = 2,
		group = 10033,
		num = 100,
		goods_name = "特装原型",
		goods_type = 1,
		id = 48,
		is_ship = 0,
		goods_rarity = 5,
		order = 4,
		goods = {
			59010
		}
	}
	pg.base.honormedal_goods_list[49] = {
		price = 20,
		goods_purchase_limit = 15,
		goods_icon = "Props/42060",
		type = 2,
		group = 10034,
		num = 1,
		goods_name = "定向蓝图・七期",
		goods_type = 1,
		id = 49,
		is_ship = 0,
		goods_rarity = 4,
		order = 7,
		goods = {
			42060
		}
	}
	pg.base.honormedal_goods_list[50] = {
		price = 20,
		goods_purchase_limit = 5,
		goods_icon = "Props/42066",
		type = 2,
		group = 10035,
		num = 1,
		goods_name = "高级定向蓝图・七期",
		goods_type = 1,
		id = 50,
		is_ship = 0,
		goods_rarity = 5,
		order = 6,
		goods = {
			42066
		}
	}
	pg.base.honormedal_goods_list[51] = {
		price = 15,
		goods_purchase_limit = 20,
		goods_icon = "Props/30207",
		type = 2,
		group = 10036,
		num = 1,
		goods_name = "撒丁装备研发支援箱",
		goods_type = 1,
		id = 51,
		is_ship = 0,
		goods_rarity = 2,
		order = 33,
		goods = {
			30207
		}
	}
	pg.base.honormedal_goods_list[52] = {
		price = 10,
		goods_purchase_limit = 20,
		goods_icon = "Props/specialarmor_prt",
		type = 2,
		group = 10037,
		num = 100,
		goods_name = "特装原型",
		goods_type = 1,
		id = 52,
		is_ship = 0,
		goods_rarity = 5,
		order = 5,
		goods = {
			59010
		}
	}
	pg.base.honormedal_goods_list[53] = {
		price = 15,
		goods_purchase_limit = 20,
		goods_icon = "Props/30208",
		type = 2,
		group = 10038,
		num = 1,
		goods_name = "北联装备研发支援箱",
		goods_type = 1,
		id = 53,
		is_ship = 0,
		goods_rarity = 2,
		order = 34,
		goods = {
			30208
		}
	}
	pg.base.honormedal_goods_list[54] = {
		price = 20,
		goods_purchase_limit = 15,
		goods_icon = "Props/42070",
		type = 2,
		group = 10039,
		num = 1,
		goods_name = "定向蓝图・八期",
		goods_type = 1,
		id = 54,
		is_ship = 0,
		goods_rarity = 4,
		order = 7,
		goods = {
			42070
		}
	}
	pg.base.honormedal_goods_list[55] = {
		price = 20,
		goods_purchase_limit = 5,
		goods_icon = "Props/42076",
		type = 2,
		group = 10040,
		num = 1,
		goods_name = "高级定向蓝图・八期",
		goods_type = 1,
		id = 55,
		is_ship = 0,
		goods_rarity = 5,
		order = 6,
		goods = {
			42076
		}
	}
end)()
