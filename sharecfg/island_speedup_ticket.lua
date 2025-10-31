pg = pg or {}
pg.island_speedup_ticket = {
	[10001] = {
		rarity = 2,
		name = "Express Ticket (1 Min.) ",
		expiration_type = 2,
		type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "Can be used to shorten an active task by 1 minute. Make tomorrow's developments into today's!",
		speedup_time = 60,
		id = 10001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket1",
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
		rarity = 2,
		name = "Express Ticket (1 Min.) ",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "Can be used to shorten an active task by 1 minute. Make tomorrow's developments into today's!",
		speedup_time = 60,
		id = 10002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket1"
	},
	[10003] = {
		rarity = 2,
		name = "Express Ticket (1 Min.) ",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "Can be used to shorten an active task by 1 minute. Make tomorrow's developments into today's!",
		speedup_time = 60,
		id = 10003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket1"
	},
	[10004] = {
		rarity = 2,
		name = "Express Ticket (1 Min.) ",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "Can be used to shorten an active task by 1 minute. Make tomorrow's developments into today's!",
		speedup_time = 60,
		id = 10004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket1"
	},
	[20001] = {
		rarity = 3,
		name = "Express Ticket (10 Min.)",
		expiration_type = 2,
		type = 2,
		icon = "islandprops/item_speedup_ticket2",
		desc = "Can be used to shorten an active task by 10 minutes. Make tomorrow's developments into today's!",
		speedup_time = 600,
		id = 20001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket2",
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
		rarity = 3,
		name = "Express Ticket (10 Min.)",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "Can be used to shorten an active task by 10 minutes. Make tomorrow's developments into today's!",
		speedup_time = 600,
		id = 20002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket2"
	},
	[20003] = {
		rarity = 3,
		name = "Express Ticket (10 Min.)",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "Can be used to shorten an active task by 10 minutes. Make tomorrow's developments into today's!",
		speedup_time = 600,
		id = 20003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket2"
	},
	[20004] = {
		rarity = 3,
		name = "Express Ticket (10 Min.)",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "Can be used to shorten an active task by 10 minutes. Make tomorrow's developments into today's!",
		speedup_time = 600,
		id = 20004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket2"
	},
	[30001] = {
		rarity = 4,
		name = "Express Ticket (60 Min.)",
		expiration_type = 2,
		type = 3,
		icon = "islandprops/item_speedup_ticket3",
		desc = "Can be used to shorten an active task by 60 minutes. Make tomorrow's developments into today's!",
		speedup_time = 3600,
		id = 30001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket3",
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
		rarity = 4,
		name = "Express Ticket (60 Min.)",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "Can be used to shorten an active task by 60 minutes. Make tomorrow's developments into today's!",
		speedup_time = 3600,
		id = 30002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket3"
	},
	[30003] = {
		rarity = 4,
		name = "Express Ticket (60 Min.)",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "Can be used to shorten an active task by 60 minutes. Make tomorrow's developments into today's!",
		speedup_time = 3600,
		id = 30003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket3"
	},
	[30004] = {
		rarity = 4,
		name = "Express Ticket (60 Min.)",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "Can be used to shorten an active task by 60 minutes. Make tomorrow's developments into today's!",
		speedup_time = 3600,
		id = 30004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket3"
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
