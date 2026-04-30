pg = pg or {}
pg.island_fish = rawget(pg, "island_fish") or setmetatable({
	__name = "island_fish"
}, confNEO)
pg.island_fish.all = {
	5001,
	5002,
	5003,
	5004,
	5005,
	5006,
	5007,
	5008,
	5101,
	5102,
	5103,
	5104,
	5105,
	5106,
	5107,
	5108
}
pg.base = pg.base or {}
pg.base.island_fish = {}

;(function()
	pg.base.island_fish[5001] = {
		item_id = 5001,
		name = "贝壳",
		unit_id = 302500,
		qte_effect = "fish_1",
		id = 5001,
		rarity = 1,
		hard = 1,
		bite_time = {
			2,
			4
		}
	}
	pg.base.island_fish[5002] = {
		item_id = 5002,
		name = "鲶鱼",
		unit_id = 303300,
		qte_effect = "fish_1",
		id = 5002,
		rarity = 1,
		hard = 1,
		bite_time = {
			2,
			4
		}
	}
	pg.base.island_fish[5003] = {
		item_id = 5003,
		name = "鲤鱼",
		unit_id = 302400,
		qte_effect = "fish_2",
		id = 5003,
		rarity = 2,
		hard = 2,
		bite_time = {
			3,
			5
		}
	}
	pg.base.island_fish[5004] = {
		item_id = 5004,
		name = "鲫鱼",
		unit_id = 303400,
		qte_effect = "fish_2",
		id = 5004,
		rarity = 2,
		hard = 2,
		bite_time = {
			3,
			5
		}
	}
	pg.base.island_fish[5005] = {
		item_id = 5005,
		name = "小河虾",
		unit_id = 302300,
		qte_effect = "fish_3",
		id = 5005,
		rarity = 3,
		hard = 5,
		bite_time = {
			4,
			7
		}
	}
	pg.base.island_fish[5006] = {
		item_id = 5006,
		name = "小龙虾",
		unit_id = 302600,
		qte_effect = "fish_3",
		id = 5006,
		rarity = 3,
		hard = 5,
		bite_time = {
			4,
			7
		}
	}
	pg.base.island_fish[5007] = {
		item_id = 5007,
		name = "鲈鱼",
		unit_id = 303800,
		qte_effect = "fish_4",
		id = 5007,
		rarity = 3,
		hard = 8,
		bite_time = {
			5,
			8
		}
	}
	pg.base.island_fish[5008] = {
		item_id = 5008,
		name = "螃蟹",
		unit_id = 303100,
		qte_effect = "fish_4",
		id = 5008,
		rarity = 4,
		hard = 8,
		bite_time = {
			5,
			8
		}
	}
	pg.base.island_fish[5101] = {
		item_id = 5101,
		name = "鱿鱼",
		unit_id = 302900,
		qte_effect = "fish_2",
		id = 5101,
		rarity = 1,
		hard = 2,
		bite_time = {
			3,
			5
		}
	}
	pg.base.island_fish[5102] = {
		item_id = 5102,
		name = "马鲛鱼",
		unit_id = 303500,
		qte_effect = "fish_2",
		id = 5102,
		rarity = 2,
		hard = 2,
		bite_time = {
			3,
			5
		}
	}
	pg.base.island_fish[5103] = {
		item_id = 5103,
		name = "金枪鱼",
		unit_id = 303000,
		qte_effect = "fish_2",
		id = 5103,
		rarity = 3,
		hard = 2,
		bite_time = {
			3,
			5
		}
	}
	pg.base.island_fish[5104] = {
		item_id = 5104,
		name = "三文鱼",
		unit_id = 302700,
		qte_effect = "fish_3",
		id = 5104,
		rarity = 3,
		hard = 5,
		bite_time = {
			4,
			7
		}
	}
	pg.base.island_fish[5105] = {
		item_id = 5105,
		name = "红鲷鱼",
		unit_id = 303600,
		qte_effect = "fish_3",
		id = 5105,
		rarity = 1,
		hard = 5,
		bite_time = {
			4,
			7
		}
	}
	pg.base.island_fish[5106] = {
		item_id = 5106,
		name = "黑鲷鱼",
		unit_id = 303900,
		qte_effect = "fish_4",
		id = 5106,
		rarity = 2,
		hard = 8,
		bite_time = {
			5,
			8
		}
	}
	pg.base.island_fish[5107] = {
		item_id = 5107,
		name = "黄鳍金枪鱼",
		unit_id = 303700,
		qte_effect = "fish_4",
		id = 5107,
		rarity = 4,
		hard = 8,
		bite_time = {
			5,
			8
		}
	}
	pg.base.island_fish[5108] = {
		item_id = 5108,
		name = "海参",
		unit_id = 302800,
		qte_effect = "fish_4",
		id = 5108,
		rarity = 4,
		hard = 8,
		bite_time = {
			5,
			8
		}
	}
end)()
