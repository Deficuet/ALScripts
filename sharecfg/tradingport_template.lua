pg = pg or {}
pg.tradingport_template = rawget(pg, "tradingport_template") or setmetatable({
	__name = "tradingport_template"
}, confNEO)
pg.tradingport_template.all = {
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
pg.base.tradingport_template = {}

;(function()
	pg.base.tradingport_template[1] = {
		store = 900,
		production = 60,
		time = 10,
		user_level = 1,
		level = 1,
		hour_time = 3,
		use = {
			1,
			60
		}
	}
	pg.base.tradingport_template[2] = {
		store = 1800,
		production = 64,
		time = 900,
		user_level = 10,
		level = 2,
		hour_time = 3,
		use = {
			1,
			300
		}
	}
	pg.base.tradingport_template[3] = {
		store = 2800,
		production = 68,
		time = 3600,
		user_level = 20,
		level = 3,
		hour_time = 3,
		use = {
			1,
			600
		}
	}
	pg.base.tradingport_template[4] = {
		store = 3800,
		production = 72,
		time = 7200,
		user_level = 30,
		level = 4,
		hour_time = 3,
		use = {
			1,
			1500
		}
	}
	pg.base.tradingport_template[5] = {
		store = 4800,
		production = 76,
		time = 14400,
		user_level = 40,
		level = 5,
		hour_time = 3,
		use = {
			1,
			3000
		}
	}
	pg.base.tradingport_template[6] = {
		store = 5800,
		production = 80,
		time = 28800,
		user_level = 50,
		level = 6,
		hour_time = 3,
		use = {
			1,
			4500
		}
	}
	pg.base.tradingport_template[7] = {
		store = 6800,
		production = 84,
		time = 43200,
		user_level = 60,
		level = 7,
		hour_time = 3,
		use = {
			1,
			6000
		}
	}
	pg.base.tradingport_template[8] = {
		store = 7900,
		production = 88,
		time = 64800,
		user_level = 70,
		level = 8,
		hour_time = 3,
		use = {
			1,
			7500
		}
	}
	pg.base.tradingport_template[9] = {
		store = 8900,
		production = 92,
		time = 86400,
		user_level = 80,
		level = 9,
		hour_time = 3,
		use = {
			1,
			15000
		}
	}
	pg.base.tradingport_template[10] = {
		store = 10000,
		production = 100,
		time = 7200,
		user_level = 90,
		level = 10,
		hour_time = 3,
		use = {
			1,
			9000
		}
	}
	pg.base.tradingport_template[11] = {
		store = 11000,
		production = 104,
		time = 7200,
		user_level = 100,
		level = 11,
		hour_time = 3,
		use = {
			1,
			10500
		}
	}
	pg.base.tradingport_template[12] = {
		store = 12000,
		production = 108,
		time = 0,
		user_level = 110,
		level = 12,
		hour_time = 3,
		use = {
			1,
			12000
		}
	}
end)()
