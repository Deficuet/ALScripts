pg = pg or {}
pg.island_speedup_ticket = {
	[10001] = {
		name = "1分钟加速券",
		rarity = 2,
		expiration_type = 2,
		type = 1,
		id = 10001,
		icon = "islandprops/item_speedup_ticket1",
		speedup_time = 60,
		duration = 0,
		expiration_time = {
			{
				2026,
				1,
				8
			},
			{
				12,
				0,
				0
			}
		}
	},
	[10002] = {
		name = "1分钟加速券",
		rarity = 2,
		expiration_time = "",
		type = 1,
		speedup_time = 60,
		duration = 7,
		expiration_type = 1,
		id = 10002,
		icon = "islandprops/item_speedup_ticket1"
	},
	[10003] = {
		name = "1分钟加速券",
		rarity = 2,
		expiration_time = "",
		type = 1,
		speedup_time = 60,
		duration = 3,
		expiration_type = 1,
		id = 10003,
		icon = "islandprops/item_speedup_ticket1"
	},
	[10004] = {
		name = "1分钟加速券",
		rarity = 2,
		expiration_time = "",
		type = 1,
		speedup_time = 60,
		duration = 2,
		expiration_type = 1,
		id = 10004,
		icon = "islandprops/item_speedup_ticket1"
	},
	[20001] = {
		name = "10分钟加速券",
		rarity = 3,
		expiration_type = 2,
		type = 2,
		id = 20001,
		icon = "islandprops/item_speedup_ticket2",
		speedup_time = 600,
		duration = 0,
		expiration_time = {
			{
				2026,
				1,
				8
			},
			{
				12,
				0,
				0
			}
		}
	},
	[20002] = {
		name = "10分钟加速券",
		rarity = 3,
		expiration_time = "",
		type = 2,
		speedup_time = 600,
		duration = 7,
		expiration_type = 1,
		id = 20002,
		icon = "islandprops/item_speedup_ticket2"
	},
	[20003] = {
		name = "10分钟加速券",
		rarity = 3,
		expiration_time = "",
		type = 2,
		speedup_time = 600,
		duration = 3,
		expiration_type = 1,
		id = 20003,
		icon = "islandprops/item_speedup_ticket2"
	},
	[20004] = {
		name = "10分钟加速券",
		rarity = 3,
		expiration_time = "",
		type = 2,
		speedup_time = 600,
		duration = 2,
		expiration_type = 1,
		id = 20004,
		icon = "islandprops/item_speedup_ticket2"
	},
	[30001] = {
		name = "60分钟加速券",
		rarity = 4,
		expiration_type = 2,
		type = 3,
		id = 30001,
		icon = "islandprops/item_speedup_ticket3",
		speedup_time = 3600,
		duration = 0,
		expiration_time = {
			{
				2026,
				1,
				8
			},
			{
				12,
				0,
				0
			}
		}
	},
	[30002] = {
		name = "60分钟加速券",
		rarity = 4,
		expiration_time = "",
		type = 3,
		speedup_time = 3600,
		duration = 7,
		expiration_type = 1,
		id = 30002,
		icon = "islandprops/item_speedup_ticket3"
	},
	[30003] = {
		name = "60分钟加速券",
		rarity = 4,
		expiration_time = "",
		type = 3,
		speedup_time = 3600,
		duration = 3,
		expiration_type = 1,
		id = 30003,
		icon = "islandprops/item_speedup_ticket3"
	},
	[30004] = {
		name = "60分钟加速券",
		rarity = 4,
		expiration_time = "",
		type = 3,
		speedup_time = 3600,
		duration = 2,
		expiration_type = 1,
		id = 30004,
		icon = "islandprops/item_speedup_ticket3"
	},
	get_id_list_by_speedup_time = {
		[60] = {
			10001,
			10002,
			10003,
			10004
		},
		[600] = {
			20001,
			20002,
			20003,
			20004
		},
		[3600] = {
			30001,
			30002,
			30003,
			30004
		}
	},
	all = {
		10001,
		10002,
		10003,
		10004,
		20001,
		20002,
		20003,
		20004,
		30001,
		30002,
		30003,
		30004
	}
}
