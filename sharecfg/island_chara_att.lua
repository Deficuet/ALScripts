pg = pg or {}
pg.island_chara_att = rawget(pg, "island_chara_att") or setmetatable({
	__name = "island_chara_att"
}, confNEO)
pg.island_chara_att.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8
}
pg.base = pg.base or {}
pg.base.island_chara_att = {}

;(function()
	pg.base.island_chara_att[1] = {
		name = "SSS",
		effect = 25,
		id = 1,
		gather_effect = 7,
		manage_effect = 10000,
		range = {
			500,
			999
		}
	}
	pg.base.island_chara_att[2] = {
		name = "SS",
		effect = 23,
		id = 2,
		gather_effect = 6,
		manage_effect = 8400,
		range = {
			320,
			499
		}
	}
	pg.base.island_chara_att[3] = {
		name = "S",
		effect = 20,
		id = 3,
		gather_effect = 5,
		manage_effect = 7200,
		range = {
			200,
			319
		}
	}
	pg.base.island_chara_att[4] = {
		name = "A",
		effect = 15,
		id = 4,
		gather_effect = 4,
		manage_effect = 5600,
		range = {
			120,
			199
		}
	}
	pg.base.island_chara_att[5] = {
		name = "B",
		effect = 10,
		id = 5,
		gather_effect = 3,
		manage_effect = 4200,
		range = {
			80,
			119
		}
	}
	pg.base.island_chara_att[6] = {
		name = "C",
		effect = 5,
		id = 6,
		gather_effect = 2,
		manage_effect = 3000,
		range = {
			50,
			79
		}
	}
	pg.base.island_chara_att[7] = {
		name = "D",
		effect = 2,
		id = 7,
		gather_effect = 1,
		manage_effect = 1600,
		range = {
			25,
			49
		}
	}
	pg.base.island_chara_att[8] = {
		name = "E",
		effect = 0,
		id = 8,
		gather_effect = 0,
		manage_effect = 500,
		range = {
			0,
			24
		}
	}
end)()
