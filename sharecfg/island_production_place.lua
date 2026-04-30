pg = pg or {}
pg.island_production_place = rawget(pg, "island_production_place") or setmetatable({
	__name = "island_production_place"
}, confNEO)
pg.island_production_place.all = {
	101,
	102,
	201,
	401,
	402,
	501,
	502,
	601,
	602,
	603,
	604,
	702,
	703,
	704,
	705,
	706,
	901
}
pg.island_production_place.get_id_list_by_map_id = {
	[1001] = {
		101,
		102
	},
	[1002] = {
		201
	},
	[1004] = {
		401,
		402
	},
	[1005] = {
		501,
		502
	},
	[1006] = {
		601,
		602,
		603,
		604
	},
	[1007] = {
		702,
		703,
		704,
		705,
		706
	},
	[1009] = {
		901
	}
}
pg.base = pg.base or {}
pg.base.island_production_place = {}

;(function()
	pg.base.island_production_place[101] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_farm",
		name = "丰壤农田",
		behaviourTree = "island/nodecanvas/system/system_farm_place",
		delegationCamera = "RoleDelegationCamera101",
		map_id = 1001,
		locked_obj = 0,
		npcbehaviourTree = "island/nodecanvas/system/system_npc_farm",
		npc_birthplace = 1010001,
		tool_list = "",
		unlocked_obj = 0,
		id = 101,
		interactionType = 0,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			10101,
			10102,
			10103,
			10104
		},
		seed_list = {
			1001,
			1002,
			1003,
			1004,
			1005,
			1006,
			1007,
			1008
		}
	}
	pg.base.island_production_place[102] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_pasture",
		name = "悠然牧场",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera102",
		map_id = 1001,
		behaviourTree = "island/nodecanvas/system/system_pasture_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_pasture",
		locked_obj = 0,
		tool_list = "",
		npc_birthplace = 10010040,
		unlocked_obj = 0,
		id = 102,
		interactionType = 0,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			10201,
			10202,
			10203,
			10204
		}
	}
	pg.base.island_production_place[201] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_fish",
		name = "啾啾渔场",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera201",
		map_id = 1002,
		behaviourTree = "island/nodecanvas/system/system_fish_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_fish",
		locked_obj = 0,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 0,
		id = 201,
		interactionType = 0,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			20101,
			20102,
			20103
		}
	}
	pg.base.island_production_place[401] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_mine",
		name = "沉石矿山",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera401",
		map_id = 1004,
		behaviourTree = "island/nodecanvas/system/system_mine_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_mine",
		locked_obj = 0,
		npc_birthplace = 10040022,
		unlocked_obj = 0,
		id = 401,
		interactionType = 1,
		unlock_type = 2,
		gathering_slot = {
			40101,
			40102,
			40103,
			40104
		},
		commission_slot = {
			40101,
			40102,
			40103,
			40104
		},
		tool_list = {
			10006,
			10010,
			10011
		}
	}
	pg.base.island_production_place[402] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_felling",
		name = "翠土林场 ",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera402",
		map_id = 1004,
		behaviourTree = "island/nodecanvas/system/system_felling_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_felling",
		locked_obj = 0,
		npc_birthplace = 10040002,
		unlocked_obj = 0,
		id = 402,
		interactionType = 0,
		unlock_type = 2,
		gathering_slot = {
			40201,
			40202,
			40203,
			40204
		},
		commission_slot = {
			40201,
			40202,
			40203,
			40204
		},
		tool_list = {
			10007,
			10012,
			10013
		}
	}
	pg.base.island_production_place[501] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_orchard",
		name = "坠香果园",
		behaviourTree = "island/nodecanvas/system/system_orchard_place",
		delegationCamera = "RoleDelegationCamera501",
		map_id = 1005,
		locked_obj = 0,
		npcbehaviourTree = "island/nodecanvas/system/system_npc_orchard",
		npc_birthplace = 1010005,
		tool_list = "",
		unlocked_obj = 0,
		id = 501,
		interactionType = 0,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			50101,
			50102,
			50103,
			50104
		},
		seed_list = {
			1101,
			1102,
			1103,
			1104,
			1105,
			1106,
			1107,
			1108,
			1109
		}
	}
	pg.base.island_production_place[502] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_garden",
		name = "青芽苗圃",
		behaviourTree = "island/nodecanvas/system/system_garden_place",
		delegationCamera = "RoleDelegationCamera502",
		map_id = 1005,
		locked_obj = 0,
		npcbehaviourTree = "island/nodecanvas/system/system_npc_garden",
		npc_birthplace = 1010006,
		tool_list = "",
		unlocked_obj = 0,
		id = 502,
		interactionType = 0,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			50201,
			50202
		},
		seed_list = {
			1201,
			1202,
			1203,
			1204,
			1205,
			1206,
			1207,
			1208,
			1209
		}
	}
	pg.base.island_production_place[601] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_cook",
		name = "有鱼餐馆",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera601",
		map_id = 1006,
		behaviourTree = "island/nodecanvas/system/system_cook_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_cook",
		locked_obj = 10060046,
		tool_list = "",
		npc_birthplace = 10060001,
		unlocked_obj = 10060050,
		id = 601,
		interactionType = 1,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			60101,
			60102
		}
	}
	pg.base.island_production_place[602] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_cook",
		name = "白熊饮品",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera602",
		map_id = 1006,
		behaviourTree = "island/nodecanvas/system/system_cook_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_cook",
		locked_obj = 10060047,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10060051,
		id = 602,
		interactionType = 1,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			60201,
			60202
		}
	}
	pg.base.island_production_place[603] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_cook",
		name = "啾啾简餐",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera603",
		map_id = 1006,
		behaviourTree = "island/nodecanvas/system/system_cook_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_cook",
		locked_obj = 10060048,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10060052,
		id = 603,
		interactionType = 1,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			60301,
			60302
		}
	}
	pg.base.island_production_place[604] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_cook",
		name = "乌鱼烤肉",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera604",
		map_id = 1006,
		behaviourTree = "island/nodecanvas/system/system_cook_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_cook",
		locked_obj = 10060049,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10060053,
		id = 604,
		interactionType = 1,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			60401,
			60402
		}
	}
	pg.base.island_production_place[702] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_technology",
		name = "岛屿科技",
		seed_list = "",
		delegationCamera = "",
		map_id = 1007,
		behaviourTree = "island/nodecanvas/system/system_technology_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_technology",
		locked_obj = 0,
		tool_list = "",
		npc_birthplace = 10070004,
		unlocked_obj = 0,
		id = 702,
		interactionType = 0,
		unlock_type = 0,
		gathering_slot = {},
		commission_slot = {
			70201,
			70202
		}
	}
	pg.base.island_production_place[703] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_factory",
		name = "木料加工设备",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera703",
		map_id = 1007,
		behaviourTree = "island/nodecanvas/system/system_factory_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_factory",
		locked_obj = 10070033,
		tool_list = "",
		npc_birthplace = 1010010,
		unlocked_obj = 10070013,
		id = 703,
		interactionType = 1,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {
			70301,
			70302
		}
	}
	pg.base.island_production_place[704] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_factory",
		name = "工业生产设备",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera704",
		map_id = 1007,
		behaviourTree = "island/nodecanvas/system/system_factory_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_factory",
		locked_obj = 10070034,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10070014,
		id = 704,
		interactionType = 1,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			70401,
			70402
		}
	}
	pg.base.island_production_place[705] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_factory",
		name = "电子加工设备",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera705",
		map_id = 1007,
		behaviourTree = "island/nodecanvas/system/system_factory_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_factory",
		locked_obj = 10070035,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10070015,
		id = 705,
		interactionType = 1,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			70501,
			70502
		}
	}
	pg.base.island_production_place[706] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_factory",
		name = "手工制作设备",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera706",
		map_id = 1007,
		behaviourTree = "island/nodecanvas/system/system_factory_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_factory",
		locked_obj = 10070036,
		tool_list = "",
		npc_birthplace = 0,
		unlocked_obj = 10070016,
		id = 706,
		interactionType = 1,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			70601,
			70602
		}
	}
	pg.base.island_production_place[901] = {
		chickenbehaviourTree = "island/nodecanvas/system/system_chicken_coffeeshop",
		name = "啾咖啡",
		seed_list = "",
		delegationCamera = "RoleDelegationCamera901",
		map_id = 1009,
		behaviourTree = "island/nodecanvas/system/system_mall_place",
		npcbehaviourTree = "island/nodecanvas/system/system_npc_coffeeshop",
		locked_obj = 0,
		tool_list = "",
		npc_birthplace = 10090008,
		unlocked_obj = 0,
		id = 901,
		interactionType = 1,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			90101,
			90102
		}
	}
end)()
