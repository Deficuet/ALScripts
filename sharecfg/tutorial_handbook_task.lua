pg = pg or {}
pg.tutorial_handbook_task = rawget(pg, "tutorial_handbook_task") or setmetatable({
	__name = "tutorial_handbook_task"
}, confNEO)
pg.tutorial_handbook_task.all = {
	100101,
	100201,
	100301,
	100401,
	100501,
	100601,
	100701,
	100801,
	100901,
	200101,
	200201,
	200301,
	200401,
	200501,
	200601,
	200701,
	200801,
	200901,
	201001,
	201101,
	201201,
	201301,
	201401,
	201501,
	201601,
	201701,
	201801,
	201901,
	202001,
	202101,
	202201,
	202301,
	202401,
	202501,
	202601,
	202701,
	202801,
	202901,
	203001,
	203101,
	203201,
	203301,
	203401
}
pg.base = pg.base or {}
pg.base.tutorial_handbook_task = {}

;(function()
	pg.base.tutorial_handbook_task[100101] = {
		pt = 68800,
		name = "阶段一",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100101,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					22011,
					22016,
					22014,
					22012,
					22013,
					22015,
					22017,
					22018
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					20001,
					20
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100201] = {
		pt = 68801,
		name = "阶段二",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100201,
		lock_name = "未解锁",
		unlock = {
			23510
		},
		task_list = {
			{
				{
					22021,
					22026,
					22028,
					22022,
					22023,
					22024,
					22025,
					22027
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					59900,
					400
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100301] = {
		pt = 68802,
		name = "阶段三",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100301,
		lock_name = "未解锁",
		unlock = {
			23511
		},
		task_list = {
			{
				{
					22037,
					22035,
					22031,
					22032,
					22033,
					22034,
					22036,
					22038
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					20001,
					20
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100401] = {
		pt = 68803,
		name = "阶段四",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100401,
		lock_name = "未解锁",
		unlock = {
			23512
		},
		task_list = {
			{
				{
					22046,
					22047,
					22041,
					22042,
					22043,
					22044,
					22045,
					22048
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					59900,
					400
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100501] = {
		pt = 68804,
		name = "阶段五",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100501,
		lock_name = "未解锁",
		unlock = {
			23513
		},
		task_list = {
			{
				{
					22058,
					22057,
					22051,
					22052,
					22053,
					22054,
					22055,
					22056
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					20001,
					20
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100601] = {
		pt = 68805,
		name = "阶段六",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100601,
		lock_name = "未解锁",
		unlock = {
			23514
		},
		task_list = {
			{
				{
					22061,
					22062,
					22066,
					22068,
					22063,
					22064,
					22065,
					22067
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					59900,
					400
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100701] = {
		pt = 68806,
		name = "阶段七",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100701,
		lock_name = "未解锁",
		unlock = {
			23515
		},
		task_list = {
			{
				{
					22075,
					22078,
					22073,
					22071,
					22072,
					22074,
					22076,
					22077
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					20001,
					20
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100801] = {
		pt = 68807,
		name = "阶段八",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100801,
		lock_name = "未解锁",
		unlock = {
			23516
		},
		task_list = {
			{
				{
					22087,
					22086,
					22085,
					22081,
					22082,
					22083,
					22084,
					22088
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					59900,
					400
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[100901] = {
		pt = 68808,
		name = "阶段九",
		eng_name = "HANDBOOK",
		type = 1,
		id = 100901,
		lock_name = "未解锁",
		unlock = {
			23517
		},
		task_list = {
			{
				{
					22098,
					22093,
					22092,
					22091,
					22094,
					22095,
					22096,
					22097,
					22099
				},
				{}
			}
		},
		target = {
			9
		},
		drop_client = {
			{
				{
					2,
					60544,
					1
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200101] = {
		pt = 68809,
		name = "等级",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200101,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23001,
					23002
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200201] = {
		pt = 68900,
		name = "建造",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200201,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23003,
					23004,
					23005,
					23006,
					23007
				},
				{}
			}
		},
		target = {
			5
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200301] = {
		pt = 68901,
		name = "编队",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200301,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23008,
					23009,
					23010,
					23011,
					23012,
					23013,
					23014,
					23015
				},
				{}
			}
		},
		target = {
			8
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200401] = {
		pt = 68902,
		name = "出击",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200401,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23016,
					23017,
					23018,
					23019,
					23020,
					23021,
					23022,
					23023,
					23024,
					23025
				},
				{}
			}
		},
		target = {
			10
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200501] = {
		pt = 68903,
		name = "活动",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200501,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23026,
					23027
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200601] = {
		pt = 68904,
		name = "养成",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200601,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23028,
					23029,
					23030,
					23031,
					23032,
					23033,
					23034,
					23035,
					23036
				},
				{}
			}
		},
		target = {
			9
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200701] = {
		pt = 68905,
		name = "周常",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200701,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23037
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200801] = {
		pt = 68906,
		name = "商城",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200801,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23038,
					23039
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[200901] = {
		pt = 68907,
		name = "军火商店",
		eng_name = "HANDBOOK",
		type = 2,
		id = 200901,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23040
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201001] = {
		pt = 68908,
		name = "战术学院",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201001,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23041,
					23042
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201101] = {
		pt = 68909,
		name = "食堂",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201101,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23043
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201201] = {
		pt = 68910,
		name = "勋章收藏",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201201,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23044,
					23045
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201301] = {
		pt = 68911,
		name = "世界巡游",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201301,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23046,
					23047
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201401] = {
		pt = 68912,
		name = "邮箱",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201401,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23048
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201501] = {
		pt = 68913,
		name = "装备",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201501,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23049,
					23050,
					23051,
					23052,
					23053,
					23054,
					23055
				},
				{}
			}
		},
		target = {
			7
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201601] = {
		pt = 68914,
		name = "科技点",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201601,
		lock_name = "",
		unlock = {},
		task_list = {
			{
				{
					23056
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201701] = {
		pt = 68915,
		name = "后宅",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201701,
		lock_name = "Lv.8",
		unlock = {
			23501
		},
		task_list = {
			{
				{
					23057,
					23058,
					23059
				},
				{}
			}
		},
		target = {
			3
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201801] = {
		pt = 68916,
		name = "日常",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201801,
		lock_name = "Lv.10",
		unlock = {
			23502
		},
		task_list = {
			{
				{
					23060,
					23061,
					23062,
					23063,
					23064,
					23065
				},
				{}
			}
		},
		target = {
			6
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[201901] = {
		pt = 68917,
		name = "核心商店",
		eng_name = "HANDBOOK",
		type = 2,
		id = 201901,
		lock_name = "Lv.10",
		unlock = {
			23502
		},
		task_list = {
			{
				{
					23066
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202001] = {
		pt = 68918,
		name = "委托",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202001,
		lock_name = "Lv.11",
		unlock = {
			23503
		},
		task_list = {
			{
				{
					23067,
					23068
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202101] = {
		pt = 68919,
		name = "大舰队",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202101,
		lock_name = "Lv.11",
		unlock = {
			23503
		},
		task_list = {
			{
				{
					23069,
					23070,
					23071,
					23072,
					23073
				},
				{}
			}
		},
		target = {
			5
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202201] = {
		pt = 68920,
		name = "演习",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202201,
		lock_name = "Lv.15",
		unlock = {
			23504
		},
		task_list = {
			{
				{
					23074,
					23075,
					23076,
					23077
				},
				{}
			}
		},
		target = {
			4
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202301] = {
		pt = 68921,
		name = "原型商店",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202301,
		lock_name = "Lv.30",
		unlock = {
			23505
		},
		task_list = {
			{
				{
					23078,
					23079
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202401] = {
		pt = 68922,
		name = "游戏屋",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202401,
		lock_name = "Lv.30",
		unlock = {
			23505
		},
		task_list = {
			{
				{
					23080
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202501] = {
		pt = 68923,
		name = "军部研究室",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202501,
		lock_name = "Lv.30",
		unlock = {
			23505
		},
		task_list = {
			{
				{
					23081,
					23082,
					23083,
					23084
				},
				{}
			}
		},
		target = {
			4
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202601] = {
		pt = 68924,
		name = "开发船坞",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202601,
		lock_name = "Lv.30",
		unlock = {
			23505
		},
		task_list = {
			{
				{
					23085,
					23086,
					23087,
					23088
				},
				{}
			}
		},
		target = {
			4
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202701] = {
		pt = 68925,
		name = "养成计划",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202701,
		lock_name = "Lv.30",
		unlock = {
			23505
		},
		task_list = {
			{
				{
					23089,
					23090
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202801] = {
		pt = 68926,
		name = "指挥喵",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202801,
		lock_name = "Lv.40",
		unlock = {
			23506
		},
		task_list = {
			{
				{
					23091,
					23092,
					23093
				},
				{}
			}
		},
		target = {
			3
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[202901] = {
		pt = 68927,
		name = "大讲堂",
		eng_name = "HANDBOOK",
		type = 2,
		id = 202901,
		lock_name = "Lv.50",
		unlock = {
			23507
		},
		task_list = {
			{
				{
					23094,
					23095
				},
				{}
			}
		},
		target = {
			2
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[203001] = {
		pt = 68928,
		name = "装备研发",
		eng_name = "HANDBOOK",
		type = 2,
		id = 203001,
		lock_name = "Lv.60",
		unlock = {
			23508
		},
		task_list = {
			{
				{
					23096
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[203101] = {
		pt = 68929,
		name = "限界挑战",
		eng_name = "HANDBOOK",
		type = 2,
		id = 203101,
		lock_name = "Lv.80",
		unlock = {
			23509
		},
		task_list = {
			{
				{
					23097
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[203201] = {
		pt = 68930,
		name = "大型作战",
		eng_name = "HANDBOOK",
		type = 2,
		id = 203201,
		lock_name = "Lv.80",
		unlock = {
			23509
		},
		task_list = {
			{
				{
					23098,
					23099,
					23100,
					23101,
					23102,
					23103,
					23104,
					23105,
					23106,
					23107
				},
				{}
			}
		},
		target = {
			10
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[203301] = {
		pt = 68931,
		name = "META研究室",
		eng_name = "HANDBOOK",
		type = 2,
		id = 203301,
		lock_name = "Lv.80",
		unlock = {
			23509
		},
		task_list = {
			{
				{
					23108
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
	pg.base.tutorial_handbook_task[203401] = {
		pt = 68932,
		name = "宿舍计划",
		eng_name = "HANDBOOK",
		type = 2,
		id = 203401,
		lock_name = "Lv.80",
		unlock = {
			23509
		},
		task_list = {
			{
				{
					23109
				},
				{}
			}
		},
		target = {
			1
		},
		drop_client = {
			{
				{
					2,
					20001,
					2
				}
			}
		}
	}
end)()
