pg = pg or {}
pg.child2_plan = {
	[1101] = {
		type = 1,
		name = "Play Ballgame",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_1",
		result_node = 20001,
		is_show = 1,
		icon_square = "plan_square_1",
		name_2 = "Play Ballgame",
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
	},
	[1102] = {
		type = 1,
		name = "Play with Wooden Blocks",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_2",
		result_node = 20003,
		is_show = 1,
		icon_square = "plan_square_2",
		name_2 = "Play with Wooden Blocks",
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
	},
	[1103] = {
		type = 1,
		name = "Read",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_3",
		result_node = 20005,
		is_show = 1,
		icon_square = "plan_square_3",
		name_2 = "Read",
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
	},
	[1104] = {
		type = 1,
		name = "Have a Think",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_4",
		result_node = 20007,
		is_show = 1,
		icon_square = "plan_square_4",
		name_2 = "Have a Think",
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
	},
	[1105] = {
		type = 2,
		name = "Dance Practice",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_5",
		result_node = 20009,
		is_show = 1,
		icon_square = "plan_square_5",
		name_2 = "Dance Practice",
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
	},
	[1106] = {
		type = 2,
		name = "Do Housework",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_6",
		result_node = 20011,
		is_show = 1,
		icon_square = "plan_square_6",
		name_2 = "Do Housework",
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
	},
	[1107] = {
		type = 1,
		name = "Fitness Work Lv. 1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20013,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
				"Fitness<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"Stats Total<color=#f7f7f7>>=600</color>"
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
	},
	[1108] = {
		type = 1,
		name = "Fitness Work Lv. 2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20015,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
				"Fitness<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"Stats Total<color=#f7f7f7>>=1800</color>"
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
	},
	[1109] = {
		type = 1,
		name = "Fitness Work Max Lv.",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20017,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
	},
	[1110] = {
		type = 1,
		name = "Dexterity Work Lv. 1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20019,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
				"Dexterity<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"Stats Total<color=#f7f7f7>>=600</color>"
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
	},
	[1111] = {
		type = 1,
		name = "Dexterity Work Lv. 2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20021,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
				"Dexterity<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"Stats Total<color=#f7f7f7>>=1800</color>"
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
	},
	[1112] = {
		type = 1,
		name = "Dexterity Work Max Lv.",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20023,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
	},
	[1113] = {
		type = 1,
		name = "Knowledge Work Lv. 1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20025,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
				"Knowledge<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"Stats Total<color=#f7f7f7>>=600</color>"
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
	},
	[1114] = {
		type = 1,
		name = "Knowledge Work Lv. 2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20027,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
				"Knowledge<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"Stats Total<color=#f7f7f7>>=1800</color>"
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
	},
	[1115] = {
		type = 1,
		name = "Knowledge Work Max Lv.",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20029,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
	},
	[1116] = {
		type = 1,
		name = "Sensitivity Work Lv. 1",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20031,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
				"Sensitivity<color=#f7f7f7>>=300</color>"
			},
			{
				{
					20050
				},
				"Stats Total<color=#f7f7f7>>=600</color>"
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
	},
	[1117] = {
		type = 1,
		name = "Sensitivity Work Lv. 2",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20033,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
				"Sensitivity<color=#f7f7f7>>=1000</color>"
			},
			{
				{
					20051
				},
				"Stats Total<color=#f7f7f7>>=1800</color>"
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
	},
	[1118] = {
		type = 1,
		name = "Sensitivity Work Max Lv.",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20035,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
	},
	[1119] = {
		type = 2,
		name = "Cheerful Dance",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_12",
		result_node = 20037,
		is_show = 1,
		icon_square = "plan_square_12",
		name_2 = "Cheerful Dance",
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
	},
	[1122] = {
		type = 2,
		name = "Farmhand",
		replace_type_show = 1,
		icon_rectangle = "plan_rectangle_11",
		result_node = 20039,
		is_show = 1,
		icon_square = "plan_square_11",
		name_2 = "Farmhand",
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
	},
	[3001] = {
		type = 1,
		name = "Walk",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20501,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "Walk",
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
	},
	[3002] = {
		type = 1,
		name = "Walk",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20503,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "Walk",
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
	},
	[3003] = {
		type = 1,
		name = "Walk",
		replace_type_show = 2,
		icon_rectangle = "plan_rectangle_15",
		result_node = 20505,
		is_show = 1,
		icon_square = "plan_square_15",
		name_2 = "Walk",
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
	},
	[3107] = {
		type = 1,
		name = "Fitness Work Lv. 1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20513,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
	},
	[3108] = {
		type = 1,
		name = "Fitness Work Lv. 2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20515,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
	},
	[3109] = {
		type = 1,
		name = "Fitness Work Max Lv.",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_7",
		result_node = 20517,
		is_show = 1,
		icon_square = "plan_square_7",
		name_2 = "Fitness Work",
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
	},
	[3110] = {
		type = 1,
		name = "Dexterity Work Lv. 1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20519,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
	},
	[3111] = {
		type = 1,
		name = "Dexterity Work Lv. 2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20521,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
	},
	[3112] = {
		type = 1,
		name = "Dexterity Work Max Lv.",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_8",
		result_node = 20523,
		is_show = 1,
		icon_square = "plan_square_8",
		name_2 = "Dexterity Work",
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
	},
	[3113] = {
		type = 1,
		name = "Knowledge Work Lv. 1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20525,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
	},
	[3114] = {
		type = 1,
		name = "Knowledge Work Lv. 2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20527,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
	},
	[3115] = {
		type = 1,
		name = "Knowledge Work Max Lv.",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_9",
		result_node = 20529,
		is_show = 1,
		icon_square = "plan_square_9",
		name_2 = "Knowledge Work",
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
	},
	[3116] = {
		type = 1,
		name = "Sensitivity Work Lv. 1",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20531,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
	},
	[3117] = {
		type = 1,
		name = "Sensitivity Work Lv. 2",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20533,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
	},
	[3118] = {
		type = 1,
		name = "Sensitivity Work Max Lv.",
		replace_type_show = 3,
		icon_rectangle = "plan_rectangle_10",
		result_node = 20535,
		is_show = 1,
		icon_square = "plan_square_10",
		name_2 = "Sensitivity Work",
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
	},
	get_id_list_by_group_id = {
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
		[30] = {
			3001,
			3002,
			3003
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
		}
	},
	all = {
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
		3118
	}
}
