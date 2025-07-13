pg = pg or {}
pg.island_ship_skill = {
	[100101] = {
		upgrade_unlock = 5,
		name = "干劲十足Lv1",
		id = 100101,
		icon = "props/skill",
		group = 1001,
		upgrade_desc = "",
		level = 1,
		desc = "在农场工作时，设施内所有角色体力消耗减少5%,暂存数量增加5",
		trigger_type = {
			{
				1,
				101101
			}
		},
		effect_type = {
			{
				1,
				5
			},
			{
				7,
				5
			}
		},
		special_effect_type = {},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100102] = {
		upgrade_unlock = 10,
		name = "干劲十足Lv2",
		id = 100102,
		icon = "props/skill",
		group = 1001,
		upgrade_desc = "体力消耗减少7%，暂存数量增加7",
		level = 2,
		desc = "在农场工作时，设施内所有角色体力消耗减少7%,暂存数量增加7",
		trigger_type = {
			{
				1,
				101101
			}
		},
		effect_type = {
			{
				1,
				7
			},
			{
				7,
				7
			}
		},
		special_effect_type = {},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100103] = {
		upgrade_unlock = 15,
		name = "干劲十足Lv3",
		id = 100103,
		icon = "props/skill",
		group = 1001,
		upgrade_desc = "体力消耗减少10%，暂存数量增加10",
		level = 3,
		desc = "在农场工作时，设施内所有角色体力消耗减少10%,暂存数量增加10",
		trigger_type = {
			{
				1,
				101101
			}
		},
		effect_type = {
			{
				1,
				10
			},
			{
				7,
				10
			}
		},
		special_effect_type = {},
		upgrade_cost = {}
	},
	[100201] = {
		upgrade_unlock = 5,
		name = "巧夺天工Lv1",
		id = 100201,
		icon = "props/skill",
		group = 1002,
		upgrade_desc = "",
		level = 1,
		desc = "在农场工作时，自身生产时间缩短15%",
		trigger_type = {
			{
				1,
				101102
			}
		},
		effect_type = {
			{
				4,
				15
			}
		},
		special_effect_type = {},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100202] = {
		upgrade_unlock = 10,
		name = "巧夺天工Lv2",
		id = 100202,
		icon = "props/skill",
		group = 1002,
		upgrade_desc = "",
		level = 2,
		desc = "在农场工作时，自身生产时间缩短20%",
		trigger_type = {
			{
				1,
				101102
			}
		},
		effect_type = {
			{
				4,
				20
			}
		},
		special_effect_type = {},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100203] = {
		upgrade_unlock = 15,
		name = "巧夺天工Lv3",
		id = 100203,
		icon = "props/skill",
		group = 1002,
		upgrade_desc = "",
		level = 3,
		desc = "在农场工作时，自身生产时间缩短25%",
		trigger_type = {
			{
				1,
				101102
			}
		},
		effect_type = {
			{
				4,
				25
			}
		},
		special_effect_type = {},
		upgrade_cost = {}
	},
	[100301] = {
		upgrade_unlock = 5,
		name = "占坑一Lv1",
		id = 100301,
		icon = "props/skill",
		group = 1003,
		upgrade_desc = "",
		level = 1,
		desc = "在农场工作1小时后，设施内所有角色生产时间缩短5%",
		trigger_type = {
			{
				1,
				101101
			},
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				3,
				5
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100302] = {
		upgrade_unlock = 10,
		name = "占坑一Lv2",
		id = 100302,
		icon = "props/skill",
		group = 1003,
		upgrade_desc = "",
		level = 2,
		desc = "在农场工作1小时后，设施内所有角色生产时间缩短7%",
		trigger_type = {
			{
				1,
				101101
			},
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				3,
				7
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100303] = {
		upgrade_unlock = 15,
		name = "占坑一Lv3",
		id = 100303,
		icon = "props/skill",
		group = 1003,
		upgrade_desc = "",
		level = 3,
		desc = "在农场工作1小时后，设施内所有角色生产时间缩短10%",
		trigger_type = {
			{
				1,
				101101
			},
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				3,
				10
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {}
	},
	[100401] = {
		upgrade_unlock = 5,
		name = "占坑二Lv1",
		id = 100401,
		icon = "props/skill",
		group = 1004,
		upgrade_desc = "",
		level = 1,
		desc = "工作1小时后，有5%概率产出2倍产物",
		trigger_type = {
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				5,
				5,
				2
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100402] = {
		upgrade_unlock = 10,
		name = "占坑二Lv2",
		id = 100402,
		icon = "props/skill",
		group = 1004,
		upgrade_desc = "",
		level = 2,
		desc = "工作1小时后，有7%概率产出2倍产物",
		trigger_type = {
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				5,
				7,
				2
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {
			{
				1,
				16,
				2000
			},
			{
				28,
				5001,
				1
			},
			{
				28,
				5002,
				1
			}
		}
	},
	[100403] = {
		upgrade_unlock = 15,
		name = "占坑二Lv3",
		id = 100403,
		icon = "props/skill",
		group = 1004,
		upgrade_desc = "",
		level = 3,
		desc = "工作1小时后，有10%概率产出2倍产物",
		trigger_type = {
			{
				2,
				3600
			}
		},
		effect_type = {
			{
				5,
				10,
				2
			}
		},
		special_effect_type = {
			{
				1,
				1
			}
		},
		upgrade_cost = {}
	},
	get_id_list_by_group = {
		[1001] = {
			100101,
			100102,
			100103
		},
		[1002] = {
			100201,
			100202,
			100203
		},
		[1003] = {
			100301,
			100302,
			100303
		},
		[1004] = {
			100401,
			100402,
			100403
		}
	},
	all = {
		100101,
		100102,
		100103,
		100201,
		100202,
		100203,
		100301,
		100302,
		100303,
		100401,
		100402,
		100403
	}
}
