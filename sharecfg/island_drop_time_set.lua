pg = pg or {}
pg.island_drop_time_set = rawget(pg, "island_drop_time_set") or setmetatable({
	__name = "island_drop_time_set"
}, confNEO)
pg.island_drop_time_set.all = {
	5010001,
	5010002,
	5010003,
	5010004,
	5010005,
	5010006,
	5010007,
	5020001,
	5020002,
	5020003,
	5020004,
	5020005,
	5020006,
	5020007,
	5030001,
	5030002,
	5030003,
	5030004,
	5030005,
	5030006,
	5030007
}
pg.base = pg.base or {}
pg.base.island_drop_time_set = {}

;(function()
	pg.base.island_drop_time_set[5010001] = {
		id = 5010001,
		drop_type = 50,
		link_id = 10001
	}
	pg.base.island_drop_time_set[5010002] = {
		id = 5010002,
		drop_type = 50,
		link_id = 10002
	}
	pg.base.island_drop_time_set[5010003] = {
		id = 5010003,
		drop_type = 50,
		link_id = 10003
	}
	pg.base.island_drop_time_set[5010004] = {
		id = 5010004,
		drop_type = 50,
		link_id = 10004
	}
	pg.base.island_drop_time_set[5010005] = {
		id = 5010005,
		drop_type = 50,
		link_id = 10005
	}
	pg.base.island_drop_time_set[5010006] = {
		id = 5010006,
		drop_type = 50,
		link_id = 10006
	}
	pg.base.island_drop_time_set[5010007] = {
		id = 5010007,
		drop_type = 50,
		link_id = 10007
	}
	pg.base.island_drop_time_set[5020001] = {
		id = 5020001,
		drop_type = 50,
		link_id = 20001
	}
	pg.base.island_drop_time_set[5020002] = {
		id = 5020002,
		drop_type = 50,
		link_id = 20002
	}
	pg.base.island_drop_time_set[5020003] = {
		id = 5020003,
		drop_type = 50,
		link_id = 20003
	}
	pg.base.island_drop_time_set[5020004] = {
		id = 5020004,
		drop_type = 50,
		link_id = 20004
	}
	pg.base.island_drop_time_set[5020005] = {
		id = 5020005,
		drop_type = 50,
		link_id = 20005
	}
	pg.base.island_drop_time_set[5020006] = {
		id = 5020006,
		drop_type = 50,
		link_id = 20006
	}
	pg.base.island_drop_time_set[5020007] = {
		id = 5020007,
		drop_type = 50,
		link_id = 20007
	}
	pg.base.island_drop_time_set[5030001] = {
		id = 5030001,
		drop_type = 50,
		link_id = 30001
	}
	pg.base.island_drop_time_set[5030002] = {
		id = 5030002,
		drop_type = 50,
		link_id = 30002
	}
	pg.base.island_drop_time_set[5030003] = {
		id = 5030003,
		drop_type = 50,
		link_id = 30003
	}
	pg.base.island_drop_time_set[5030004] = {
		id = 5030004,
		drop_type = 50,
		link_id = 30004
	}
	pg.base.island_drop_time_set[5030005] = {
		id = 5030005,
		drop_type = 50,
		link_id = 30005
	}
	pg.base.island_drop_time_set[5030006] = {
		id = 5030006,
		drop_type = 50,
		link_id = 30006
	}
	pg.base.island_drop_time_set[5030007] = {
		id = 5030007,
		drop_type = 50,
		link_id = 30007
	}
end)()
