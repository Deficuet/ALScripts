pg = pg or {}
pg.activity_town_work_level = rawget(pg, "activity_town_work_level") or setmetatable({
	__name = "activity_town_work_level"
}, confNEO)
pg.activity_town_work_level.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	11,
	12,
	13,
	14,
	15,
	16,
	21,
	22,
	23,
	24,
	25,
	26,
	31,
	32,
	33,
	34,
	35,
	36,
	101,
	102,
	103,
	104,
	105,
	106,
	111,
	112,
	113,
	114,
	115,
	116,
	121,
	122,
	123,
	124,
	125,
	126,
	131,
	132,
	133,
	134,
	135,
	136,
	137,
	138,
	139,
	140,
	141
}
pg.base = pg.base or {}
pg.base.activity_town_work_level = {}

;(function()
	pg.base.activity_town_work_level[1] = {
		name = "小型牧场LV.0",
		exp_display = 10,
		group = 1,
		type = 1,
		gold = 0,
		town_level = 1,
		pic = "muchang_xiao",
		gold_gain = 0,
		id = 1,
		level = 0
	}
	pg.base.activity_town_work_level[2] = {
		name = "小型牧场LV.1",
		exp_display = 10,
		group = 1,
		type = 1,
		gold = 50000,
		town_level = 1,
		pic = "muchang_xiao",
		gold_gain = 1000,
		id = 2,
		level = 1
	}
	pg.base.activity_town_work_level[3] = {
		name = "中型牧场LV.2",
		exp_display = 10,
		group = 1,
		type = 1,
		gold = 100000,
		town_level = 1,
		pic = "muchang_zhong",
		gold_gain = 1100,
		id = 3,
		level = 2
	}
	pg.base.activity_town_work_level[4] = {
		name = "中型牧场LV.3",
		exp_display = 10,
		group = 1,
		type = 1,
		gold = 300000,
		town_level = 2,
		pic = "muchang_zhong",
		gold_gain = 1200,
		id = 4,
		level = 3
	}
	pg.base.activity_town_work_level[5] = {
		name = "大型牧场LV.4",
		exp_display = 20,
		group = 1,
		type = 1,
		gold = 600000,
		town_level = 2,
		pic = "muchang_da",
		gold_gain = 1300,
		id = 5,
		level = 4
	}
	pg.base.activity_town_work_level[6] = {
		name = "大型牧场LV.5",
		exp_display = 0,
		group = 1,
		type = 1,
		gold = 0,
		town_level = 0,
		pic = "muchang_da",
		gold_gain = 1500,
		id = 6,
		level = 5
	}
	pg.base.activity_town_work_level[11] = {
		name = "小型农场LV.0",
		exp_display = 15,
		group = 2,
		type = 1,
		gold = 1200000,
		town_level = 3,
		pic = "nongchang_xiao",
		gold_gain = 0,
		id = 11,
		level = 0
	}
	pg.base.activity_town_work_level[12] = {
		name = "小型农场LV.1",
		exp_display = 15,
		group = 2,
		type = 1,
		gold = 800000,
		town_level = 3,
		pic = "nongchang_xiao",
		gold_gain = 500,
		id = 12,
		level = 1
	}
	pg.base.activity_town_work_level[13] = {
		name = "中型农场LV.2",
		exp_display = 15,
		group = 2,
		type = 1,
		gold = 1000000,
		town_level = 3,
		pic = "nongchang_zhong",
		gold_gain = 600,
		id = 13,
		level = 2
	}
	pg.base.activity_town_work_level[14] = {
		name = "中型农场LV.3",
		exp_display = 15,
		group = 2,
		type = 1,
		gold = 1200000,
		town_level = 4,
		pic = "nongchang_zhong",
		gold_gain = 700,
		id = 14,
		level = 3
	}
	pg.base.activity_town_work_level[15] = {
		name = "大型农场LV.4",
		exp_display = 20,
		group = 2,
		type = 1,
		gold = 2000000,
		town_level = 4,
		pic = "nongchang_da",
		gold_gain = 800,
		id = 15,
		level = 4
	}
	pg.base.activity_town_work_level[16] = {
		name = "大型农场LV.5",
		exp_display = 0,
		group = 2,
		type = 1,
		gold = 0,
		town_level = 0,
		pic = "nongchang_da",
		gold_gain = 1000,
		id = 16,
		level = 5
	}
	pg.base.activity_town_work_level[21] = {
		name = "小型矿场LV.0",
		exp_display = 20,
		group = 3,
		type = 1,
		gold = 10000000,
		town_level = 5,
		pic = "kuangchang_xiao",
		gold_gain = 0,
		id = 21,
		level = 0
	}
	pg.base.activity_town_work_level[22] = {
		name = "小型矿场LV.1",
		exp_display = 20,
		group = 3,
		type = 1,
		gold = 8000000,
		town_level = 5,
		pic = "kuangchang_xiao",
		gold_gain = 800,
		id = 22,
		level = 1
	}
	pg.base.activity_town_work_level[23] = {
		name = "中型矿场LV.2",
		exp_display = 20,
		group = 3,
		type = 1,
		gold = 12000000,
		town_level = 5,
		pic = "kuangchang_zhong",
		gold_gain = 1100,
		id = 23,
		level = 2
	}
	pg.base.activity_town_work_level[24] = {
		name = "中型矿场LV.3",
		exp_display = 20,
		group = 3,
		type = 1,
		gold = 20000000,
		town_level = 6,
		pic = "kuangchang_zhong",
		gold_gain = 1400,
		id = 24,
		level = 3
	}
	pg.base.activity_town_work_level[25] = {
		name = "大型矿场LV.4",
		exp_display = 30,
		group = 3,
		type = 1,
		gold = 30000000,
		town_level = 6,
		pic = "kuangchang_da",
		gold_gain = 1700,
		id = 25,
		level = 4
	}
	pg.base.activity_town_work_level[26] = {
		name = "大型矿场LV.5",
		exp_display = 0,
		group = 3,
		type = 1,
		gold = 0,
		town_level = 0,
		pic = "kuangchang_da",
		gold_gain = 2000,
		id = 26,
		level = 5
	}
	pg.base.activity_town_work_level[31] = {
		name = "小型摄影棚LV.0",
		exp_display = 20,
		group = 4,
		type = 1,
		gold = 90000000,
		town_level = 7,
		pic = "sheyingpeng_xiao",
		gold_gain = 0,
		id = 31,
		level = 0
	}
	pg.base.activity_town_work_level[32] = {
		name = "小型摄影棚LV.1",
		exp_display = 20,
		group = 4,
		type = 1,
		gold = 45000000,
		town_level = 7,
		pic = "sheyingpeng_xiao",
		gold_gain = 1000,
		id = 32,
		level = 1
	}
	pg.base.activity_town_work_level[33] = {
		name = "中型摄影棚LV.2",
		exp_display = 20,
		group = 4,
		type = 1,
		gold = 60000000,
		town_level = 7,
		pic = "sheyingpeng_zhong",
		gold_gain = 1500,
		id = 33,
		level = 2
	}
	pg.base.activity_town_work_level[34] = {
		name = "中型摄影棚LV.3",
		exp_display = 20,
		group = 4,
		type = 1,
		gold = 75000000,
		town_level = 8,
		pic = "sheyingpeng_zhong",
		gold_gain = 2000,
		id = 34,
		level = 3
	}
	pg.base.activity_town_work_level[35] = {
		name = "大型摄影棚LV.4",
		exp_display = 20,
		group = 4,
		type = 1,
		gold = 180000000,
		town_level = 8,
		pic = "sheyingpeng_da",
		gold_gain = 2500,
		id = 35,
		level = 4
	}
	pg.base.activity_town_work_level[36] = {
		name = "大型摄影棚LV.5",
		exp_display = 0,
		group = 4,
		type = 1,
		gold = 0,
		town_level = 0,
		pic = "sheyingpeng_da",
		gold_gain = 3500,
		id = 36,
		level = 5
	}
	pg.base.activity_town_work_level[101] = {
		name = "小镇车站LV.0",
		exp_display = 40,
		group = 5,
		type = 2,
		gold = 25000000,
		town_level = 4,
		pic = "huochezhan",
		gold_gain = 0,
		id = 101,
		level = 0
	}
	pg.base.activity_town_work_level[102] = {
		name = "小镇车站LV.1",
		exp_display = 40,
		group = 5,
		type = 2,
		gold = 27000000,
		town_level = 4,
		pic = "huochezhan",
		gold_gain = 500,
		id = 102,
		level = 1
	}
	pg.base.activity_town_work_level[103] = {
		name = "小镇车站LV.2",
		exp_display = 40,
		group = 5,
		type = 2,
		gold = 30000000,
		town_level = 4,
		pic = "huochezhan",
		gold_gain = 1000,
		id = 103,
		level = 2
	}
	pg.base.activity_town_work_level[104] = {
		name = "小镇车站LV.3",
		exp_display = 40,
		group = 5,
		type = 2,
		gold = 35000000,
		town_level = 5,
		pic = "huochezhan",
		gold_gain = 1500,
		id = 104,
		level = 3
	}
	pg.base.activity_town_work_level[105] = {
		name = "小镇车站LV.4",
		exp_display = 40,
		group = 5,
		type = 2,
		gold = 40000000,
		town_level = 5,
		pic = "huochezhan",
		gold_gain = 2000,
		id = 105,
		level = 4
	}
	pg.base.activity_town_work_level[106] = {
		name = "小镇车站LV.5",
		exp_display = 0,
		group = 5,
		type = 2,
		gold = 0,
		town_level = 0,
		pic = "huochezhan",
		gold_gain = 2500,
		id = 106,
		level = 5
	}
	pg.base.activity_town_work_level[111] = {
		name = "小镇旅店LV.0",
		exp_display = 40,
		group = 6,
		type = 2,
		gold = 80000000,
		town_level = 6,
		pic = "jiudian",
		gold_gain = 0,
		id = 111,
		level = 0
	}
	pg.base.activity_town_work_level[112] = {
		name = "小镇旅店LV.1",
		exp_display = 40,
		group = 6,
		type = 2,
		gold = 85000000,
		town_level = 6,
		pic = "jiudian",
		gold_gain = 1000,
		id = 112,
		level = 1
	}
	pg.base.activity_town_work_level[113] = {
		name = "小镇旅店LV.2",
		exp_display = 40,
		group = 6,
		type = 2,
		gold = 90000000,
		town_level = 6,
		pic = "jiudian",
		gold_gain = 2000,
		id = 113,
		level = 2
	}
	pg.base.activity_town_work_level[114] = {
		name = "小镇旅店LV.3",
		exp_display = 40,
		group = 6,
		type = 2,
		gold = 100000000,
		town_level = 7,
		pic = "jiudian",
		gold_gain = 3000,
		id = 114,
		level = 3
	}
	pg.base.activity_town_work_level[115] = {
		name = "小镇旅店LV.4",
		exp_display = 40,
		group = 6,
		type = 2,
		gold = 120000000,
		town_level = 7,
		pic = "jiudian",
		gold_gain = 4000,
		id = 115,
		level = 4
	}
	pg.base.activity_town_work_level[116] = {
		name = "小镇旅店LV.5",
		exp_display = 0,
		group = 6,
		type = 2,
		gold = 0,
		town_level = 0,
		pic = "jiudian",
		gold_gain = 5000,
		id = 116,
		level = 5
	}
	pg.base.activity_town_work_level[121] = {
		name = "小镇酒馆LV.0",
		exp_display = 10,
		group = 7,
		type = 2,
		gold = 240000000,
		town_level = 9,
		pic = "jiuguan",
		gold_gain = 0,
		id = 121,
		level = 0
	}
	pg.base.activity_town_work_level[122] = {
		name = "小镇酒馆LV.1",
		exp_display = 10,
		group = 7,
		type = 2,
		gold = 250000000,
		town_level = 9,
		pic = "jiuguan",
		gold_gain = 2000,
		id = 122,
		level = 1
	}
	pg.base.activity_town_work_level[123] = {
		name = "小镇酒馆LV.2",
		exp_display = 10,
		group = 7,
		type = 2,
		gold = 260000000,
		town_level = 9,
		pic = "jiuguan",
		gold_gain = 4000,
		id = 123,
		level = 2
	}
	pg.base.activity_town_work_level[124] = {
		name = "小镇酒馆LV.3",
		exp_display = 10,
		group = 7,
		type = 2,
		gold = 280000000,
		town_level = 9,
		pic = "jiuguan",
		gold_gain = 6000,
		id = 124,
		level = 3
	}
	pg.base.activity_town_work_level[125] = {
		name = "小镇酒馆LV.4",
		exp_display = 10,
		group = 7,
		type = 2,
		gold = 300000000,
		town_level = 9,
		pic = "jiuguan",
		gold_gain = 8000,
		id = 125,
		level = 4
	}
	pg.base.activity_town_work_level[126] = {
		name = "小镇酒馆LV.5",
		exp_display = 0,
		group = 7,
		type = 2,
		gold = 0,
		town_level = 0,
		pic = "jiuguan",
		gold_gain = 10000,
		id = 126,
		level = 5
	}
	pg.base.activity_town_work_level[131] = {
		name = "小镇办公厅LV.0",
		exp_display = 50,
		group = 8,
		type = 2,
		gold = 50000000,
		town_level = 8,
		pic = "jingju",
		gold_gain = 0,
		id = 131,
		level = 0
	}
	pg.base.activity_town_work_level[132] = {
		name = "小镇办公厅LV.1",
		exp_display = 50,
		group = 8,
		type = 2,
		gold = 50000000,
		town_level = 8,
		pic = "jingju",
		gold_gain = 0,
		id = 132,
		level = 1
	}
	pg.base.activity_town_work_level[133] = {
		name = "小镇办公厅LV.2",
		exp_display = 60,
		group = 8,
		type = 2,
		gold = 100000000,
		town_level = 9,
		pic = "jingju",
		gold_gain = 0,
		id = 133,
		level = 2
	}
	pg.base.activity_town_work_level[134] = {
		name = "小镇办公厅LV.3",
		exp_display = 60,
		group = 8,
		type = 2,
		gold = 100000000,
		town_level = 9,
		pic = "jingju",
		gold_gain = 0,
		id = 134,
		level = 3
	}
	pg.base.activity_town_work_level[135] = {
		name = "小镇办公厅LV.4",
		exp_display = 70,
		group = 8,
		type = 2,
		gold = 150000000,
		town_level = 9,
		pic = "jingju",
		gold_gain = 0,
		id = 135,
		level = 4
	}
	pg.base.activity_town_work_level[136] = {
		name = "小镇办公厅LV.5",
		exp_display = 80,
		group = 8,
		type = 2,
		gold = 200000000,
		town_level = 10,
		pic = "jingju",
		gold_gain = 0,
		id = 136,
		level = 5
	}
	pg.base.activity_town_work_level[137] = {
		name = "小镇办公厅LV.6",
		exp_display = 90,
		group = 8,
		type = 2,
		gold = 400000000,
		town_level = 10,
		pic = "jingju",
		gold_gain = 0,
		id = 137,
		level = 6
	}
	pg.base.activity_town_work_level[138] = {
		name = "小镇办公厅LV.7",
		exp_display = 100,
		group = 8,
		type = 2,
		gold = 800000000,
		town_level = 10,
		pic = "jingju",
		gold_gain = 0,
		id = 138,
		level = 7
	}
	pg.base.activity_town_work_level[139] = {
		name = "小镇办公厅LV.8",
		exp_display = 100,
		group = 8,
		type = 2,
		gold = 1500000000,
		town_level = 10,
		pic = "jingju",
		gold_gain = 0,
		id = 139,
		level = 8
	}
	pg.base.activity_town_work_level[140] = {
		name = "小镇办公厅LV.9",
		exp_display = 100,
		group = 8,
		type = 2,
		gold = 3000000000,
		town_level = 10,
		pic = "jingju",
		gold_gain = 0,
		id = 140,
		level = 9
	}
	pg.base.activity_town_work_level[141] = {
		name = "小镇办公厅LV.10",
		exp_display = 0,
		group = 8,
		type = 2,
		gold = 0,
		town_level = 0,
		pic = "jingju",
		gold_gain = 0,
		id = 141,
		level = 10
	}
end)()
