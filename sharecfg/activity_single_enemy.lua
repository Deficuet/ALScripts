pg = pg or {}
pg.activity_single_enemy = rawget(pg, "activity_single_enemy") or setmetatable({
	__name = "activity_single_enemy"
}, confNEO)
pg.activity_single_enemy.all = {
	1001,
	1002,
	1003,
	1004,
	1005,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006,
	2007,
	2008,
	2009,
	2010,
	2011,
	2012,
	2013,
	3001,
	3002,
	3003,
	1000001,
	1000002,
	1000003,
	1000004,
	1000005
}
pg.base = pg.base or {}
pg.base.activity_single_enemy = {}

;(function()
	pg.base.activity_single_enemy[1001] = {
		expedition_id = 0,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1001,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1002] = {
		expedition_id = 0,
		pre_chapter = 1001,
		count = 0,
		type = 2,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1002,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1003] = {
		expedition_id = 0,
		pre_chapter = 1002,
		count = 0,
		type = 3,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1003,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1004] = {
		expedition_id = 0,
		pre_chapter = 1003,
		count = 1,
		type = 4,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1004,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {
			{
				"level",
				1,
				110
			}
		}
	}
	pg.base.activity_single_enemy[1005] = {
		expedition_id = 0,
		pre_chapter = 1003,
		count = 0,
		type = 5,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 1,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1005,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			40,
			16
		},
		limitation = {},
		property_limitation = {
			{
				"level",
				1,
				105
			}
		}
	}
	pg.base.activity_single_enemy[2001] = {
		expedition_id = 1901001,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "T1 住院大楼",
		enter_cost_drop = 0,
		strategy_num = 2,
		icon = "clue_5",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2001,
		activity_type = 2,
		level = "LV.20",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905364
			},
			{
				2,
				905365
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201304,
			201309,
			201310,
			201311
		}
	}
	pg.base.activity_single_enemy[2002] = {
		expedition_id = 1901002,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "T2 疗养中心",
		enter_cost_drop = 0,
		strategy_num = 2,
		icon = "clue_2",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2002,
		activity_type = 2,
		level = "LV.20",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905364
			},
			{
				2,
				905365
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201305,
			201309,
			201312
		}
	}
	pg.base.activity_single_enemy[2003] = {
		expedition_id = 1901003,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "T3 后勤中心",
		enter_cost_drop = 0,
		strategy_num = 2,
		icon = "clue_1",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2003,
		activity_type = 2,
		level = "LV.20",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905364
			},
			{
				2,
				905365
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201306,
			201309,
			201313
		}
	}
	pg.base.activity_single_enemy[2004] = {
		expedition_id = 1901004,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "T4 研究中心",
		enter_cost_drop = 0,
		strategy_num = 2,
		icon = "clue_3",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2004,
		activity_type = 2,
		level = "LV.20",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905364
			},
			{
				2,
				905365
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201307,
			201314,
			201315,
			201316,
			201317,
			201318
		}
	}
	pg.base.activity_single_enemy[2005] = {
		expedition_id = 1902001,
		pre_chapter = 0,
		count = 0,
		type = 2,
		name = "T1 住院大楼",
		enter_cost_drop = 0,
		strategy_num = 3,
		icon = "clue_5",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2005,
		activity_type = 2,
		level = "LV.50",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905367
			},
			{
				2,
				905368
			},
			{
				3,
				905369
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201304,
			201309,
			201310,
			201311
		}
	}
	pg.base.activity_single_enemy[2006] = {
		expedition_id = 1902002,
		pre_chapter = 0,
		count = 0,
		type = 2,
		name = "T2 疗养中心",
		enter_cost_drop = 0,
		strategy_num = 3,
		icon = "clue_2",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2006,
		activity_type = 2,
		level = "LV.50",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905367
			},
			{
				2,
				905368
			},
			{
				3,
				905369
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201305,
			201309,
			201312
		}
	}
	pg.base.activity_single_enemy[2007] = {
		expedition_id = 1902003,
		pre_chapter = 0,
		count = 0,
		type = 2,
		name = "T3 后勤中心",
		enter_cost_drop = 0,
		strategy_num = 3,
		icon = "clue_1",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2007,
		activity_type = 2,
		level = "LV.50",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905367
			},
			{
				2,
				905368
			},
			{
				3,
				905369
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201306,
			201309,
			201313
		}
	}
	pg.base.activity_single_enemy[2008] = {
		expedition_id = 1902004,
		pre_chapter = 0,
		count = 0,
		type = 2,
		name = "T4 研究中心",
		enter_cost_drop = 0,
		strategy_num = 3,
		icon = "clue_3",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2008,
		activity_type = 2,
		level = "LV.50",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905367
			},
			{
				2,
				905368
			},
			{
				3,
				905369
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201307,
			201314,
			201315,
			201316,
			201317,
			201318
		}
	}
	pg.base.activity_single_enemy[2009] = {
		expedition_id = 1903001,
		pre_chapter = 0,
		count = 0,
		type = 3,
		name = "T1 住院大楼",
		enter_cost_drop = 0,
		strategy_num = 4,
		icon = "clue_5",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2009,
		activity_type = 2,
		level = "LV.90",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905371
			},
			{
				2,
				905372
			},
			{
				3,
				905373
			},
			{
				4,
				905374
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201304,
			201309,
			201310,
			201311
		}
	}
	pg.base.activity_single_enemy[2010] = {
		expedition_id = 1903002,
		pre_chapter = 0,
		count = 0,
		type = 3,
		name = "T2 疗养中心",
		enter_cost_drop = 0,
		strategy_num = 4,
		icon = "clue_2",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2010,
		activity_type = 2,
		level = "LV.90",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905371
			},
			{
				2,
				905372
			},
			{
				3,
				905373
			},
			{
				4,
				905374
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201305,
			201309,
			201312
		}
	}
	pg.base.activity_single_enemy[2011] = {
		expedition_id = 1903003,
		pre_chapter = 0,
		count = 0,
		type = 3,
		name = "T3 后勤中心",
		enter_cost_drop = 0,
		strategy_num = 4,
		icon = "clue_1",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2011,
		activity_type = 2,
		level = "LV.90",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905371
			},
			{
				2,
				905372
			},
			{
				3,
				905373
			},
			{
				4,
				905374
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201306,
			201309,
			201313
		}
	}
	pg.base.activity_single_enemy[2012] = {
		expedition_id = 1903004,
		pre_chapter = 0,
		count = 0,
		type = 3,
		name = "T4 研究中心",
		enter_cost_drop = 0,
		strategy_num = 4,
		icon = "clue_3",
		guardian_limit = 0,
		time = "always",
		enter_cost = 0,
		id = 2012,
		activity_type = 2,
		level = "LV.90",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905371
			},
			{
				2,
				905372
			},
			{
				3,
				905373
			},
			{
				4,
				905374
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201307,
			201314,
			201315,
			201316,
			201317,
			201318
		}
	}
	pg.base.activity_single_enemy[2013] = {
		expedition_id = 1904001,
		pre_chapter = 0,
		count = 0,
		type = 4,
		name = "ESP 诊疗中心",
		enter_cost_drop = 905380,
		strategy_num = 4,
		icon = "clue_4",
		guardian_limit = 0,
		time = "always",
		enter_cost = 65561,
		id = 2013,
		activity_type = 2,
		level = "LV.110",
		use_oil_limit = {
			40,
			16
		},
		limitation = {},
		property_limitation = {},
		extra_drop = {
			{
				1,
				905376
			},
			{
				2,
				905377
			},
			{
				3,
				905378
			},
			{
				4,
				905379
			}
		},
		strategy_id = {
			201301,
			201302,
			201303,
			201308,
			201309,
			201319,
			201320
		}
	}
	pg.base.activity_single_enemy[3001] = {
		expedition_id = 1929001,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "ABRS-1",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "30",
		time = "always",
		enter_cost = 0,
		id = 3001,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[3002] = {
		expedition_id = 1929002,
		pre_chapter = 3001,
		count = 0,
		type = 1,
		name = "ABRS-2",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "60",
		time = "always",
		enter_cost = 0,
		id = 3002,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[3003] = {
		expedition_id = 1929003,
		pre_chapter = 3002,
		count = 0,
		type = 1,
		name = "ABRS-3",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "90",
		time = "always",
		enter_cost = 0,
		id = 3003,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1000001] = {
		expedition_id = 1799001,
		pre_chapter = 0,
		count = 0,
		type = 1,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1000001,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1000002] = {
		expedition_id = 1799002,
		pre_chapter = 1000001,
		count = 0,
		type = 2,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1000002,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1000003] = {
		expedition_id = 1799003,
		pre_chapter = 1000002,
		count = 0,
		type = 3,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1000003,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			25,
			15
		},
		limitation = {},
		property_limitation = {}
	}
	pg.base.activity_single_enemy[1000004] = {
		expedition_id = 1799004,
		pre_chapter = 1000003,
		count = 1,
		type = 4,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 0,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1000004,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			0,
			0
		},
		limitation = {},
		property_limitation = {
			{
				"level",
				1,
				110
			}
		}
	}
	pg.base.activity_single_enemy[1000005] = {
		expedition_id = 1799005,
		pre_chapter = 1000003,
		count = 0,
		type = 5,
		name = "",
		enter_cost_drop = 0,
		strategy_num = 0,
		icon = "",
		guardian_limit = 1,
		level = "",
		time = "stop",
		enter_cost = 0,
		id = 1000005,
		activity_type = 1,
		extra_drop = "",
		strategy_id = "",
		use_oil_limit = {
			40,
			16
		},
		limitation = {},
		property_limitation = {
			{
				"level",
				1,
				105
			}
		}
	}
end)()
