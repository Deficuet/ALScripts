pg = pg or {}
pg.activity_dreamland_event = rawget(pg, "activity_dreamland_event") or setmetatable({
	__name = "activity_dreamland_event"
}, confNEO)
pg.activity_dreamland_event.all = {
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
	19
}
pg.base = pg.base or {}
pg.base.activity_dreamland_event = {}

;(function()
	pg.base.activity_dreamland_event[1] = {
		icon = "tag_story_main",
		name = "梦境的入口",
		id = 1,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI1",
		pos = {
			x = 184,
			y = 268
		}
	}
	pg.base.activity_dreamland_event[2] = {
		icon = "tag_story_main",
		name = "来一杯冰牛奶吧~",
		id = 2,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI13",
		pos = {
			x = 1487,
			y = 293
		}
	}
	pg.base.activity_dreamland_event[3] = {
		icon = "tag_story_main",
		name = "一日之计在于晨？",
		id = 3,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI2",
		pos = {
			x = 1211,
			y = 139
		}
	}
	pg.base.activity_dreamland_event[4] = {
		icon = "tag_story_main",
		name = "通往心房的钥匙",
		id = 4,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI14",
		pos = {
			x = 74,
			y = 97
		}
	}
	pg.base.activity_dreamland_event[5] = {
		icon = "tag_story_main",
		name = "闪耀的魔法表演",
		id = 5,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI7",
		pos = {
			x = 1097,
			y = -603
		}
	}
	pg.base.activity_dreamland_event[6] = {
		icon = "tag_story_main",
		name = "泳装女仆与冰镇汽水",
		id = 6,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI15",
		pos = {
			x = 1261,
			y = -505
		}
	}
	pg.base.activity_dreamland_event[7] = {
		icon = "tag_story_main",
		name = "特别的花车巡游",
		id = 7,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI8",
		pos = {
			x = -1961,
			y = -537
		}
	}
	pg.base.activity_dreamland_event[8] = {
		icon = "tag_story_main",
		name = "正中靶心的甜蜜赌局",
		id = 8,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI16",
		pos = {
			x = -1197,
			y = -63
		}
	}
	pg.base.activity_dreamland_event[9] = {
		icon = "tag_story_main",
		name = "换上纯白礼服吧！",
		id = 9,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI17",
		pos = {
			x = -34,
			y = 151
		}
	}
	pg.base.activity_dreamland_event[10] = {
		icon = "tag_story_main",
		name = "逢魔之时",
		id = 10,
		bg = 2,
		story = "MENGHUANLEYUANDEMENGHUANJIARI3",
		pos = {
			x = -151,
			y = 148
		}
	}
	pg.base.activity_dreamland_event[11] = {
		icon = "tag_story_main",
		name = "迷宫之中",
		id = 11,
		bg = 2,
		story = "MENGHUANLEYUANDEMENGHUANJIARI10",
		pos = {
			x = -1522,
			y = 140
		}
	}
	pg.base.activity_dreamland_event[12] = {
		icon = "tag_story_main",
		name = "缠绕的黑暗",
		id = 12,
		bg = 2,
		story = "MENGHUANLEYUANDEMENGHUANJIARI11",
		pos = {
			x = 1122,
			y = 33
		}
	}
	pg.base.activity_dreamland_event[13] = {
		icon = "tag_story_main",
		name = "特殊时刻",
		id = 13,
		bg = 3,
		story = "MENGHUANLEYUANDEMENGHUANJIARI12",
		pos = {
			x = 1511,
			y = 452
		}
	}
	pg.base.activity_dreamland_event[14] = {
		icon = "tag_story_main",
		name = "夜晚的游乐时间",
		id = 14,
		bg = 3,
		story = "MENGHUANLEYUANDEMENGHUANJIARI4",
		pos = {
			x = 1324,
			y = -309
		}
	}
	pg.base.activity_dreamland_event[15] = {
		icon = "tag_story_main",
		name = "烟花与回忆",
		id = 15,
		bg = 3,
		story = "MENGHUANLEYUANDEMENGHUANJIARI9",
		pos = {
			x = -273,
			y = 6
		}
	}
	pg.base.activity_dreamland_event[16] = {
		icon = "tag_story_main",
		name = "美梦落幕之时",
		id = 16,
		bg = 3,
		story = "MENGHUANLEYUANDEMENGHUANJIARI5",
		pos = {
			x = 1383,
			y = 103
		}
	}
	pg.base.activity_dreamland_event[17] = {
		icon = "tag_story_main",
		name = "梦幻的烟火",
		id = 17,
		bg = 3,
		story = "MENGHUANLEYUANDEMENGHUANJIARI18",
		pos = {
			x = 5,
			y = -103
		}
	}
	pg.base.activity_dreamland_event[18] = {
		icon = "tag_story_main",
		name = "特别的睡前服务",
		id = 18,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI19",
		pos = {
			x = -2140,
			y = -357
		}
	}
	pg.base.activity_dreamland_event[19] = {
		icon = "tag_story_main",
		name = "后日谈",
		id = 19,
		bg = 1,
		story = "MENGHUANLEYUANDEMENGHUANJIARI6",
		pos = {
			x = -68,
			y = -456
		}
	}
end)()
