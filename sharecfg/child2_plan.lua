pg = pg or {}
pg.child2_plan = rawget(pg, "child2_plan") or setmetatable({
	__name = "child2_plan"
}, confNEO)
pg.child2_plan.all = {
	1101,
	1102,
	1103,
	1104,
	1105,
	1106,
	1107,
	1108,
	1109,
	1110,
	1111,
	1112,
	1113,
	1114,
	1115,
	1116,
	1117,
	1118,
	1119,
	1122,
	3001,
	3002,
	3003,
	3107,
	3108,
	3109,
	3110,
	3111,
	3112,
	3113,
	3114,
	3115,
	3116,
	3117,
	3118,
	1201,
	1202,
	1203,
	1204,
	1205,
	1206,
	1207,
	1208,
	1209,
	1210,
	1211,
	1212,
	1213,
	1214,
	1215,
	1216,
	1217,
	1218,
	1219,
	1222,
	1223,
	1224,
	1225,
	1226,
	1227,
	1228,
	1229,
	1230,
	1231,
	1232,
	1233,
	1234,
	1235,
	1236,
	1237
}
pg.child2_plan.get_id_list_by_group_id = {
	{
		1101
	},
	{
		1102
	},
	{
		1103
	},
	{
		1104
	},
	{
		1105
	},
	{
		1106
	},
	{
		1107,
		1108,
		1109
	},
	{
		1110,
		1111,
		1112
	},
	{
		1113,
		1114,
		1115
	},
	{
		1116,
		1117,
		1118
	},
	{
		1119
	},
	{
		1122
	},
	[15] = {
		3107,
		3108,
		3109
	},
	[16] = {
		3110,
		3111,
		3112
	},
	[17] = {
		3113,
		3114,
		3115
	},
	[18] = {
		3116,
		3117,
		3118
	},
	[30] = {
		3001,
		3002,
		3003
	},
	[101] = {
		1201
	},
	[102] = {
		1202
	},
	[103] = {
		1203
	},
	[104] = {
		1204
	},
	[105] = {
		1205
	},
	[106] = {
		1206
	},
	[107] = {
		1207,
		1208,
		1209
	},
	[108] = {
		1210,
		1211,
		1212
	},
	[109] = {
		1213,
		1214,
		1215
	},
	[110] = {
		1216,
		1217,
		1218
	},
	[111] = {
		1219
	},
	[112] = {
		1222
	},
	[115] = {
		1226,
		1227,
		1228
	},
	[116] = {
		1229,
		1230,
		1231
	},
	[117] = {
		1232,
		1233,
		1234
	},
	[118] = {
		1235,
		1236,
		1237
	},
	[130] = {
		1223,
		1224,
		1225
	}
}
pg.base = pg.base or {}
pg.base.child2_plan = {}

;(function()
	pg.base.child2_plan[1101] = {
		type = 1,
		name = "趣球课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_1",
		result_node = 20001,
		is_show = 1,
		icon_square = "plan_square_1",
		name_2 = "趣球课堂",
		id = 1101,
		group_id = 1,
		level = 1,
		cost = {
			{
				2,
				1,
				6
			},
			{
				2,
				2,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1102] = {
		type = 1,
		name = "巧手课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_2",
		result_node = 20003,
		is_show = 1,
		icon_square = "plan_square_2",
		name_2 = "巧手课堂",
		id = 1102,
		group_id = 2,
		level = 1,
		cost = {
			{
				2,
				1,
				6
			},
			{
				2,
				2,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				103,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1103] = {
		type = 1,
		name = "悦读课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_3",
		result_node = 20005,
		is_show = 1,
		icon_square = "plan_square_3",
		name_2 = "悦读课堂",
		id = 1103,
		group_id = 3,
		level = 1,
		cost = {
			{
				2,
				1,
				6
			},
			{
				2,
				2,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				102,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1104] = {
		type = 1,
		name = "奇思课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_4",
		result_node = 20007,
		is_show = 1,
		icon_square = "plan_square_4",
		name_2 = "奇思课堂",
		id = 1104,
		group_id = 4,
		level = 1,
		cost = {
			{
				2,
				1,
				6
			},
			{
				2,
				2,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				104,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1105] = {
		type = 2,
		name = "律动课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_5",
		result_node = 20009,
		is_show = 1,
		icon_square = "plan_square_5",
		name_2 = "律动课堂",
		id = 1105,
		group_id = 5,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				2,
				3
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1106] = {
		type = 2,
		name = "生活课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_6",
		result_node = 20011,
		is_show = 1,
		icon_square = "plan_square_6",
		name_2 = "生活课堂",
		id = 1106,
		group_id = 6,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				1,
				8
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1107] = {
		type = 1,
		name = "体能课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20013,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 1107,
		group_id = 7,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {
			"&&",
			{
				20010,
				20050
			}
		},
		condition_desc = {
			{
				{
					20010
				},
				"体能<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				101,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1108] = {
		type = 1,
		name = "体能课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20015,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 1108,
		group_id = 7,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {
			"&&",
			{
				20011,
				20051
			}
		},
		condition_desc = {
			{
				{
					20011
				},
				"体能<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				101,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1109] = {
		type = 1,
		name = "体能课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20017,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 1109,
		group_id = 7,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1110] = {
		type = 1,
		name = "实践课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20019,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 1110,
		group_id = 8,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {
			"&&",
			{
				20020,
				20050
			}
		},
		condition_desc = {
			{
				{
					20020
				},
				"实践<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				103,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1111] = {
		type = 1,
		name = "实践课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20021,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 1111,
		group_id = 8,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {
			"&&",
			{
				20021,
				20051
			}
		},
		condition_desc = {
			{
				{
					20021
				},
				"实践<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				103,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1112] = {
		type = 1,
		name = "实践课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20023,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 1112,
		group_id = 8,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				103,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1113] = {
		type = 1,
		name = "阅读课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20025,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 1113,
		group_id = 9,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {
			"&&",
			{
				20040,
				20050
			}
		},
		condition_desc = {
			{
				{
					20040
				},
				"知识<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				102,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1114] = {
		type = 1,
		name = "阅读课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20027,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 1114,
		group_id = 9,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {
			"&&",
			{
				20041,
				20051
			}
		},
		condition_desc = {
			{
				{
					20041
				},
				"知识<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				102,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1115] = {
		type = 1,
		name = "阅读课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20029,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 1115,
		group_id = 9,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				102,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1116] = {
		type = 1,
		name = "感知课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20031,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 1116,
		group_id = 10,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {
			"&&",
			{
				20030,
				20050
			}
		},
		condition_desc = {
			{
				{
					20030
				},
				"感知<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				104,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1117] = {
		type = 1,
		name = "感知课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20033,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 1117,
		group_id = 10,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {
			"&&",
			{
				20031,
				20051
			}
		},
		condition_desc = {
			{
				{
					20031
				},
				"感知<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				104,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1118] = {
		type = 1,
		name = "感知课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20035,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 1118,
		group_id = 10,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				104,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1119] = {
		type = 2,
		name = "元气舞蹈",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_12",
		result_node = 20037,
		is_show = 1,
		icon_square = "plan_square_12",
		name_2 = "元气舞蹈",
		id = 1119,
		group_id = 11,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				2,
				6
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1122] = {
		type = 2,
		name = "庄园助手",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_11",
		result_node = 20039,
		is_show = 1,
		icon_square = "plan_square_11",
		name_2 = "庄园助手",
		id = 1122,
		group_id = 12,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				1,
				15
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3001] = {
		type = 1,
		name = "自由漫步",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20501,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "自由漫步",
		id = 3001,
		group_id = 30,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3002] = {
		type = 1,
		name = "自由漫步",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20503,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "自由漫步",
		id = 3002,
		group_id = 30,
		level = 2,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3003] = {
		type = 1,
		name = "自由漫步",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20505,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "自由漫步",
		id = 3003,
		group_id = 30,
		level = 3,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3107] = {
		type = 1,
		name = "体能课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20513,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 3107,
		group_id = 15,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3108] = {
		type = 1,
		name = "体能课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20515,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 3108,
		group_id = 15,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3109] = {
		type = 1,
		name = "体能课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20517,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "体能课程",
		id = 3109,
		group_id = 15,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				101,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3110] = {
		type = 1,
		name = "实践课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20519,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 3110,
		group_id = 16,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				103,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3111] = {
		type = 1,
		name = "实践课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20521,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 3111,
		group_id = 16,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				103,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3112] = {
		type = 1,
		name = "实践课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20523,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "实践课程",
		id = 3112,
		group_id = 16,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				103,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3113] = {
		type = 1,
		name = "阅读课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20525,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 3113,
		group_id = 17,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				102,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3114] = {
		type = 1,
		name = "阅读课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20527,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 3114,
		group_id = 17,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				102,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3115] = {
		type = 1,
		name = "阅读课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20529,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "阅读课程",
		id = 3115,
		group_id = 17,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				102,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3116] = {
		type = 1,
		name = "感知课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20531,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 3116,
		group_id = 18,
		level = 1,
		cost = {
			{
				2,
				1,
				12
			},
			{
				2,
				2,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				104,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3117] = {
		type = 1,
		name = "感知课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20533,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 3117,
		group_id = 18,
		level = 2,
		cost = {
			{
				2,
				1,
				20
			},
			{
				2,
				2,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				104,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[3118] = {
		type = 1,
		name = "感知课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20535,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "感知课程",
		id = 3118,
		group_id = 18,
		level = 3,
		cost = {
			{
				2,
				1,
				40
			},
			{
				2,
				2,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				104,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1201] = {
		type = 1,
		name = "趣球课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_1",
		result_node = 3700001,
		is_show = 1,
		icon_square = "plan_explorer_square_1",
		name_2 = "趣球课堂",
		id = 1201,
		group_id = 101,
		level = 1,
		cost = {
			{
				2,
				301,
				6
			},
			{
				2,
				302,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1202] = {
		type = 1,
		name = "巧手课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_2",
		result_node = 3700003,
		is_show = 1,
		icon_square = "plan_explorer_square_2",
		name_2 = "巧手课堂",
		id = 1202,
		group_id = 102,
		level = 1,
		cost = {
			{
				2,
				301,
				6
			},
			{
				2,
				302,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				303,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1203] = {
		type = 1,
		name = "悦读课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_3",
		result_node = 3700005,
		is_show = 1,
		icon_square = "plan_explorer_square_3",
		name_2 = "悦读课堂",
		id = 1203,
		group_id = 103,
		level = 1,
		cost = {
			{
				2,
				301,
				6
			},
			{
				2,
				302,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				302,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1204] = {
		type = 1,
		name = "奇思课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_4",
		result_node = 3700007,
		is_show = 1,
		icon_square = "plan_explorer_square_4",
		name_2 = "奇思课堂",
		id = 1204,
		group_id = 104,
		level = 1,
		cost = {
			{
				2,
				301,
				6
			},
			{
				2,
				302,
				1
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				304,
				5
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1205] = {
		type = 2,
		name = "律动课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_5",
		result_node = 3700009,
		is_show = 1,
		icon_square = "plan_explorer_square_5",
		name_2 = "律动课堂",
		id = 1205,
		group_id = 105,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				302,
				3
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1206] = {
		type = 2,
		name = "生活课堂",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_6",
		result_node = 3700011,
		is_show = 1,
		icon_square = "plan_explorer_square_6",
		name_2 = "生活课堂",
		id = 1206,
		group_id = 106,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				301,
				8
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1207] = {
		type = 1,
		name = "体能课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700013,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1207,
		group_id = 107,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {
			"&&",
			{
				3700010,
				3700050
			}
		},
		condition_desc = {
			{
				{
					3700010
				},
				"体能<color=#f7f7f7>>=300</color>"
			},
			{
				{
					3700050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				301,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1208] = {
		type = 1,
		name = "体能课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700015,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1208,
		group_id = 107,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {
			"&&",
			{
				3700011,
				3700051
			}
		},
		condition_desc = {
			{
				{
					3700011
				},
				"体能<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					3700051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				301,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1209] = {
		type = 1,
		name = "体能课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700017,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1209,
		group_id = 107,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1210] = {
		type = 1,
		name = "实践课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700019,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1210,
		group_id = 108,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {
			"&&",
			{
				3700020,
				3700050
			}
		},
		condition_desc = {
			{
				{
					3700020
				},
				"实践<color=#f7f7f7>>=300</color>"
			},
			{
				{
					3700050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				303,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1211] = {
		type = 1,
		name = "实践课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700021,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1211,
		group_id = 108,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {
			"&&",
			{
				3700021,
				3700051
			}
		},
		condition_desc = {
			{
				{
					3700021
				},
				"实践<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					3700051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				303,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1212] = {
		type = 1,
		name = "实践课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700023,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1212,
		group_id = 108,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				303,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1213] = {
		type = 1,
		name = "阅读课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700025,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1213,
		group_id = 109,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {
			"&&",
			{
				3700040,
				3700050
			}
		},
		condition_desc = {
			{
				{
					3700040
				},
				"知识<color=#f7f7f7>>=300</color>"
			},
			{
				{
					3700050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				302,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1214] = {
		type = 1,
		name = "阅读课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700027,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1214,
		group_id = 109,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {
			"&&",
			{
				3700041,
				3700051
			}
		},
		condition_desc = {
			{
				{
					3700041
				},
				"知识<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					3700051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				302,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1215] = {
		type = 1,
		name = "阅读课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700029,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1215,
		group_id = 109,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				302,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1216] = {
		type = 1,
		name = "感知课程Lv.1",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700031,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1216,
		group_id = 110,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {
			"&&",
			{
				3700030,
				3700050
			}
		},
		condition_desc = {
			{
				{
					3700030
				},
				"感知<color=#f7f7f7>>=300</color>"
			},
			{
				{
					3700050
				},
				"总属性<color=#f7f7f7>>=600</color>"
			}
		},
		result_display = {
			{
				1,
				304,
				10
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1217] = {
		type = 1,
		name = "感知课程Lv.2",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700033,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1217,
		group_id = 110,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {
			"&&",
			{
				3700031,
				3700051
			}
		},
		condition_desc = {
			{
				{
					3700031
				},
				"感知<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					3700051
				},
				"总属性<color=#f7f7f7>>=1800</color>"
			}
		},
		result_display = {
			{
				1,
				304,
				20
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1218] = {
		type = 1,
		name = "感知课程Lv.Max",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700035,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1218,
		group_id = 110,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				304,
				40
			}
		},
		replace_type = {
			1,
			2
		}
	}
	pg.base.child2_plan[1219] = {
		type = 2,
		name = "元气舞蹈",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_12",
		result_node = 3700037,
		is_show = 1,
		icon_square = "plan_explorer_square_12",
		name_2 = "元气舞蹈",
		id = 1219,
		group_id = 111,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				302,
				6
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1222] = {
		type = 2,
		name = "庄园助手",
		replace_type_show = 1,
		icon_rectangle = "plan_explorer_rectangle_11",
		result_node = 3700039,
		is_show = 1,
		icon_square = "plan_explorer_square_11",
		name_2 = "庄园助手",
		id = 1222,
		group_id = 112,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				2,
				301,
				15
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1223] = {
		type = 1,
		name = "随心探索 ",
		replace_type_show = 2,
		icon_rectangle = "plan_explorer_rectangle_15",
		result_node = 3700501,
		is_show = 1,
		icon_square = "plan_explorer_square_15",
		name_2 = "随心探索 ",
		id = 1223,
		group_id = 130,
		level = 1,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1224] = {
		type = 1,
		name = "随心探索 ",
		replace_type_show = 2,
		icon_rectangle = "plan_explorer_rectangle_15",
		result_node = 3700503,
		is_show = 1,
		icon_square = "plan_explorer_square_15",
		name_2 = "随心探索 ",
		id = 1224,
		group_id = 130,
		level = 2,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1225] = {
		type = 1,
		name = "随心探索 ",
		replace_type_show = 2,
		icon_rectangle = "plan_explorer_rectangle_15",
		result_node = 3700505,
		is_show = 1,
		icon_square = "plan_explorer_square_15",
		name_2 = "随心探索 ",
		id = 1225,
		group_id = 130,
		level = 3,
		cost = {},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				1
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1226] = {
		type = 1,
		name = "体能课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700513,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1226,
		group_id = 115,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1227] = {
		type = 1,
		name = "体能课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700515,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1227,
		group_id = 115,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1228] = {
		type = 1,
		name = "体能课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_7",
		result_node = 3700517,
		is_show = 1,
		icon_square = "plan_explorer_square_7",
		name_2 = "体能课程",
		id = 1228,
		group_id = 115,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				301,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1229] = {
		type = 1,
		name = "实践课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700519,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1229,
		group_id = 116,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				303,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1230] = {
		type = 1,
		name = "实践课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700521,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1230,
		group_id = 116,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				303,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1231] = {
		type = 1,
		name = "实践课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_8",
		result_node = 3700523,
		is_show = 1,
		icon_square = "plan_explorer_square_8",
		name_2 = "实践课程",
		id = 1231,
		group_id = 116,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				303,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1232] = {
		type = 1,
		name = "阅读课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700525,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1232,
		group_id = 117,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				302,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1233] = {
		type = 1,
		name = "阅读课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700527,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1233,
		group_id = 117,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				302,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1234] = {
		type = 1,
		name = "阅读课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_9",
		result_node = 3700529,
		is_show = 1,
		icon_square = "plan_explorer_square_9",
		name_2 = "阅读课程",
		id = 1234,
		group_id = 117,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				302,
				40
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1235] = {
		type = 1,
		name = "感知课程Lv.1",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700531,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1235,
		group_id = 118,
		level = 1,
		cost = {
			{
				2,
				301,
				12
			},
			{
				2,
				302,
				2
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				304,
				10
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1236] = {
		type = 1,
		name = "感知课程Lv.2",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700533,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1236,
		group_id = 118,
		level = 2,
		cost = {
			{
				2,
				301,
				20
			},
			{
				2,
				302,
				4
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				304,
				20
			}
		},
		replace_type = {}
	}
	pg.base.child2_plan[1237] = {
		type = 1,
		name = "感知课程Lv.Max",
		replace_type_show = 3,
		icon_rectangle = "plan_explorer_rectangle_10",
		result_node = 3700535,
		is_show = 1,
		icon_square = "plan_explorer_square_10",
		name_2 = "感知课程",
		id = 1237,
		group_id = 118,
		level = 3,
		cost = {
			{
				2,
				301,
				40
			},
			{
				2,
				302,
				8
			}
		},
		level_condition = {},
		condition_desc = {},
		result_display = {
			{
				1,
				304,
				40
			}
		},
		replace_type = {}
	}
end)()
