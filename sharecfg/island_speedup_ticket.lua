pg = pg or {}
pg.island_speedup_ticket = rawget(pg, "island_speedup_ticket") or setmetatable({
	__name = "island_speedup_ticket"
}, confNEO)
pg.island_speedup_ticket.all = {
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	20001,
	20002,
	20003,
	20004,
	20005,
	20006,
	20007,
	30001,
	30002,
	30003,
	30004,
	30005,
	30006,
	30007
}
pg.island_speedup_ticket.get_id_list_by_speedup_time = {
	[60] = {
		10001,
		10002,
		10003,
		10004,
		10005,
		10006,
		10007
	},
	[600] = {
		20001,
		20002,
		20003,
		20004,
		20005,
		20006,
		20007
	},
	[3600] = {
		30001,
		30002,
		30003,
		30004,
		30005,
		30006,
		30007
	}
}
pg.base = pg.base or {}
pg.base.island_speedup_ticket = {}

;(function()
	pg.base.island_speedup_ticket[10001] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_type = 2,
		type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（在岛屿开发季I期活动内有效）",
		speedup_time = 60,
		id = 10001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket1",
		expiration_time = {
			{
				2026,
				2,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[10002] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（该加速券有效期为7天）",
		speedup_time = 60,
		id = 10002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket1"
	}
	pg.base.island_speedup_ticket[10003] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（该加速券有效期为3天）",
		speedup_time = 60,
		id = 10003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket1"
	}
	pg.base.island_speedup_ticket[10004] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_time = "",
		type = 1,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（该加速券有效期为2天）",
		speedup_time = 60,
		id = 10004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket1"
	}
	pg.base.island_speedup_ticket[10005] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_type = 2,
		type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（在岛屿开发季II期活动内有效）",
		speedup_time = 60,
		id = 10005,
		duration = 0,
		icon_normal = "props/item_speedup_ticket1",
		expiration_time = {
			{
				2026,
				5,
				7
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[10006] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_type = 2,
		type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（在岛屿开发季III期活动内有效）",
		speedup_time = 60,
		id = 10006,
		duration = 0,
		icon_normal = "props/item_speedup_ticket1",
		expiration_time = {
			{
				2026,
				8,
				6
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[10007] = {
		rarity = 2,
		name = "1分钟加速券",
		expiration_type = 2,
		type = 1,
		icon = "islandprops/item_speedup_ticket1",
		desc = "使用后，能加速1分钟的时间，让发展快人一步。（在岛屿开发季IV期活动内有效）",
		speedup_time = 60,
		id = 10007,
		duration = 0,
		icon_normal = "props/item_speedup_ticket1",
		expiration_time = {
			{
				2026,
				11,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[20001] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_type = 2,
		type = 2,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（在岛屿开发季I期活动内有效）",
		speedup_time = 600,
		id = 20001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket2",
		expiration_time = {
			{
				2026,
				2,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[20002] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（该加速券有效期为7天）",
		speedup_time = 600,
		id = 20002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket2"
	}
	pg.base.island_speedup_ticket[20003] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（该加速券有效期为3天）",
		speedup_time = 600,
		id = 20003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket2"
	}
	pg.base.island_speedup_ticket[20004] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_time = "",
		type = 2,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（该加速券有效期为2天）",
		speedup_time = 600,
		id = 20004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket2"
	}
	pg.base.island_speedup_ticket[20005] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_type = 2,
		type = 2,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（在岛屿开发季II期活动内有效）",
		speedup_time = 600,
		id = 20005,
		duration = 0,
		icon_normal = "props/item_speedup_ticket2",
		expiration_time = {
			{
				2026,
				5,
				7
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[20006] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_type = 2,
		type = 2,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（在岛屿开发季II期活动内有效）",
		speedup_time = 600,
		id = 20006,
		duration = 0,
		icon_normal = "props/item_speedup_ticket2",
		expiration_time = {
			{
				2026,
				8,
				6
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[20007] = {
		rarity = 3,
		name = "10分钟加速券",
		expiration_type = 2,
		type = 2,
		icon = "islandprops/item_speedup_ticket2",
		desc = "使用后，能加速10分钟的时间，让发展快人一步。（在岛屿开发季IV期活动内有效）",
		speedup_time = 600,
		id = 20007,
		duration = 0,
		icon_normal = "props/item_speedup_ticket2",
		expiration_time = {
			{
				2026,
				11,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[30001] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_type = 2,
		type = 3,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（在岛屿开发季I期活动内有效）",
		speedup_time = 3600,
		id = 30001,
		duration = 0,
		icon_normal = "props/item_speedup_ticket3",
		expiration_time = {
			{
				2026,
				2,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[30002] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（该加速券有效期为7天）",
		speedup_time = 3600,
		id = 30002,
		duration = 7,
		icon_normal = "props/item_speedup_ticket3"
	}
	pg.base.island_speedup_ticket[30003] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（该加速券有效期为3天）",
		speedup_time = 3600,
		id = 30003,
		duration = 3,
		icon_normal = "props/item_speedup_ticket3"
	}
	pg.base.island_speedup_ticket[30004] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_time = "",
		type = 3,
		expiration_type = 1,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（该加速券有效期为2天）",
		speedup_time = 3600,
		id = 30004,
		duration = 2,
		icon_normal = "props/item_speedup_ticket3"
	}
	pg.base.island_speedup_ticket[30005] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_type = 2,
		type = 3,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（在岛屿开发季II期活动内有效）",
		speedup_time = 3600,
		id = 30005,
		duration = 0,
		icon_normal = "props/item_speedup_ticket3",
		expiration_time = {
			{
				2026,
				5,
				7
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[30006] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_type = 2,
		type = 3,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（在岛屿开发季II期活动内有效）",
		speedup_time = 3600,
		id = 30006,
		duration = 0,
		icon_normal = "props/item_speedup_ticket3",
		expiration_time = {
			{
				2026,
				8,
				6
			},
			{
				12,
				0,
				0
			}
		}
	}
	pg.base.island_speedup_ticket[30007] = {
		rarity = 4,
		name = "60分钟加速券",
		expiration_type = 2,
		type = 3,
		icon = "islandprops/item_speedup_ticket3",
		desc = "使用后，能加速60分钟的时间，让发展快人一步。（在岛屿开发季IV期活动内有效）",
		speedup_time = 3600,
		id = 30007,
		duration = 0,
		icon_normal = "props/item_speedup_ticket3",
		expiration_time = {
			{
				2026,
				11,
				5
			},
			{
				12,
				0,
				0
			}
		}
	}
end)()
