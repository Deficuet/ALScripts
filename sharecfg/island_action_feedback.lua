pg = pg or {}
pg.island_action_feedback = rawget(pg, "island_action_feedback") or setmetatable({
	__name = "island_action_feedback"
}, confNEO)
pg.island_action_feedback.all = {
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	201,
	202,
	203,
	204,
	205,
	206,
	207
}
pg.island_action_feedback.get_id_list_by_condition = {
	{
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108
	},
	{
		201,
		202,
		203,
		204,
		205,
		206,
		207
	}
}
pg.island_action_feedback.get_id_list_by_feedback_type = {
	{
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		201,
		202,
		203,
		204,
		205,
		206,
		207
	}
}
pg.base = pg.base or {}
pg.base.island_action_feedback = {}

;(function()
	pg.base.island_action_feedback[101] = {
		feedback_type = 1,
		condition = 1,
		state_name = "hi",
		id = 101,
		drop_id = 3001,
		emoji = {
			1,
			2,
			8
		}
	}
	pg.base.island_action_feedback[102] = {
		feedback_type = 1,
		condition = 1,
		state_name = "happy",
		id = 102,
		drop_id = 3001,
		emoji = {
			1,
			2,
			10
		}
	}
	pg.base.island_action_feedback[103] = {
		feedback_type = 1,
		condition = 1,
		state_name = "elation",
		id = 103,
		drop_id = 3001,
		emoji = {
			6
		}
	}
	pg.base.island_action_feedback[104] = {
		feedback_type = 1,
		condition = 1,
		state_name = "happy",
		id = 104,
		drop_id = 3001,
		emoji = {
			1,
			2,
			8
		}
	}
	pg.base.island_action_feedback[105] = {
		feedback_type = 1,
		condition = 1,
		state_name = "shy",
		id = 105,
		drop_id = 3001,
		emoji = {
			10
		}
	}
	pg.base.island_action_feedback[106] = {
		feedback_type = 1,
		condition = 1,
		state_name = "curious",
		id = 106,
		drop_id = 3001,
		emoji = {
			2,
			11
		}
	}
	pg.base.island_action_feedback[107] = {
		feedback_type = 1,
		condition = 1,
		state_name = "idea",
		id = 107,
		drop_id = 3001,
		emoji = {
			9
		}
	}
	pg.base.island_action_feedback[108] = {
		feedback_type = 1,
		condition = 1,
		state_name = "think",
		id = 108,
		drop_id = 3001,
		emoji = {
			13
		}
	}
	pg.base.island_action_feedback[201] = {
		feedback_type = 1,
		condition = 2,
		state_name = "embarrass",
		id = 201,
		drop_id = 0,
		emoji = {
			4
		}
	}
	pg.base.island_action_feedback[202] = {
		feedback_type = 1,
		condition = 2,
		state_name = "sad",
		id = 202,
		drop_id = 0,
		emoji = {
			5,
			14
		}
	}
	pg.base.island_action_feedback[203] = {
		feedback_type = 1,
		condition = 2,
		state_name = "scare",
		id = 203,
		drop_id = 0,
		emoji = {
			9
		}
	}
	pg.base.island_action_feedback[204] = {
		feedback_type = 1,
		condition = 2,
		state_name = "amaze",
		id = 204,
		drop_id = 0,
		emoji = {
			9
		}
	}
	pg.base.island_action_feedback[205] = {
		feedback_type = 1,
		condition = 2,
		state_name = "weep",
		id = 205,
		drop_id = 0,
		emoji = {
			14
		}
	}
	pg.base.island_action_feedback[206] = {
		feedback_type = 1,
		condition = 2,
		state_name = "angry",
		id = 206,
		drop_id = 0,
		emoji = {
			3,
			7
		}
	}
	pg.base.island_action_feedback[207] = {
		feedback_type = 1,
		condition = 2,
		state_name = "doubt",
		id = 207,
		drop_id = 0,
		emoji = {
			11
		}
	}
end)()
