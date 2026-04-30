pg = pg or {}
pg.island_shop_normal_template = rawget(pg, "island_shop_normal_template") or setmetatable({
	__name = "island_shop_normal_template"
}, confNEO)
pg.island_shop_normal_template.all = {
	10012,
	10013,
	10014,
	10015,
	10016,
	10017,
	10021,
	10111,
	10112,
	10113,
	10132,
	50131,
	50132,
	50133,
	50123,
	10024,
	10027,
	10030,
	10033,
	10034,
	10035,
	10037
}
pg.base = pg.base or {}
pg.base.island_shop_normal_template = {}

;(function()
	pg.base.island_shop_normal_template[10012] = {
		refresh_player = "",
		id = 10012,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "stop"
	}
	pg.base.island_shop_normal_template[10013] = {
		refresh_player = "",
		id = 10013,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "stop"
	}
	pg.base.island_shop_normal_template[10014] = {
		refresh_player = "",
		id = 10014,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "stop"
	}
	pg.base.island_shop_normal_template[10015] = {
		refresh_player = "",
		id = 10015,
		refresh_free = 0,
		refresh_set = 0,
		refresh_time = 0,
		unlock = "",
		exist_time = {
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					1
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_normal_template[10016] = {
		refresh_player = "",
		id = 10016,
		refresh_free = 0,
		refresh_set = 0,
		refresh_time = 0,
		unlock = "",
		exist_time = {
			{
				{
					2026,
					3,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_normal_template[10017] = {
		refresh_player = "",
		id = 10017,
		refresh_free = 0,
		refresh_set = 0,
		refresh_time = 0,
		unlock = "",
		exist_time = {
			{
				{
					2026,
					4,
					9
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					7
				},
				{
					12,
					0,
					0
				}
			}
		}
	}
	pg.base.island_shop_normal_template[10021] = {
		refresh_player = "",
		id = 10021,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10111] = {
		refresh_player = "",
		id = 10111,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10112] = {
		refresh_player = "",
		id = 10112,
		refresh_free = 0,
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always",
		unlock = {
			404
		}
	}
	pg.base.island_shop_normal_template[10113] = {
		refresh_player = "",
		id = 10113,
		refresh_free = 0,
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always",
		unlock = {
			405
		}
	}
	pg.base.island_shop_normal_template[10132] = {
		refresh_player = "",
		id = 10132,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[50131] = {
		refresh_player = "",
		id = 50131,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[50132] = {
		refresh_player = "",
		id = 50132,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[50133] = {
		refresh_player = "",
		id = 50133,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[50123] = {
		refresh_player = "",
		id = 50123,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10024] = {
		refresh_player = "",
		id = 10024,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10027] = {
		refresh_player = "",
		id = 10027,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10030] = {
		refresh_player = "",
		id = 10030,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10033] = {
		refresh_player = "",
		id = 10033,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10034] = {
		refresh_player = "",
		id = 10034,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10035] = {
		refresh_player = "",
		id = 10035,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
	pg.base.island_shop_normal_template[10037] = {
		refresh_player = "",
		id = 10037,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	}
end)()
