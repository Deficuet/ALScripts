pg = pg or {}
pg.world_carry_item = rawget(pg, "world_carry_item") or setmetatable({
	__name = "world_carry_item"
}, confNEO)
pg.world_carry_item.all = {
	1001,
	1002,
	1003,
	54101,
	60101,
	62001,
	62002,
	62003,
	63001,
	63002,
	76001,
	50101
}
pg.base = pg.base or {}
pg.base.world_carry_item = {}

;(function()
	pg.base.world_carry_item[1001] = {
		out_story = "W1012",
		enemyicon = 0,
		id = 1001,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[1002] = {
		out_story = "",
		enemyicon = 0,
		id = 1002,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[1003] = {
		out_story = "W1011",
		enemyicon = 0,
		id = 1003,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[54101] = {
		out_story = "",
		enemyicon = 0,
		id = 54101,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[60101] = {
		out_story = "",
		enemyicon = 0,
		id = 60101,
		icon = "jinshuban",
		scale = 50
	}
	pg.base.world_carry_item[62001] = {
		out_story = "",
		enemyicon = 0,
		id = 62001,
		icon = "jinshuban",
		scale = 50
	}
	pg.base.world_carry_item[62002] = {
		out_story = "",
		enemyicon = 0,
		id = 62002,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[62003] = {
		out_story = "",
		enemyicon = 0,
		id = 62003,
		icon = "jinshuban",
		scale = 90
	}
	pg.base.world_carry_item[63001] = {
		out_story = "",
		enemyicon = 0,
		id = 63001,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[63002] = {
		out_story = "",
		enemyicon = 0,
		id = 63002,
		icon = "jinshuban",
		scale = 100
	}
	pg.base.world_carry_item[76001] = {
		out_story = "W1011",
		enemyicon = 0,
		id = 76001,
		icon = "jinshuban",
		scale = 70
	}
	pg.base.world_carry_item[50101] = {
		out_story = "",
		enemyicon = 0,
		id = 50101,
		icon = "qiang1",
		scale = 40
	}
end)()
