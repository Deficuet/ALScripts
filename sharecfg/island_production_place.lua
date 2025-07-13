pg = pg or {}
pg.island_production_place = {
	[101] = {
		behaviourTree = "",
		name = "农田",
		map_id = 1001,
		delegationCamera = "",
		npc_birthplace = 1010001,
		interactionType = 0,
		id = 101,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			10101,
			10102,
			10103,
			10104
		}
	},
	[102] = {
		behaviourTree = "",
		name = "牧场",
		map_id = 1001,
		delegationCamera = "",
		npc_birthplace = 1010002,
		interactionType = 0,
		id = 102,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[401] = {
		behaviourTree = "Island/NodeCanvas/System/system_mineArea",
		name = "矿场",
		map_id = 1004,
		delegationCamera = "RoleDelegationCamera",
		npc_birthplace = 10040022,
		interactionType = 1,
		id = 401,
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
		}
	},
	[402] = {
		behaviourTree = "island/nodecanvas/system/system_loggingcamp",
		name = "伐木场",
		map_id = 1004,
		delegationCamera = "",
		npc_birthplace = 10040002,
		interactionType = 0,
		id = 402,
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
		}
	},
	[501] = {
		behaviourTree = "",
		name = "果园",
		map_id = 1005,
		delegationCamera = "",
		npc_birthplace = 1010005,
		interactionType = 0,
		id = 501,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[502] = {
		behaviourTree = "",
		name = "种植园",
		map_id = 1005,
		delegationCamera = "",
		npc_birthplace = 1010006,
		interactionType = 0,
		id = 502,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[503] = {
		behaviourTree = "",
		name = "蜂箱",
		map_id = 1005,
		delegationCamera = "",
		npc_birthplace = 1010007,
		interactionType = 0,
		id = 503,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[601] = {
		behaviourTree = "",
		name = "水吧",
		map_id = 1006,
		delegationCamera = "",
		npc_birthplace = 1010008,
		interactionType = 0,
		id = 601,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[602] = {
		behaviourTree = "",
		name = "厨房",
		map_id = 1006,
		delegationCamera = "",
		npc_birthplace = 1010009,
		interactionType = 0,
		id = 602,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[701] = {
		behaviourTree = "",
		name = "工厂",
		map_id = 1007,
		delegationCamera = "",
		npc_birthplace = 1010010,
		interactionType = 0,
		id = 701,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[702] = {
		behaviourTree = "",
		name = "科研",
		map_id = 1007,
		delegationCamera = "",
		npc_birthplace = 1010012,
		interactionType = 0,
		id = 702,
		unlock_type = 0,
		gathering_slot = {},
		commission_slot = {
			70201,
			70202
		}
	},
	[801] = {
		behaviourTree = "",
		name = "渔场",
		map_id = 1008,
		delegationCamera = "",
		npc_birthplace = 1010011,
		interactionType = 0,
		id = 801,
		unlock_type = 1,
		gathering_slot = {},
		commission_slot = {}
	},
	[901] = {
		behaviourTree = "",
		name = "咖啡馆",
		map_id = 1009,
		delegationCamera = "",
		npc_birthplace = 10090008,
		interactionType = 0,
		id = 901,
		unlock_type = 2,
		gathering_slot = {},
		commission_slot = {
			90101,
			90102
		}
	},
	get_id_list_by_map_id = {
		[1001] = {
			101,
			102
		},
		[1004] = {
			401,
			402
		},
		[1005] = {
			501,
			502,
			503
		},
		[1006] = {
			601,
			602
		},
		[1007] = {
			701,
			702
		},
		[1008] = {
			801
		},
		[1009] = {
			901
		}
	},
	all = {
		101,
		102,
		401,
		402,
		501,
		502,
		503,
		601,
		602,
		701,
		702,
		801,
		901
	}
}
