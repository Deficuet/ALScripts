pg = pg or {}
pg.child2_round = rawget(pg, "child2_round") or setmetatable({
	__name = "child2_round"
}, confNEO)
pg.child2_round.all = {
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
	15,
	16,
	17,
	18,
	19,
	20,
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	115,
	116,
	117,
	118,
	119,
	120,
	151,
	152,
	153,
	154,
	155,
	156,
	157,
	158,
	159,
	160,
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	209,
	210,
	211,
	212,
	213,
	214,
	215,
	216,
	217,
	218,
	219,
	220,
	251,
	252,
	253,
	254,
	255,
	256,
	257,
	258,
	259,
	260
}
pg.child2_round.get_id_list_by_character = {
	{
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
		15,
		16,
		17,
		18,
		19,
		20
	},
	{
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		115,
		116,
		117,
		118,
		119,
		120,
		151,
		152,
		153,
		154,
		155,
		156,
		157,
		158,
		159,
		160,
		201,
		202,
		203,
		204,
		205,
		206,
		207,
		208,
		209,
		210,
		211,
		212,
		213,
		214,
		215,
		216,
		217,
		218,
		219,
		220,
		251,
		252,
		253,
		254,
		255,
		256,
		257,
		258,
		259,
		260
	}
}
pg.base = pg.base or {}
pg.base.child2_round = {}

;(function()
	pg.base.child2_round[1] = {
		stage = 1,
		endless_factor = "",
		id = 1,
		tarot_select = "",
		main_background = "educate_oceana_1",
		round_type = 1,
		round = 1,
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 0,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe1_1"
			},
			{
				"tag2",
				"lingyangzhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					1,
					2,
					3,
					4,
					5
				}
			},
			{
				"tag2",
				{
					1,
					2,
					3,
					4,
					5
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					7,
					3,
					8,
					2,
					6
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					2,
					6
				}
			}
		},
		main_event_node_id = {},
		benefit_select = {
			{
				1001,
				152
			},
			{
				1002,
				152
			},
			{
				1003,
				50
			},
			{
				1004,
				50
			},
			{
				1005,
				50
			},
			{
				1006,
				50
			},
			{
				1007,
				50
			},
			{
				1008,
				50
			},
			{
				1009,
				30
			},
			{
				1010,
				30
			},
			{
				1011,
				152
			},
			{
				1012,
				152
			},
			{
				1013,
				152
			},
			{
				1014,
				152
			},
			{
				1041,
				50
			},
			{
				1042,
				50
			},
			{
				1043,
				50
			},
			{
				1044,
				50
			},
			{
				1045,
				50
			},
			{
				1046,
				50
			},
			{
				1047,
				50
			},
			{
				1048,
				50
			},
			{
				1052,
				50
			},
			{
				1053,
				30
			},
			{
				1054,
				50
			},
			{
				1055,
				30
			},
			{
				1064,
				50
			},
			{
				1065,
				50
			},
			{
				1066,
				30
			},
			{
				1067,
				30
			},
			{
				1068,
				50
			},
			{
				1069,
				30
			},
			{
				1070,
				50
			},
			{
				1071,
				50
			},
			{
				1072,
				50
			},
			{
				1073,
				50
			},
			{
				1078,
				50
			},
			{
				1079,
				50
			},
			{
				1080,
				30
			},
			{
				1081,
				30
			},
			{
				1088,
				50
			},
			{
				1089,
				50
			},
			{
				1090,
				50
			},
			{
				1091,
				50
			},
			{
				1096,
				50
			},
			{
				1097,
				50
			},
			{
				1098,
				50
			},
			{
				1099,
				50
			}
		},
		plan_group = {
			1,
			2,
			3,
			4,
			5,
			6
		},
		main_event_chat_node_id = {
			{
				"tag1",
				403
			},
			{
				"tag2",
				403
			}
		}
	}
	pg.base.child2_round[2] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 2,
		round_type = 1,
		round = 2,
		main_background = "educate_oceana_1",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe1_1"
			},
			{
				"tag2",
				"lingyangzhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					1,
					2,
					3,
					4,
					5
				}
			},
			{
				"tag2",
				{
					1,
					2,
					3,
					4,
					5
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					7,
					3,
					8,
					2,
					6
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					2,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				440
			},
			{
				"tag2",
				440
			}
		},
		plan_group = {
			1,
			2,
			3,
			4,
			5,
			6
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[3] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 3,
		round_type = 1,
		round = 3,
		main_background = "educate_oceana_1",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe1_1"
			},
			{
				"tag2",
				"lingyangzhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					1,
					2,
					3,
					4,
					5
				}
			},
			{
				"tag2",
				{
					1,
					2,
					3,
					4,
					5
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					7,
					3,
					8,
					2,
					6
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					2,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				442
			},
			{
				"tag2",
				441
			}
		},
		plan_group = {
			1,
			2,
			3,
			4,
			5,
			6
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[4] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 4,
		round_type = 1,
		round = 4,
		main_background = "educate_oceana_1",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe1_2"
			},
			{
				"tag2",
				"lingyangzhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					1,
					2,
					3,
					4,
					5
				}
			},
			{
				"tag2",
				{
					1,
					2,
					3,
					4,
					5
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					7,
					3,
					8,
					2,
					6
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					2,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			1,
			2,
			3,
			4,
			5,
			6
		},
		main_event_chat_node_id = {
			{
				"tag1",
				415
			},
			{
				"tag2",
				412
			}
		}
	}
	pg.base.child2_round[5] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 5,
		round_type = 1,
		round = 5,
		main_background = "educate_oceana_1",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 1,
		main_painting = {
			{
				"tag1",
				"lingyangzhe1_2"
			},
			{
				"tag2",
				"lingyangzhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					1,
					2,
					3,
					4,
					5
				}
			},
			{
				"tag2",
				{
					1,
					2,
					3,
					4,
					5
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					7,
					3,
					8,
					2,
					6
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					2,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				444
			},
			{
				"tag2",
				443
			}
		},
		plan_group = {
			1,
			2,
			3,
			4,
			5,
			6
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[6] = {
		stage = 2,
		endless_factor = "",
		id = 6,
		tarot_select = "",
		main_background = "educate_oceana_2",
		round_type = 1,
		round = 6,
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe21_1"
			},
			{
				"tag2",
				"lingyangzhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					11,
					12,
					13,
					14,
					15
				}
			},
			{
				"tag2",
				{
					6,
					7,
					8,
					9,
					10
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					6,
					8,
					2,
					3
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				446
			},
			{
				"tag2",
				445
			}
		},
		benefit_select = {
			{
				1001,
				72
			},
			{
				1002,
				72
			},
			{
				1003,
				50
			},
			{
				1004,
				50
			},
			{
				1005,
				50
			},
			{
				1006,
				50
			},
			{
				1007,
				50
			},
			{
				1008,
				50
			},
			{
				1009,
				35
			},
			{
				1010,
				35
			},
			{
				1011,
				72
			},
			{
				1012,
				72
			},
			{
				1013,
				72
			},
			{
				1014,
				72
			},
			{
				1041,
				50
			},
			{
				1042,
				50
			},
			{
				1043,
				50
			},
			{
				1044,
				50
			},
			{
				1045,
				50
			},
			{
				1046,
				50
			},
			{
				1047,
				50
			},
			{
				1048,
				50
			},
			{
				1052,
				50
			},
			{
				1053,
				35
			},
			{
				1054,
				50
			},
			{
				1055,
				35
			},
			{
				1064,
				50
			},
			{
				1065,
				50
			},
			{
				1066,
				35
			},
			{
				1067,
				35
			},
			{
				1068,
				50
			},
			{
				1069,
				35
			},
			{
				1070,
				50
			},
			{
				1071,
				50
			},
			{
				1072,
				50
			},
			{
				1073,
				50
			},
			{
				1074,
				50
			},
			{
				1075,
				50
			},
			{
				1076,
				50
			},
			{
				1077,
				50
			},
			{
				1078,
				50
			},
			{
				1079,
				50
			},
			{
				1080,
				35
			},
			{
				1081,
				35
			},
			{
				1088,
				50
			},
			{
				1089,
				50
			},
			{
				1090,
				50
			},
			{
				1091,
				50
			},
			{
				1096,
				50
			},
			{
				1097,
				50
			},
			{
				1098,
				50
			},
			{
				1099,
				50
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[7] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 7,
		round_type = 1,
		round = 7,
		main_background = "educate_oceana_2",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe21_1"
			},
			{
				"tag2",
				"lingyangzhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					11,
					12,
					13,
					14,
					15
				}
			},
			{
				"tag2",
				{
					6,
					7,
					8,
					9,
					10
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					6,
					8,
					2,
					3
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				448
			},
			{
				"tag2",
				447
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[8] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 8,
		round_type = 1,
		round = 8,
		main_background = "educate_oceana_2",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe21_1"
			},
			{
				"tag2",
				"lingyangzhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					11,
					12,
					13,
					14,
					15
				}
			},
			{
				"tag2",
				{
					6,
					7,
					8,
					9,
					10
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					6,
					8,
					2,
					3
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				450
			},
			{
				"tag2",
				449
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[9] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 9,
		round_type = 1,
		round = 9,
		main_background = "educate_oceana_2",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe21_1"
			},
			{
				"tag2",
				"lingyangzhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					11,
					12,
					13,
					14,
					15
				}
			},
			{
				"tag2",
				{
					6,
					7,
					8,
					9,
					10
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					6,
					8,
					2,
					3
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				452
			},
			{
				"tag2",
				451
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {
			{
				"tag1",
				421
			},
			{
				"tag2",
				406
			}
		}
	}
	pg.base.child2_round[10] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 10,
		round_type = 1,
		round = 10,
		main_background = "educate_oceana_2",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 2,
		main_painting = {
			{
				"tag1",
				"lingyangzhe21_1"
			},
			{
				"tag2",
				"lingyangzhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					11,
					12,
					13,
					14,
					15
				}
			},
			{
				"tag2",
				{
					6,
					7,
					8,
					9,
					10
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					6,
					8,
					2,
					3
				}
			},
			{
				"tag2",
				{
					7,
					3,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				454
			},
			{
				"tag2",
				453
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[11] = {
		stage = 3,
		endless_factor = "",
		id = 11,
		tarot_select = "",
		main_background = "educate_oceana_2",
		round_type = 1,
		round = 11,
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_2"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				455
			},
			{
				"tag2",
				455
			}
		},
		benefit_select = {
			{
				1001,
				22
			},
			{
				1002,
				22
			},
			{
				1003,
				40
			},
			{
				1004,
				40
			},
			{
				1005,
				40
			},
			{
				1006,
				52
			},
			{
				1007,
				52
			},
			{
				1008,
				52
			},
			{
				1009,
				45
			},
			{
				1010,
				45
			},
			{
				1011,
				22
			},
			{
				1012,
				22
			},
			{
				1013,
				22
			},
			{
				1014,
				22
			},
			{
				1041,
				40
			},
			{
				1042,
				40
			},
			{
				1043,
				52
			},
			{
				1044,
				52
			},
			{
				1045,
				40
			},
			{
				1046,
				52
			},
			{
				1047,
				52
			},
			{
				1048,
				52
			},
			{
				1052,
				52
			},
			{
				1053,
				45
			},
			{
				1054,
				52
			},
			{
				1055,
				45
			},
			{
				1064,
				52
			},
			{
				1065,
				52
			},
			{
				1066,
				45
			},
			{
				1067,
				45
			},
			{
				1068,
				52
			},
			{
				1069,
				45
			},
			{
				1070,
				40
			},
			{
				1071,
				40
			},
			{
				1072,
				40
			},
			{
				1073,
				40
			},
			{
				1074,
				52
			},
			{
				1075,
				52
			},
			{
				1076,
				52
			},
			{
				1077,
				52
			},
			{
				1078,
				40
			},
			{
				1079,
				52
			},
			{
				1080,
				45
			},
			{
				1081,
				45
			},
			{
				1088,
				40
			},
			{
				1089,
				40
			},
			{
				1090,
				40
			},
			{
				1091,
				40
			},
			{
				1096,
				40
			},
			{
				1097,
				40
			},
			{
				1098,
				40
			},
			{
				1099,
				40
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[12] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 12,
		round_type = 1,
		round = 12,
		main_background = "educate_oceana_2",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_2"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[13] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 13,
		round_type = 1,
		round = 13,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_1"
			},
			{
				"tag2",
				"lingyangzhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				457
			},
			{
				"tag2",
				456
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[14] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 14,
		round_type = 1,
		round = 14,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_1"
			},
			{
				"tag2",
				"lingyangzhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {
			{
				"tag1",
				424
			},
			{
				"tag2",
				409
			}
		}
	}
	pg.base.child2_round[15] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 15,
		round_type = 1,
		round = 15,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 3,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_2"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				459
			},
			{
				"tag2",
				458
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[16] = {
		stage = 3,
		endless_factor = "",
		id = 16,
		tarot_select = "",
		main_background = "educate_oceana_3",
		round_type = 1,
		round = 16,
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_2"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {},
		benefit_select = {
			{
				1003,
				16
			},
			{
				1004,
				16
			},
			{
				1005,
				16
			},
			{
				1006,
				34
			},
			{
				1007,
				34
			},
			{
				1008,
				34
			},
			{
				1009,
				34
			},
			{
				1010,
				34
			},
			{
				1041,
				16
			},
			{
				1042,
				16
			},
			{
				1043,
				34
			},
			{
				1044,
				34
			},
			{
				1045,
				16
			},
			{
				1046,
				34
			},
			{
				1047,
				34
			},
			{
				1048,
				34
			},
			{
				1052,
				34
			},
			{
				1053,
				34
			},
			{
				1054,
				34
			},
			{
				1055,
				34
			},
			{
				1064,
				34
			},
			{
				1065,
				34
			},
			{
				1066,
				34
			},
			{
				1067,
				34
			},
			{
				1068,
				34
			},
			{
				1069,
				34
			},
			{
				1070,
				16
			},
			{
				1071,
				16
			},
			{
				1072,
				16
			},
			{
				1073,
				16
			},
			{
				1074,
				34
			},
			{
				1075,
				34
			},
			{
				1076,
				34
			},
			{
				1077,
				34
			},
			{
				1078,
				16
			},
			{
				1079,
				34
			},
			{
				1080,
				34
			},
			{
				1081,
				34
			},
			{
				1088,
				16
			},
			{
				1089,
				16
			},
			{
				1090,
				16
			},
			{
				1091,
				16
			},
			{
				1096,
				16
			},
			{
				1097,
				16
			},
			{
				1098,
				16
			},
			{
				1099,
				16
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[17] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 17,
		round_type = 1,
		round = 17,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_1"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				461
			},
			{
				"tag2",
				460
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[18] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 18,
		round_type = 1,
		round = 18,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_1"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[19] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 19,
		round_type = 1,
		round = 19,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_1"
			},
			{
				"tag2",
				"lingyangzhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {
			{
				"tag1",
				418
			},
			{
				"tag2",
				400
			}
		}
	}
	pg.base.child2_round[20] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 20,
		round_type = 1,
		round = 20,
		main_background = "educate_oceana_3",
		refresh_refill = 0,
		character = 1,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 4,
		main_painting = {
			{
				"tag1",
				"lingyangzhe31_2"
			},
			{
				"tag2",
				"lingyangzhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					21,
					22,
					23,
					24,
					25
				}
			},
			{
				"tag2",
				{
					16,
					17,
					18,
					19,
					20
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					2,
					2,
					6,
					6,
					6
				}
			},
			{
				"tag2",
				{
					7,
					6,
					8,
					6,
					8
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				463
			},
			{
				"tag2",
				462
			}
		},
		plan_group = {
			7,
			8,
			9,
			10,
			11,
			12
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[101] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		id = 101,
		main_background = "educate_explorer_1",
		round_type = 1,
		round = 1,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 0,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300401
			},
			{
				"tag2",
				3300401
			}
		},
		tarot_select = {
			1000
		}
	}
	pg.base.child2_round[102] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 102,
		round_type = 1,
		round = 2,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400001
			},
			{
				"tag2",
				3400003
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[103] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 103,
		round_type = 1,
		round = 3,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400002
			},
			{
				"tag2",
				3400004
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300501
			},
			{
				"tag2",
				3300801
			}
		}
	}
	pg.base.child2_round[104] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 104,
		round_type = 1,
		round = 4,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_2"
			},
			{
				"tag2",
				"tansuozhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[105] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 105,
		round_type = 1,
		round = 5,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 101,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_2"
			},
			{
				"tag2",
				"tansuozhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400005
			},
			{
				"tag2",
				3400005
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[106] = {
		stage = 2,
		endless_factor = "",
		id = 106,
		tarot_select = "",
		main_background = "educate_explorer_2",
		round_type = 1,
		round = 6,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_1"
			},
			{
				"tag2",
				"tansuozhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400006
			},
			{
				"tag2",
				3400024
			}
		},
		benefit_select = {
			{
				3830001,
				22
			},
			{
				3830002,
				22
			},
			{
				3830003,
				22
			},
			{
				3830004,
				22
			},
			{
				3830005,
				22
			},
			{
				3830006,
				22
			},
			{
				3830008,
				22
			},
			{
				3830009,
				22
			},
			{
				3830010,
				22
			},
			{
				3830012,
				22
			},
			{
				3830013,
				22
			},
			{
				3830018,
				22
			},
			{
				3830022,
				22
			},
			{
				3830023,
				22
			},
			{
				3830024,
				22
			},
			{
				3830025,
				22
			},
			{
				3830027,
				22
			},
			{
				3830028,
				22
			},
			{
				3830029,
				22
			},
			{
				3830030,
				22
			},
			{
				3830031,
				22
			},
			{
				3830032,
				22
			},
			{
				3830033,
				22
			},
			{
				3830034,
				22
			},
			{
				3830035,
				22
			},
			{
				3830036,
				22
			},
			{
				3830037,
				22
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300101
			},
			{
				"tag2",
				3300601
			}
		}
	}
	pg.base.child2_round[107] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 107,
		round_type = 1,
		round = 7,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_1"
			},
			{
				"tag2",
				"tansuozhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400008
			},
			{
				"tag2",
				3400011
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[108] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 108,
		round_type = 1,
		round = 8,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400009
			},
			{
				"tag2",
				3400012
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[109] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 109,
		round_type = 1,
		round = 9,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400010
			},
			{
				"tag2",
				3400013
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[110] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 110,
		round_type = 1,
		round = 10,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 102,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400015
			},
			{
				"tag2",
				3400014
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[111] = {
		stage = 3,
		endless_factor = "",
		id = 111,
		tarot_select = "",
		main_background = "educate_explorer_2",
		round_type = 1,
		round = 11,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400016
			},
			{
				"tag2",
				3400025
			}
		},
		benefit_select = {
			{
				3830001,
				22
			},
			{
				3830002,
				22
			},
			{
				3830003,
				22
			},
			{
				3830004,
				22
			},
			{
				3830005,
				22
			},
			{
				3830006,
				22
			},
			{
				3830008,
				22
			},
			{
				3830009,
				22
			},
			{
				3830010,
				22
			},
			{
				3830012,
				22
			},
			{
				3830013,
				22
			},
			{
				3830018,
				22
			},
			{
				3830022,
				22
			},
			{
				3830023,
				22
			},
			{
				3830024,
				22
			},
			{
				3830025,
				22
			},
			{
				3830027,
				22
			},
			{
				3830028,
				22
			},
			{
				3830029,
				22
			},
			{
				3830030,
				22
			},
			{
				3830031,
				22
			},
			{
				3830032,
				22
			},
			{
				3830033,
				22
			},
			{
				3830034,
				22
			},
			{
				3830035,
				22
			},
			{
				3830036,
				22
			},
			{
				3830037,
				22
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300201
			},
			{
				"tag2",
				3300901
			}
		}
	}
	pg.base.child2_round[112] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 112,
		round_type = 1,
		round = 12,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[113] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 113,
		round_type = 1,
		round = 13,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400017
			},
			{
				"tag2",
				3400020
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[114] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 114,
		round_type = 1,
		round = 14,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[115] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 115,
		round_type = 1,
		round = 15,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 103,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400018
			},
			{
				"tag2",
				3400021
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[116] = {
		stage = 3,
		endless_factor = "",
		id = 116,
		tarot_select = "",
		main_background = "educate_explorer_3",
		round_type = 1,
		round = 16,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		benefit_select = {
			{
				3830001,
				22
			},
			{
				3830002,
				22
			},
			{
				3830003,
				22
			},
			{
				3830004,
				22
			},
			{
				3830005,
				22
			},
			{
				3830006,
				22
			},
			{
				3830008,
				22
			},
			{
				3830009,
				22
			},
			{
				3830010,
				22
			},
			{
				3830012,
				22
			},
			{
				3830013,
				22
			},
			{
				3830018,
				22
			},
			{
				3830022,
				22
			},
			{
				3830023,
				22
			},
			{
				3830024,
				22
			},
			{
				3830025,
				22
			},
			{
				3830027,
				22
			},
			{
				3830028,
				22
			},
			{
				3830029,
				22
			},
			{
				3830030,
				22
			},
			{
				3830031,
				22
			},
			{
				3830032,
				22
			},
			{
				3830033,
				22
			},
			{
				3830034,
				22
			},
			{
				3830035,
				22
			},
			{
				3830036,
				22
			},
			{
				3830037,
				22
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300301
			},
			{
				"tag2",
				3301001
			}
		}
	}
	pg.base.child2_round[117] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 117,
		round_type = 1,
		round = 17,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400019
			},
			{
				"tag2",
				3400022
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[118] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 118,
		round_type = 1,
		round = 18,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[119] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 119,
		round_type = 1,
		round = 19,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[120] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 120,
		round_type = 1,
		round = 20,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 104,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400023
			},
			{
				"tag2",
				3400026
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[151] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 151,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 111,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[152] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 152,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 112,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[153] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 153,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 113,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[154] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 154,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 114,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[155] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 155,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 115,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[156] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 156,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 116,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[157] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 157,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 117,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[158] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 158,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 118,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[159] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 159,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 119,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[160] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 160,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 0,
		stage_change_event_node_id = 0,
		target_id = 120,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[201] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		id = 201,
		main_background = "educate_explorer_1",
		round_type = 1,
		round = 1,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 0,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300401
			},
			{
				"tag2",
				3300701
			}
		},
		tarot_select = {
			1001
		}
	}
	pg.base.child2_round[202] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 202,
		round_type = 1,
		round = 2,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400001
			},
			{
				"tag2",
				3400003
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[203] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 203,
		round_type = 1,
		round = 3,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_1"
			},
			{
				"tag2",
				"tansuozhe1_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400002
			},
			{
				"tag2",
				3400004
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300501
			},
			{
				"tag2",
				3300801
			}
		}
	}
	pg.base.child2_round[204] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 204,
		round_type = 1,
		round = 4,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_2"
			},
			{
				"tag2",
				"tansuozhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[205] = {
		stage = 1,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 205,
		round_type = 1,
		round = 5,
		main_background = "educate_explorer_1",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 201,
		main_painting = {
			{
				"tag1",
				"tansuozhe1_2"
			},
			{
				"tag2",
				"tansuozhe1_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			},
			{
				"tag2",
				{
					3000001,
					3000002,
					3000003,
					3000004,
					3000005
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					11,
					14,
					12,
					1,
					15
				}
			},
			{
				"tag2",
				{
					11,
					14,
					12,
					1,
					15
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400005
			},
			{
				"tag2",
				3400005
			}
		},
		plan_group = {
			101,
			102,
			103,
			104,
			105,
			106
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[206] = {
		stage = 2,
		endless_factor = "",
		id = 206,
		tarot_select = "",
		main_background = "educate_explorer_2",
		round_type = 1,
		round = 6,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_1"
			},
			{
				"tag2",
				"tansuozhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400006
			},
			{
				"tag2",
				3400024
			}
		},
		benefit_select = {
			{
				3830001,
				1
			},
			{
				3830002,
				1
			},
			{
				3830003,
				1
			},
			{
				3830004,
				1
			},
			{
				3830005,
				1
			},
			{
				3830006,
				1
			},
			{
				3830008,
				1
			},
			{
				3830009,
				1
			},
			{
				3830010,
				1
			},
			{
				3830011,
				1
			},
			{
				3830012,
				1
			},
			{
				3830013,
				1
			},
			{
				3830014,
				1
			},
			{
				3830015,
				1
			},
			{
				3830016,
				1
			},
			{
				3830017,
				1
			},
			{
				3830018,
				1
			},
			{
				3830019,
				1
			},
			{
				3830020,
				1
			},
			{
				3830021,
				1
			},
			{
				3830022,
				1
			},
			{
				3830023,
				1
			},
			{
				3830024,
				1
			},
			{
				3830025,
				1
			},
			{
				3830026,
				1
			},
			{
				3830027,
				1
			},
			{
				3830028,
				1
			},
			{
				3830029,
				1
			},
			{
				3830030,
				1
			},
			{
				3830031,
				1
			},
			{
				3830032,
				1
			},
			{
				3830033,
				1
			},
			{
				3830034,
				1
			},
			{
				3830035,
				1
			},
			{
				3830036,
				1
			},
			{
				3830037,
				1
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300101
			},
			{
				"tag2",
				3300601
			}
		}
	}
	pg.base.child2_round[207] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 207,
		round_type = 1,
		round = 7,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_1"
			},
			{
				"tag2",
				"tansuozhe22_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400008
			},
			{
				"tag2",
				3400011
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[208] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 208,
		round_type = 1,
		round = 8,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400009
			},
			{
				"tag2",
				3400012
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[209] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 209,
		round_type = 1,
		round = 9,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400010
			},
			{
				"tag2",
				3400013
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[210] = {
		stage = 2,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 210,
		round_type = 1,
		round = 10,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 202,
		main_painting = {
			{
				"tag1",
				"tansuozhe21_2"
			},
			{
				"tag2",
				"tansuozhe22_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000006,
					3000007,
					3000008,
					3000009,
					3000010
				}
			},
			{
				"tag2",
				{
					3000011,
					3000012,
					3000013,
					3000014,
					3000015
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					9,
					2,
					7,
					8,
					5
				}
			},
			{
				"tag2",
				{
					10,
					1,
					2,
					7,
					10
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400015
			},
			{
				"tag2",
				3400014
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[211] = {
		stage = 3,
		endless_factor = "",
		id = 211,
		tarot_select = "",
		main_background = "educate_explorer_2",
		round_type = 1,
		round = 11,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400016
			},
			{
				"tag2",
				3400025
			}
		},
		benefit_select = {
			{
				3830001,
				1
			},
			{
				3830002,
				1
			},
			{
				3830003,
				1
			},
			{
				3830004,
				1
			},
			{
				3830005,
				1
			},
			{
				3830006,
				1
			},
			{
				3830008,
				1
			},
			{
				3830009,
				1
			},
			{
				3830010,
				1
			},
			{
				3830011,
				1
			},
			{
				3830012,
				1
			},
			{
				3830013,
				1
			},
			{
				3830014,
				1
			},
			{
				3830015,
				1
			},
			{
				3830016,
				1
			},
			{
				3830017,
				1
			},
			{
				3830018,
				1
			},
			{
				3830019,
				1
			},
			{
				3830020,
				1
			},
			{
				3830021,
				1
			},
			{
				3830022,
				1
			},
			{
				3830023,
				1
			},
			{
				3830024,
				1
			},
			{
				3830025,
				1
			},
			{
				3830026,
				1
			},
			{
				3830027,
				1
			},
			{
				3830028,
				1
			},
			{
				3830029,
				1
			},
			{
				3830030,
				1
			},
			{
				3830031,
				1
			},
			{
				3830032,
				1
			},
			{
				3830033,
				1
			},
			{
				3830034,
				1
			},
			{
				3830035,
				1
			},
			{
				3830036,
				1
			},
			{
				3830037,
				1
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300201
			},
			{
				"tag2",
				3300901
			}
		}
	}
	pg.base.child2_round[212] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 212,
		round_type = 1,
		round = 12,
		main_background = "educate_explorer_2",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[213] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 213,
		round_type = 1,
		round = 13,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400017
			},
			{
				"tag2",
				3400020
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[214] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 214,
		round_type = 1,
		round = 14,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[215] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 215,
		round_type = 1,
		round = 15,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 203,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400018
			},
			{
				"tag2",
				3400021
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[216] = {
		stage = 3,
		endless_factor = "",
		id = 216,
		tarot_select = "",
		main_background = "educate_explorer_3",
		round_type = 1,
		round = 16,
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		benefit_select = {
			{
				3830001,
				1
			},
			{
				3830002,
				1
			},
			{
				3830003,
				1
			},
			{
				3830004,
				1
			},
			{
				3830005,
				1
			},
			{
				3830006,
				1
			},
			{
				3830008,
				1
			},
			{
				3830009,
				1
			},
			{
				3830010,
				1
			},
			{
				3830011,
				1
			},
			{
				3830012,
				1
			},
			{
				3830013,
				1
			},
			{
				3830014,
				1
			},
			{
				3830015,
				1
			},
			{
				3830016,
				1
			},
			{
				3830017,
				1
			},
			{
				3830018,
				1
			},
			{
				3830019,
				1
			},
			{
				3830020,
				1
			},
			{
				3830021,
				1
			},
			{
				3830022,
				1
			},
			{
				3830023,
				1
			},
			{
				3830024,
				1
			},
			{
				3830025,
				1
			},
			{
				3830026,
				1
			},
			{
				3830027,
				1
			},
			{
				3830028,
				1
			},
			{
				3830029,
				1
			},
			{
				3830030,
				1
			},
			{
				3830031,
				1
			},
			{
				3830032,
				1
			},
			{
				3830033,
				1
			},
			{
				3830034,
				1
			},
			{
				3830035,
				1
			},
			{
				3830036,
				1
			},
			{
				3830037,
				1
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {
			{
				"tag1",
				3300301
			},
			{
				"tag2",
				3301001
			}
		}
	}
	pg.base.child2_round[217] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 217,
		round_type = 1,
		round = 17,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400019
			},
			{
				"tag2",
				3400022
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[218] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 218,
		round_type = 1,
		round = 18,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[219] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 219,
		round_type = 1,
		round = 19,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 0,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_1"
			},
			{
				"tag2",
				"tansuozhe32_1"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[220] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "",
		tarot_select = "",
		id = 220,
		round_type = 1,
		round = 20,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 204,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {
			{
				"tag1",
				3400023
			},
			{
				"tag2",
				3400026
			}
		},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[251] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 251,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 211,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[252] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 252,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 212,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[253] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 253,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 213,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[254] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 254,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 214,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[255] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 255,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 215,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[256] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 256,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 216,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[257] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 257,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 217,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[258] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 258,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 218,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[259] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 259,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 219,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
	pg.base.child2_round[260] = {
		stage = 3,
		benefit_select = "",
		endless_factor = "1",
		tarot_select = "",
		id = 260,
		round_type = 2,
		round = 1,
		main_background = "educate_explorer_3",
		refresh_refill = 1,
		character = 2,
		plan_num = 5,
		map_mobility = 3,
		is_hard_mode = 1,
		stage_change_event_node_id = 0,
		target_id = 220,
		main_painting = {
			{
				"tag1",
				"tansuozhe31_2"
			},
			{
				"tag2",
				"tansuozhe32_2"
			}
		},
		main_word = {
			{
				"tag1",
				{
					3000016,
					3000017,
					3000018,
					3000019,
					3000020
				}
			},
			{
				"tag2",
				{
					3000021,
					3000022,
					3000023,
					3000024,
					3000025
				}
			}
		},
		main_word_expression = {
			{
				"tag1",
				{
					1,
					5,
					7,
					7,
					10
				}
			},
			{
				"tag2",
				{
					10,
					5,
					6,
					10,
					6
				}
			}
		},
		main_event_node_id = {},
		plan_group = {
			107,
			108,
			109,
			110,
			111,
			112
		},
		main_event_chat_node_id = {}
	}
end)()
