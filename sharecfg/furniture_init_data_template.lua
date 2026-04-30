pg = pg or {}
pg.furniture_init_data_template = rawget(pg, "furniture_init_data_template") or setmetatable({
	__name = "furniture_init_data_template"
}, confNEO)
pg.furniture_init_data_template.all = {
	1002,
	1001,
	1111,
	1104,
	1301,
	1306,
	1107,
	1102,
	1103,
	1304,
	1302,
	1105,
	1106,
	1112
}
pg.base = pg.base or {}
pg.base.furniture_init_data_template = {}

;(function()
	pg.base.furniture_init_data_template[1002] = {
		dir = 1,
		parent = 0,
		y = 0,
		id = 1002,
		x = 0,
		child = {}
	}
	pg.base.furniture_init_data_template[1001] = {
		dir = 1,
		parent = 0,
		y = 0,
		id = 1001,
		x = 0,
		child = {}
	}
	pg.base.furniture_init_data_template[1111] = {
		dir = 2,
		parent = 0,
		y = 22,
		id = 1111,
		x = 22,
		child = {}
	}
	pg.base.furniture_init_data_template[1104] = {
		dir = 1,
		parent = 0,
		y = 12,
		id = 1104,
		x = 16,
		child = {}
	}
	pg.base.furniture_init_data_template[1301] = {
		dir = 1,
		parent = 0,
		y = 24,
		id = 1301,
		x = 20,
		child = {}
	}
	pg.base.furniture_init_data_template[1306] = {
		dir = 1,
		parent = 0,
		y = 24,
		id = 1306,
		x = 16,
		child = {}
	}
	pg.base.furniture_init_data_template[1107] = {
		dir = 1,
		parent = 0,
		y = 20,
		id = 1107,
		x = 23,
		child = {}
	}
	pg.base.furniture_init_data_template[1102] = {
		dir = 1,
		parent = 0,
		y = 12,
		id = 1102,
		x = 17,
		child = {}
	}
	pg.base.furniture_init_data_template[1103] = {
		dir = 1,
		parent = 0,
		y = 12,
		id = 1103,
		x = 12,
		child = {}
	}
	pg.base.furniture_init_data_template[1304] = {
		dir = 1,
		parent = 0,
		y = 20,
		id = 1304,
		x = 24,
		child = {}
	}
	pg.base.furniture_init_data_template[1302] = {
		dir = 1,
		parent = 0,
		y = 12,
		id = 1302,
		x = 24,
		child = {}
	}
	pg.base.furniture_init_data_template[1105] = {
		dir = 1,
		parent = 0,
		y = 15,
		id = 1105,
		x = 22,
		child = {}
	}
	pg.base.furniture_init_data_template[1106] = {
		dir = 1,
		parent = 0,
		y = 23,
		id = 1106,
		x = 12,
		child = {}
	}
	pg.base.furniture_init_data_template[1112] = {
		dir = 1,
		parent = 0,
		y = 13,
		id = 1112,
		x = 22,
		child = {}
	}
end)()
