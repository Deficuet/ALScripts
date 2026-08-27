pg = pg or {}
pg.class_upgrade_template = rawget(pg, "class_upgrade_template") or setmetatable({
	__name = "class_upgrade_template"
}, confNEO)
pg.class_upgrade_template.all = {
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
	15
}
pg.base = pg.base or {}
pg.base.class_upgrade_template = {}

;(function()
	pg.base.class_upgrade_template[1] = {
		store = 100000,
		time = 900,
		proficency_cost_per_min = 55,
		user_level = 55,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 35,
		proficency_get_percent = 10,
		level = 1,
		use = {
			1,
			6000
		}
	}
	pg.base.class_upgrade_template[2] = {
		store = 110000,
		time = 3600,
		proficency_cost_per_min = 60,
		user_level = 60,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 38,
		proficency_get_percent = 11,
		level = 2,
		use = {
			1,
			8000
		}
	}
	pg.base.class_upgrade_template[3] = {
		store = 120000,
		time = 7200,
		proficency_cost_per_min = 65,
		user_level = 65,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 41,
		proficency_get_percent = 12,
		level = 3,
		use = {
			1,
			10000
		}
	}
	pg.base.class_upgrade_template[4] = {
		store = 130000,
		time = 14400,
		proficency_cost_per_min = 70,
		user_level = 70,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 44,
		proficency_get_percent = 13,
		level = 4,
		use = {
			1,
			12000
		}
	}
	pg.base.class_upgrade_template[5] = {
		store = 140000,
		time = 28800,
		proficency_cost_per_min = 75,
		user_level = 75,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 47,
		proficency_get_percent = 14,
		level = 5,
		use = {
			1,
			15000
		}
	}
	pg.base.class_upgrade_template[6] = {
		store = 150000,
		time = 43200,
		proficency_cost_per_min = 80,
		user_level = 80,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 49,
		proficency_get_percent = 15,
		level = 6,
		use = {
			1,
			18000
		}
	}
	pg.base.class_upgrade_template[7] = {
		store = 160000,
		time = 64800,
		proficency_cost_per_min = 85,
		user_level = 85,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 51,
		proficency_get_percent = 16,
		level = 7,
		use = {
			1,
			21000
		}
	}
	pg.base.class_upgrade_template[8] = {
		store = 170000,
		time = 86400,
		proficency_cost_per_min = 90,
		user_level = 90,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 54,
		proficency_get_percent = 17,
		level = 8,
		use = {
			1,
			25000
		}
	}
	pg.base.class_upgrade_template[9] = {
		store = 180000,
		time = 172800,
		proficency_cost_per_min = 95,
		user_level = 95,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 57,
		proficency_get_percent = 18,
		level = 9,
		use = {
			1,
			30000
		}
	}
	pg.base.class_upgrade_template[10] = {
		store = 200000,
		time = 7200,
		proficency_cost_per_min = 100,
		user_level = 100,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 60,
		proficency_get_percent = 20,
		level = 10,
		use = {
			1,
			17500
		}
	}
	pg.base.class_upgrade_template[11] = {
		store = 210000,
		time = 7200,
		proficency_cost_per_min = 105,
		user_level = 105,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 63,
		proficency_get_percent = 21,
		level = 11,
		use = {
			1,
			20000
		}
	}
	pg.base.class_upgrade_template[12] = {
		store = 220000,
		time = 7200,
		proficency_cost_per_min = 110,
		user_level = 110,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 66,
		proficency_get_percent = 22,
		level = 12,
		use = {
			1,
			22500
		}
	}
	pg.base.class_upgrade_template[13] = {
		store = 230000,
		time = 7200,
		proficency_cost_per_min = 115,
		user_level = 115,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 69,
		proficency_get_percent = 23,
		level = 13,
		use = {
			1,
			25000
		}
	}
	pg.base.class_upgrade_template[14] = {
		store = 240000,
		time = 7200,
		proficency_cost_per_min = 120,
		user_level = 120,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 72,
		proficency_get_percent = 24,
		level = 14,
		use = {
			1,
			27500
		}
	}
	pg.base.class_upgrade_template[15] = {
		store = 250000,
		time = 0,
		proficency_cost_per_min = 125,
		user_level = 125,
		proficency_to_exp_rant = 100,
		item_id = 16501,
		stock = 75,
		proficency_get_percent = 25,
		level = 15,
		use = {
			1,
			30000
		}
	}
end)()
