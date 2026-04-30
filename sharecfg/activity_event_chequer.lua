pg = pg or {}
pg.activity_event_chequer = rawget(pg, "activity_event_chequer") or setmetatable({
	__name = "activity_event_chequer"
}, confNEO)
pg.activity_event_chequer.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7
}
pg.base = pg.base or {}
pg.base.activity_event_chequer = {}

;(function()
	pg.base.activity_event_chequer[1] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 1,
		difficult = 1,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450001,
			1450002
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[2] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 2,
		difficult = 1,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450003,
			1450004
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[3] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 3,
		difficult = 1,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450005,
			1450006
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[4] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 4,
		difficult = 2,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450007,
			1450008
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[5] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 5,
		difficult = 2,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450009,
			1450010
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[6] = {
		chequer_normal = 24,
		drop_normal = 93803,
		chequer_boss = 2,
		drop_boss = 93805,
		id = 6,
		difficult = 3,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450011,
			1450012
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
	pg.base.activity_event_chequer[7] = {
		chequer_normal = 23,
		drop_normal = 93803,
		chequer_boss = 3,
		drop_boss = 93805,
		id = 7,
		difficult = 3,
		chequer_box = 5,
		drop_box = 93804,
		list_boss = {
			1450013,
			1450014,
			1450015
		},
		chequer_map = {
			5,
			7
		},
		empty_grid = {
			{
				5,
				1
			},
			{
				5,
				3
			},
			{
				5,
				5
			},
			{
				5,
				7
			}
		}
	}
end)()
