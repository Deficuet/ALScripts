pg = pg or {}
pg.island_ship_state = {
	[200101] = {
		id = 200101,
		name = "工作疲劳",
		icon = "props/state",
		type = 2,
		group = 2001,
		duration = 300,
		level = 1,
		desc = "长时间工作导致的疲劳状态，工作速度降低5%",
		effect_type = {
			4,
			-5
		}
	},
	[200102] = {
		id = 200102,
		name = "缺乏运动",
		icon = "props/state",
		type = 2,
		group = 2001,
		duration = 300,
		level = 2,
		desc = "最近缺乏运动导致体力较差，体力消耗速度增加5%",
		effect_type = {
			1,
			5
		}
	},
	[200103] = {
		id = 200103,
		name = "心情愉悦",
		icon = "props/state",
		type = 1,
		group = 2001,
		duration = 300,
		level = 3,
		desc = "心情愉悦，工作效率提升，工作速度提升5%",
		effect_type = {
			4,
			5
		}
	},
	[200201] = {
		id = 200201,
		name = "兴致勃勃 ",
		icon = "props/state",
		type = 1,
		group = 2002,
		duration = 3600,
		level = 1,
		desc = "似乎忘记了疲劳，体力消耗速度减缓10%",
		effect_type = {
			2,
			-10
		}
	},
	[200202] = {
		id = 200202,
		name = "睡眠不足",
		icon = "props/state",
		type = 2,
		group = 2002,
		duration = 3600,
		level = 2,
		desc = "昨天熬夜了，体力消耗速度增加10%",
		effect_type = {
			2,
			10
		}
	},
	[200203] = {
		id = 200203,
		name = "怠惰",
		icon = "props/state",
		type = 2,
		group = 2002,
		duration = 300,
		level = 3,
		desc = "今天工作状态不佳，工作速度降低10%",
		effect_type = {
			4,
			-10
		}
	},
	all = {
		200101,
		200102,
		200103,
		200201,
		200202,
		200203
	}
}
