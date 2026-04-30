pg = pg or {}
pg.navalacademy_data_template = rawget(pg, "navalacademy_data_template") or setmetatable({
	__name = "navalacademy_data_template"
}, confNEO)
pg.navalacademy_data_template.all = {
	1,
	2,
	3,
	4,
	5,
	6
}
pg.base = pg.base or {}
pg.base.navalacademy_data_template = {}

;(function()
	pg.base.navalacademy_data_template[1] = {
		name = "大讲堂",
		slot = 0,
		painting = 0,
		information = "",
		id = 1,
		schedule = {}
	}
	pg.base.navalacademy_data_template[2] = {
		name = "体育馆",
		slot = 0,
		painting = 0,
		information = "",
		id = 2,
		schedule = {}
	}
	pg.base.navalacademy_data_template[3] = {
		name = "小卖部",
		slot = 0,
		painting = 0,
		information = "",
		id = 3,
		schedule = {}
	}
	pg.base.navalacademy_data_template[4] = {
		name = "海军食堂",
		slot = 0,
		painting = 0,
		information = "",
		id = 4,
		schedule = {}
	}
	pg.base.navalacademy_data_template[5] = {
		name = "补给商店",
		slot = 0,
		painting = 0,
		information = "",
		id = 5,
		schedule = {}
	}
	pg.base.navalacademy_data_template[6] = {
		name = "战术学院",
		slot = 0,
		painting = 0,
		information = "",
		id = 6,
		schedule = {}
	}
end)()
