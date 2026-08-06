pg = pg or {}
pg.island_waypoint = rawget(pg, "island_waypoint") or setmetatable({
	__name = "island_waypoint"
}, confNEO)
pg.island_waypoint.all = {
	10050001,
	10050002,
	10050003,
	10050004,
	10050005,
	10050006,
	10050007,
	10050008,
	10050009,
	10050010,
	10050011,
	10050012,
	10050013,
	10050014,
	10050015,
	10050016,
	10050017,
	10050018,
	10040001,
	10040002,
	10040003,
	10040004,
	10040005,
	10040006,
	10040007,
	10040008,
	10040009,
	10040010,
	10040011,
	10040012,
	10040013,
	10040014,
	10040015,
	10040016,
	10040017,
	10040018,
	10040019,
	10040020,
	10040021,
	10040022,
	10040023,
	10040024,
	10040025,
	10010001,
	10010002,
	10010003,
	10010004,
	10010005,
	10010006,
	10010007,
	10010008,
	10010009,
	10010010,
	10010011,
	10010012,
	10010013,
	10010014,
	10010015,
	10010016,
	10010017,
	10010018,
	10010019,
	10010020,
	10010021,
	10010022,
	10010023,
	10010024,
	10010025,
	10010026,
	10010027,
	10020001,
	10020002,
	10020003,
	10020004,
	10020005,
	10020006,
	10020007,
	10020008,
	10020009,
	10020010,
	10020011,
	10020012,
	10020013,
	10020014,
	10020015,
	10020016,
	10020017,
	10020018,
	10020019,
	10020020,
	10020021,
	10020022,
	10020023,
	10020024,
	10020025,
	10020026,
	10020027,
	10020028,
	10020029,
	10020030,
	10020031,
	10020032,
	10020033,
	10020034,
	10020035,
	10020036,
	10020037,
	10020038,
	10020039,
	10020040,
	10020041,
	10020042,
	10020043,
	10020044,
	10020045,
	10020046,
	10020047,
	10020048,
	10020049,
	10020050,
	10020051,
	10020052,
	10020053,
	10020054,
	10020055,
	10020056,
	10020057,
	10020058,
	10020059,
	10020060,
	10020061,
	10020062
}
pg.island_waypoint.get_id_list_by_mapId = {
	[1001] = {
		10010001,
		10010002,
		10010003,
		10010004,
		10010005,
		10010006,
		10010007,
		10010008,
		10010009,
		10010010,
		10010011,
		10010012,
		10010013,
		10010014,
		10010015,
		10010016,
		10010017,
		10010018,
		10010019,
		10010020,
		10010021,
		10010022,
		10010023,
		10010024,
		10010025,
		10010026,
		10010027
	},
	[1002] = {
		10020001,
		10020002,
		10020003,
		10020004,
		10020005,
		10020006,
		10020007,
		10020008,
		10020009,
		10020010,
		10020011,
		10020012,
		10020013,
		10020014,
		10020015,
		10020016,
		10020017,
		10020018,
		10020019,
		10020020,
		10020021,
		10020022,
		10020023,
		10020024,
		10020025,
		10020026,
		10020027,
		10020028,
		10020029,
		10020030,
		10020031,
		10020032,
		10020033,
		10020034,
		10020035,
		10020036,
		10020037,
		10020038,
		10020039,
		10020040,
		10020041,
		10020042,
		10020043,
		10020044,
		10020045,
		10020046,
		10020047,
		10020048,
		10020049,
		10020050,
		10020051,
		10020052,
		10020053,
		10020054,
		10020055,
		10020056,
		10020057,
		10020058,
		10020059,
		10020060,
		10020061,
		10020062
	},
	[1004] = {
		10040001,
		10040002,
		10040003,
		10040004,
		10040005,
		10040006,
		10040007,
		10040008,
		10040009,
		10040010,
		10040011,
		10040012,
		10040013,
		10040014,
		10040015,
		10040016,
		10040017,
		10040018,
		10040019,
		10040020,
		10040021,
		10040022,
		10040023,
		10040024,
		10040025
	},
	[1005] = {
		10050001,
		10050002,
		10050003,
		10050004,
		10050005,
		10050006,
		10050007,
		10050008,
		10050009,
		10050010,
		10050011,
		10050012,
		10050013,
		10050014,
		10050015,
		10050016,
		10050017,
		10050018
	}
}
pg.base = pg.base or {}
pg.base.island_waypoint = {}

;(function()
	pg.base.island_waypoint[10050001] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1005,
		id = 10050001,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			73.56,
			2.331,
			119.19
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050002] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1005,
		id = 10050002,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			74.2,
			2.331,
			98.2
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050003] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1005,
		id = 10050003,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			91.44,
			2.331,
			88.41
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050004] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1005,
		id = 10050004,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			125.78,
			2.331,
			94.82
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050005] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1005,
		id = 10050005,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			79.88,
			2.331,
			95.92
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050006] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1005,
		id = 10050006,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			71.82,
			2.331,
			87.41
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050007] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1005,
		id = 10050007,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			86.92,
			2.331,
			78.17
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050008] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1005,
		id = 10050008,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			131.1,
			2.331,
			94.7
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050009] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1005,
		id = 10050009,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			103.5,
			2.331,
			95.4
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050010] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1005,
		id = 10050010,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			72.8,
			2.331,
			93.5
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050011] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1005,
		id = 10050011,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			104.6,
			2.347,
			124.41
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050012] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1005,
		id = 10050012,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			104.47,
			2.347,
			96.19
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050013] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1005,
		id = 10050013,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			130.8,
			2.347,
			95.79
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050014] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1005,
		id = 10050014,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			128.84,
			2.16,
			94.88
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050015] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1005,
		id = 10050015,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			73.33,
			2.16,
			95.65
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050016] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1005,
		id = 10050016,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			97.6,
			2.27,
			126.36
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050017] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1005,
		id = 10050017,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			118.76,
			2.27,
			95.38
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10050018] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1005,
		id = 10050018,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			76.13,
			2.27,
			95.98
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040001] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1004,
		id = 10040001,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			87.38,
			3.391,
			86.51
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040002] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1004,
		id = 10040002,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			66.81,
			2.978,
			87.66
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040003] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1004,
		id = 10040003,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			38.55,
			2.978,
			98.58
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040004] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1004,
		id = 10040004,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			45.96,
			2.827,
			138.13
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040005] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1004,
		id = 10040005,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			70.4,
			2.9,
			116.1
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040006] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1004,
		id = 10040006,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			84.58,
			2.813,
			104.7
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040007] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1004,
		id = 10040007,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			81.53,
			2.62,
			84.67
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040008] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1004,
		id = 10040008,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			46.46,
			2.93,
			78.68
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040009] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1004,
		id = 10040009,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			43.308,
			3.439,
			144.38
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040010] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1004,
		id = 10040010,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			40.49,
			2.419,
			99.75
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040011] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1004,
		id = 10040011,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			73.75,
			2.787,
			89.46
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040012] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1004,
		id = 10040012,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			63.4,
			3.596,
			146.9
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040013] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1004,
		id = 10040013,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			66.28,
			0,
			82.39
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040014] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1004,
		id = 10040014,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			41.7,
			3,
			113.1
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040015] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1004,
		id = 10040015,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			39.3,
			3,
			97.9
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040016] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1004,
		id = 10040016,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			75.71,
			3,
			87.95
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040017] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1004,
		id = 10040017,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			51.8,
			2.852,
			141.5
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040018] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1004,
		id = 10040018,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			80.58,
			2.852,
			91.34
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040019] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1004,
		id = 10040019,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			35.4,
			2.852,
			102.3
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040020] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1004,
		id = 10040020,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			72.55,
			2.55,
			109.26
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040021] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1004,
		id = 10040021,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			31.78,
			2.55,
			103.63
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040022] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1004,
		id = 10040022,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			67.09,
			2.55,
			84.37
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040023] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1004,
		id = 10040023,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			31.52,
			2.595,
			104.81
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040024] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1004,
		id = 10040024,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			65.9,
			2.595,
			119.8
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10040025] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1004,
		id = 10040025,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			85.9,
			2.595,
			77.2
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010001] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010001,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			69.3,
			12.602,
			57.66
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010002] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010002,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			75.85,
			12.616,
			70.64
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010003] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010003,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			77.15,
			12.677,
			94.04
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010004] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010004,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			95.53,
			12.594,
			102.97
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010005] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010005,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			119.64,
			12.59,
			103.81
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010006] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010006,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			78.78,
			12.59,
			106.04
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010007] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010007,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			71.69,
			12.59,
			114.59
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010008] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010008,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			76.61,
			12.59,
			93.95
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010009] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1001,
		id = 10010009,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			75.32,
			12.59,
			70.646
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010010] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1001,
		id = 10010010,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			118.64,
			12.607,
			104.28
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010011] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1001,
		id = 10010011,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			80.22,
			12.706,
			100.41
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010012] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1001,
		id = 10010012,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			68.14,
			12.706,
			70.71
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010013] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1001,
		id = 10010013,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			74.84,
			12.706,
			97.18
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010014] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1001,
		id = 10010014,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			109.56,
			12.7,
			79.49
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010015] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1001,
		id = 10010015,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			77.66,
			12.7,
			79.32
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010016] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1001,
		id = 10010016,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			67.77,
			12.7,
			55.14
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010017] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1001,
		id = 10010017,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			109.04,
			12.7,
			57.91
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010018] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1001,
		id = 10010018,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			114.64,
			12.7,
			104.4
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010019] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1001,
		id = 10010019,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			93.17,
			12.7,
			79.27
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010020] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1001,
		id = 10010020,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			74.61,
			12.7,
			102.66
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010021] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1001,
		id = 10010021,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			73.95,
			12.57,
			74.38
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010022] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1001,
		id = 10010022,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			114.57,
			12.57,
			102.44
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010023] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1001,
		id = 10010023,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			77.58,
			12.572,
			83.13
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010024] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1001,
		id = 10010024,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			109.84,
			12.572,
			90.53
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010025] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1001,
		id = 10010025,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			108.54,
			12.59,
			107.57
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010026] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1001,
		id = 10010026,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			75.876,
			12.564,
			79.224
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10010027] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1001,
		id = 10010027,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			106.53,
			12.59,
			78.74
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020001] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1002,
		id = 10020001,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-5.04,
			0,
			-3.2
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020002] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1002,
		id = 10020002,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-4.85,
			0,
			-20.7
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020003] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1002,
		id = 10020003,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			5.18,
			0,
			-20.81
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020004] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1002,
		id = 10020004,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-66.26,
			0,
			1.68
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020005] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1002,
		id = 10020005,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-26.17,
			0,
			1.469
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020006] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 1,
		disappear = 0,
		mapId = 1002,
		id = 10020006,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			40.68,
			0,
			0.66
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020007] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020007,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			56.29,
			-1.691,
			9.16
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020008] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020008,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			26.78,
			0.166,
			4.61
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020009] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020009,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			2.918,
			-1.7,
			5.281
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020010] = {
		turn_to = 0,
		process_time = 0,
		wait = 3,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020010,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-0.3,
			-1.7,
			11.64
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020011] = {
		turn_to = 0,
		process_time = 0,
		wait = 5,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020011,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-0.17,
			-1.7,
			92.22
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020012] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020012,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-5.76,
			-1.62,
			99.45
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020013] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 0,
		disappear = 0,
		mapId = 1002,
		id = 10020013,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			4.76,
			0,
			-3.19
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020014] = {
		turn_to = 0,
		process_time = 0,
		wait = 5,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020014,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-0.1,
			-2.04,
			103.97
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020015] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020015,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			4.23,
			-1.89,
			100.55
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020016] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 2,
		disappear = 0,
		mapId = 1002,
		id = 10020016,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			4.65,
			-1.97,
			8.86
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020017] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1002,
		id = 10020017,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-70.03,
			-2.337,
			26.614
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020018] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1002,
		id = 10020018,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-38.744,
			-2.417,
			26.82
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020019] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1002,
		id = 10020019,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-59.11,
			0,
			3.45
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020020] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1002,
		id = 10020020,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			56.71,
			0,
			2.39
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020021] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 4,
		disappear = 0,
		mapId = 1002,
		id = 10020021,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-1.18,
			0,
			-20.39
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020022] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 5,
		disappear = 0,
		mapId = 1002,
		id = 10020022,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			7.47,
			0,
			-17.9
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020023] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 6,
		disappear = 0,
		mapId = 1002,
		id = 10020023,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-53.907,
			-0.316,
			7.868
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020024] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 7,
		disappear = 0,
		mapId = 1002,
		id = 10020024,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			25.059,
			0,
			-0.71
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020025] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 8,
		disappear = 0,
		mapId = 1002,
		id = 10020025,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			8.739,
			-1.718,
			6.963
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020026] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 9,
		disappear = 0,
		mapId = 1002,
		id = 10020026,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-4.863,
			-1.729,
			44.566
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020027] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 3,
		disappear = 0,
		mapId = 1002,
		id = 10020027,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			31.99,
			-1.715,
			9.68
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020028] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 10,
		disappear = 0,
		mapId = 1002,
		id = 10020028,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-3.044,
			-1.721,
			103.98
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020029] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 10,
		disappear = 0,
		mapId = 1002,
		id = 10020029,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-2.84,
			-1.719,
			10.02
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020030] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 11,
		disappear = 0,
		mapId = 1002,
		id = 10020030,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-42.44,
			-0.321,
			13.5
		},
		process_action = {},
		arrive_action = {}
	}
end)()
;(function()
	pg.base.island_waypoint[10020031] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 11,
		disappear = 0,
		mapId = 1002,
		id = 10020031,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-38.768,
			-2.349,
			26.766
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020032] = {
		turn_to = 0,
		process_time = 0,
		wait = 5,
		process_dialogue = "",
		group = 11,
		disappear = 0,
		mapId = 1002,
		id = 10020032,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-27.66,
			-2.511,
			26.43
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020033] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 12,
		disappear = 0,
		mapId = 1002,
		id = 10020033,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-68.46,
			-2.416,
			16.9
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020034] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 12,
		disappear = 0,
		mapId = 1002,
		id = 10020034,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-4.2,
			-1.759,
			7.59
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020035] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 12,
		disappear = 0,
		mapId = 1002,
		id = 10020035,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			2.04,
			-1.734,
			105.089
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020036] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 13,
		disappear = 0,
		mapId = 1002,
		id = 10020036,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-62.16,
			-0.42,
			2.75
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020037] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 13,
		disappear = 0,
		mapId = 1002,
		id = 10020037,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			1.01,
			0,
			63.87
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020038] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 13,
		disappear = 0,
		mapId = 1002,
		id = 10020038,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			18.75,
			0,
			1.34
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020039] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 14,
		disappear = 0,
		mapId = 1002,
		id = 10020039,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			64.19,
			0,
			2.34
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020040] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 14,
		disappear = 0,
		mapId = 1002,
		id = 10020040,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			0.09,
			-2,
			12.52
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020041] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 15,
		disappear = 0,
		mapId = 1002,
		id = 10020041,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-71.64,
			0,
			2.87
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020042] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 15,
		disappear = 0,
		mapId = 1002,
		id = 10020042,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			52.67,
			0,
			0.85
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020043] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 14,
		disappear = 0,
		mapId = 1002,
		id = 10020043,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			14.22,
			0,
			2.61
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020044] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 15,
		disappear = 0,
		mapId = 1002,
		id = 10020044,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			0.02,
			0,
			-2.15
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020045] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 16,
		disappear = 0,
		mapId = 1002,
		id = 10020045,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-4.45,
			-1.732,
			9.33
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020046] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 16,
		disappear = 0,
		mapId = 1002,
		id = 10020046,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			65.4,
			-1.732,
			8.1
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020047] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 16,
		disappear = 0,
		mapId = 1002,
		id = 10020047,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			65,
			-2.46,
			54.4
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020048] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 17,
		disappear = 0,
		mapId = 1002,
		id = 10020048,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-0.25,
			-1.75,
			9.5
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020049] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 17,
		disappear = 0,
		mapId = 1002,
		id = 10020049,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			47.5,
			-1.75,
			9
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020050] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 17,
		disappear = 0,
		mapId = 1002,
		id = 10020050,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-65.95,
			-0.046,
			0.43
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020051] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 18,
		disappear = 0,
		mapId = 1002,
		id = 10020051,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			2.7,
			-1.767,
			96.4
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020052] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 18,
		disappear = 0,
		mapId = 1002,
		id = 10020052,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			2.56,
			-1.767,
			10.53
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020053] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 18,
		disappear = 0,
		mapId = 1002,
		id = 10020053,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-28.02,
			-2.464,
			22.8
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020054] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 19,
		disappear = 0,
		mapId = 1002,
		id = 10020054,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			0.12,
			0,
			-3.72
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020055] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 19,
		disappear = 0,
		mapId = 1002,
		id = 10020055,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-47.89,
			0,
			1.67
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020056] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 19,
		disappear = 0,
		mapId = 1002,
		id = 10020056,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-1.14,
			-1.758,
			37.97
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020057] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 20,
		disappear = 0,
		mapId = 1002,
		id = 10020057,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			5.34,
			0,
			0.48
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020058] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 20,
		disappear = 0,
		mapId = 1002,
		id = 10020058,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			34.2,
			-1.784,
			9.26
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020059] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 20,
		disappear = 0,
		mapId = 1002,
		id = 10020059,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-63.63,
			0,
			3.92
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020060] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 21,
		disappear = 0,
		mapId = 1002,
		id = 10020060,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			3.48,
			-1.768,
			14.89
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020061] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 21,
		disappear = 0,
		mapId = 1002,
		id = 10020061,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-0.76,
			-1.755,
			106.47
		},
		process_action = {},
		arrive_action = {}
	}
	pg.base.island_waypoint[10020062] = {
		turn_to = 0,
		process_time = 0,
		wait = 0,
		process_dialogue = "",
		group = 21,
		disappear = 0,
		mapId = 1002,
		id = 10020062,
		arrive_dialogue = "",
		rotation = 0,
		position = {
			-4.68,
			-1.775,
			34.06
		},
		process_action = {},
		arrive_action = {}
	}
end)()
