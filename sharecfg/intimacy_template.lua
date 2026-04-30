pg = pg or {}
pg.intimacy_template = rawget(pg, "intimacy_template") or setmetatable({
	__name = "intimacy_template"
}, confNEO)
pg.intimacy_template.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7
}
pg.base = pg.base or {}
pg.base.intimacy_template = {}

;(function()
	pg.base.intimacy_template[1] = {
		upper_bound = 3099,
		name = "失望",
		lower_bound = 0,
		icon = "intimacy_1",
		id = 1,
		attr_bonus = 0,
		desc = "intimacy_desc_1"
	}
	pg.base.intimacy_template[2] = {
		upper_bound = 6099,
		name = "陌生",
		lower_bound = 3100,
		icon = "intimacy_2",
		id = 2,
		attr_bonus = 0,
		desc = "intimacy_desc_2"
	}
	pg.base.intimacy_template[3] = {
		upper_bound = 8099,
		name = "友好",
		lower_bound = 6100,
		icon = "intimacy_3",
		id = 3,
		attr_bonus = 100,
		desc = "intimacy_desc_3"
	}
	pg.base.intimacy_template[4] = {
		upper_bound = 9999,
		name = "喜欢",
		lower_bound = 8100,
		icon = "intimacy_4",
		id = 4,
		attr_bonus = 300,
		desc = "intimacy_desc_4"
	}
	pg.base.intimacy_template[5] = {
		upper_bound = 10000,
		name = "爱",
		lower_bound = 10000,
		icon = "intimacy_5",
		id = 5,
		attr_bonus = 600,
		desc = "intimacy_desc_5"
	}
	pg.base.intimacy_template[6] = {
		upper_bound = 19999,
		name = "婚",
		lower_bound = 10001,
		icon = "Intimacy_6",
		id = 6,
		attr_bonus = 900,
		desc = "intimacy_desc_6"
	}
	pg.base.intimacy_template[7] = {
		upper_bound = 20000,
		name = "婚",
		lower_bound = 20000,
		icon = "Intimacy_6",
		id = 7,
		attr_bonus = 1200,
		desc = "intimacy_desc_7"
	}
end)()
