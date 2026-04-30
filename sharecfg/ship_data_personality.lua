pg = pg or {}
pg.ship_data_personality = rawget(pg, "ship_data_personality") or setmetatable({
	__name = "ship_data_personality"
}, confNEO)
pg.ship_data_personality.all = {
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
	12
}
pg.base = pg.base or {}
pg.base.ship_data_personality = {}

;(function()
	pg.base.ship_data_personality[1] = {
		front_rate = 0.1,
		name = "冒失",
		rear_rate = 0.3,
		id = 1,
		lower_rate = 0.4,
		upper_rate = 0.6
	}
	pg.base.ship_data_personality[2] = {
		front_rate = 0.15,
		name = "元气",
		rear_rate = 0.3,
		id = 2,
		lower_rate = 0.3,
		upper_rate = 0.7
	}
	pg.base.ship_data_personality[3] = {
		front_rate = 0.05,
		name = "天然呆",
		rear_rate = 0.6,
		id = 3,
		lower_rate = 0.4,
		upper_rate = 0.6
	}
	pg.base.ship_data_personality[4] = {
		front_rate = 0.3,
		name = "傲娇",
		rear_rate = 0.7,
		id = 4,
		lower_rate = 0.1,
		upper_rate = 0.9
	}
	pg.base.ship_data_personality[5] = {
		front_rate = 0.1,
		name = "病娇",
		rear_rate = 0.3,
		id = 5,
		lower_rate = 0.2,
		upper_rate = 0.8
	}
	pg.base.ship_data_personality[6] = {
		front_rate = 0.55,
		name = "弱气",
		rear_rate = 0.8,
		id = 6,
		lower_rate = 0.2,
		upper_rate = 0.8
	}
	pg.base.ship_data_personality[7] = {
		front_rate = 0.7,
		name = "腹黑",
		rear_rate = 0.9,
		id = 7,
		lower_rate = 0.1,
		upper_rate = 0.9
	}
	pg.base.ship_data_personality[8] = {
		front_rate = 0.4,
		name = "傲慢",
		rear_rate = 0.8,
		id = 8,
		lower_rate = 0.3,
		upper_rate = 0.7
	}
	pg.base.ship_data_personality[9] = {
		front_rate = 0.35,
		name = "傲沉",
		rear_rate = 0.6,
		id = 9,
		lower_rate = 0.2,
		upper_rate = 0.8
	}
	pg.base.ship_data_personality[10] = {
		front_rate = 0.2,
		name = "无口",
		rear_rate = 0.45,
		id = 10,
		lower_rate = 0.4,
		upper_rate = 0.6
	}
	pg.base.ship_data_personality[11] = {
		front_rate = 0.25,
		name = "毒舌",
		rear_rate = 0.5,
		id = 11,
		lower_rate = 0.6,
		upper_rate = 0.9
	}
	pg.base.ship_data_personality[12] = {
		front_rate = 0.25,
		name = "糟糕",
		rear_rate = 0.5,
		id = 12,
		lower_rate = 0.1,
		upper_rate = 0.4
	}
end)()
